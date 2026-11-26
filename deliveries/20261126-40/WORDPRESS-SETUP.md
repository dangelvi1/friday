# WordPress connection and first approved change

AITAN's existing address was supplied as https://aitanservices.com. This cloud environment denied public website inspection, so neither WordPress/hosting availability nor the canonical www/non-www address is independently verified. Use the actual public HTTPS address shown by your browser after redirects. No existing live page has been changed here.

## Required site access

Use self-hosted/managed WordPress with the official core REST API and Application Passwords enabled, normally WordPress 5.6+. WordPress.com-specific authentication and host-specific restrictions are not assumed to work. A public HTTPS domain and valid TLS certificate are required. Internal/loopback/private IP sites, nonstandard ports, URL credentials and automatic redirects are intentionally unsupported for this first connection.

1. Sign in to the actual WordPress administration privately. Create or choose a dedicated user for FRIDAY; Editor normally supplies core page/post editing capabilities without plugin/theme administration. Use only permissions the customer authorizes.
2. Open that user's Profile and find Application Passwords. Create a named password such as FRIDAY-AITAN. Copy the generated application password privately. It is separate from the normal WordPress login password and from every Google Ads credential.
3. If Application Passwords/REST are disabled, use your authorized hosting/WordPress controls to enable supported API access. Do not bypass protections with stored browser passwords or credentialed scraping. Some host/authentication setups need additional supported integration.
4. Install v40 and run Initialize-WordPress-Key.cmd with FRIDAY stopped. It adds only FRIDAY_WORDPRESS_CREDENTIAL_KEY to the private PC .env when absent/empty. No key value is printed. Preserve the existing key and back it up securely with the private database. No .env file, provider credential or database configuration is supplied by this source package.
5. Restart both FRIDAY servers once, sign in using your existing FRIDAY owner access, then open AITAN → AITAN Services Corp → Website Manager → Initialize Website Manager.
6. Enter the canonical public site address, dedicated username and Application Password in the private connection form. The initial action verifies authenticated REST identity and stores the credentials encrypted using company/site-bound AES-256-GCM. Successful save clears the private form. Failed requests retain entries; Clear private connection fields discards them. They are never saved in browser storage or returned to the voice model.
7. Choose the connected website and run Test connection for a fresh check. Saved connection metadata alone is not a live check. The interface reports the actual site/user identity; actual write capabilities are checked again before submission.

## First test: unpublished draft

Use Posts → New WordPress draft. Add a short test title and factual test content that is clearly a private draft. Click Review exact website change. Inspect company, website, content type and the entire before/after. Approve using the button or the existing voice/typed owner-approval flow. Creation always makes a WordPress DRAFT, even if a raw request asks for publication. A new draft uses a unique internal marker slug for lost-response recovery. After creation, reload it, choose a meaningful URL slug and prepare a separate reviewed update/publication when needed. No page deletion or automatic publication is performed.

The verified receipt reads fresh RAW fields from WordPress; rendered title/body fallbacks are not treated as stored values. A successful request is not reported as verified when WordPress sanitization/filtering changes approved fields. Exact draft marker recovery uses explicit draft/published status filters rather than assuming collection defaults include drafts.

## Existing pages/posts and SEO

Read content lists (10 per page), search, select an actual native item ID and edit title, source HTML/Gutenberg blocks, supported excerpt, URL slug, draft/published status and registered supported SEO meta. The editor displays HTML as text, never executable page scripts inside FRIDAY. Pages commonly have no excerpt; that field stays unavailable unless the actual type/schema supports it. Preserve builder/block markup unless you deliberately intend to replace it. Elementor/Divi layouts, theme templates, menus, plugin configuration and global site redesign are not managed by this release.

Core WordPress title and excerpt are NOT the same thing as SEO-plugin title/meta description. Only known Yoast/Rank Math/AIOSEO string meta keys that this site's OPTIONS schema actually exposes as writable are offered. Existing values must be readable as raw strings before overwrite. Computed readonly fields such as yoast_head_json are not writable. Plugin-specific APIs/registration may require additional supported setup; FRIDAY does not install code or assume the fields exist. Readonly/unsupported metadata is not silently included in core-content edits.

Preview is private and creates no website mutation. Applying a prepared change requires the exact owner review. The backend binds company/site/connection revision, owner, item type/ID, expiry and before/after. It rereads the baseline and actual account capabilities before reserving a durable claim and sending one POST. A late conflicting preview or changed connection is rejected. Do not edit the same item concurrently in WordPress/other tools: the core REST API does not provide an atomic cross-system compare-and-swap; the fresh baseline check is best effort against external edits during the final network window.

A live published item may change immediately after approved submission. For production work, use managed hosting backups/staging as appropriate. This module does not make a full WordPress database/theme/media backup. Use a small draft for the initial validation, not the live homepage.

## Receipts, recovery and rollback

Receipts record the original request and before/after, creator, submission times, exact item and result. Uncertain/submitted claims block another write to the same item (or another unverified create of that type/site). No timeout/provider error automatically repeats a write. Other independent verified items are not blindly resubmitted. An in-process request must finish before reconciliation.

Verify current saved fields is read-only. When approved values are actually present, it can recover a submitted/uncertain receipt without another POST. If current values differ, inspect them. Review accepting current values prepares an exact private resolution; after explicit owner approval it records resolved_current and retains the original requested values, rather than falsely declaring them verified. The backend rereads the observed fingerprint before resolution. If an uncertain create is not found by its marker, it stays unresolved; this release does not guess that resubmission is safe.

Review rollback applies only to a verified update of an existing item, not draft deletion. It requires the currently observed full snapshot to match the original verified snapshot; unrelated later edits make automatic rollback unavailable. Verification never overwrites that completed snapshot merely because a subset still matches. A new review shows the original values of exactly the fields previously changed; it does not blindly restore every field or another plugin's readonly metadata. Rollback itself still requires owner approval and fresh write verification. Hosting recovery remains necessary for effects outside these captured fields.

Local disconnect removes the saved encrypted connection payload and increments its revision. Native content and receipts remain. Revoke the Application Password separately in WordPress if needed. Resolve submitted/uncertain receipts before disconnecting/reconnecting to avoid losing their verification access. Deactivated businesses must be reactivated to manage their website; no history is erased.

## Data, keys and supported scope

All workspaces stay owner-only: Salvador/Dayanna, no customer portal or employee access added. Each business can have multiple sites; an exact base URL cannot be assigned to a different business. Site credentials are encrypted with site-bound authenticated data. Company/site queries and private receipts are scoped independently. Public DNS addresses are validated and pinned for TLS requests; redirects do not forward Basic credentials, response size/time are limited, and returned HTML/JSON is never executed as FRIDAY instructions.

Private backup JSON includes website metadata, before/after receipts and permanent claims, never the sealed connection payload or encryption key. It contains private page content and is not a public source export or a complete hosting/database restore utility. A full private PostgreSQL backup plus the stable key is needed to recover saved authorization. Never upload private backups. Source rollback retains all WordPress tables/data and does not undo native website changes or revoke site passwords.

Pending: media upload, template/plugin/builder management, AI site-wide analysis, automatic internal-link/broken-link crawling, page batches and scheduled publication. Google Ads remains its separate read-only connection/research module; its developer/OAuth credentials do not connect WordPress and no advertising launch capability is added by this update.
