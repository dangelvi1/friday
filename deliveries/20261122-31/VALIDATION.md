# v31 validation — November 22, 2026 Eastern

**162 reported automated test entries passed**, including parent entries in Node counts. Frontend/strict changed-backend types and production build passed. Nine actual PowerShell package scenarios passed for the final payload.

Tests use synthetic products/providers, never the uploaded private receipt as a fixture. Focused coverage includes the confirmed apostrophe representation change; rejection of different text, whitespace, attributes, script/markup, escaped literal entities and SEO/tag differences; successful native readback with normalization; real mismatches retaining uncertainty and field-level evidence; later independent approved products continuing; verification of old receipts without a new Shopify mutation or guard deletion; wrong-owner rejection; and already-matching proposals requiring no write.

The combined regression run covers saved-fields-v31, receipts-v30, saldana-v30-ui, saldana-v29, saldana-ui-v29, daily-commerce, catalog-updates, commerce-reports, friday-dashboard, voice-approvals, owner-session, v25-dashboard-chat and office-natural-voice-v28 test files. Frontend TypeScript, strict changed-backend TypeScript and the production build are checked. Existing large-bundle warning remains.

The installer uses exact supported v30 source hashes and both voice-family entry-point hashes. Package checks execute PowerShell 7 on Linux: install, verified backup, guarded restore, rejection of unknown entry point/module changes, new file collision, altered payload and restore over a later edit. Synthetic private content is preserved. These are not Windows PowerShell execution claims.

No live Shopify read/write, OAuth, microphone, phone/email call, paid research, Windows install or iPhone test is performed in the cloud. The owner-PC current-value verification remains the live acceptance check. Category exclusions and older uncertain guards are not declared fixed. AGENTS.md is not installed or overwritten.
