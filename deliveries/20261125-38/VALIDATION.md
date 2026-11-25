# AITAN Phase 1 v38 validation — November 25, 2026 Eastern

227 reported automated entries pass across three final release runs: 15 new AITAN entries, 195 existing commerce/dashboard/owner-approval/phone regression entries, and 17 isolated Google-routing/actual SDK/chat entries. Node counts include parent entries. Fixtures use synthetic contacts and test databases. This is source plus automated runtime verification, not a live owner-PC/provider connection claim.

## New service and database verification

The new service uses the actual PostgreSQL-compatible PGlite engine, including an on-disk database that is closed and reopened. The pool adapter serializes test connections and uses the production SQL rather than replacing it with in-memory business-object maps. The assertions cover:

- Owner-session authentication; rejection of anonymous/raw-module-key requests, wrong origins and missing session marker before schema creation.
- Failed initialization rolls back the entire new schema while preserving an unrelated preexisting table and sentinel value.
- Explicit/idempotent migration seeds four separate UUID profiles in manual/paused mode. Repeat initialization preserves records; unsupported versions do not mutate data.
- An outside customer's business record persists. An identical repeated creation request returns the same record; a changed payload with the same request ID conflicts.
- Updates affect only the exact requested company. Competing stale-revision updates yield one success and one conflict; both owners have administrator access by design.
- Rejection of unknown provider credential fields, fully automatic mode, malformed USD values, unsafe/profile-query URLs, invalid UUIDs and missing companies.
- Deactivation/pause preserve data; activity queries remain scoped and omit contact details/free text.
- Transaction failures roll back a partially created business/audit. A read-consistent private backup includes only AITAN records and schema metadata, excluding unrelated FRIDAY records.
- Real database close/reopen retains all five test businesses and exact budget strings.

## Actual UI and voice interface

A real built panel is mounted in the existing FRIDAY dashboard navigation, backed by the actual authenticated routes and test PostgreSQL engine. Headless Chromium checks saved workspace counts, honest disconnected metrics, add/save/reload, cleared new-entry form, retained invalid/unsaved input, company-ID/name mismatch protection, deactivate/reactivate through the command interface, mobile width and a real downloaded JSON backup. Owner change clears company/contact/selection/log data. A screenshot of the actual mobile form was visually inspected. This is not an iPhone or live microphone test.

The real Agents SDK tool schema/invocation is tested for explicit fields and refusal of unsupported publishing. Both preserved v12/v13 voice entry points compile against the added panel; navigation and existing shared owner approvals remain unchanged. The final 195-entry regression includes marketplace evidence, selected product research, image preparation, categories, SEO defaults, atomic JSON, native readback, receipts, Saldana UI, reports, dashboard, phone natural voice, calendar/QuickBooks owner reviews and session boundaries. The separate 17-entry run exercises the actual built SDK/chat and existing Google target dispatch.

An initial existing dashboard regression raced a manual feedback mutation against unfinished asynchronous navigation. Its test now waits for the existing aria-busy=false navigation completion before injecting the outcome. It continues to assert accurate uncertainty feedback and absence of false success; no workflow guard or assertion was removed. The first isolated mobile harness lacked the main app's global CSS; it now imports that actual stylesheet, matching the production entry point, and the mobile-width assertion passes.

## Build, package and limits

Frontend TypeScript passes for both supported voice families. Strict backend TypeScript passes for all four new marketing modules. Production Vite build passes; the existing large-bundle warning remains. The sanitized source lacks private db/pool/Gmail/configuration and Windows TLS, so a full private-backend startup cannot be asserted here.

Nine actual PowerShell 7/Linux installer scenarios pass for both exact source families with/without the optional preexisting dashboard test: verified install/backup/restore, unknown main source and server edits, new-file collision, payload tamper rejection and refusal to restore over later edits. Private synthetic configuration remains intact. Package manifest hashes, all 12 installed payloads, both voice overrides, ZIP CRC and published download equality are verified. Linux PowerShell success is not a Windows PowerShell execution claim.

The real PC must still validate the v37 installed baseline, PostgreSQL connectivity/schema permissions, initialization, one outside-business save/reload, mobile/voice use and backup download. AITAN requires no new external credentials in Phase 1. No live OpenAI request, Meta/Google/WordPress connection, rendered Reel, native Shopify/QuickBooks write, ad spend, invoice, call, email, customer login or hosting migration occurred. No claim of completed later-phase marketing integrations is made. Source rollback retains additive AITAN data. Database exports remain private; full production database recovery must use and test the existing PostgreSQL backup process.
