[Download the complete WordPress v40 ZIP](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261126-40/FRIDAY-WordPress-Manager-v40.zip)

# FRIDAY WordPress Website Manager v40

November 26, 2026 Eastern. Compatible with the exact delivered v38 or v39 voice families. The cumulative package includes the earlier Google Ads connection source when installing over v38. It keeps all existing companies, accounting/Sandra, ecommerce, calendar, phone, chat, owner/device rules and private configuration. FRIDAY remains at S:\AI\friday-ai; no customer-facing server or login is introduced.

## Start with the files

Extract the full folder into S:\AI\Fixing-Files-Folder. Stop both FRIDAY servers and finish active calls/reviews. Double-click Install-WordPress-Manager.cmd; it performs the guarded source installation and build. Then run Initialize-WordPress-Key.cmd once, and restart your existing two FRIDAY servers once. The key helper creates a stable private key only when absent/empty, backs up .env, keeps Google/unrelated settings and never prints the key. Keep the backup/private key. Do not run files from inside the ZIP preview.

Open AITAN Marketing Studio → AITAN Services Corp → Website Manager. Initialize Website Manager explicitly. Connect the actual canonical https://aitanservices.com address with a dedicated WordPress username and Application Password entered ONLY in the private form. Google Ads tokens are unrelated. Read WORDPRESS-SETUP.md before the first connection/write. No public site has been accessed with credentials or changed here.

## What works

Persistent site connections and receipts; actual authenticated REST read test; pages/posts lists including drafts, search/pagination, native item source; exact private preview; one owner-approved create-as-draft or existing-item edit/publish/unpublish; registered supported SEO string meta; fresh raw-field read-back; durable no-repeat claims; read-only lost-response recovery; explicit private acceptance of actual values; reviewed rollback when the full verified snapshot is unchanged; local credential removal; existing shared voice/typed approvals; mobile layout and foreground scroll/pointer. Private .env, database and hosting backups are not packaged.

WordPress Application Passwords need HTTPS/core REST support and appropriate user capabilities. Published-content edits can take effect immediately after explicit approval. New content is always created as a draft first; publication is a separate review. HTML/block source is reviewed as text, not a theme/layout preview. Core title/excerpt are not automatic SEO overrides. No website theme/plugin/media or bulk redesign is claimed. Native writes are intentionally not retried on uncertain responses. WordPress external-edit checks are best effort, not an atomic distributed transaction.

## Full command-line alternative

The .cmd files perform the first install/build. If you prefer PowerShell, these are the complete paths:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-WordPress-Manager-v40\Install-WordPress-Manager.ps1' -ProjectPath 'S:\AI\friday-ai'
if ($LASTEXITCODE -ne 0) { throw 'Installation failed. Stop here.' }
Set-Location 'S:\AI\friday-ai'
npm.cmd run build
if ($LASTEXITCODE -ne 0) { throw 'Build failed. Stop here.' }
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-WordPress-Manager-v40\Initialize-WordPress-Key.ps1' -ProjectPath 'S:\AI\friday-ai'
if ($LASTEXITCODE -ne 0) { throw 'Key setup failed. Stop here.' }
npm.cmd run server
```

Second terminal:

```powershell
Set-Location 'S:\AI\friday-ai'
npm.cmd run dev
```

Hard-refresh/close old tabs and reconnect FRIDAY to load the new voice tool. Exact baseline/source checks, verified source backup and guarded restore are included. Unknown edits/collisions stop before copying. No dependency reinstall is needed. Existing enabled FRIDAY tasks can resume after restart. Source installation runs no migration, provider request or website write. Initialize adds only the new WordPress namespace tables transactionally.

## Suggested first test and voice commands

Use a small unpublished post draft first, not the live homepage. Verify the connected site/user. Select Posts, New WordPress draft, enter short factual test text, Review exact website change and approve once. Check the verified receipt in FRIDAY and the draft in native WordPress. Never infer publication from a draft receipt. If it is uncertain, Verify current saved fields before any new write. No exact remote URL or WordPress credential was independently verified in this cloud environment.

Voice examples: “Open AITAN's Website Manager”; “Show my connected websites”; “List WordPress posts”; “Open this page”; “Change the title locally to [text]”; “Review this exact website change”; “Verify that website receipt”; “Review rollback.” Use the actual company/site/item/receipt IDs returned by the application. Site passwords are never tool parameters. The existing owner-approval control handles fresh yes/approve/cancel; no direct apply action is exposed in model arguments. Outside-page text is data, not authority.

## Source rollback

The installer prints a verified backup under S:\AI\friday-ai\backups\wordpress-manager-v40-<timestamp>. Keep it. Stop both servers, then run its Restore-WordPress-Manager.ps1:

```powershell
$backupFolder = 'PASTE THE VERIFIED BACKUP FOLDER PRINTED BY THE INSTALLER'
powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $backupFolder 'Restore-WordPress-Manager.ps1')
if ($LASTEXITCODE -ne 0) { throw 'Restore failed. Stop here.' }
Set-Location 'S:\AI\friday-ai'
npm.cmd run build
if ($LASTEXITCODE -ne 0) { throw 'Build failed. Stop here.' }
npm.cmd run server
```

Start npm.cmd run dev in a second terminal, hard-refresh and reconnect. Restore refuses later source edits or damaged backups. It restores the selected old source family and removes only this patch's new files. It does NOT delete WordPress/Ads data, revoke credentials, revert .env, undo native website content or pause existing Google campaigns. Use a separately reviewed site rollback or hosting backup for website changes. No destructive database down migration is included. AGENTS.md is not overwritten.
