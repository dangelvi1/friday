[Download v26 patch](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261112-26/FRIDAY-Vite-Config-v26.zip)

# FRIDAY Vite Config v26 — November 12, 2026

Small patch for installed v25. Vite's warning is informational; the extensionless import was incompatible with its future native-loader default. This changes `./auth/vite-device-gate` to `./auth/vite-device-gate.ts` in vite.config.ts. The existing Calendar config-test adapter recognizes the corrected import. Device protection, TLS certificate paths, proxies, app features and private data remain intact. No warning suppression, dependency reinstall or backend change is needed.

Stop the Vite/dev terminal with Ctrl+C; keep the backend running. Extract the ZIP's single folder into `S:\AI\Fixing-Files-Folder`, then run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Vite-Config-v26\Install-Vite-Config.ps1' -ProjectPath 'S:\AI\friday-ai'
if ($LASTEXITCODE -ne 0) { throw 'Installation failed. Stop here.' }
Set-Location 'S:\AI\friday-ai'
npm.cmd run dev
```

The installer checks the exact v25 config/device-gate hashes, creates a verified backup, then replaces the config and the existing Calendar test if present. Absent test files stay absent. Unknown edits stop installation before replacement. It does not change any AGENTS.md. A later repeated installation is rejected as a different source version; do not repeatedly apply it.

Rollback: stop Vite and run the backup folder's Restore-Vite-Config.ps1 using its full path with process-scoped ExecutionPolicy Bypass, then restart Vite. Restore verifies both backup and installed hashes and stops on later edits. Private data is never part of this source backup.

Validation: the exact real config loads with both native and bundle loaders on Node 24.19, using temporary synthetic certificate bytes solely to exercise config reading on Linux. No TLS server or private certificate was used. Calendar routes/browser tests and device/passkey/page-gate regressions passed 18/18. Package source/hash/backup/restore modeling and exclusion scan passed. Windows PowerShell execution and restarting the actual PC Vite server remain local checks. No live microphone, Cloudflare login, OAuth, phone call or external business write was performed.
