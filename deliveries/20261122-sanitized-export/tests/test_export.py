"""Synthetic export checks. Run: python test_export.py /path/to/pwsh"""
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
import zipfile

POWERSHELL = sys.argv.pop(1) if len(sys.argv) > 1 else 'pwsh'
SCRIPT = Path(__file__).resolve().parents[1] / 'Export-FRIDAY-Sanitized.ps1'


class ExportTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.base = Path(self.temp.name)
        self.project = self.base / 'project with spaces'
        self.output = self.base / 'output with spaces'
        self.write('package.json', '{"name":"synthetic-fixture","private":true}')
        self.write('src/main.ts', 'export const title = "FRIDAY";\n')

    def write(self, path, value):
        target = self.project / path
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(value, encoding='utf-8')
        return target

    def run_export(self, output=None):
        return subprocess.run([POWERSHELL, '-NoProfile', '-File', str(SCRIPT),
            '-ProjectPath', str(self.project), '-OutputDirectory', str(output or self.output)],
            capture_output=True, text=True, env=os.environ.copy())

    def read_export(self):
        result = self.run_export()
        self.assertEqual(result.returncode, 0, result.stderr)
        archives = list(self.output.glob('*.zip'))
        self.assertEqual(len(archives), 1)
        with zipfile.ZipFile(archives[0]) as z:
            self.assertIsNone(z.testzip())
            return {n.removeprefix('FRIDAY-Sanitized-Source/'): z.read(n) for n in z.namelist()}

    def test_source_documents_originals_and_zip_hashes(self):
        for name in ['AGENTS.md', 'AGENTS-SUGGESTED.md', 'FRIDAY-HANDOFF.md', 'src/AGENTS.md']:
            self.write(name, 'Synthetic instructions only.\n')
        self.write('public/app.js', 'console.log("fixture");\n')
        before = {str(p): p.read_bytes() for p in self.project.rglob('*') if p.is_file()}
        contents = self.read_export()
        report = json.loads(contents['SANITIZE-REPORT.json'])
        self.assertEqual(report['includedCount'], len(before))
        for item in report['files']:
            self.assertEqual(hashlib.sha256(contents[item['path']]).hexdigest(), item['sha256'])
        self.assertEqual(before, {str(p): p.read_bytes() for p in self.project.rglob('*') if p.is_file()})

    def test_private_folders_files_and_binary_data_excluded(self):
        paths = ['.env', '.env.local', '.npmrc', 'credentials/google.json', 'backups/server.ts',
            'uploads/x.ts', 'src/data/x.ts', 'src/private/x.ts', 'public/receipts/x.ts',
            'node_modules/x/index.js', 'cache/x.js', 'logs/x.js', 'private/x.md',
            'config/service-account.json', 'src/credentials.ts', 'public/product.png',
            'public/statement.pdf', 'public/export.csv', 'database.sql', 'source.zip',
            'contact-notes.md', 'docs/customer-notes.md', 'src/session.key']
        for name in paths:
            self.write(name, 'PRIVATE-CONTENT-FIXTURE')
        contents = self.read_export()
        self.assertEqual(set(contents), {'package.json', 'src/main.ts', 'SANITIZE-REPORT.json'})
        self.assertFalse(any(b'PRIVATE-CONTENT-FIXTURE' in c for c in contents.values()))

    def test_redacts_assignments_escaped_strings_and_multiline_templates(self):
        self.write('src/main.ts', '''const password = "literal-fixture";
const clientSecret = 'second-fixture';
const authToken = "escaped\\\"suffix-fixture";
const signingSecret = `multiline
suffix-fixture`;
const harmless = "FRIDAY";
''')
        contents = self.read_export()
        main = contents['src/main.ts'].decode()
        for value in ['literal-fixture', 'second-fixture', 'suffix-fixture']:
            self.assertNotIn(value, main)
        self.assertEqual(main.count('[REDACTED]'), 4)
        self.assertIn('const harmless = "FRIDAY";', main)
        self.assertTrue(next(x for x in json.loads(contents['SANITIZE-REPORT.json'])['files'] if x['path'] == 'src/main.ts')['redacted'])

    def test_redacts_known_tokens_keys_and_credential_urls(self):
        markers = ['sk-proj-' + 'a' * 40, 'shpat_' + 'b' * 32, 'ghp_' + 'c' * 36,
            'github_pat_' + 'd' * 40, 'AIza' + 'e' * 35, 'ya29.' + 'f' * 25,
            'AKIA' + 'A' * 16, 'eyJabcdefghijk.abcdefghijk.abcdefghijk',
            'postgresql://owner:fixture@localhost/db', 'https://user:fixture@example.com',
            '-----BEGIN PRIVATE KEY-----\nfixture-private-key\n-----END PRIVATE KEY-----',
            'Bearer ' + 'z' * 30]
        self.write('src/example.md', '\n'.join(markers))
        result = self.read_export()['src/example.md'].decode()
        for marker in markers:
            self.assertNotIn(marker, result)

    def test_symlinks_to_outside_not_followed(self):
        external = self.base / 'outside-secret.ts'
        external.write_text('OUTSIDE-FIXTURE')
        try:
            (self.project / 'src' / 'outside.ts').symlink_to(external)
        except OSError:
            self.skipTest('Symlink creation unavailable')
        self.assertNotIn('src/outside.ts', self.read_export())

    def test_invalid_utf8_nul_and_oversized_files_skipped(self):
        (self.project / 'src' / 'invalid.ts').write_bytes(b'\xff\xfe\xff')
        (self.project / 'src' / 'binary.ts').write_bytes(b'hello\x00world')
        (self.project / 'src' / 'large.ts').write_bytes(b'x' * (4 * 1024 * 1024 + 1))
        contents = self.read_export()
        self.assertEqual(set(contents), {'package.json', 'src/main.ts', 'SANITIZE-REPORT.json'})

    def test_output_inside_project_rejected(self):
        result = self.run_export(self.project / 'export')
        self.assertNotEqual(result.returncode, 0)
        self.assertFalse((self.project / 'export').exists())

    def test_source_size_limit_fails_without_publishing_partial_archive(self):
        for i in range(8):
            self.write(f'src/large{i}.ts', 'x' * (4 * 1024 * 1024))
        result = self.run_export()
        self.assertNotEqual(result.returncode, 0)
        self.assertFalse(list(self.output.glob('*.zip')))


if __name__ == '__main__':
    unittest.main()
