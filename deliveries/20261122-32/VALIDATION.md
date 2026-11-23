# v32 validation — November 22, 2026 Eastern

**170 reported automated test entries passed**, including parent entries. Frontend/strict touched-backend TypeScript and production build passed. Nine actual PowerShell package scenarios passed for the final payload.

Synthetic local-file tests simulate EPERM, EACCES and EBUSY then perform the real filesystem replacement. They check reuse of the same staged file, old-destination integrity through every failed attempt, correct final JSON and cleanup. Persistent denial checks seven attempts, six waits totaling 2750 ms, error propagation, original bytes retained and temporary-file cleanup. ENOENT, ENOSPC and EIO are not retried. Circular/unserializable values cannot replace the old receipt.

A real seoService fixture temporarily replaces Node's rename binding in its isolated test process to force all seven pre-submission persistence attempts to fail. It verifies zero Shopify mutation calls, needs_review status, the save_before_product_submission phase and FRIDAY local storage provider diagnostics. No real provider is contacted.

Regression coverage includes atomic-json-v32, saved-fields-v31, receipts-v30, saldana-v30-ui, saldana-v29, saldana-ui-v29, daily-commerce, catalog-updates, commerce-reports, friday-dashboard, voice-approvals, owner-session, v25-dashboard-chat and office-natural-voice-v28. Frontend TypeScript, strict touched-backend types and a production build are checked; the existing bundle-size warning remains.

PowerShell 7 package tests on Linux cover both supported v31 source families, verified install/backup/restore, unknown entry point/module edits, new-file collision, tampered payload and restore over later changes. Synthetic private data is preserved. These are not Windows PowerShell 5.1 execution claims.

Limits: Windows filesystem locking/ACL cause on the owner's PC, installed live Shopify scopes/data, OAuth, microphone and iPhone behavior are not live-tested here. No native Shopify write/read, paid research, call or email is made. Existing receipts and submission guards are retained. Category exclusions and actual field differences remain separate diagnostics, not claimed resolved.
