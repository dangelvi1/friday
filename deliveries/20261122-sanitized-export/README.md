# FRIDAY source export helper - November 22, 2026

Creates one sanitized **source-only** ZIP for review. It does not install an update, edit the FRIDAY project, contact business providers, or stop/restart FRIDAY. No project backup is needed for this export-only operation.

The helper is written for Windows PowerShell 5.1 or later. Download it to `S:\AI\Fixing-Files-Folder\Export-FRIDAY-Sanitized.ps1`, then run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\Export-FRIDAY-Sanitized.ps1' -ProjectPath 'S:\AI\friday-ai' -OutputDirectory 'S:\AI\Fixing-Files-Folder'
if ($LASTEXITCODE -ne 0) { throw 'Export failed. Do not upload a partial file.' }
```

The console prints the actual ZIP path. It is named `FRIDAY-Sanitized-Source-<timestamp>-<suffix>.zip`. Existing exports are not overwritten. Open that ZIP, review `SANITIZE-REPORT.json` and the exported files, and upload it in the chat. Do not upload your original project folder or private configuration. A separate reference ZIP is unnecessary if the export already includes your FRIDAY-HANDOFF.md and AGENTS-SUGGESTED.md; add those documents separately if they live outside the project.

Included: root source files and recognized source directories, package/lock/TypeScript configuration JSON, the project handoff/AGENTS/README documents, nested AGENTS.md files within included source directories, frontend text assets and code. UTF-8 text only; non-UTF-8 files are skipped. Unknown top-level folders and most JSON configuration are intentionally omitted. This may omit necessary code/configuration: identify missing filenames without supplying private values. No project AGENTS.md is overwritten or interpreted as new user authorization.

Excluded: environment files, credential/token files, private runtime folders, node_modules, Git, builds, databases/dumps, backups, uploads/attachments, receipts/reports, call recordings/transcripts, logs/caches, browser profiles, certificates, fixture/snapshot folders, binary files, pictures, PDFs, archives and spreadsheets. Directory links/junctions and file links are not followed. No arbitrary customer documents or root notes are intentionally collected. Source files over 4 MB are skipped; the total staged source is limited to 28 MB, rather than silently producing an incomplete multipart export.

Common credential literals, private-key blocks, recognized provider token formats, bearer tokens and credential URLs are replaced **only in exported copies**. `SANITIZE-REPORT.json` lists exported filenames, hashes, and whether redaction changed a copy; credential values are never printed. Every source ZIP entry is read back and hash-checked. Staging and incomplete ZIPs are removed on ordinary completion/errors; forced process termination can interrupt cleanup.

Automated filtering cannot guarantee removal of every secret, personal detail, or proprietary value, especially unknown credential formats and private content embedded in source/comments. Review before sharing. Redacted copies are for inspection, **not an installable backup or a replacement for your working source**. No original secret is rotated by this script.

## Validation

Eleven synthetic integration tests passed on PowerShell 7.4.13 for Linux: retained source/instructions and unchanged original bytes; archive entry hashes; private/binary exclusions; escaped and multiline credential literals; known token/key/URL patterns; symlinks; invalid UTF-8/NUL/oversized files; unsafe output rejection; and total-size failure without a partial ZIP (some tests cover multiple cases). The corrected verifier also passes actual ZIP fixtures with Windows backslash and mixed-separator entry names, and still rejects corrupted entry content. Windows PowerShell 5.1 and real owner-PC files were not executed here. No live account or private project content was used in these tests. Test fixtures contain synthetic markers only.

Run the included validation using `python tests/test_export.py <path-to-pwsh> -v` when Python and PowerShell are available. This helper does not depend on Python on the owner PC.

## ZIP verification correction

The first export could fail with `Archive source entry missing` on Windows PowerShell/.NET Framework because ZIP entry names can use backslashes. The corrected helper normalizes both separator styles for lookup and rejects duplicate normalized names, while preserving every source-entry SHA-256 check and incomplete-ZIP cleanup. Download the corrected script before rerunning. No original project file was modified by the failed export.
