[Download Category Review v34 ZIP](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261123-34/FRIDAY-Category-Review-v34.zip)

# FRIDAY Category Review v34 — November 23, 2026 Eastern

Requires installed v33. FRIDAY stays on the owner PC at S:\AI\friday-ai. Installation makes no Shopify call, paid research request or native change.

## Confirmed bug and correction

The new category receipt exposed the actual provider error: Field 'category' doesn't exist on type 'Taxonomy'. FRIDAY's category verifier incorrectly used taxonomy.category(id:...), so otherwise valid suggestions were excluded before approval. This was an application query defect, not evidence of missing owner permission or an invalid Sneakers category.

The verifier now reads the taxonomy.categories connection already used by the working catalog audit. The displayed category's final breadcrumb segment narrows the search, and only the exact returned Shopify category ID qualifies. A matching category name alone never qualifies. It pages when necessary; missing/malformed/repeated cursors or a bounded read limit stop review without a write. If no display label exists it searches the connection without a label rather than inventing an ID. Returned provider errors remain in sanitized diagnostics.

Owner/store identity, exact current-before values, fresh approval, category-dependent metafield safeguards and readback verification remain. Existing Shopify namespace category attributes can still require native dependency review. No category, metafield, tax setting, invoice, inventory or price is changed by installation or preview. A category write still requires the existing exact owner approval. Permanent submission guards and old receipts remain intact.

Payload: commerce/daily/seo.ts, new commerce/daily/category-verification.ts, a new test and two updated synthetic test fixtures that formerly modeled the invalid singular response. Existing fixture files may be absent; present unknown edits are rejected. No dependency, configuration, database, private receipt/report, UI entry point or AGENTS.md is replaced. v32 storage retries and v33 SEO corrections are retained and checked by hash.

## Install using the full path

Finish/cancel pending reviews and end active calls. Stop both FRIDAY terminals with Ctrl+C. Extract the ZIP's single folder into S:\AI\Fixing-Files-Folder, then run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Category-Review-v34\Install-Category-Review.ps1' -ProjectPath 'S:\AI\friday-ai'
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

Hard-refresh and close old review tabs. The installer verifies source/payload hashes, creates a verified source backup and rolls back copied source on failure. No dependency reinstall is needed. Existing enabled schedules/approved due tasks may resume after server restart.

## First live test

Open the current completed report, Suggestions, and Vans Crockett High Decon Canvas Black- White category. Click Accept this change → Review. A new paid research run is not required just to retry validation. If the original before category and product identity remain current and no category-dependent attributes block the change, the review should show Shoes (aa-8) → Sneakers (aa-8-8). Inspect and approve this one category first. Expect a new receipt with one verified product. Preview/prepare alone must not change Shopify.

After that first product verifies, prepare a fresh review of the remaining category suggestions. Inspect included and excluded entries before approving. Do not bypass dependency exclusions or delete claims to force a write. Changed product/category values require a refreshed suggestion. Original no_changes receipts remain historical records; they are not automatically retried or rewritten.

No live Shopify, Windows PowerShell, microphone or phone/iPhone test was performed in the cloud. The owner-PC single-product preview/approval and native readback are the live acceptance check. Other category exclusions can still have legitimate dependency/current-value reasons.

## Restore

Stop both terminals. Run the backup-folder Restore-Category-Review.ps1 using its full path through powershell.exe -NoProfile -ExecutionPolicy Bypass -File. The installer prints the verified backup under S:\AI\friday-ai\backups\category-review-v34-<timestamp>. Restore rejects later source edits or damaged backups, restores prior source and removes only the patch's new files, then verifies bytes. Build/restart/hard-refresh. Source restore does not undo native category changes, private review notes or submission records. Keep backups until testing is complete.
