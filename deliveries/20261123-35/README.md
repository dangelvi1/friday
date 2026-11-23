[Download Market Evidence v35 ZIP](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261123-35/FRIDAY-Market-Evidence-v35.zip)

# FRIDAY Market Evidence v35 — November 23, 2026 Eastern

Requires installed v34. FRIDAY remains on the owner PC at S:\AI\friday-ai. Installation starts no paid research, Shopify request, ads, purchase or native change.

## Why this update

The pasted Bitter Chocolate comparison linked a $97.50 asking price to a general TikTok search page and repeated an unsupported high-demand rationale. Search-source membership alone does not establish an exact item's price, shipping, demand or profitability. That report is not sufficient for choosing a selling price or advertising spend.

## Changes

- Each researched item includes Search Google for its public product name. Automated research is prompted to search broadly for direct independent retailers/manufacturers as well as marketplace leads. This uses the configured research search provider, not direct automated browsing of Google.com. The existing browser_search / local Google voice tool remains available on a computer running FRIDAY Local Agent; opening a Google results page does not establish prices or mean those results were automatically read. Google result pages are discovery links only.

- Recognized general search/category/collection pages remain discovery links. Price/cost/shipping/fee figures from those pages cannot enter usable comparisons or profit calculations. Recognizable direct product/listing paths are required, together with source-list membership, declared exact variant/model/condition matching, USD and an excerpt containing the specific USD price. Unknown paths remain unqualified. This conservative path recognition can reject valid merchant URLs; it fails closed rather than inventing comparables.
- These are still AI-extracted research leads, not independently verified page contents, checkout totals, authenticity, stock or sold data. An AI exact-match declaration and quote do not guarantee correctness. Review the linked exact size/color/condition and delivered total before acting. No browser/login analytics or paid marketplace data access is claimed.
- Unsupported model-generated high-demand/fast-selling rationales are replaced with factual inventory-first text. Seller-reported counts/windows are retained separately as unverified metadata; they cannot generate a daily sales-rate or lot days-to-sell prediction. Ad ideas are withheld when no qualifying item-price lead is returned.
- The research view shows existing per-variant Shopify/report stock, SKU, current selling price and available Shopify/private unit-cost notes, contribution estimates and missing costs. This uses the selected report's snapshot and existing notes, not a new live inventory query. Private cost notes retain precedence over Shopify unit cost. Unknown costs/stock stay unknown; zero stock or missing costs do not qualify as promotion-ready. No new cost account/scopes are connected.
- Restock economics for owned items are collapsed separately from selling your existing stock. New reports show requested targets, returned items and items with qualifying quoted price leads. Detailed-market comparison counts now require a qualifying price lead. Existing six-owned-item/two-new-lead per-run limits and rotation remain; full-store catalog reads do not imply full-store market research. No extra paid retry or research batch is automatically added.
- Legacy saved reports remain intact. Their model rationales/prices/profit tables are hidden or labeled legacy in the current research view; generate a new report for new evidence rules. New report corrections do not rewrite old source data or approve a price/discount.

Payload: commerce/daily/research.ts, new commerce/daily/market-evidence.ts, src/daily-commerce-panel.ts, new src/research-stock.ts, a new test and an updated synthetic market-economics fixture using explicit exact-item quoted sources. No dependency, UI entry point, credential, database, actual report, owner settings, schedule, cost notes, claim or AGENTS.md is replaced. Existing approvals, voice controls, visible pointer, report history, category fixes and receipt protections remain.

## Install

Finish/cancel pending reviews and end active calls. Stop both FRIDAY terminals with Ctrl+C. Extract the ZIP's single folder into S:\AI\Fixing-Files-Folder. Run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Market-Evidence-v35\Install-Market-Evidence.ps1' -ProjectPath 'S:\AI\friday-ai'
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

Hard-refresh and close old review tabs. Source/payload checks, verified backup and guarded rollback are included; no dependency reinstall. Existing enabled schedules/approved due tasks may resume after restart.

## Owner-PC test and selling next step

1. Open the old Marketplace research report: it should say Legacy and stop presenting the general TikTok $97.50 as a usable price. Your saved report remains available.
2. When ready for the usual provider API usage, run Research / audit now once. Existing enabled nightly research also uses the new rules. Check coverage and exact-item evidence labels. A search result is a discovery link, not a verified comparable; fewer/no usable comparisons is an honest result, not permission to invent prices.
3. In each owned-item card, review your actual available size/SKU, price and recorded unit cost. Fill unknown costs under Private per-unit cost notes: actual inbound allocation, shipping to the customer, packaging, selling/payment fees and any other applicable costs. Blank means unknown; enter zero only when you know it applies. Do not transfer the ePower360 item's cost to a Vans item.
4. Choose a promotion only when the item's available stock, contribution costs and appropriate competitor prices support it. Ads/discounts still require separate owner review; this update does not activate either. Reports cannot promise sales speed without measured evidence. The nightly schedule after 7 PM Eastern still needs live owner-PC confirmation if not already checked.

## Restore

Stop both servers. Use the backup-folder Restore-Market-Evidence.ps1 by its full path through powershell.exe -NoProfile -ExecutionPolicy Bypass -File. The installer prints a verified backup under S:\AI\friday-ai\backups\market-evidence-v35-<timestamp>. Restore rejects later source edits/damaged backups, restores old source and removes only new patch files, then verifies bytes. Build/restart/hard-refresh. Source restore does not undo provider usage or private reports; it reintroduces the older, weaker research display, so preserve the evidence caveats. Keep backups until testing completes.
