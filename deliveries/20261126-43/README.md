[Download v43 diagnostic update](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261126-43/FRIDAY-Google-Ads-Diagnostics-v43.zip)

# FRIDAY Google Ads Diagnostics v43

The owner confirmed AITAN's Manager ID matches, the developer token UI shows Explorer access and Google Ads API shows Manage/enabled. The remaining generic PERMISSION_DENIED cannot identify which runtime Google login/token/Cloud project caused the rejection. This patch displays recognized native Google reason codes with fixed guidance. It does not guess a permission diagnosis or grant access.

## Included behavior

Cumulative narrow backend update over exact delivered v41 OR v42, both voice families. Includes v42 localhost/configured-public callback selection and explicit additive OAuth-state upgrade, plus diagnostic Google error handling. v41's per-request OpenAI consent remains unchanged. Seven source/test files, no frontend/credential/environment/dependency changes.

Only allowlisted GoogleAdsFailure/ErrorInfo reason codes and known OAuth grant codes are exposed, with fixed operator guidance. Examples include USER_PERMISSION_DENIED, DEVELOPER_TOKEN_PROHIBITED, DEVELOPER_TOKEN_NOT_APPROVED, CUSTOMER_NOT_ENABLED and SERVICE_DISABLED. Google's raw error messages, descriptions, request IDs, field paths, metadata, project/account/client IDs, tokens and secrets are not copied into the error. Unknown types/codes remain generic. Details/duplicates/output are bounded. No retry, log export, additional diagnostic API call, ad launch or connection-guard bypass is added. Network/unreadable failures retain generic handling.

Explorer access and API enablement in one visible project do not prove FRIDAY's runtime token, authorizing login and Client ID belong to those same settings. Use the actual recognized code before changing configuration. No Google credentials were available or tested in this cloud environment.

## Install and restart

Finish/cancel OAuth attempts and active calls/reviews; stop both servers. Extract the full FRIDAY-Google-Ads-Diagnostics-v43 folder into S:\AI\Fixing-Files-Folder and run Install-Google-Ads-Diagnostics.cmd. Guarded installation identifies the previous Ads google.ts hash and independently checks the supported main voice hash. This is necessary because v41/v42 share frontend bytes. Each baseline has its own expected backend/test hashes; unchanged required files and new-file collisions are checked. It creates and verifies source backup bytes before copying. Unknown edits stop; do not force through them.

Exact PowerShell alternative:

```powershell
& {
    $ErrorActionPreference = 'Stop'
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Google-Ads-Diagnostics-v43\Install-Google-Ads-Diagnostics.ps1' -ProjectPath 'S:\AI\friday-ai'
    if ($LASTEXITCODE -ne 0) { throw 'Installation failed. Stop here.' }
}
Set-Location 'S:\AI\friday-ai'
npm.cmd run server
```

Second terminal:

```powershell
Set-Location 'S:\AI\friday-ai'
npm.cmd run dev
```

No frontend rebuild, dependency reinstall or .env editing is required. Installation runs no SQL migration/provider operation. Existing scheduled tasks can resume after restart. Private credentials/data, companies, Sandra/accounting, phone/chat/calendar, commerce/WordPress and owner/device/TLS/Cloudflare protections remain. Backups have no automatic expiration.

## Retry locally and copy only safe diagnostic text

Reconnect/sign in at https://localhost:5173/dashboard. Select AITAN → Nationwide → Google Ads Manager. If Initialize Ads workspace is visible, click once; this adds the nullable redirect_uri state field transactionally, retains auth/plans/research/version 1 and cancels legacy unfinished attempts. Existing v42 upgrades repeat safely. New auth attempts are owner/session/company/expiry/one-time and exact-origin/redirect bound, and token exchange uses the stored callback.

Keep both exact redirect URIs in the same Google Web OAuth client: https://localhost:5173/marketing/google-ads/callback and the configured public callback (default https://friday.dangelvi.com/marketing/google-ads/callback). Do not switch origins during a login. Keep public application info/privacy URLs separate. Never enter credentials into FRIDAY chat.

Click Connect with Google again. If the API rejects access, the FRIDAY authorization page should now include recognized reason code(s) and fixed guidance. Copy that safe displayed error only, without URL parameters/codes, .env, tokens or raw logs. If it succeeds, list linked advertiser accounts, choose Nationwide, Verify and assign, then Test connection. Do not claim success before the actual account read. Direct dashboard reads remain available without AI-sharing permission; conversational Ads operations keep v41's per-request disclosure.

## Source rollback

The installer prints a verified backup at S:\AI\friday-ai\backups\google-ads-diagnostics-v43-<timestamp>. With both servers stopped:

```powershell
& {
    $ErrorActionPreference = 'Stop'
    $backupFolder = 'PASTE THE VERIFIED BACKUP FOLDER PRINTED BY THE INSTALLER'
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $backupFolder 'Restore-Google-Ads-Diagnostics.ps1')
    if ($LASTEXITCODE -ne 0) { throw 'Restore failed. Stop here.' }
}
Set-Location 'S:\AI\friday-ai'
npm.cmd run server
```

Start npm.cmd run dev in a second terminal and reconnect. Restore verifies all backed-up/installed payloads before copying and refuses later edits/damaged backups. It restores the exact pre-v43 backend, whether v41 or v42, and removes only newly added source/test files. It leaves schema/private records/config/native website/Google campaigns intact. Restoring v41 removes localhost dual-origin OAuth, while retaining v41 consent; v42 retains local OAuth but returns generic errors. Restart any OAuth attempt after update/restore. No destructive down migration is included. Source backup is not a private database/content backup. AGENTS.md is not overwritten.
