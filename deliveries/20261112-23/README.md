[Download installer ZIP](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261112-23/FRIDAY-Calls-Text-Restaurants-v23.zip) · [Review preview (synthetic test data)](phone-review-preview.png) · [Mobile controls preview (synthetic test data)](phone-mobile-preview.png)

# FRIDAY Calls, Text & Restaurants v23 — November 12, 2026

Adds the first owner-reviewed Twilio restaurant-call workflow, an own-phone simulation template, typed commands in the same FRIDAY conversation, and source-linked restaurant research using relevant saved food preferences. Keeps FRIDAY on your PC at S:\AI\friday-ai. No live call, calendar change, research request, account connection or purchase is made by installation.

## Prerequisite and install

This incremental updater requires the published **v22** moving-hologram/direct-calendar update, in either preserved voice source family. If v22 is not installed, install it first: https://github.com/dangelvi1/friday/tree/main/deliveries/20261111-22. Unknown source changes stop before copying. No credentials, provider consent, private reports, camera files or existing AGENTS.md are supplied/replaced. The Vite configuration gets a same-origin /phone HTTP/WebSocket proxy; its existing certificate paths and other proxy values remain. A custom changed Vite file is rejected rather than overwritten.

Finish/stop any active call. Disconnect FRIDAY and stop **both** npm run server and npm run dev with Ctrl+C. Extract the ZIP into S:\AI\Fixing-Files-Folder. It contains its own FRIDAY-Calls-Text-Restaurants-v23 folder; do not create a second nested folder with that name. Run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Calls-Text-Restaurants-v23\Install-Calls-Text-Restaurants.ps1' -ProjectPath 'S:\AI\friday-ai'
if ($LASTEXITCODE -ne 0) { throw 'Installer failed. Do not continue.' }
Set-Location 'S:\AI\friday-ai'
npm run build
if ($LASTEXITCODE -ne 0) { throw 'Build failed. Do not continue.' }
npm run server
```

In a second PowerShell terminal:

```powershell
Set-Location 'S:\AI\friday-ai'
npm run dev
```

Close old review tabs and hard-refresh with Ctrl+F5. Existing owner password works. ExecutionPolicy Bypass applies only to the child installer process. A verified backup path is printed; keep it. No new npm dependency or database migration is needed. New private call records initialize only on authenticated requests.

## First live test — your own phone

1. On the PC open https://localhost:5173/dashboard → **Phone appointments**. Sign in once as Salvador. **Check configuration** reports presence only, not a live call or model/callback test.
2. Click **Use own-phone test template**. It fills a clearly labelled simulation for tomorrow: preferred 19:00, allowed 18:00–20:00, party of two, 90-minute planned visit and Personal calendar. Review/edit every value. Enter your own phone privately in international format (+1 followed by ten digits for a US number). We do not invent or infer that number.
3. Click **Review call before dialing**. Check caller, destination, name, date, time window, party, planned duration and calendar. Say or type **approve it / approve that call**, or use Approve and call. Cancel it submits no call. A production company review still requires its full displayed company name.
4. If text transcription is On, FRIDAY first asks permission. As the simulated host, say “Yes, you may keep a text transcript” to test saving, or decline to test the off path. Answer your phone and act as the host. Example: “Yes, I can confirm a table for two on [the exact date] at 7 PM under Salvador. No deposit or fee.” FRIDAY should identify herself as an AI, confirm the details, thank you and finish. This simulation is not a real restaurant booking.
5. Use **Check call receipt**. A completed call alone is not a reservation. Only a completed call with an assistant-reported confirmation can offer **Review calendar event**. That opens the existing Personal/Nationwide event review, with TEST in the title. Nothing is saved until you approve that separate event review. A canceled review can be reopened by its linked review/receipt; the app does not submit a fresh duplicate automatically.
6. “Stop the call” targets the selected call without another approval. Stop during submission is remembered until the verified provider ID arrives. A stop may remain requested/uncertain until the receipt confirms the final state. It never places another call. Stopping the phone call or deleting an event does not cancel a real restaurant reservation.

For the first test, watching FRIDAY on the PC while answering your phone is easiest. If the same iPhone is also your dashboard, the phone call may pause browser audio; return to FRIDAY afterward and refresh its receipt.

## Typed commands and voice

The command box appears on voice home and in the dashboard voice dock. Enter sends; Shift+Enter inserts a newline. Typing can connect without asking for microphone access, using a silent local input track. **Use microphone** explicitly activates audio input in the same realtime session. A denied microphone permission leaves text mode usable. The face still connects voice when disconnected and disconnects an existing session. The typed Disconnect button also ends the session.

The same command box becomes available inside registered approval dialogs. Typed “approve it,” “cancel it” or “approve that call” refers to the current visible exact review, not a blanket authorization. Model arguments, web text, saved preferences and assistant readbacks are never typed approval. Changed/expired/multiple reviews and production-company scope stay guarded. Explicit call commands do not cancel an unrelated calendar review. Credential-like keys are blocked locally and never sent as commands. The app keeps the displayed conversation in browser memory only and clears it on owner lock; model/provider processing still follows your existing API setup.

Examples:
- “Set up my own-phone test call.”
- “Find quiet sushi restaurants near 08822 that fit what I told you I like.”
- “Compare the reviews and menu prices, under $40 per person if possible.”
- “Prepare a real restaurant reservation for [business], at [international phone number], for two on [date], preferred 19:00, allowed 18:00–20:00, name Salvador, 90 minutes, Personal calendar.”
- “Approve that call.” / “Cancel it.” / “Stop the call.”
- “Check the call receipt.” / “Review the calendar event from that call.”

## Text-transcription controls

In **Dashboard → Phone appointments**, use **Next call text transcript: On/Off** before reviewing a call. The choice is part of that exact approval; the UI starts On. **Audio recording is off**; this version has no playable audio recordings. Text transcription uses the existing OpenAI connection with gpt-4o-mini-transcribe and may have provider usage charges.

FRIDAY asks the other person for explicit permission before retaining text. Until permission, draft text is transient in memory only. Declining or revoking permission erases retained verbatim text for that call and locks saving off. An owner cannot override that refusal. A minimal factual call outcome can still be kept without quoting the conversation.

A permitted active call has **Pause saving / Resume saving** controls. Pause keeps earlier permitted text and drops new turns; resuming does not recover the paused interval. A call approved with transcription Off cannot be switched On mid-call. These controls affect text retention, not the audio processing needed to converse.

Call history offers **View transcript** and **Download transcript (.txt)** for the signed-in owner. The private text includes speaker labels, permission/pause events and partial/interrupted flags. It is a best-effort transcript, not proof of a booking; confirm dates and times against what was actually said. Text is capped at 400 turns/80,000 characters per call, with a limit notice. Downloads are local copies you control. Transcript text is not automatically added to the main FRIDAY conversation.

Voice or typed examples: “Turn off text transcripts for my next call,” “Show the transcript for this call,” “Pause saving this call transcript,” and “Resume saving this call transcript.” The selected call and current recipient permission still govern the action.

## Recommendations and saved preferences

Phone appointments includes **Find a restaurant**. ZIP defaults to 08822 and optional budget is per person in USD; it is unrelated to the ecommerce inventory budget. Research uses the authenticated owner's relevant food-related personal/shared memory, or shared memory only when the Shared profile is selected. It returns at most five source-linked options, preference quotes that actually occur in the selected memories, review themes/cautions and published menu-price estimates where supported.

Missing prices, ratings, counts and preferences remain unknown. Search results are not a verified nearest-route calculation, current checkout total, review audit or live table opening. Maps/source links let you inspect them. Prices may exclude tax, tip, drinks and fees. No research request calls, books, purchases or saves preferences. Failed/incomplete research is shown explicitly; no paid automatic retry or invented substitute results. In test mode, choosing a restaurant copies its name while retaining your own destination number. Restaurant numbers copy only when Real restaurant mode is explicitly selected; copying never dials.

## Existing private configuration

Reuse the existing server variables: TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN, TWILIO_PHONE_NUMBER, FRIDAY_PUBLIC_BASE_URL and OPENAI_API_KEY. Keep values on your PC, outside chat/GitHub. Optional FRIDAY_PHONE_MODEL defaults to the existing gpt-realtime-2.1; FRIDAY_RESTAURANT_RESEARCH_MODEL defaults to gpt-4.1-mini. No provider permissions or subscriptions are invented. Before dialing, the caller must be a voice-enabled Twilio number in the configured account. Twilio trial restrictions may require verifying your destination through your own Twilio console.

FRIDAY_PUBLIC_BASE_URL must be the actual public HTTPS origin. Signed callbacks use /phone/appointments/hooks/...; media uses wss at /phone/appointments/media/.... The new /phone proxy forwards these on the existing frontend. Cloudflare/tunnel/Access routing is not changed here; external Twilio callbacks and WebSockets must reach those exact signed endpoints. Keep owner-facing APIs private; do not disable authentication globally to make a callback work.

On iPhone Chrome use https://friday.dangelvi.com/ or /dashboard with your existing tunnel/PC running. localhost on a phone means the phone itself. Live iPhone permissions, WebRTC playback, tunnel reachability, model access, Twilio routing/caller ownership and Google Calendar saves require device-side tests. Legacy PC-agent functions still target their current computer's local agent; this update does not turn them into a remote PC control service.

## Safeguards and current limits

Calls require one immutable owner review and durable submission claims. Uncertain submissions are not redialed automatically or through a fresh identical number/date/window review. Inspect the receipt and your Twilio account before any retry; do not delete claim files to bypass this guard. Calls are limited to five minutes after answer, with a 25-second ring timeout. No audio recording is requested. Raw phone transcripts are never printed to server logs. Private text is retained only with the reviewed setting and recipient permission; see the transcription controls below. Private jobs/reports are saved under credentials/phone-appointments separately for Salvador/Dayanna. Signed status callbacks, exact call/account/number binding, and one-use stream credentials protect the phone bridge before opening the paid AI session.

The old unreviewed /phone/call and /phone/ai-call endpoints are disabled. The legacy conference listener remains owner-authenticated and limited to its owner's conference-name prefix; it is not a live-listening feature for the new AI calls. New calls are monitored by status/report, and the first test is heard on your own phone.

This version supports simulations and restaurant reservation requests. Doctor calls, IVR/DTMF navigation, rescheduling/canceling restaurant bookings, taking over a live AI call, and arbitrary phone tasks are not implemented. Assistant-reported confirmation is still a report requiring your review, not independently verified booking proof. A missing/ambiguous confirmation never becomes an automatic event.

Saved-memory endpoints now require the existing owner session and restrict reads/writes/backfill to own/shared scopes. Existing modular app, voice session, face, dashboard/calendar navigation, company isolation, owner approvals, Shopify uncertain-write guards and the Nationwide/Sara employee separation are retained. No QuickBooks or Shopify records are changed by this update or its cloud tests. House control remains the separate Home Assistant setup phase documented in v22.

## Backup, restore and validation

The installer supports the two known v22 voice families, validates source/package/dependency hashes, verifies backups, rechecks source before copying and rolls back attempted copies on failure. Unknown edits stop before changes. With active calls ended and both servers stopped, run the printed backup folder's Restore-Calls-Text-Restaurants.ps1 by its full path with process-scoped ExecutionPolicy Bypass. Restore rejects later edits and keeps private credentials/call receipts. Rollback does not undo calls/calendar events and restores prior phone behavior, including old direct-dial behavior; keep the backend stopped if that would re-expose those legacy routes.

See VALIDATION.md for final automated checks and limits. AGENTS-MERGE-PROPOSAL.md proposes additions only; no existing AGENTS.md is overwritten. Windows PowerShell execution and live provider/device testing are not claimed.
