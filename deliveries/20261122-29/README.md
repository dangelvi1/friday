[Download Saldana Dashboard v29 ZIP](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261122-29/FRIDAY-Saldana-Dashboard-v29.zip)

# FRIDAY Saldana Dashboard v29 - November 22, 2026 (Eastern)

This is a reversible update for the installed v28 source, including both supported voice families. FRIDAY remains hosted at `S:\AI\friday-ai`; the public address, private Cloudflare/device checks, owner sign-in, natural voice session, visible pointer and other company modules remain in place. No dependencies or private configuration are installed.

## What changes

- **Today is the first Saldana page.** Refresh reads the pinned SALDANA SHOP: today's created orders, current totals of paid/partially-paid orders, successful payment transactions and refunds, open physical fulfillment backlog, product/variant counts, known stock and actual product pictures. Today uses America/New_York, including daylight saving. Unavailable/partial reads are labeled, not replaced with zero. Order totals are not profit or bank deposits. Backlog includes open pickup orders; verify payment and delivery method before shipping.
- **Separate views:** Today, Reports & schedule, Current stock, Suggestions, Changes & receipts, Marketplace research and New product. Report selection still refreshes its data together. The existing Trash/restore workflow remains.
- **Select all recommended changes** selects pending supported proposals only. Accept selected/all opens the existing exact owner review. Verified applied rows move out of pending Suggestions into Changes; uncertain/failed receipts stay available and duplicate-write guards remain.
- **Research filters:** per-item purchase price bands (under $10, $10–20, $20–30, higher/custom), independent of the editable total inventory budget and ±10/20% comparisons. Research compares TikTok Shop, Instagram Shop, Amazon, Facebook Marketplace, eBay and Google Shopping with explicit coverage gaps. Existing inventory stays a priority; each run audits the active catalog and researches a rotating sample of up to six owned items plus two new/restock leads. It does not claim a complete market-price audit of every variant. Supplier links, inbound/outbound shipping, fees, profit dollars, ROI and unknown costs are shown. Conditional turnover scenarios use source-reported market sales, not a promise of your own sales speed. Budget upper bounds are exclusive except open-ended bands.
- **Photo or name lookup:** save 0–3 own photos plus a product name/notes (notes required without photos), then Analyse. Each search saves a result or an explicit failure; matches show source links, quoted asking prices, source dates and reference-photo links. Missing exact model/condition/quantity/price/packed weight requires your answer. Only your uploaded photos are used for the listing; online images are references unless reuse is separately authorized.
- **Review and publish:** complete the fields, search the actual Shopify category, enter the measured packed shipping weight/unit, and read actual Shopify locations. Choose draft or Online Store publication. One exact owner review covers the final target. Publication checks the current input schema and actual app scopes/channel, creates a draft once, verifies its fields/stock/weight/pictures, then activates and publishes only to the reviewed Online Store. ACTIVE alone is not reported as publication. Actual Online Store readback is required. If images are processing, inspect the receipt and review publication again when ready; it resumes the same read-verified draft, never recreates it. Uncertain activation/publication is not automatically retried. A deliberately saved draft can later be reviewed for publication if it already contains all required confirmed facts. Missing write_publications must be granted privately through the existing app setup; no permissions are invented or changed by this package.
- **Voice:** “How is Saldana today?”, “What's new in Saldana?”, “Show me the navy Vans”, “Select all recommended changes”, “Set the per-product purchase budget to $20–30”, and “Review this listing and publish it.” Actions open the same dashboard as FRIDAY answers. Existing exact contextual approve/cancel still handles writes.
- **Print a product picture:** an explicit voice/typed command or Print picture button opens the device's print dialog without another FRIDAY approval. Ambiguous products must be identified first. This is browser printing, not silent Windows spooler control; printer completion is not verified. iPhone printing requires the device's supported print path/printer. Other approvals remain.

## Install - use the full path

Finish/cancel open reviews, end active calls, then Ctrl+C in both FRIDAY terminals. Keep the source backup until the update is validated. Extract the ZIP's single folder into `S:\AI\Fixing-Files-Folder`, then run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Saldana-Dashboard-v29\Install-Saldana-Dashboard.ps1' -ProjectPath 'S:\AI\friday-ai'
if ($LASTEXITCODE -ne 0) { throw 'Installation failed. Stop here.' }
Set-Location 'S:\AI\friday-ai'
npm.cmd run build
if ($LASTEXITCODE -ne 0) { throw 'Build failed. Stop here.' }
npm.cmd run server
```

In the second terminal:

```powershell
Set-Location 'S:\AI\friday-ai'
npm.cmd run dev
```

Hard-refresh `/dashboard`, close old review tabs, reconnect FRIDAY and open SALDANA SHOP. The installer validates the exact installed source family and every payload hash, backs up changed source with hash checks, and rejects unknown edits/new-file collisions before replacing anything. Private credentials, database, documents, reports, schedules, source handoff/AGENTS files and write receipts are not copied or deleted. No QuickBooks records are changed by this update.

Installation makes no Shopify call, research request, phone call or email. Already-approved due office tasks and already-enabled nightly research can resume after restarting the backend. Research uses the existing OpenAI account and web search. The expanded research request has a higher output/search allowance (16,000 tokens / up to 20 tool calls); real usage/cost depends on results. There is no automatic paid retry.

## First checks on your PC

1. Open Today and Refresh sales & stock. Check the “As of” Eastern date, order/payment distinction and backlog against Shopify. Missing read_orders/read_inventory permissions should remain unavailable, not zero. Recent order access is limited by actual app permissions; older open backlog may be unavailable without the needed access.
2. Say “How is Saldana today?” and confirm the dashboard opens while the existing voice replies. Ask for an exact product and check its real picture/SKU. Request Print picture and finish your device's print dialog.
3. Open Suggestions. Select all should not write anything. Review a small factual change and approve once; check its receipt and actual Shopify value before a large batch. Verified entries should appear in Changes.
4. In Reports & schedule confirm nightly research is enabled at **7:30 PM Eastern**, or your chosen time after 7 PM. Saved disabled settings are preserved. The PC/backend must run for scheduled work; each owner has their own report/settings scope. A voice request to enable the saved schedule can use the normal settings action.
5. Run one report, inspect source dates/cost gaps and platform coverage. Restricted marketplace pages or an unavailable research provider must show limitations, not fabricated prices/trends.
6. Use one owned product for photo/name lookup. Confirm every fact before native creation/publication. Start with a draft if desired; publication requires measured shipping weight, an actual category, own pictures, actual location and the real channel permissions. Do not retry a submission marked uncertain; inspect its saved receipt/product link.

No microphone, live OAuth/Shopify read/write, paid research, Windows printer or iPhone physical device was exercised in the cloud tests. The app's current source and the recovered reference were read; missing private configuration was not invented. See VALIDATION.md and AUDIT-AND-PLAN.md.

## Restore

Finish/cancel reviews and end active calls; stop both terminals. Use the **backup folder's** `Restore-Saldana-Dashboard.ps1` by its full path with process-scoped `-ExecutionPolicy Bypass`. The backup path is printed during installation, under `S:\AI\friday-ai\backups\saldana-dashboard-v29-<timestamp>`. Restore rejects later source edits and damaged backups, then verifies the restored bytes. Build/restart and hard-refresh.

Restore rolls back application source only. It does not undo Shopify publications/discounts, delete reports/receipts, revoke approved schedules, or restore private data. Preserve and inspect any v29 submission receipts before retrying anything in the older interface. Source backup and private-data backup are separate.
