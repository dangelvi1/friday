[Download SEO Defaults v33 ZIP](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261123-33/FRIDAY-SEO-Defaults-v33.zip)

# FRIDAY SEO Defaults v33 — November 23, 2026 Eastern

Requires installed v32. FRIDAY remains hosted on S:\AI\friday-ai. Installation makes no provider call, Shopify write or paid research request.

## Changes

- A null custom SEO title override can match the current live product title only when that title exactly equals the approved value. Receipts retain raw current:null, add effectiveCurrent and identify comparisonBasis:shopify_default_product_title. This is evidence of the default title, not a claim that a custom override was stored. No title fallback is used when the current override is non-null, when live product title differs, for meta descriptions, or for other fields. Exact pre-write before-value checks remain.
- Current-value verification can move these matching old proposals out of pending suggestions, without resubmitting to Shopify. Original uncertain/blocked statuses and permanent submission guards remain as history. New audits avoid proposing a redundant exact default title.
- New audits decode one layer of common HTML entities when preparing plain SEO description proposals. Existing SEO descriptions containing encoded entities get an explicit correction proposal preserving their exact current value as before. The corrected description still requires review and approval before a Shopify write. Product description HTML is not changed by this correction. Existing reports/reviews are not silently rewritten; generate a new report to see new correction proposals.
- Category field reviews include sanitized exception/provider diagnostics rather than only the generic native-review message. This exposes evidence needed to diagnose the 138 old exclusions; it does not assert those categories are now applied or safe to change. Existing category/definition safeguards remain.

Only commerce/daily/seo.ts, commerce/daily/saved-field-comparison.ts, new commerce/daily/seo-text.ts and a regression test are installed. No dependencies, UI entry points, credentials, actual receipts/claims/reports, database or AGENTS.md are replaced. The v32 local-file lock retry fix is retained and hash-checked.

## Install

Finish/cancel pending reviews, end active calls and stop both FRIDAY terminals with Ctrl+C. Extract the ZIP's single folder into S:\AI\Fixing-Files-Folder, then run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-SEO-Defaults-v33\Install-SEO-Defaults.ps1' -ProjectPath 'S:\AI\friday-ai'
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

Hard-refresh and close old review tabs. Source/payload hashes, verified source backup and guarded rollback are included. No dependency reinstall is needed. Existing enabled schedules/approved due tasks may resume after restart.

## Next owner-PC steps

1. Open the latest receipt that completed with 48 products, then Verify current Shopify values. If the live Navy/White Vans and ePower360 product titles exactly match their approved SEO titles, their default-title comparisons should now match without a new write. Raw null overrides and original historical statuses remain visible. The interrupted tag claim is not automatically reset.
2. Go to Reports & schedule and choose Research / audit now to create a NEW report with current Shopify values. This uses the existing research provider and its usual API usage; installation does not run it. Existing already-enabled nightly runs can also produce the new report.
3. In that new report, inspect the ePower360 SEO-description correction (readable & instead of literal &amp;), review and approve the intended changes. New correction suggestions use current native before values; they do not overwrite a changed field from an old report. Do not blindly approve unrelated category changes.
4. If categories remain excluded, copy details from that NEW review receipt. Its excluded entries now include sanitized native errors/codes. Do not repeat an old batch or remove private guards to force it through.

No live Windows/Shopify/microphone testing was performed in the cloud. Native current-value verification and the approved description correction on the PC are the live acceptance steps.

## Restore

Stop both servers. Run the backup-folder Restore-SEO-Defaults.ps1 by its full path via powershell.exe -NoProfile -ExecutionPolicy Bypass -File. The installer prints the verified backup under S:\AI\friday-ai\backups\seo-defaults-v33-<timestamp>. Restore rejects later source edits or damaged backups, restores previous source and removes only this patch's new files. Build/restart/hard-refresh. Source restore does not undo Shopify changes, local verification notes or submission evidence. Keep backups until testing completes.
