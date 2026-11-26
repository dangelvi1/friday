[Download the single combined v41 ZIP](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261126-41/FRIDAY-Combined-v41.zip)

# FRIDAY Combined v41

This single cumulative package contains v40's functional WordPress Website Manager and Google Ads connection/draft tools, plus a new per-request disclosure/consent gate for conversational Google Ads tool results sent to OpenAI. Install directly over the exact delivered v38, v39 or v40, either supported voice family. You do not need to install v40 first. No external customer login/server is introduced.

## Install the files

Follow START-HERE.txt. Extract the entire folder into S:\AI\Fixing-Files-Folder, stop both FRIDAY servers, finish active calls/reviews, and double-click Install-FRIDAY-v41.cmd. It validates source/payload hashes, creates and verifies a source backup and runs the build. Unknown edits or collisions stop before source replacement. No dependency reinstall is needed. For WordPress, Initialize-WordPress-Key.cmd creates a stable private key only when absent/empty and preserves an existing valid key; do not replace an established key. The optional Configure-Google-Ads.cmd privately prompts for developer/OAuth credentials if not already configured. Keep all .env backups private.

Full PowerShell alternative to the double-click source installer/build:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Combined-v41\Install-FRIDAY-v41.ps1' -ProjectPath 'S:\AI\friday-ai'
if ($LASTEXITCODE -ne 0) { throw 'Installation failed. Stop here.' }
Set-Location 'S:\AI\friday-ai'
npm.cmd run build
if ($LASTEXITCODE -ne 0) { throw 'Build failed. Stop here.' }
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Combined-v41\Initialize-WordPress-Key.ps1' -ProjectPath 'S:\AI\friday-ai'
if ($LASTEXITCODE -ne 0) { throw 'WordPress key setup failed. Stop here.' }
npm.cmd run server
```

In a second terminal:

```powershell
Set-Location 'S:\AI\friday-ai'
npm.cmd run dev
```

Restart once, close old pre-update tabs, hard-refresh and reconnect FRIDAY so all chat/voice sessions load the new tool. The cloud package is not a deployment on your PC. Source installation runs no provider request, database migration, advertising spend or website publication. Existing background tasks may resume after restart.

## What the consent gate does

Every invocation of google_ads_studio_control from FRIDAY's conversational AI presents a separate local disclosure naming OpenAI, the requested action/business workspace, the data categories and purpose. The owner must check an unchecked box and click Allow this request. That grant applies to that one call only. A general yes/approval, a model-supplied consent field, an untrusted programmatic click or an earlier grant cannot approve a new request. Decline, Escape, timeout or owner/session/context change produces only a fixed generic result, without running the denied Ads operation or returning account/keyword/campaign data. Concurrent requests cannot reuse a pending disclosure. A different owner/company during an allowed in-flight request suppresses its result.

The disclosed categories include account identifiers/names, currency/time zone, campaign plans and keyword/negative/ad-copy/budget/target information, plus historical Keyword Planner volume, competition and bid estimates. These results are used by OpenAI to answer the requested question and assist with campaign planning. The existing server-side Ads layer keeps authorization tokens/developer tokens/client secrets out of model/browser results.

Direct dashboard Ads buttons continue using the FRIDAY backend/Google API without calling this AI-sharing gate or sending their result to the AI. After declining, use AITAN → select company → Google Ads Manager directly. The requested conversational operation is not executed after decline; this does not disconnect Google, delete saved records, pause campaigns or disable normal chat. AI tool results shared earlier cannot be recalled. This is a gate for the dedicated conversational Ads tool, not a claim of system-wide data-loss prevention for user-typed messages, chat attachments, manually supplied screenshots or other integrations. It does not change OpenAI provider retention/training settings or implement ad launching.

## Website Manager included

AITAN → select business → Website Manager → Initialize Website Manager explicitly. Enter the actual canonical public HTTPS WordPress site, dedicated username and Application Password privately. Google credentials do not authenticate WordPress. WORDPRESS-SETUP.md contains the detailed core REST, capabilities, registered SEO meta and first-unpublished-draft guidance. The manager supports company-scoped encrypted connections, actual pages/posts reads, source editing, exact owner-approved draft/edit/publication, raw-field verification, durable no-repeat receipts and reviewed content rollback. Themes/plugins/builders/media/bulk/automatic SEO audits remain pending. WordPress native changes are best-effort guarded against outside edits, not atomic cross-system compare-and-set; use hosting backups and avoid simultaneous editing. Source restore does not undo published content.

## Privacy publication

PRIVACY-POLICY-NOTE.md gives accurate wording for this update and remaining operator responsibilities. This package does not publish the WordPress privacy/home/terms drafts, assign a deletion-request owner or verify all production logging/support providers. Confirm those operational facts, test on the real PC, then publish/test public URLs and use those same URLs in OAuth Branding. No automatic backup expiration was added. Keep the confirmed privacy inbox aitanservicescorp@gmail.com; assign a person who monitors it. No customer data or private WordPress draft was exported in this package.

## Source rollback

The installer prints S:\AI\friday-ai\backups\combined-v41-<timestamp>. Keep that verified backup. Stop both servers, then run its restore script:

```powershell
$backupFolder = 'PASTE THE VERIFIED BACKUP FOLDER PRINTED BY THE INSTALLER'
powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $backupFolder 'Restore-FRIDAY-v41.ps1')
if ($LASTEXITCODE -ne 0) { throw 'Restore failed. Stop here.' }
Set-Location 'S:\AI\friday-ai'
npm.cmd run build
if ($LASTEXITCODE -ne 0) { throw 'Build failed. Stop here.' }
npm.cmd run server
```

Start npm.cmd run dev in a second terminal, close all old tabs, hard-refresh/reconnect. Restore refuses damaged backups or later source edits. It restores the previous source family and removes only this patch's new files; it retains WordPress/Ads/private data and configuration. Restoring pre-v41 code also removes this consent gate, so do not claim it remains active after rollback. No destructive database down migration is supplied. Content rollback needs its separate reviewed website action or hosting backup. AGENTS.md is not overwritten.
