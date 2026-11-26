[Download v42 local Google Ads support](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261126-42/FRIDAY-Local-Google-Ads-v42.zip)

# FRIDAY Local Google Ads v42

Narrow backend update for the installed combined v41, both supported voice families. The user normally uses https://localhost:5173/dashboard. OAuth may now start/finish on that exact local origin or on the existing configured public origin. The primary private callback configuration is retained. No .env edit, credential re-entry, frontend tool change, consent weakening, new dependency or ad-launch capability is added.

## Google Cloud client configuration

Open Google Auth Platform → Clients → the same Web application client used by FRIDAY → Authorized redirect URIs. Keep the existing configured public URI (default https://friday.dangelvi.com/marketing/google-ads/callback) and add https://localhost:5173/marketing/google-ads/callback. Save. Use exact HTTPS URLs/path/port, without a trailing slash. Do not replace the public callback or use a Desktop OAuth client. The authorized-domain/homepage/privacy fields are separate; do not register localhost as a public authorized domain. This does not publish legal pages or guarantee OAuth verification approval.

## Source install and restart

Finish active reviews/calls and unfinished Google logins; stop both servers. Extract the full folder into S:\AI\Fixing-Files-Folder, then double-click Install-Local-Google-Ads.cmd. This guarded installer checks the exact v41 baseline, verifies backup/source bytes and installs six source/test files. It preserves credentials, private database, companies, WordPress, Sandra/accounting, commerce, phone, chat/calendar and owner/device/Cloudflare rules. No source migration or provider call runs during installation. This backend-only change does not require a frontend rebuild or dependency installation.

Exact PowerShell installation:

```powershell
& {
    $ErrorActionPreference = 'Stop'
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Local-Google-Ads-v42\Install-Local-Google-Ads.ps1' -ProjectPath 'S:\AI\friday-ai'
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

Open https://localhost:5173/dashboard, reconnect/sign in, select Nationwide → Google Ads Manager → Initialize Ads workspace once. This is an explicit, additive, transactional upgrade of the existing schema: it adds redirect_uri to OAuth-state rows, preserves version 1/connection encryption/drafts/research, and cancels older unbound unfinished authorization attempts. Repeating initialization preserves saved data. No database startup migration or destructive down migration occurs. After upgrade, make a NEW Google login attempt.

## Runtime behavior and first test

The start endpoint chooses only between the configured callback and the fixed local https://localhost:5173 callback. No arbitrary request/body-supplied redirect is used. The full selected redirect is stored with the one-time state bound to owner, exact session, company and expiry. Completion must occur on the same allowed origin and consumes only the matching stored redirect. Google token exchange uses that recorded URI, not always the public URI. An origin/session mismatch fails before exchange. Config changes, superseded/expired/used/legacy state and disconnect protections remain. OAuth popup notifications remain bound to their exact opener origin/company. Saved credentials are not returned to the AI/browser. v41's per-request local OpenAI disclosure remains unchanged.

Test locally: Connect with Google → Google consent → List linked advertiser accounts → select Nationwide → Verify and assign → Test connection. If you also use the public origin, sign in there separately and run a fresh attempt; do not switch between origins midway. Session cookies remain origin-bound. HTTPS localhost points to the device using the browser; the public domain remains the remote-device address. The supplied patch does not change TLS certificates, DNS, Google consent settings or access protections.

If the popup still closes, inspect the message directly under the Google Ads heading (gaState). Missing Google configuration/developer access, bad client/secret, unregistered URI, revoked consent, Google account permissions or network errors still need their own actual correction; no fixture test establishes live connectivity. Do not send OAuth codes, tokens, secrets or .env to chat. Public/private privacy/contact operational work remains separate.

## Source rollback

The installer prints a verified backup under S:\AI\friday-ai\backups\local-google-ads-v42-<timestamp>. With both servers stopped:

```powershell
& {
    $ErrorActionPreference = 'Stop'
    $backupFolder = 'PASTE THE VERIFIED BACKUP FOLDER PRINTED BY THE INSTALLER'
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $backupFolder 'Restore-Local-Google-Ads.ps1')
    if ($LASTEXITCODE -ne 0) { throw 'Restore failed. Stop here.' }
}
Set-Location 'S:\AI\friday-ai'
npm.cmd run server
```

Start npm.cmd run dev in a second terminal and reconnect. Restore verifies installed payloads/backups and refuses later edits in the files it would replace. Source rollback leaves the additive redirect column/private tables/data in place; v41 ignores that extra column and retains its consent gate. Finish/cancel and restart any OAuth attempt after rollback. Local dual-origin authorization is removed by rolling back this patch; the old configured-origin workflow returns. Source backup is not a private database or WordPress-content backup. Native site/campaign data are not reverted or deleted. Backup copies still have no automatic expiration. AGENTS.md is not overwritten.
