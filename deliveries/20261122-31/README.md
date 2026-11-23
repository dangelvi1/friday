[Download Shopify Verification v31 ZIP](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261122-31/FRIDAY-Shopify-Verification-v31.zip)

# FRIDAY Shopify Verification v31

Requires the installed v30 Receipts, Orders and Scrolling update. FRIDAY remains on the owner PC at S:\AI\friday-ai.

## Confirmed problem and correction

The provided readback shows the Olive Blue product's SEO title, SEO description and tags exactly match the approved values. Shopify converted the description's apostrophe entity `&#39;` into a literal apostrophe, with all other characters/paragraphs identical. The previous exact HTML comparison treated that representation change as uncertain and stopped the batch.

This patch recognizes only apostrophe entity spelling differences (`&#39;`, equivalent decimal/hex spellings and `&apos;`) in plain paragraph text during saved-value verification. It does not relax markup, attributes, whitespace, wording, SEO fields, tags, prices, definitions or pre-write before-value checks. Unknown HTML stays exact. Matching changes can leave pending suggestions after read-only verification; original submission status and permanent claim records remain intact.

Future readbacks store per-field current/approved values and comparison basis in the receipt. A genuinely different readback remains uncertain, with no automatic resubmission. Other independently reviewed products in that approved batch can proceed. Provider/network/identity failures still stop the batch. Already-submitted/unknown and legacy guards remain protected.

Only commerce/daily/seo.ts, the new commerce/daily/saved-field-comparison.ts and a regression test are installed. No dependencies, UI/voice entry points, credentials, reports, claim files, database or AGENTS.md are replaced. The 138 category exclusions in the older receipt are a separate issue; this patch does not claim they were applied or resolved.

## Install using the full path

Finish/cancel open reviews and end active calls. Stop both FRIDAY terminals with Ctrl+C. Extract the ZIP's single folder into S:\AI\Fixing-Files-Folder, then run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Shopify-Verification-v31\Install-Shopify-Verification.ps1' -ProjectPath 'S:\AI\friday-ai'
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

Hard-refresh the dashboard and close old review tabs. Installation performs source/payload hash checks, a verified source backup, and guarded rollback on failure. It makes no Shopify request or research call. Previously enabled schedules/approved due tasks may resume after backend restart.

## Verify the affected receipt first

Open Changes & receipts, choose the affected batch (the one with 11 products verified and the Olive Blue uncertain result), and click Verify current Shopify values. Its description should now match if it still differs only by the confirmed apostrophe spelling. That suggestion can move to verified history without a new Shopify write. The old receipt's original needs_review/uncertain status remains as historical evidence; inspect its separate current-value verification.

Then prepare a fresh review of remaining pending suggestions, inspect included/excluded changes and approve once. An earlier submitted/uncertain Navy/White SEO guard can still block that product and link its earlier receipt; it is not silently reset. Real future mismatches show their field comparisons and allow other independent approved products to continue.

## Restore

Stop both FRIDAY terminals. Run the backup-folder copy of Restore-Shopify-Verification.ps1, using its full path, through powershell.exe -NoProfile -ExecutionPolicy Bypass -File. The installer prints the verified backup path under S:\AI\friday-ai\backups\shopify-verification-v31-<timestamp>. Restore refuses later edits or a damaged backup, restores the old SEO module, removes only this patch's new files, and verifies restored bytes. Build/restart both servers and hard-refresh. Source restoration does not undo Shopify changes, verification notes or submission guards. Keep the backup until testing is complete.
