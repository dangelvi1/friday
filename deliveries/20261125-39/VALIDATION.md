# Google Ads Studio v39 validation — November 25, 2026 Eastern

242 reported automated entries passed across release runs: 30 combined Ads/AITAN entries (15 new Ads entries and 15 existing AITAN entries), 195 existing commerce/dashboard/owner-approval/phone regression entries, and 17 isolated Google-browser routing/actual SDK/chat entries. Node counts include parent entries. Test account IDs, OAuth responses, metrics and contact data are synthetic. No real Google Ads account was connected in this cloud session.

## New plan/credential/service tests

The actual PostgreSQL-compatible PGlite engine and production SQL are used, including transactional schema creation and company-scoped CRUD. Tests verify:

- $350.00 average/day × 3 = $1,050.00 planned total; proposed $280/$70 split; explicit Manhattan location; exact/phrase seeds; headline/description lengths; cheap exclusions; retention of valuable core terms. Daily/total caps and complete competitor research are explicitly not claimed.
- AES-256-GCM encryption/decryption with company-bound authenticated data; wrong company or key cannot decrypt; plaintext refresh tokens are absent from stored records/returned JSON. Configuration exposes missing names, not credential values.
- Explicit/repeated owner-only Ads initialization retains the four companies. No launch endpoint exists. Private drafts persist with Eastern requested date, exact company scope, idempotent creation and stale-revision refusal.
- Validation rejects blanket core-service negative phrases and malformed draft input without changing saved data. New SQL list/read calls bind their company parameter. Initial failures from an omitted read parameter were fixed; assertions were retained.
- OAuth state binds company, owner and current session; replay, expiry and supersession reject. A pending exchange completed after disconnect cannot silently restore credentials.
- Actual mocked official endpoint request shapes for token exchange/refresh, MCC advertiser listing, actual client-account verification, Manhattan geo-target resolution and historical keyword estimates. No client account is inferred from a manager ID; unknown/manager/already-bound account choices reject.
- Every unique seed in the preset is submitted in batches of at most 20. A non-Manhattan geo result is rejected rather than substituted with all NYC. Real-response evidence stores location/currency/time separately from seed suggestions; first-page coverage is stated.
- Sanitized provider permission/network failures do not expose response details or retry automatically. Every recorded provider call is OAuth or a read/keyword-research endpoint; no mutate URL is called.
- Private company backups include saved plans and binding metadata but omit encrypted refresh payloads and OAuth states.

## Actual browser and SDK checks

Headless Chromium runs the real built AITAN/Ads panels with authenticated owner cookies and real test PostgreSQL. The OAuth callback HTML executes under its CSP, posts the received code/state with the existing owner session and removes query values from browser history/page text. No fake production Google sign-in or bypass is used.

The actual form shows the saved $350/three-day draft, cheap exclusions, commercial allocation and cap limitations. Validation failure retains typed entries; company switches cannot discard dirty campaign edits. Voice-tool edits update only the local form until save; discard restores the persisted value. Fresh account-read result labels do not imply campaign creation. A real review-bundle download excludes secrets; owner change clears private form/evidence data; mobile width fits. The actual mobile test screenshot was inspected and is test data, not a real account/analytics screenshot. Foreground results use existing shared scroll/pointer presentation; form controls are locked during requests to prevent a response overwriting concurrent campaign typing.

The real Agents SDK accepts only the enumerated connection/draft/read actions and rejects launch. Both v12/v13 voice families compile. The separate regression runs preserve Shopify receipts/verification, photo listing, source evidence, daily reports, calendar/QuickBooks approvals, phone workflows, chat storage/owner isolation and prior Google target routing. No assertion was weakened to permit a financial action.

## Build/package/live limits

Frontend TypeScript passes for both preserved source families; strict targeted backend TypeScript passes for new Ads modules and changed marketing routes/service. Production Vite build passes with the preexisting large-bundle warning. The sanitized source still omits private db/pool/Gmail/configuration/TLS, so full private-backend startup is not claimed here.

Nine actual PowerShell 7/Linux package scenarios pass: both exact source families with repeated install/backup/restore fixtures, unknown main/server edits, new-file collision, package tampering and guarded restore over a later edit. Private synthetic files stay intact. All 13 installed payloads and two voice overrides are compared against source/manifest hashes; ZIP CRC and published download bytes are verified. This is not a Windows PowerShell execution claim.

Live API version compatibility, developer-token access approval, Google consent/refresh behavior, actual manager link/account rights, owner-PC PostgreSQL/schema permissions, real account currency/time zone, Keyword Planner availability, microphone/iPhone behavior and live callback networking still require the PC test after private configuration. Outbound public website/Google documentation inspection was denied by this cloud environment's network policy; no live market volumes/CPCs or exhaustive NYC/NJ competitor directory were obtained. Public reference links in the setup guide are starting points, not claimed live citations.

The requested start today is a draft intention, not an ad launch. No Google campaign-create/enable/budget mutation, ad spending, live web conversion verification, tracking pixel change, phone call, email, invoice or hosting migration occurred. Google's unified Ads OAuth scope can support broader actions in other software; this implementation deliberately exposes read-only operations. Source installation changes no private configuration and runs no migration/provider call. Ads tables initialize explicitly; source rollback retains data/authorization. No AGENTS.md is overwritten.
