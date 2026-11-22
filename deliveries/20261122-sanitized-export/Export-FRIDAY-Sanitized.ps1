#requires -Version 5.1
[CmdletBinding()]
param(
    [string]$ProjectPath = 'S:\AI\friday-ai',
    [string]$OutputDirectory = 'S:\AI\Fixing-Files-Folder'
)

# Export only. No source files, configuration, services or accounts are changed.
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$utf8 = New-Object System.Text.UTF8Encoding($false, $true)
$root = (Resolve-Path -LiteralPath $ProjectPath).Path.TrimEnd([char[]]'\/')
if (-not (Test-Path -LiteralPath (Join-Path $root 'package.json') -PathType Leaf)) {
    throw 'ProjectPath must point to the FRIDAY project containing package.json.'
}
if ((Get-Item -LiteralPath $root -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) {
    throw 'Use the actual project folder, not a symbolic link or junction.'
}
$rootPrefix = $root + [IO.Path]::DirectorySeparatorChar
$outputFull = [IO.Path]::GetFullPath($OutputDirectory)
if ($outputFull.Equals($root, [StringComparison]::OrdinalIgnoreCase) -or
    $outputFull.StartsWith($rootPrefix, [StringComparison]::OrdinalIgnoreCase)) {
    throw 'Choose an output directory outside the project.'
}

$sourceFolders = @('src','public','auth','calendar','chat','commerce','marketplaces',
    'phone','quickbooks','shopify','scripts','tests','types','config','server','api',
    'services','routes','tools','modules','sandra','sara','camila','estimating','aitan',
    'lib','utils','desktop','electron','plugins','assets','docs')
$excludedFolders = @('.git','.aws','.codex','.agents','.ssh','.vscode','node_modules',
    'dist','build','coverage','credentials','secrets','private','data','database',
    'databases','backups','backup','uploads','upload','attachments','downloads',
    'logs','log','cache','.cache','tmp','temp','sessions','profiles','browser-profile',
    'browser-profiles','playwright','playwright-report','test-results','receipts',
    'reports','statements','recordings','transcripts','exports','deliveries','fixtures',
    '__fixtures__','snapshots','__snapshots__','certs','certificates','ssl','tls')
$extensions = @('.ts','.tsx','.js','.jsx','.mjs','.cjs','.mts','.cts','.html','.css',
    '.scss','.less','.ps1','.psm1','.psd1','.md','.graphql','.gql')
$omitName = '(?i)(^\.env(?:\.|$)|^\.(?:npmrc|yarnrc|pypirc|netrc|git-credentials)$|' +
    '(?:credential|client[_-]?secret|service[_-]?account|oauth[_-]?token)|' +
    '^(?:token|tokens|secret|secrets|cookies|storageState|auth-state)(?:\.|$)|' +
    '\.(?:bak|orig|old|log|csv|pdf|zip|db|sqlite|sqlite3|pem|key|pfx|p12|crt|cer)$)'

# Redact values in staged copies only; never print their values.
$secretName = '(?:[a-z0-9_]*(?:api[_-]?key|access[_-]?token|refresh[_-]?token|' +
    'client[_-]?secret|auth[_-]?token|password|passwd|passphrase|private[_-]?key|' +
    'connection[_-]?string|database[_-]?url|signing[_-]?key|secret)[a-z0-9_]*)'
$secretLiteral = '(?im)(?<prefix>["''`]?\b' + $secretName +
    '\b["''`]?\s*[:=]\s*)(?<q>["''`])(?<value>(?:\\[\s\S]|(?!\k<q>)[^\\])*?)\k<q>'
$patterns = @(
    '(?s)-----BEGIN (?:[A-Z0-9 ]*PRIVATE KEY|OPENSSH PRIVATE KEY)-----.*?-----END (?:[A-Z0-9 ]*PRIVATE KEY|OPENSSH PRIVATE KEY)-----',
    '\bsk-(?:proj-|svcacct-)?[A-Za-z0-9_-]{20,}\b',
    '\b(?:shpat_|shpca_|shppa_|shpss_)[A-Za-z0-9]{16,}\b',
    '\b(?:ghp_|gho_|ghu_|ghs_|ghr_)[A-Za-z0-9]{20,}\b',
    '\bgithub_pat_[A-Za-z0-9_]{20,}\b',
    '\bAIza[A-Za-z0-9_-]{30,}\b',
    '\bya29\.[A-Za-z0-9._-]{15,}',
    '\b(?:AKIA|ASIA)[A-Z0-9]{16}\b',
    '\beyJ[A-Za-z0-9_-]{8,}\.[A-Za-z0-9_-]{8,}\.[A-Za-z0-9_-]{8,}\b',
    '(?i)\b(?:postgres(?:ql)?|mysql|mongodb(?:\+srv)?|redis)://[^\s"''<>`]+',
    '(?i)(?<=Bearer )[A-Za-z0-9._~-]{16,}'
)

$stage = Join-Path ([IO.Path]::GetTempPath()) ('friday-source-' + [guid]::NewGuid().ToString('N'))
$exportRoot = Join-Path $stage 'FRIDAY-Sanitized-Source'
$included = New-Object 'System.Collections.Generic.List[object]'
$omitted = 0
$totalBytes = 0L
$zipPath = $null
$completed = $false
try {
    [IO.Directory]::CreateDirectory($exportRoot) | Out-Null
    $pending = New-Object 'System.Collections.Generic.Stack[string]'
    $pending.Push($root)
    while ($pending.Count -gt 0) {
        $directory = $pending.Pop()
        foreach ($entry in Get-ChildItem -LiteralPath $directory -Force) {
            if ($entry.Attributes -band [IO.FileAttributes]::ReparsePoint) { $omitted++; continue }
            $relative = $entry.FullName.Substring($rootPrefix.Length)
            if ($entry.PSIsContainer) {
                if ($excludedFolders -contains $entry.Name -or $entry.Name.StartsWith('.')) { continue }
                if ($directory -eq $root -and $sourceFolders -notcontains $entry.Name) { continue }
                $pending.Push($entry.FullName)
                continue
            }
            $name = $entry.Name
            if ($name -match $omitName -or $entry.Length -gt 4MB) { $omitted++; continue }
            $allowed = $extensions -contains $entry.Extension.ToLowerInvariant()
            if ($entry.Extension -eq '.json') {
                $allowed = ($directory -eq $root -and $name -match '^(?:package(?:-lock)?|tsconfig(?:\.[\w-]+)?|jsconfig)\.json$')
            }
            if ($name -eq '.gitignore') { $allowed = $true }
            if (-not $allowed) { $omitted++; continue }
            if ($directory -eq $root -and $entry.Extension -eq '.md' -and
                $name -notmatch '^(?:AGENTS(?:-SUGGESTED)?|FRIDAY-HANDOFF|README(?:[-.][\w-]+)?|HANDOFF)\.md$') {
                $omitted++; continue
            }
            if ($relative -match '(?i)(?:^|[\\/])docs[\\/]' -and
                $name -notmatch '^(?:AGENTS(?:-SUGGESTED)?|FRIDAY-HANDOFF|README(?:[-.][\w-]+)?|HANDOFF)\.md$') {
                $omitted++; continue
            }
            try { $content = $utf8.GetString([IO.File]::ReadAllBytes($entry.FullName)).TrimStart([char]0xFEFF) }
            catch [Text.DecoderFallbackException] { $omitted++; continue }
            if ($content.IndexOf([char]0) -ge 0) { $omitted++; continue }
            # Also reject credential objects hidden under a source/config filename.
            if ($content -match '(?i)"type"\s*:\s*"service_account"' -or
                $content -match '(?i)"(?:installed|web)"\s*:\s*\{\s*"client_id"') { $omitted++; continue }
            $safe = $content
            if ($safe -match '(?i)(?:api[_-]?key|access[_-]?token|refresh[_-]?token|client[_-]?secret|auth[_-]?token|password|passwd|passphrase|private[_-]?key|connection[_-]?string|database[_-]?url|signing[_-]?key|secret)') {
                $safe = [regex]::Replace($safe, $secretLiteral, '${prefix}${q}[REDACTED]${q}')
            }
            foreach ($pattern in $patterns) { $safe = [regex]::Replace($safe, $pattern, '[REDACTED]') }
            # User/password URLs, including HTTPS credentials.
            $safe = [regex]::Replace($safe, '(?i)\b([a-z][a-z0-9+.-]{0,20}://)[^\s/"''<>]+:[^\s/"''<>]+@', '${1}[REDACTED]@')
            $destination = Join-Path $exportRoot $relative
            [IO.Directory]::CreateDirectory([IO.Path]::GetDirectoryName($destination)) | Out-Null
            [IO.File]::WriteAllText($destination, $safe, $utf8)
            $size = (Get-Item -LiteralPath $destination).Length
            $totalBytes += $size
            if ($totalBytes -gt 28MB) { throw 'Source export exceeds 28 MB. No ZIP created. Ask for a narrower export.' }
            $included.Add([pscustomobject]@{
                path = $relative.Replace('\','/'); redacted = ($safe -cne $content)
                sha256 = (Get-FileHash -LiteralPath $destination -Algorithm SHA256).Hash.ToLowerInvariant()
            })
        }
    }
    if ($included.Count -lt 2) { throw 'Not enough source files were found; check ProjectPath. No ZIP created.' }
    $summary = [ordered]@{
        format = 'FRIDAY-source-export-1'; createdUtc = [DateTime]::UtcNow.ToString('o')
        includedCount = $included.Count; omittedFileCount = $omitted
        note = 'Source only. No binary assets/private runtime folders. Redacted files are review copies, not an installable backup. Automated filtering cannot guarantee removal of every secret or personal detail. Review before sharing.'
        files = @($included.ToArray())
    }
    [IO.File]::WriteAllText((Join-Path $exportRoot 'SANITIZE-REPORT.json'), ($summary | ConvertTo-Json -Depth 5), $utf8)
    [IO.Directory]::CreateDirectory($outputFull) | Out-Null
    $zipPath = Join-Path $outputFull ('FRIDAY-Sanitized-Source-' + (Get-Date -Format 'yyyyMMdd-HHmmss') + '-' + [guid]::NewGuid().ToString('N').Substring(0,6) + '.zip')
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [IO.Compression.ZipFile]::CreateFromDirectory($stage, $zipPath, [IO.Compression.CompressionLevel]::Optimal, $false)
    $archive = [IO.Compression.ZipFile]::OpenRead($zipPath)
    try {
        if ($archive.Entries.Count -ne ($included.Count + 1)) { throw 'Archive entry verification failed.' }
        # Windows PowerShell/.NET Framework can write backslash ZIP entry names.
        # Normalize the lookup, retaining the same per-entry hash verification.
        $entryIndex = New-Object 'System.Collections.Generic.Dictionary[string,object]' -ArgumentList ([StringComparer]::Ordinal)
        foreach ($entry in $archive.Entries) {
            $normalizedName = $entry.FullName.Replace('\','/')
            if ($entryIndex.ContainsKey($normalizedName)) { throw 'Duplicate normalized archive entry.' }
            $entryIndex.Add($normalizedName, $entry)
        }
        foreach ($item in $included) {
            $expectedName = 'FRIDAY-Sanitized-Source/' + $item.path
            if (-not $entryIndex.ContainsKey($expectedName)) { throw 'Archive source entry missing.' }
            $zipEntry = $entryIndex[$expectedName]
            $stream = $zipEntry.Open()
            $hasher = [Security.Cryptography.SHA256]::Create()
            try { $digest = ([BitConverter]::ToString($hasher.ComputeHash($stream))).Replace('-','').ToLowerInvariant() }
            finally { $stream.Dispose(); $hasher.Dispose() }
            if ($digest -ne $item.sha256) { throw 'Archive source hash verification failed.' }
        }
    } finally { $archive.Dispose() }
    $completed = $true
    Write-Host ''
    Write-Host ('Created: ' + $zipPath)
    Write-Host ('Source files: ' + $included.Count + '; copies with redactions: ' + @($included | Where-Object { $_.redacted }).Count)
    Write-Host 'Your original project was not changed.'
    Write-Host 'Review SANITIZE-REPORT.json and the exported files before uploading. Do not use this ZIP to restore/install FRIDAY.'
} finally {
    if (Test-Path -LiteralPath $stage) { Remove-Item -LiteralPath $stage -Recurse -Force }
    if (-not $completed -and $zipPath -and (Test-Path -LiteralPath $zipPath)) { Remove-Item -LiteralPath $zipPath -Force }
}
