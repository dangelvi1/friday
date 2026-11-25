# AITAN Marketing Studio — architecture review and staged plan

Reviewed November 25, 2026, America/New_York. Implementation baseline: the sanitized FRIDAY source with delivered v37 applied. This is source and synthetic-runtime evidence, not a live audit of Salvador's PC, database or provider accounts.

## Existing architecture and reusable components

FRIDAY remains at `S:\AI\friday-ai`. The main backend is Express/TypeScript (`server.ts`, `npm run server`); the responsive Vite frontend (`npm run dev`) serves the existing `/` hologram and `/dashboard` experience. Vite forwards the browser's module paths to the backend. AITAN adds `/marketing` to that proxy and registers its routes after the existing device and owner-session middleware. The same backend and existing PostgreSQL pool are reused; no second FRIDAY server is started.

`auth/owner-session.ts` verifies Salvador/Dayanna and binds opaque HttpOnly cookies to a trusted origin, session marker and current credential fingerprint. Existing device/Cloudflare checks remain. AITAN accepts this owner session only, never a raw legacy module key, external customer login or client-supplied actor. Both verified owners are administrators for every managed business in this phase. No employee role or customer authentication is created.

Existing modules include QuickBooks/Sandra accounting, company connections, document reviews, calendar, Gmail routes, phone workflows, chat history and Shopify commerce. Database-backed modules already use PostgreSQL through `db/pool`; commerce also uses private owner-scoped JSON records. The sanitized export omits `db/pool`, Gmail implementation, live database configuration, credentials, TLS material and private records. Those files cannot be audited here and are never replaced or invented. The new AITAN router receives the existing pool from server.ts. TypeScript/backend tests exercise the new service with PostgreSQL-compatible PGlite; they do not establish that the full private backend starts here.

The dashboard mounts actual existing module roots; AITAN contributes one root without replacing accounting, voice, finance frames or the homepage. Navigation, normal feedback and auto-scroll remain shared. A new narrow Realtime SDK tool opens/lists/selects company profiles, saves explicit company fields, adds marketing customers, reads logs, downloads a backup and saves a publishing-pause preference. Existing voice approvals and provider tools are retained. No AITAN tool can publish content, transfer funds, run ads, create invoices or render media.

## Business model — owner's clarification controls

All managed businesses are AITAN marketing customers. The four owner companies and outside customer businesses use the same profile/workspace model. `relationship=internal` distinguishes owner companies; `external` distinguishes outside customers. The relationship flag affects filtering, not authentication. An outside customer record is a business being serviced, not a person who can sign in. No customer portal, external login, website intake endpoint or employee URL is included. Do not add these without a new owner request.

The four initial records use only owner-supplied facts: Nationwide's website/Instagram/emergency number/services, Saldana's website and coral/white preference, Carba's rental services/coverage and AITAN's business scope. Unprovided logos, fonts, emails, addresses, audiences and rates stay blank. A starter coral hex is explicitly marked as a suggestion to confirm. No connected provider identity or customer relationship is inferred from a company name.

Each profile independently stores branding references, colors, fonts/guidelines, contacts, services, geography, audience, strategy, brand voice, AI instructions, language, time zone, ad/AI budget plans, customer status/notes and automation planning preferences. Blank budget is null, distinct from 0.00; money is a validated USD decimal string, not a floating-point spending instruction. Default planning is 3 posts + 2 Reels/week over 14 days, Eastern, manual and paused. Semi-automatic is only a saved preference. Fully automatic cannot be selected or submitted to the API. No planning preference starts work.

## Database design, migration and transaction boundary

A separate PostgreSQL namespace `aitan_studio` contains:

- `version`: known schema version 1; unsupported/empty incompatible versions stop instead of being silently upgraded.
- `companies`: UUID identity and unique creation request ID; original creation fingerprint; optional stable seed key; profile JSONB validated by a strict schema; active flag; revision; creator and timestamps.
- `activity`: company foreign key, verified administrator actor, action name, revision and timestamp. It intentionally omits contact details, free-form notes, AI instructions and credentials.

Every company-specific read/update/pause uses the exact company UUID. Updates require the expected revision and atomically increment it; stale changes do not overwrite newer edits. Creating a business uses a unique caller-generated request ID and original fingerprint so a repeated identical save returns the already-saved record. Changing the payload under the same request ID is a conflict. SQL parameters carry all user input. Profiles never accept provider token/password fields. Website/logo URLs are HTTPS references without credentials, query or fragment; no server fetch or remote import occurs.

The migration is deliberately explicit: installation/registering routes/status does not create tables. The owner selects Initialize company workspaces. One PostgreSQL transaction and advisory lock create only the new namespace/tables and seed four records. Failure rolls all of this back. Repeating initialization preserves existing profiles and never reseeds over edits. Existing FRIDAY tables, accounting company connections and records are untouched. Deactivation is reversible and retains history; no business-delete endpoint exists.

Production deployment still requires the PC's existing database role to have CREATE SCHEMA permission (or an administrator-managed installation of this exact schema). A permission failure returns a neutral actionable storage message without leaking database credentials. No privilege grant or database migration is performed automatically by the Windows source installer.

## Backups and rollback

Development source was copied from v37 into a separate v38 working directory before edits. On the owner's PC the installer verifies the exact installed source family and every affected baseline, then creates and checks a source backup before copying any changes. Unknown edits/new-file collisions fail before mutation. Guarded restore refuses later edits and restores only this package's files. It does not remove saved AITAN data or touch original FRIDAY tables. No irreversible database down migration is shipped.

The private backup button downloads a repeatable-read JSON snapshot of every AITAN company and activity row, including revisions and timestamps. It excludes credentials and unrelated schemas. Keep exports encrypted/private and verify the downloaded file. JSON export is an inspection/recovery snapshot, not an automatic whole-database restore tool. Use the existing PostgreSQL backup process for production recovery, and test restoring it into a separate database before replacing production. If PostgreSQL tools are available, an administrator can additionally use `pg_dump --format=custom --schema=aitan_studio --file=<private-backup-path>` with the PC's existing private PG connection environment; no connection values are supplied or printed by this package. A full FRIDAY database backup remains advisable before future schema versions. Never share backups in Git or sanitized exports.

## Implemented in Phase 1

Persistent multi-company/customer workspace management; add/edit/deactivate/reload; independent profiles and planning budgets; all/internal/external filters; consolidated profile overview; real PostgreSQL transaction/revision/idempotency guards; owner-only access; per-company/global activity; private snapshot download; per-company pause preference; actual dashboard navigation and typed/voice tools; responsive layout and unsaved-data retention; hash-verified installer/source rollback. No new npm dependency is required.

## Pending stages and configuration

2. Dedicated brand/media library and content calendar: company-owned upload metadata, provenance and asset access controls; actual dated content records. Profile URL references and frequency preferences in Phase 1 are not a media library or calendar.
3. Content/graphics generation, nonrepetition history and exact preview/approval workflow. Reuse OpenAI through server-side credentials with company-scoped prompts, explicit claims and cost monitoring. Profile AI instructions remain data until this controlled generation path exists.
4. Meta OAuth and professional account/Page connections: consult current official supported APIs/scopes and app review requirements before implementation; configure app IDs, secret storage/encryption keys and callbacks privately. No Instagram password or browser bypass. No API version/permission is invented here.
5. Real 9:16 rendering, previews, approved stock/music provenance, illustration labeling, voiceover/subtitles and output validation. Requires installed FFmpeg plus authorized media/TTS providers; actual footage remains distinguishable.
6. Persistent scheduling/publishing/outbox, restart recovery, rate-limit/backoff policies and company-scoped approvals. Blind retries of uncertain provider submissions must not duplicate publications. A local always-on worker can start on the owner PC; a separate process/server may later help with rendering uptime. No hosting move is authorized by this package.
7. AITAN operational CRM beyond current business/contact records: lead pipelines, estimates, artwork/proofs, printing production/shipping, suppliers, subscriptions, profitability and Sandra/QuickBooks links. Reuse confirmed company connections and external reference IDs to prevent duplicate accounting entries; do not assume AITAN is connected to QuickBooks.
8. Authorized WordPress/website SEO, Search Console/Analytics and authenticated website inquiries. Public intake, if requested later, should be a separate restricted service; the owner specifically excluded customer access/portal in this task.
9. Meta/Google advertising integration, live metrics, cost attribution, exact administrator-approved budgets and spending policies. Current profile budgets do not authorize expenses. No leads/reach/spend/conversions/ROAS are simulated.
10. External marketing service subscriptions as internal business records can be added later; customer-facing accounts/portal remain excluded unless the owner explicitly changes this requirement.

No external API credential is needed for Phase 1. Existing FRIDAY owner credentials and working PostgreSQL configuration are prerequisites. All later provider interfaces are visibly marked awaiting integration/configuration. These are pending implementations, not functioning connections merely waiting for a token.

## Hosting recommendation

Use the existing private FRIDAY server/database namespace for this owner-only Phase 1. There is no need for a second server for a managed customer's profile. Internal/external businesses are isolated by company ID in records and operations; only the owners can access this system. Future employee roles must be restricted per company before access is enabled. A separate worker can later handle long video renders and public provider callbacks without putting the private dashboard online for customers. Any public lead intake requires a restricted boundary and separate review; no migration/public server was started here.
