# Source audit and compatible implementation - November 22, 2026 Eastern

Evidence: the 294-file hash-verified owner export and the recovered FRIDAY-Codex-Reference.zip. FRIDAY-HANDOFF.md (October 13) and AGENTS-SUGGESTED.md were read. No AGENTS.md was in either upload. The source matches the latest released v27/v28 voice baseline (voice family v13 on the owner export); v12 is also supported. Sanitizer-redacted test/diagnostic/dependency text was matched against publicly released package originals before using the exact original source hashes. Private configuration was not reconstructed. No cloud-to-PC hosting migration is included.

## What the current source established before changes

| Area | Source evidence / limit |
| --- | --- |
| Frontend/backend | `src/main.ts` creates the existing Realtime agent/session and modular panels; `server.ts` registers owner/device/auth, calendar, chat, office calls, QuickBooks, Gmail, commerce/Shopify and marketplaces. Vite frontend and Express backend remain separate. |
| Voice | `daily_commerce_control` already supports reports, inventory, metadata reviews, promotions and photo drafts, but has no Today/product-photo/print actions. Global dashboard navigation/pointer and contextual owner approvals already exist. |
| Saldana UI | One long daily-commerce panel. `renderChanges` renders every change, including appliedAt; Accept All prepares a review, rather than a separate selection-only control. Reports already refresh together and support Trash/restore. |
| Store/sales | Catalog audit paginates active products, variants and pictures. `salesSummary` is last-30-day paid/partially-paid order totals; no first-page Eastern-day payment/fulfillment overview exists. Unknown costs/scopes already have explicit limitations. |
| Listing updates | `commerce/daily/seo.ts`, `catalog.ts`, `suggestions.ts` and `promotions.ts` implement reviewed metadata writes, real taxonomy/definitions, exact field readback and guarded receipts. Existing protection against uncertain duplicate submissions must remain. Base-price/stock writes and campaigns are separate from metadata proposals. |
| Research/scheduler | Per-owner private file jobs, activity, stopped/interrupted states and daily reservations already exist. The saved enabled schedule defaults to 19:30 Eastern. Research rotates up to six owned items and two leads, with only two channels per item; no per-item purchase budget or six-platform coverage summary. |
| Photo builder | Own-photo upload/analysis and reviewed DRAFT creation already exist; no name-only lookup, structured per-match price result, measured weight/category fields or verified Online Store publication. Search exceptions retain inputs but have no persisted last-search outcome. |
| QuickBooks/Document Analysis | Modular company routes, invoice custom-field search/detail/update, bank review/reconciliation/statements, Sandra learning/collections and private document-analysis review/report files are present. Earlier user-confirmed behavior is historical evidence. These modules were preserved; no live accounting action was performed for this update. |
| Gmail/DB | Server imports/registration and root OAuth helpers are visible, but `gmail/` and `db/` source folders were omitted by the source export's allowlist. Therefore mailbox implementation and full backend startup cannot be completely audited from this ZIP. This is not evidence that the working PC lacks them. No unrelated account was connected. |
| Sara/Camila/Estimating/Aitan | No verified employee-service/module connection is established by the supplied source. The handoff's separate Nationwide operations service may live elsewhere on the PC and was not available here. Do not equate a role/name with an installed worker. |

## Smallest compatible changes implemented

1. Add `commerce/daily/today.ts`, a read-only, identity-pinned, paginated live Today overview, and register it in existing daily routes. Include Today in nightly reports without changing private schedule settings or existing reservation guards.
2. Add `src/commerce-workspace.ts/.css` to group the existing controls/listeners into views and display sales/actions/catalog pictures. Keep `daily-commerce-panel.ts` as the existing controller. Filter verified applied rows to history, add selection-only Select All, and retain the same review/receipt functions.
3. Extend `core.ts`/`research.ts` settings and evidence formatting for separate product-price bands, six named marketplace coverage outcomes, source-linked economics/ROI and explicitly conditional turnover. Preserve missing-cost and no-spending semantics; keep bounded rotating owned-item research.
4. Extend `photo.ts` and `commerce-photo-panel.ts` for name/photo search outcomes and complete confirmed listing facts. Add `publication.ts` for current schema/scope/channel preflight, full product readback and reviewed activation/publication. Resume only the same known draft before any activation/publication attempt; uncertain submitted native writes remain guarded.
5. Extend the existing `daily_commerce_control` tool/schema/instructions in both main.ts source families. Open the existing dashboard while speaking, show product pictures, and use browser printing on explicit request without a new FRIDAY review. Preserve all other tools and owner approval gates.
6. Update relevant fixtures/selectors for the new tabs/full field verification and add backend/browser/real Agents SDK tests. Package only the changed files with exact accepted source hashes, verified backup and guarded restore.

## Material limits

- Cloud tests use synthetic providers and data, not the owner's live metrics/stock/orders. Actual scopes, market-source access, response completeness, media processing, API permissions and sound/phone behavior still require PC checks.
- Orders/payment transactions are separate; totals shown are not profit/settlement. Open physical backlog can include pickup/unpaid orders; delivery method is not independently classified.
- Marketplaces are public research sources; this does not connect their seller accounts, post cross-listings, buy stock, spend ads or fulfill orders. Restricted/unavailable sources remain gaps. A seller's market sales-rate claim is not the store's forecast.
- Online reference pictures are not automatically republished. Measured packed weight, exact identity/condition/quantity and current location/category cannot be guessed.
- Browser printing opens the device print path. Silent Windows printing/native queue confirmation is not installed. No extra FRIDAY approval is requested for the explicit picture-print action.
- Previous phone-location/food-pickup behavior requests remain separate pending work; this package does not claim they were implemented.
