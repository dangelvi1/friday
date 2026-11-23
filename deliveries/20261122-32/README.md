[Download Receipt Save v32 ZIP](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261122-32/FRIDAY-Receipt-Save-v32.zip)

# FRIDAY Receipt Save v32

Requires installed v31. FRIDAY stays on S:\AI\friday-ai. This patch addresses Windows EPERM when renaming a staged local JSON receipt over its existing receipt. A temporary lock is possible, but the specific process/ACL cause on the PC is not established by this error.

## Change

Local commerce JSON replacement retries only EPERM, EACCES and EBUSY, with six waits totaling 2.75 seconds. It retries replacement of the same fully written temporary file, never a Shopify mutation. Existing receipt bytes remain until replacement succeeds. If the lock persists, the original error is returned and the old file remains. No unlink/truncate/copy-over fallback, permission changes, security software changes or deletion of submission guards is used. Non-lock errors fail immediately. Temporary-file cleanup remains.

Pre-submission persistence has a distinct local-save phase before the provider call. Storage failures are identified as FRIDAY local storage, including filesystem syscall failures. The durable pre-submission save remains mandatory; failure stops provider dispatch. This does not recover or reset old uncertain claims. Previous v31 HTML verification and independent product behavior remain.

Only commerce/daily/storage.ts, commerce/daily/seo.ts, new commerce/daily/atomic-json.ts and a new regression test are installed. Private data, configuration, credentials, actual receipts, claims, reports, source backups, other modules and AGENTS.md are not replaced. Installation makes no Shopify/research request. Existing enabled schedules/approved due tasks may resume after server restart.

## Install — full path

Finish/cancel reviews, end active calls, then stop both FRIDAY terminals with Ctrl+C. Extract the ZIP's single folder into S:\AI\Fixing-Files-Folder. Run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Receipt-Save-v32\Install-Receipt-Save.ps1' -ProjectPath 'S:\AI\friday-ai'
if ($LASTEXITCODE -ne 0) { throw 'Installation failed. Stop here.' }
Set-Location 'S:\AI\friday-ai'
npm.cmd run build
if ($LASTEXITCODE -ne 0) { throw 'Build failed. Stop here.' }
npm.cmd run server
```

Second terminal:

```powershell
Set-Location 'S:\AI\friday-ai'
npm.cmd run dev
```

Hard-refresh and close old review tabs. The installer verifies supported source/payload hashes, creates a verified source backup and rolls back copied source on failure. No dependency reinstall is needed.

## Resume safely

Open the receipt for the interrupted batch showing 75 verified products. Click Verify current Shopify values. This can mark matching pending suggestions locally without resubmitting native changes; original outcomes/guards remain. Verify before preparing a fresh review of remaining suggestions. The count of 75 is the saved receipt's verified count, not proof of the final in-flight product's outcome.

Some earlier submitted/uncertain guards or genuine field differences may remain. Do not delete claim/receipt files to force a write. Send Copy receipt details for unresolved comparisons or repeated storage errors. Category exclusions are still a separate unresolved issue.

## Restore

Stop both terminals. Use the backup-folder Restore-Receipt-Save.ps1 by its full path with powershell.exe -NoProfile -ExecutionPolicy Bypass -File. The installer prints the backup path under S:\AI\friday-ai\backups\receipt-save-v32-<timestamp>. Restore checks current installed hashes and backup hashes before replacing source; later edits are rejected. It restores the earlier source, removes only new patch files, and verifies the result. Build/restart and hard-refresh. Source restore does not undo Shopify changes, local verification notes, receipts or permanent submission records. Keep backups until testing is complete.
