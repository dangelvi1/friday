[Download Research and Photos v37](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261123-37/FRIDAY-Research-Photos-v37.zip)

# FRIDAY Research and Photos v37 — November 23, 2026 Eastern

Requires installed v36. FRIDAY remains on S:\AI\friday-ai. Installation starts no provider request, image generation, native Shopify change, call, email or ad.

## What was found and changed

The old pricing voice action read saved pricing and returned the first ten products unless given an exact product ID. A name query did not start a web search. A saved-result miss could therefore be mistaken for no online listings. Cost-note saves also updated owned-cost rows without refreshing the pricing experiments.

Pricing now resolves actual catalog products by ID or case/punctuation-normalized words, including products beyond the first ten. Ambiguous names require selection. Results explicitly identify saved-report data and state no live search occurred; a saved miss is not proof of online unavailability. Saving private cost notes refreshes persisted pricing, its read projection and dashboard estimates without changing Shopify. Older price leads without current evidence/variant linkage do not enter pricing advice. Partial legacy audits keep missing data unknown.

### Focused research

Marketplace research now has a product selector and Research selected product button. Each owned research card has Research this product. The new research_product voice action resolves the requested real store product and starts one focused run through the existing configured web-search provider. Normal API usage applies. It does not depend on the automated Google browser, require manual pasted links before trying, or automatically repeat paid searches.

The worker rereads the connected, identity-checked catalog. A missing/invalid live target or wrong store stops before the paid research call. Only the selected product is passed to focused research; new/restock products and supplier offers are excluded from focused results. Up to 100 actual variant IDs/details are supplied for this mode (daily rotation remains capped at 12 variants per product and six owned/two new products). Input includes included/total variant counts. This does not promise exhaustive listings, perfect matches or sales speed.

Owned price leads must link a supplied actual variant ID belonging to that product. Results distinguish the store variant, seller-reported size/condition, quoted item price and separately quoted seller shipping. AI-extracted quotes still require source review; missing costs or identity remain unknown. A valid amount followed by sentence punctuation is recognized without accepting malformed extra decimal digits. Seller shipping is not the owner's outbound fulfillment expense.

Focused runs preserve the enabled nightly full-report slot and do not change saved schedules, budget or owner settings. Existing normal run/status/stop/history and report-ready behavior are reused. The UI refuses a new focused run while a commerce operation/review or unsaved cost form is active. Photo/metadata forms are not reset merely to refresh cost pricing.

### Photo/name to listing audit and picture preparation

The existing photo/name lookup already uses images plus notes and public web search to return source-linked candidate products, original suggested copy and missing-fact questions. It can copy title, description, brand/type and SEO text into a private draft, read real categories/locations, and review creation/publication on Shopify. Its price extraction now also requires a recognizable direct item page and a quoted USD amount; search-source membership alone is insufficient. Online pictures remain reference links and are not automatically imported into a listing.

New optional picture preparation creates one clean-white or neutral studio copy from an uploaded ORIGINAL photo using the existing OpenAI API key and the image-edit API. Default image model is gpt-image-1; optional FRIDAY_COMMERCE_IMAGE_MODEL can select another compatible model privately. No key/config value is installed or invented. Image API permission, billing and visual quality require a real-PC test. Each explicit preparation is normal image API usage; no automatic paid retry. There are at most six prepared copies per draft.

Original bytes remain in the owner-scoped private draft. Preparation alone never selects or publishes the copy. Compare the original and AI-prepared image, including item shape, logos/color, visible wear and included accessories; then explicitly Use this prepared copy, or Restore original. The prompt requests faithful presentation, not invented angles or repaired condition; that is not a guarantee of image accuracy. The owner must inspect the real output. Voice actions support preparation, selection by returned asset ID and restoration. Typed listing facts entered while a copy is being prepared are retained.

Selecting/preparing a picture increments the private draft revision and invalidates an old native review. Submitted/uncertain/published drafts cannot be edited with these private controls. The final review labels original versus AI-prepared selected photos and reloads current picture data before display. Existing owner/store/location/category/weight/SKU/stock/tax checks, original-submission guards and verified Online Store publication remain. Uploaded photos alone cannot establish measured packed weight, actual quantity, condition or a chosen selling price; answer missing questions rather than inventing those values. Native Shopify creation/publication still requires the existing final owner approval. Successful creation clears input forms; failure retains drafts. Stop cancels remaining local preparation; provider work/usage already incurred may still exist.

## Install using the full path

Finish/cancel pending reviews and end active calls. Stop both FRIDAY terminals with Ctrl+C. Extract the ZIP's single folder into S:\AI\Fixing-Files-Folder, then run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Research-Photos-v37\Install-Research-Photos.ps1' -ProjectPath 'S:\AI\friday-ai'
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

Hard-refresh, close old tabs and reconnect FRIDAY so new voice actions load. Source/payload checks, verified source backup and guarded rollback are included. No dependency reinstall is needed. Private credentials, reports/receipts/claims, uploads, cost notes, owner settings, schedules, databases, AGENTS.md and unrelated modules are not replaced. Both existing voice source families are preserved; stopped Crosslist automation is not restarted. Existing enabled schedules/approved due tasks can resume after backend restart.

## First owner-PC checks

1. Say: Research my Vans Old Skool Bitter Chocolate now. Compare exact matches for my actual sizes, condition, item price and shipping. Use my saved costs and tell me what is missing. Do not change prices, buy anything or run ads.
2. FRIDAY should resolve the real product (clarify if ambiguous), start focused background research and show progress. Wait for the selected report. A missing public match remains possible; the new action proves a targeted attempt, not that a listing necessarily exists. Fill only real missing private costs; blank stays unknown and zero must be explicitly applicable. Fresh costs update estimates immediately.
3. Open New product. Choose 1–3 JPEG/PNG/WebP item photos and enter its name/notes. Save privately, then Analyse photos & research. Inspect candidate/source links and missing-fact questions; Use researched copy in local draft copies suggestions only.
4. Optionally choose an original photo/style and Prepare photo copy. Image API usage applies. Compare originals/prepared copies, select or restore. Voice examples: Prepare a clean white-background copy of photo one; Use the prepared copy; Restore original photo one. FRIDAY must use actual returned asset IDs, not invent them.
5. Confirm real price, size/condition, stock, SKU, category/location and measured packed shipping weight. Review final listing. For live publication, select Publish to Shopify Online Store or ask to review it for publication, then approve the exact final listing once. Draft-only remains the default. A draft is not proof of publication; inspect the verified published receipt and actual storefront. Test one real item before bulk workflow changes.

File selection itself remains an owner action in the browser picker; some devices require a physical click. The Local Agent is not needed for server-side research, image preparation or these dashboard controls. If a provider request fails/timeouts, reload the saved draft/report and inspect its current state before another explicit paid attempt. No live image edit, Shopify publication, microphone, Windows or iPhone test was performed in this cloud session.

## Restore

Stop both servers. Run the backup-folder Restore-Research-Photos.ps1 by its full path through powershell.exe -NoProfile -ExecutionPolicy Bypass -File. The installer prints a verified backup under S:\AI\friday-ai\backups\research-photos-v37-<timestamp>. Restore rejects later source edits/damaged backups, restores old source and removes only this patch's new files, then verifies bytes. Build/restart/hard-refresh/reconnect. Source restore does not undo research/image API usage, saved private reports/assets, cost notes, native products or submission records. Keep the backup until testing completes.
