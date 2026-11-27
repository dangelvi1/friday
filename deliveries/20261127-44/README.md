[Download v44 Ads workflow update](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261127-44/FRIDAY-Ads-Workflow-v44.zip)

# FRIDAY Ads Workflow v44

November 27, 2026 Eastern. Single cumulative update over the exact delivered v41, v42 or v43, both supported voice families. Adds scoped workflow consent and a functional persistent private draft-review section, while keeping read-only Google Ads, local/public callbacks, encrypted connections, company boundaries, WordPress, Sandra/accounting, commerce, calendar, phone/chat and owner/device/Cloudflare rules.

## Install and restart

Stop both FRIDAY servers and any temporary diagnostic backend. Finish calls/reviews. Extract the entire FRIDAY-Ads-Workflow-v44 folder into S:\AI\Fixing-Files-Folder. Double-click Install-Ads-Workflow.cmd; it validates baseline/payload hashes, makes a verified source backup, installs the cumulative source and builds. Unknown edits/collisions stop before copying. Do not drag individual source files into the project or force an incompatible patch. No dependency reinstall, credential re-entry or .env editing is needed.

Exact PowerShell alternative (the .cmd already performs installation/build):

```powershell
& {
    $ErrorActionPreference = 'Stop'
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Ads-Workflow-v44\Install-Ads-Workflow.ps1' -ProjectPath 'S:\AI\friday-ai'
    if ($LASTEXITCODE -ne 0) { throw 'Installation failed. Stop here.' }
    Set-Location 'S:\AI\friday-ai'
    npm.cmd run build
    if ($LASTEXITCODE -ne 0) { throw 'Build failed. Stop here.' }
    npm.cmd run server
}
```

Second terminal:

```powershell
Set-Location 'S:\AI\friday-ai'
npm.cmd run dev
```

Close old tabs, hard-refresh and reconnect FRIDAY. Source installation runs no migration, provider/research call, campaign launch or website publication. If coming directly from v41, explicitly initialize/update the Ads workspace once for the included v42 callback column; encrypted connections/plans remain. v42/v43 schema is unchanged. Keep both Google Web OAuth callbacks registered: https://localhost:5173/marketing/google-ads/callback and the configured public URI, normally https://friday.dangelvi.com/marketing/google-ads/callback. Existing enabled background tasks can resume after restart.

## One consent for a company's short Ads workflow

The disclosure now offers Allow once and Allow this company for 15 minutes after an unchecked checkbox. The latter covers repeated Ads steps for the named company in the current signed-in tab: open/view/create/edit/save/research/draft review, using the disclosed Google Ads account/planning/keyword data for OpenAI assistance. A general yes, model argument or programmatic click cannot grant it. Scope is not all companies. Accessible advertiser discovery choices stay in the dashboard; the accounts tool returns only a selection-needed summary, not other clients' names/IDs, under a one-company grant. No grant is stored in localStorage, cookies or the database. Expiry uses the displayed deadline plus a monotonic duration check. Stop AI sharing is visible in the Marketing Studio header and Ads section and remains available during an in-flight operation. Stop/expiry/owner/context changes suppress an in-flight result before it returns to the AI; a request already sent to Google cannot be recalled. Data shared earlier cannot be recalled. Reload/tab close/sign-out/company change ends the grant. Changing to another company requires a new choice. Allow once retains the original single-request option. Direct dashboard reads remain available without sharing results with OpenAI.

This permission covers only the dedicated conversational Ads tool. It does not authorize spending/native publication, change OpenAI provider retention/training settings, delete saved history or intercept user-typed/uploaded data in other features. Google authorization and Google API access are separate from OpenAI sharing consent.

## Draft review

AITAN → select Nationwide → Draft review. The manual tab can show all active managed businesses when All managed businesses is selected, or scope to the selected business. The authenticated API reads persistent ad_drafts records and joins actual company names, with a bounded latest-200 list and explicit total/truncation. Search filters loaded company/campaign names. The conversational drafts action requires an actual selected/requested company and is filtered to that company before its results can enter the consent gate; it cannot return an all-company draft list through a one-company grant.

Cards show private status, creation/update time in Eastern 12-hour format, proposed daily/total budget and dates, location, call destination, owner verification flags for call coverage/conversions/landing page, actual saved ad copy, seed keywords, negative/competitor starter review and any saved Keyword Planner evidence. Missing research is explicitly unverified; no impressions/conversions/lead guarantees are fabricated. Open draft / edit uses existing exact company/draft IDs and dirty-state guards. Save remains a private plan action. Google's own campaigns/drafts and their live status are separate; this UI does not create/pause/delete/enable them. The external Google Ads link opens Google's website for manual account selection, without guessing an internal ocid. Repeated conversational create while a draft is already loaded reuses that draft; the dashboard Create button explicitly starts another.

## Research duplicate protection

Successful research stores a plan fingerprint, input revision, connection revision and retrieval timestamp with the existing evidence. An unchanged plan/account can reuse a result less than 15 minutes old, including a repeated request whose original success response was lost. No new Google token/API request is made for reuse. Connection/plan changes or expiry invalidate the cache. Concurrent identical requests in the same backend join one promise. This is not a distributed cross-server queue.

A safe failed research message may be reused from memory for 15 minutes (bounded to 200 entries), avoiding repeated automatic requests against unchanged permissions. Expired entries are removed on the next research request or when the backend stops. It clears on backend restart, changes context with plan/account revisions and can be bypassed by the direct dashboard research button for one explicit retry/refresh. The model tool has no force-refresh permission/parameter. Failure does not invent or save successful metrics; an existing saved success remains timestamped saved evidence. No new DB migration is needed for evidence fields/caches. All provider errors remain safe/recognized codes with fixed guidance. The operation label identifies account read, location lookup or Keyword Planner ideas so a research-flow rejection is not misreported as a broken account connection. A failed flow may occur before the actual ideas request; report the operation actually shown.

## Google access issue remains separate

GOOGLE-ACCESS-NEXT.md covers the reported PERMISSION_DENIED; DEVELOPER_TOKEN_NOT_APPROVED and the optional private local token comparison. Do not claim this patch grants access or that Explorer/account-read success proves every planning-service permission. No real account credentials or production research call were used in cloud tests. Keep the saved draft; obtain the appropriate Google approval or correct the actual runtime token/client/project as the real error warrants. Never paste tokens, secrets, .env, OAuth codes or raw provider logs in chat.

## Privacy wording

PRIVACY-UPDATE.txt gives the changed consent description for the operator to merge into the public policy after PC testing. This package does not update/publish WordPress legal pages, assign a deletion-request owner or alter data/backup expiration. Existing credentials/configuration/private backups are preserved; keep stable encryption keys with private DB backups. Source backups do not replace database/WordPress hosting backups.

## Source rollback

Keep the printed S:\AI\friday-ai\backups\ads-workflow-v44-<timestamp>. With both servers stopped:

```powershell
& {
    $ErrorActionPreference = 'Stop'
    $backupFolder = 'PASTE THE VERIFIED BACKUP FOLDER PRINTED BY THE INSTALLER'
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $backupFolder 'Restore-Ads-Workflow.ps1')
    if ($LASTEXITCODE -ne 0) { throw 'Restore failed. Stop here.' }
    Set-Location 'S:\AI\friday-ai'
    npm.cmd run build
    if ($LASTEXITCODE -ne 0) { throw 'Build failed. Stop here.' }
    npm.cmd run server
}
```

Start npm.cmd run dev in a second terminal. Close old tabs and reconnect. Restore verifies installed/backed-up bytes, refuses later edits/damage and returns the exact earlier v41/v42/v43 voice family/backend. It retains private DB records, the existing additive OAuth schema/config and native campaigns/websites. New evidence fields are ignored safely by earlier code. In-memory consent/failure/in-flight state ends with restart. Restoring removes the workflow grant/review UI and returns earlier per-request consent. No destructive data rollback/expiry or automated Google/native website action is included. AGENTS.md is not overwritten.
