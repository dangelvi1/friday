[Download Receipts, Orders and Scrolling v30 ZIP](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261122-30/FRIDAY-Receipts-Orders-Scroll-v30.zip)

# FRIDAY Receipts, Orders and Scrolling v30 - November 22, 2026 Eastern

Requires the confirmed installed Saldana Dashboard v29. Both supported voice source families are preserved. FRIDAY stays on the owner PC at `S:\AI\friday-ai`. No dependencies, private configuration or hosting changes are installed.

## What this fixes

Your screenshot showed `writeAttempted: false` and an existing submission guard. The latest confirmation was accepted, but that product was blocked by earlier submission history. The old batch stopped there, so independent approved products did not proceed. The summary also hid the specific reason. Another source of confusion was the shared approval review ID being different from the Shopify batch receipt ID.

- A blocked exact submission now links to its earlier **blocking receipt**. Other independent ready products in the same approved batch can proceed. The result shows the actual reason and an **Inspect this exact receipt** button.
- A new approval may recover an exact earlier reservation only when its owned, terminal receipt proves **writeAttempted false** with an explicit blocked-before-write or stopped-before-submission result. An exclusive recovery journal preserves the original claim and prevents simultaneous recovery. Submitted/uncertain/missing evidence, active reservations and legacy SEO submission guards remain blocked. Nothing deletes or blindly resets a submission guard.
- **Verify current Shopify values** reads the selected receipt's fields in batches of up to 25 products per request. Matching current suggestions move to verified history; edited/different proposals are not falsely marked applied. It does not submit a Shopify change. Original submission status/results are retained, with a separate dated current-value verification record. So an old receipt may still say needs_review even when its current values now match: that preserves the true original outcome.
- New receipts record creation, approval/start and completion/update times. History labels show **12-hour Eastern time with seconds and EST/EDT**. Older receipts lacking event times are labeled **Last saved**, using the recorded file time; creation/approval times are not invented. Dates, status, product count and short ID distinguish entries.
- Connection diagnostics stay under the **same pinned receipt** and retain its original failure details. Voice results return a separate `receiptId`/`workflow.receiptId`; the shared approval ID is not used as a batch receipt ID. Voice can list dated receipts and resolve the intended record before acting.
- **Delete receipt** moves it to receipt Trash after one specific owner review. Check **Show receipts in Trash** to restore it. Active batches cannot be deleted. The original receipt and permanent submission records remain protected so deleting visible history cannot enable duplicate writes. This is reversible visibility deletion, not a purge of accounting/integration evidence.
- **Today cards are clickable:** Orders shows today's readable orders with item/SKU/quantity summaries; Order totals shows the paid/partially-paid subset included in the displayed total; Payments shows successful transactions/refunds with dates, gateway/test markers and order links; Waiting to fulfill shows readable open physical items; Products shows actual products and stock. Each record/card has an **Open in Shopify** link to the pinned Saldana store. These are read-only views of the latest Today refresh. Order totals are not bank deposits or profit, and historical order access depends on the actual app permissions.
- **Results scroll into view in FRIDAY's active dashboards** with a visible pointer, including ambiguous product matches, reports, suggestions, pricing, photo results, calendar/phone/chat areas and accessible same-origin embedded Finance/Gmail workspaces. The shared observer follows the changed result, rather than another older result on the same page. Hidden panels, active reviews, typing and manual scrolling are respected; background updates do not independently initiate scrolling. This is dashboard presentation, not OS mouse control or control of an external Shopify tab.

## Install - full path

Finish/cancel open reviews, end active calls, then Ctrl+C in both FRIDAY terminals. Extract the ZIP's single folder into `S:\AI\Fixing-Files-Folder`, then run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Receipts-Orders-Scroll-v30\Install-Receipts-Orders-Scroll.ps1' -ProjectPath 'S:\AI\friday-ai'
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

Hard-refresh `/dashboard`, close old review tabs and reconnect the existing FRIDAY voice session. Installation verifies exact source/payload hashes, backs up changed source with verification, and rejects unknown edits/new-file collisions. Private reports, credentials, documents, database, submission guards, schedules, unrelated modules and AGENTS.md are not replaced. No provider call, Shopify write, paid research, phone call or email is made by installation. Existing enabled schedules/approved due tasks may resume when the backend restarts.

## Test the receipt problem first

1. Go to **SALDANA SHOP → Changes & receipts → Saved listing receipts**. Choose the most recent dated batch. Check the pinned ID/date and specific reason. Open its blocking receipt directly instead of guessing among old IDs.
2. Click **Verify current Shopify values**. This is read-only in Shopify. Matching suggestions should leave pending Suggestions; the original receipt status is preserved separately. If the report is in Trash or missing, restore/open the appropriate report before expecting its local labels to refresh.
3. Return to Suggestions and prepare a **fresh review** of the remaining recommended changes. Approve once. Known-unsubmitted reservations can recover, while real uncertain/legacy guards require inspection and are not silently bypassed. The exact result states how many products verified and why any remain blocked. Do not delete private claim files to force a write.
4. Delete one unneeded receipt, cancel once to verify no change, then approve Delete. Check Trash and Restore. The deletion review can use the same natural “approve it” / “cancel it” voice gate.
5. In Today, Refresh, click each summary card, inspect its item summary and direct Shopify link. “Show today's orders” or “Show payments” can open the matching metric view by voice. “Show me the navy Vans” should bring the matching cards into view; multiple matches require selecting the intended product.
6. Try another FRIDAY dashboard with results below the viewport. Its active result should become visible while the assistant sidebar stays in place. Typing unsaved input or manually scrolling should not be interrupted by background refreshes.

Tests use synthetic data/providers. Windows installation, real Shopify permissions/data/receipts, microphone, iPhone/Cloudflare behavior and real provider writes remain owner-PC checks. Gmail's actual implementation source and the PC database configuration were not in the sanitized export; generic same-origin scrolling was tested with embedded fixtures, not a live mailbox.

## Restore

Finish/cancel reviews and stop both terminals. Use the **backup folder's** `Restore-Receipts-Orders-Scroll.ps1` by its full path with `powershell.exe -NoProfile -ExecutionPolicy Bypass -File ...`. The verified source backup path is printed under `S:\AI\friday-ai\backups\receipts-orders-scroll-v30-<timestamp>`. Restore rejects later edits/damaged backups, restores/removes the exact source files and verifies the result. Build/restart and hard-refresh.

Rollback changes source only. It does not undo Shopify changes, verification notes, receipt visibility or retained claims/recovery journals. The older interface may not display all v30 audit details. Preserve and inspect submitted receipts before another write. Source backup and private-data backup are separate; keep the source backup until testing is complete.
