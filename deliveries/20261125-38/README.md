[Download AITAN Phase 1 v38](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261125-38/FRIDAY-AITAN-Phase1-v38.zip)

# AITAN Marketing Studio — Phase 1 v38

November 25, 2026 Eastern. Requires installed FRIDAY v37. FRIDAY stays at S:\AI\friday-ai.

This implements persistent business/customer workspace management inside FRIDAY, not a static mockup. Your companies and outside businesses use the same AITAN marketing-customer system, labeled Our company or External customer. Customers have no login and no portal. Salvador and Dayanna manage them through existing FRIDAY owner sign-in.

## Included now

- AITAN Marketing Studio in the existing dashboard navigation and All functions search.
- Four initial independent profiles: Nationwide, SaldanaShop, Carba Exotics and AITAN.
- Add/reload/edit/deactivate any additional marketing customer business without modifying source.
- Independent branding, contact information, services, audience, geography, strategy, instructions, language, time zone, ad/AI budget plans, weekly planning targets and marketing account notes.
- Consolidated profile overview and all/internal/external filters. No invented live performance metrics.
- Real PostgreSQL persistence in a new aitan_studio namespace, transactional initialization, safe revision checks and idempotent creation saves.
- Activity records with company and administrator; no free-text/private contacts copied into activity messages.
- A per-company publishing pause preference, saved private backup download and guarded source rollback.
- Natural typed/voice commands through the existing FRIDAY Realtime SDK, plus responsive desktop/mobile controls.

No new npm dependency is required. Database setup is explicit, not run by installation or startup. No Meta/Instagram account is connected, campaign launched, content published, video rendered, invoice created or money spent. Existing accounting, Sandra, Shopify, Gmail, calls, calendar and voice approvals retain their integrations. Upcoming marketing modules are clearly marked pending.

## Install

Finish pending reviews and stop the two FRIDAY terminals using Ctrl+C. Extract this ZIP's single folder into S:\AI\Fixing-Files-Folder. Then run the exact full path:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-AITAN-Phase1-v38\Install-AITAN-Phase1.ps1' -ProjectPath 'S:\AI\friday-ai'
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

Hard-refresh, close old tabs and reconnect FRIDAY to load the added voice tool. If the installer reports an unsupported baseline, stop and keep the installed files; do not force past its hash checks. It supports both known v37 voice source families. Private credentials, database configuration/TLS, owner/device access settings, reports, uploads and accounting records are never replaced. Existing enabled schedules may resume after backend restart.

## First run and test

1. Open /dashboard and select AITAN Marketing Studio. Use your existing FRIDAY owner sign-in. Click Initialize company workspaces once. This creates the additive schema and four profiles in one transaction; repeating the action retains all saved data.
2. The PC's existing PostgreSQL user must permit creation of the new schema. If storage/setup fails, existing tables are preserved and no external action occurs. Check the existing private PostgreSQL setup; do not paste passwords here. This update supplies no replacement db/pool module or database credentials.
3. Select Nationwide and confirm the saved facts. Fill only actual brand/contact information. A starter coral hex for Saldana is marked as a suggestion to confirm. Blank cost/budget means unset; use two decimal places for explicit USD budgets.
4. Click Add marketing customer / company, enter an outside business name and known contact/brand details, then save. The new-entry form clears after successful creation. Select the saved business to reload it. Failed validation retains your entries. Save or discard unsaved edits before switching companies.
5. Choose Our companies, External customers or All to filter. All four owner companies are managed marketing customers too; the relationship label does not give customer access. Deactivate by clearing Business active and saving; include deactivated businesses to reload/reactivate later. Customer relationship status is separate from the workspace active flag.
6. Try voice/typed requests: “Friday, open AITAN Marketing Studio”; “Show my marketing customers”; “Add a marketing customer named [business]”; “Select Nationwide in Marketing Studio”; “Save Nationwide's brand voice as [your instruction]”; “Pause Nationwide publishing in Marketing Studio”; “Show this company's marketing activity”; “Deactivate this marketing business”; “Reactivate this marketing business.” An ambiguous company requires selection; generated/guessed IDs are not used.
7. Download private backup and verify its JSON contains the saved company profiles and activity. Store it securely; it contains business contact details. Do not upload it to GitHub or include it in sanitized source exports.

The pause button saves an AITAN publishing preference; there is no AITAN publisher yet and it does not pause existing Saldana research/calls/other FRIDAY automation. Weekly frequency, language, ad/AI budgets and semi-automatic mode are planning preferences. Fully automatic publishing is unavailable. Requests to create Reels, post ads or report live performance must be described as pending; this package does not pretend these services exist.

## Backup and rollback

The installer prints a verified source backup at S:\AI\friday-ai\backups\aitan-phase1-v38-<timestamp>. Keep it until live testing is complete. Source restore leaves AITAN business data in PostgreSQL intact and does not remove any original FRIDAY data.

To roll back, stop both FRIDAY terminals, use the exact printed backup folder and run:

```powershell
$backupFolder = 'PASTE THE VERIFIED BACKUP FOLDER PRINTED BY THE INSTALLER'
powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $backupFolder 'Restore-AITAN-Phase1.ps1')
if ($LASTEXITCODE -ne 0) { throw 'Restore failed. Stop here.' }
Set-Location 'S:\AI\friday-ai'
npm.cmd run build
if ($LASTEXITCODE -ne 0) { throw 'Build failed. Stop here.' }
npm.cmd run server
```

Start npm.cmd run dev in the second terminal, hard-refresh and reconnect. Restore refuses later source edits or a damaged backup instead of overwriting them. No database down migration is run. The private JSON download is a recovery snapshot, not a complete PostgreSQL restore utility. Use/test your existing PostgreSQL backup process before future database upgrades; see ARCHITECTURE-AND-PLAN.md.

## Next phases

Brand/media libraries and an actual content calendar; generated graphics/captions and approvals; official Meta OAuth; Reel rendering; persistent controlled publishing; deeper AITAN CRM/printing/accounting; website/SEO; authorized advertising and reporting. No customer login or public customer portal is in the approved scope. Existing server hosting is sufficient for owner-only management. A later rendering/publishing worker can be a separate process when justified; no hosting migration is included.

Read ARCHITECTURE-AND-PLAN.md for actual source findings, schema, dependencies, remaining features and recovery boundaries. VALIDATION.md distinguishes automated checks from remaining real-PC tests. No AGENTS.md file is installed or overwritten.
