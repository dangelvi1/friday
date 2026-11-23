[Download Google Target v36 ZIP](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261123-36/FRIDAY-Google-Target-v36.zip)

# FRIDAY Google Target v36 — November 23, 2026 Eastern

Requires installed v35. FRIDAY remains on S:\AI\friday-ai. No new dependency, agent service, browser profile, provider call, Google search or Shopify change is started by installation.

## Confirmed routing defect

The existing Google voice tool always fetched http://127.0.0.1:8787/google-search from the device displaying FRIDAY. Merely saying 'on the main PC' could not change that route, despite the conversation's suggestion to do so. On iPhone, loopback points to the phone; it does not point to the home PC. The supplied source contains the caller but not the separate Windows Local Agent program/startup configuration, so no agent startup command is invented.

The Google tool now has explicit this_computer and main_pc targets. An explicit main-PC request uses the existing same-origin POST /browser/search route, whose established backend browser opens Google on the main FRIDAY PC. This does not require the current device's Local Agent. The default remains current-device loopback. A failed request never silently falls back to the other device and never automatically retries. Voice instructions explicitly select the main-PC target when requested. Both supported existing voice source families are preserved.

Results identify the dispatched target. A successful browser response is accepted only for the requested Google query on a matching Google search URL; consent/challenge/mismatched pages require visible browser attention and are not reported as a completed search. Opening Google is not proof that results/prices were read or verified. Existing page-reading/dashboard tools are not expanded here. Main-PC owner/device denials are distinct from a stopped local agent. Existing backend authentication/device/browser configuration is unchanged.

This fixes Google target selection. It does not install/start/repair the separate Local Agent for current-device Windows apps/media and other local controls. The Google link in Marketplace research still opens directly without that agent. Automated ecommerce research still uses the configured search provider and does not depend on this tool.

Payload: src/main.ts selected by exact existing voice-family hash, new src/google-search-routing.ts, a new unit test and an updated actual SDK/browser test. Private config, owner sessions, accounts, credentials, reports, claims, AGENTS.md, backend routes and unrelated modules are not replaced. The stopped Crosslist workflow is not re-enabled. Previous ecommerce and receipt fixes remain hash-checked.

## Install using the full path

Finish/cancel pending reviews and end active calls. Stop both FRIDAY terminals with Ctrl+C. Extract the ZIP's single folder into S:\AI\Fixing-Files-Folder, then run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Google-Target-v36\Install-Google-Target.ps1' -ProjectPath 'S:\AI\friday-ai'
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

Hard-refresh, close old FRIDAY tabs, and reconnect the voice/chat session so the new tool schema/instructions load. The installer validates supported source and payload hashes, creates a verified source backup and performs guarded rollback on failure. No dependency reinstall is needed. Existing enabled schedules/approved due tasks can resume after backend restart.

## First live test

Say or type: Search Google for Vans Old Skool Bitter Chocolate on the main FRIDAY PC.

Expect a Google page to open in the existing backend-controlled browser on the main PC. The response should identify the main PC and not claim prices were read. If Chrome cannot launch or Google requires attention, the tool must report that route/browser failure; inspect the main PC's FRIDAY server terminal and visible browser. No separate Local Agent fallback is attempted. Send only a sanitized error if it fails, omitting tokens, keys and private URLs.

Current-device local controls are separate. To diagnose that agent, run on the MAIN WINDOWS PC (not in this cloud and not on iPhone):

```powershell
try {
    Invoke-RestMethod -Uri 'http://127.0.0.1:8787/health' -TimeoutSec 5 |
        Select-Object success, computer | ConvertTo-Json
} catch {
    Write-Host ('Local Agent health check failed: ' + $_.Exception.Message)
}
```

If health fails, the agent is stopped/missing/blocked or listening elsewhere; its actual folder/startup command is needed. If health works but browser access fails, check Chrome's local-network permission for your private FRIDAY origin and the agent's allowed-origin settings. Do not expose port 8787 to the internet or invent credentials. This command reads health only and cannot start a call, search or accounting action.

## Restore

Stop both terminals. Use the backup-folder Restore-Google-Target.ps1 by its full path with powershell.exe -NoProfile -ExecutionPolicy Bypass -File. The installer prints the verified backup under S:\AI\friday-ai\backups\google-target-v36-<timestamp>. Restore rejects later source edits/damaged backups, restores prior source and removes only new patch files, then verifies bytes. Build/restart/hard-refresh/reconnect. Source restore does not undo opened browser tabs or private/provider records. Keep backups until testing completes.
