[Download Google Ads Studio v39](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261125-39/FRIDAY-Google-Ads-Studio-v39.zip)

# FRIDAY Google Ads Studio v39

Requires installed AITAN Phase 1 v38. FRIDAY remains hosted on S:\AI\friday-ai. This update adds an actual persistent Google Ads section inside AITAN and official OAuth/read-only connection testing. It does NOT create/enable Google campaigns, spend money or claim the requested test has launched today.

## Included

- AITAN Marketing Studio → selected business → Google Ads Manager.
- Explicit additive Ads database setup, private saved drafts/history, optimistic revision checks and duplicate-create protection.
- Nationwide Manhattan-only water damage/extraction/flood preset: $350 average/day for three days, planned $1,050; proposed 80/20 commercial/general-residential allocation; 24/7 call answering and existing toll-free number. Date is Eastern at draft creation and remains saved; review it before any future launch.
- Exact/phrase seed keywords, cheap/low-price and irrelevant-intent negative phrases, competitor-brand starters and editable search-ad copy. Not live CPC/volume data or an exhaustive NYC/NJ competitor directory.
- Official Google OAuth through the intended manager login, encrypted company-bound refresh storage, actual linked advertiser selection, fresh account read test and Keyword Planner reads. No browser password storage or scraping.
- Typed/voice access for navigation, setup, draft edits/save, account selection/testing, research and review-bundle export. Google sign-in can require a physical click/pop-up permission.
- Private backup now includes campaign drafts and connection metadata, never refresh credentials/OAuth states. Existing company controls, finance, voice, calls and commerce remain.

No new npm dependencies. Server/private `.env`, provider credentials, database connection, device protections, TLS and original records are not replaced. All current app login/owner controls remain. Only Salvador and Dayanna can access these routes; customers have no login.

## Install with full paths

Finish active reviews/calls and stop both FRIDAY terminals with Ctrl+C. Extract the ZIP's single folder into S:\AI\Fixing-Files-Folder, then:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Google-Ads-Studio-v39\Install-Google-Ads-Studio.ps1' -ProjectPath 'S:\AI\friday-ai'
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

Hard-refresh, close old tabs and reconnect FRIDAY. The installer verifies the exact v38 source family, creates a checked source backup and copies only this update. Unknown source changes/new-file collisions stop before copying. Both supported voice families are preserved. Existing enabled FRIDAY jobs may resume after backend restart; this update starts no Google publishing worker.

## Test inside FRIDAY

1. Select Nationwide in AITAN Marketing Studio, then Google Ads Manager.
2. Click Initialize Ads workspace. It adds tables in one transaction and retains the four existing companies.
3. Click Create Manhattan water test to save the actual campaign plan, then inspect keywords, exclusions, proposed budgets and copy. It is a draft, not a Google campaign. Change fields directly or ask FRIDAY to edit supported fields and save the private plan. Failed saves retain inputs; unsaved campaign edits block company switches.
4. For a live connection, follow GOOGLE-ADS-SETUP.md. Private Google Ads developer/OAuth configuration is REQUIRED; an ordinary Google Ads login does not configure an API developer token. The screen reports missing setting NAMES only, never asks for keys in the chat.
5. Connect with Google → List linked advertiser accounts → choose Nationwide advertiser → Verify and assign → Test connection. Only the fresh API result confirms the connection. No campaign/budget mutation exists in this update.
6. Read Keyword Planner for real historical estimates and compare them with the starter list. If unavailable, the system reports the error and does not invent prices/volume. All account research remains separate from seed suggestions.
7. Download review bundle for the saved plan/evidence/account metadata. It is not a validated Google Ads import or proof of publication. The normal private backup also includes saved Ads plans; neither export contains encrypted refresh tokens or OAuth states.

Voice examples: “Open Nationwide's Google Ads section”; “Create the Manhattan water-damage test”; “Show saved advertising drafts”; “Test Nationwide's Google Ads connection”; “Research the keywords for this saved draft”; “Edit this draft's daily budget to 350 dollars, then save the private plan.” Use actual company/draft/account IDs returned by the system. Do not infer a live start from the saved requested date, seed keywords or a successful connection.

## Budget and research boundaries

The requested $350/day is a Google-style AVERAGE budget, not an enforced daily ceiling. Planned $1,050 over three days is not an enforced total cap. Spend controls, validated provider campaign submission and activation are pending. Commercial 80% is a proposed allocation, not an approved account setting; generic local keywords may yield either commercial or residential customers.

“Cheap” searches are excluded in the private plan. The competitor list is industry-brand starters/variants, not every NYC/NJ restoration company. Do not blindly exclude generic service/place words or valuable insurance/estimate queries. No live public-web/Google account research or account configuration was available in the cloud session. Genuine account/Keyword Planner results require the real PC test.

## Backup and rollback

Keep the verified backup printed by the installer under S:\AI\friday-ai\backups\google-ads-studio-v39-<timestamp>. Source restore does not delete Ads tables, drafts or saved authorization and does not revoke/pause actual Google campaigns. Keep the private encryption key stable and securely backed up with the database.

Stop both servers and run:

```powershell
$backupFolder = 'PASTE THE VERIFIED BACKUP FOLDER PRINTED BY THE INSTALLER'
powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $backupFolder 'Restore-Google-Ads-Studio.ps1')
if ($LASTEXITCODE -ne 0) { throw 'Restore failed. Stop here.' }
Set-Location 'S:\AI\friday-ai'
npm.cmd run build
if ($LASTEXITCODE -ne 0) { throw 'Build failed. Stop here.' }
npm.cmd run server
```

Restart npm.cmd run dev in a second terminal, hard-refresh and reconnect. Restore rejects later source edits/damaged backups. For credential removal use Disconnect locally before source rollback; this is distinct from revoking Google-side permission. No destructive database down migration is shipped. Original backups remain private. No AGENTS.md is overwritten.
