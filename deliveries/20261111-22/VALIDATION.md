# v22 validation

- Final browser/audio, direct-calendar and existing calendar authorization/event suites: **71 passed, 0 failed**.
- Frontend TypeScript passed for current v13-family source and the preserved v12-family variant.
- Standalone Vite production build passed (existing large-chunk advisory remains).
- All **18** supported source-profile/package/verified-backup/guarded-restore models passed; payload is **64** application/test files.
- Package/source SHA256 checks and secret-pattern scan passed. Original/generated artwork stays local at runtime; no new dependencies.
- Synthetic audio verified real AudioContext-driven mouth movement, silence/interruption closing, playback/track preservation. Silent demonstration starts no microphone or provider connection.
- Calendar fixtures cover combined mapped Personal/Nationwide months, exact-calendar event selection, phone agenda layout, no partial data on read failure, DST month bounds, all-day exclusive ends, overnight dates, lock clearing and draft retention. Screenshot events are **synthetic test appointments**, not Salvador’s real Google events.
- No live microphone, Google OAuth/calendar read/write, Twilio call, Shopify/QuickBooks, Ring or other home-device action was tested or performed.
- Windows PowerShell execution, actual iPhone Chrome/microphone and the user’s Cloudflare route remain device-side checks. Backup/restore validation here models the guarded workflow; it does not claim a Windows execution.

Primary changed files: src/holographic-face.ts/css, src/translucent-face.ts, src/friday-welcome.ts/css, public/friday-translucent-v22.png, src/calendar-panel.ts, src/calendar-grid.ts/css and the appearance/calendar voice-tool definitions in src/main.ts. Existing calendar-panel.css, provider configuration, TLS/Vite/package files and AGENTS.md are not overwritten.

Smart-home guide reviews public official Home Assistant documentation for the named brands. It is an onboarding plan, not an installed integration or proof of device capability. Appointment calling/calendar handoff remains a separate unfinished workflow.
