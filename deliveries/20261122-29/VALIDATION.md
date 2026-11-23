# v29 validation

**134 reported automated test entries passed**: 69 commerce/new-feature entries plus 65 dashboard, owner-session, Chat, office-voice and contextual-approval entries. Parent test entries are included in Node's counts. The dashboard suite was rerun after the photo feedback change (13 entries, all passed); those are not added again to the 134 total.

Commerce runs used:

```sh
npx tsx --test tests/saldana-v29.test.ts tests/saldana-ui-v29.test.ts tests/daily-commerce.test.ts tests/catalog-updates.test.ts tests/commerce-reports.test.ts
```

Boundary runs used:

```sh
npx tsx --test tests/friday-dashboard.test.ts tests/voice-approvals.test.ts tests/owner-session.test.ts tests/v25-dashboard-chat.test.ts tests/office-natural-voice-v28.test.ts
```

All providers/data were synthetic. The browser suites use the actual panels and, where relevant, full built main.ts, real Agents SDK validation, the actual shared voice-review hub, signed mocked phone routes and private PGlite fixtures. No call/email, live Shopify/OpenAI request, purchase, ad spend, native fulfillment or physical print occurred. `window.print` was intercepted to verify the explicit print dispatch and absence of a new FRIDAY review; this is not a printer test.

New checks cover:

- Eastern midnight and 23/25-hour daylight-saving days; separate created orders/payment captures/refunds; exact cents; physical fulfillment backlog; full product counts/photos/SKUs; missing scope, repeated paging and wrong-store denial.
- Separate total/per-item budgets, invalid custom ranges, six-platform gaps, missing shipping and source-linked profit/ROI/conditional turnover; no invented zero costs or guaranteed sales speed.
- Structured photo/name results with only search-linked price evidence; persisted failed search and owner scope; measured weight/category; missing write_publications and unsupported current schema fail before creation.
- One exact approved create/verify/activate/publish flow; current schema can place SKU on InventoryItem while preserving leading zeros; lost native response retains the product/phase and cannot be retried/recreated; processing media resumes only the same known draft after a fresh exact review; edits invalidate the previous review.
- Actual Today-first tabs, product pictures, ambiguity/missing-image print handling, print-dialog status, selection-only Select All, verified history, responsive layout and private owner resets. Actual SDK actions open the existing dashboard and invalid enums never dispatch actions.
- Existing large metadata batches, taxonomy/metafields and compareDigest, scheduled specials, uncertain-write guards, report search/whole-view refresh, receipt diagnostics, Trash/restore, private session boundaries, existing voice approvals, Chat retention/owner clearing and office-call voice behavior continue through their relevant tests.

Frontend `tsc --noEmit` passes for the uploaded v13 family and the preserved v12 variant with its existing Crosslist panel. Strict changed-commerce-module TypeScript passes with ES2023/ESNext/bundler/node settings (`--ignoreConfig` for TypeScript 6). Standalone production build passes using Vite `configFile:false` because the PC's private Windows TLS files are not in the cloud. The existing large-bundle warning remains.

The full backend was not launched: the sanitized export omits the original `gmail/` and `db/` modules and private provider/database configuration. Unrelated historical whole-server QuickBooks diagnostics were not repaired or claimed resolved. Tests of touched backend modules use injected providers/storage; they are not evidence of live OAuth permissions.

**Nine actual PowerShell 7.4.13/Linux package scenarios passed** using the final manifest/payload: installation, SHA-verified backup and full restore for both v12/v13 source families with and without old test files; rejection of an unknown main, an unknown module edit, a preexisting new-file collision and a tampered payload before source mutation; guarded restore rejection after a later edit. A private sentinel file remained unchanged. This is actual PowerShell execution on Linux, not a Windows PowerShell 5.1 claim.

Every payload/profile hash and ZIP CRC is checked; the release is scanned for credential/private runtime paths and obvious provider token/private-key patterns. Existing shared/public business IDs are not credentials. No `.env`, tokens, uploaded customer data, database, browser profiles, report history, actual owner keys or private backups are packaged. No AGENTS.md is installed or overwritten. Exact direct GitHub bytes are read back before delivery.

Still required on the owner PC: native Windows installation/build/restart, actual account/scopes/schema and complete order/backlog visibility, live microphone/navigation/pointer, paid web/image research and its real source coverage, image processing/publication verification on an owner-approved item, Cloudflare/iPhone access and supported physical printing. Do not treat fixture counts/images or the historical handoff as real current store results.
