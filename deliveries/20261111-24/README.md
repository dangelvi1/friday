[Download installer ZIP](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261111-24/FRIDAY-Appointment-Controls-v24.zip) · [Minimal home preview](minimal-home-preview.png) · [Reviewed retry preview (synthetic test data)](retry-review-preview.png)

# FRIDAY Appointment Controls v24 — November 11, 2026 (Eastern)

Requires the installed v23 Calls, Text & Restaurants update. This incremental package preserves the existing app, natural voice session, moving hologram, owner/company approvals and private data. No phone call, transfer, research request, Google/QuickBooks/Shopify write or account connection is made by installation.

## What changes

- The initial page shows only the moving hologram (click to start/end the existing voice conversation) and one dashboard link. All typed commands, profile/settings controls, appointments, calendars and modules stay in the dashboard. Existing direct /dashboard and Cloudflare addresses remain.
- Routine dashboard feedback stays in a persistent, sticky notice at the top. It distinguishes selected/requested controls from actual results and errors. You can continue without dismissing a popup. Explicit call/calendar/other approval reviews remain. An explicit receipt check brings the selected call result into view; background polling does not repeatedly scroll or announce itself.
- A verified ended own-phone simulation without a reported booking has **Review retry call**. It checks the original Twilio call's live identity and final status, prepares a new exact review, and dials only after approval. The earlier receipt and claims remain. Replayed/concurrent approvals cannot dial a second time. Unknown/active calls, missing provider IDs, confirmed bookings and completed real appointment calls remain blocked from this shortcut. Failed/busy/unanswered/canceled real calls may get a reviewed retry after live verification. Never delete claim files or change times to evade the guard.
- Recoverable Realtime cancellation/response-overlap errors no longer automatically hang up. Fatal failures save bounded connection stages and safe machine codes in the owner receipt. No raw error body, key, audio or transcript is logged. This fixes a verified error-handling flaw; it does not establish the cause of your earlier disconnect. “Permission: pending” means transcript permission was not recorded, not a diagnostic error. Old receipts have no retroactive connection trace.
- Appointment modes include Restaurant, Doctor/healthcare, Work, Event and Other, with an explicit request required for non-restaurant calls. The caller uses only the approved brief. Missing details go to the owner; no invented information, payment/contract acceptance, medical advice or unsupported phone-menu operations. Completed/answered calls are not proof of bookings.
- **My saved phone** stores an explicitly provided number privately in the existing PostgreSQL database for Salvador or Dayanna. The authenticated owner determines the record, never a body-supplied owner name or shared memory. The other owner's phone is not read. Typed/voice commands use the same controls. Other preferences/facts continue using FRIDAY's existing memory tools and scope rules; this change does not silently save every utterance.
- **Allow connecting me if needed** adds the owner's exact transfer number and possible second-leg charges to the original call review. FRIDAY can tell the recipient to hold and connect you when missing information needs you. **Connect me to this call** or voice/typed “Connect me to the call” uses that same pre-approved route. No new approval is needed for an already approved handoff. A call without that authorization cannot initiate a transfer. One redirect per call; uncertain transfers do not auto-retry.

## Installation — full path

Finish/stop any active call. Disconnect FRIDAY and stop both `npm run server` and `npm run dev` with Ctrl+C. Extract the ZIP into `S:\AI\Fixing-Files-Folder`; it contains its own `FRIDAY-Appointment-Controls-v24` folder. Avoid a second nested folder of the same name.

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Appointment-Controls-v24\Install-Appointment-Controls.ps1' -ProjectPath 'S:\AI\friday-ai'
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

Close old review tabs and hard-refresh FRIDAY (Ctrl+F5). The installer validates exact v23 source families and package hashes, creates a verified backup and stops on unknown source edits. No dependency changes, private configuration replacement or AGENTS.md overwrite. ExecutionPolicy Bypass applies only to the installer child process. Keep the printed backup path.

The new private `friday_owner_contacts` table initializes on the first authenticated contact request in the existing PostgreSQL database. The database user needs permission to create that table. No existing tables are migrated or removed. If the database cannot save/read the number, FRIDAY reports the failure and keeps the entry; no number is invented. Private call receipts/transcripts remain under `credentials/phone-appointments`.

## Test the disconnected own-phone call

1. Open Dashboard → Phone appointments → Refresh call history. Select your original simulation and **Check call receipt**. Do not use View transcript to diagnose the connection.
2. If Twilio confirms the call ended and no booking was reported, click **Review retry call**. Inspect the number, date/time, transcript choice and optional owner-transfer destination. Say/type “Approve that call.” Cancel submits no new call.
3. Answer your phone. If transcription is On, explicitly grant or decline permission when asked. If the call disconnects again, copy the **Connection diagnostics** stages/codes from its receipt and the Twilio error code, if present. Do not share keys or private phone numbers.
4. If no retry button appears, check the receipt first. A call with uncertain/active status or no verified provider ID cannot safely be retried through the button. A previously reported booking must be reviewed manually before another reservation request.

## Save your phone once

In Phone appointments → My saved phone, enter your own number in international format and click **Save my phone number**. Or say/type “Remember my phone number is [your number].” Dayanna signs in as Dayanna to save hers. No real phone numbers are included in this package. Do not use an owner password/key as a phone number.

The saved number loads when opening the phone workspace. **Use own-phone test template** can reuse it; the backend also resolves an omitted own-test/authorized transfer number from the signed-in owner's contact. Every review still shows the exact resolved destination. Saving a number is not permission to dial it automatically. You can replace it by explicitly saving a new one. It is not inferred from restaurant research, calls or a different owner's records.

## Test connecting the owner

This test needs two separate answering phones: one acts as the business/contact, the other is the owner. The recipient and transfer destination cannot be the same number. For your first retry test with only one phone, leave owner transfer Off.

1. Set the simulated business phone, check **Allow connecting me if needed**, and supply your other private owner phone or load its saved value. Review and approve the exact number and potential extra Twilio charges.
2. Act as the business contact: “I need information you do not have. Please connect me to Salvador.” FRIDAY should ask you to hold and connect only the approved owner number. You can also click **Connect me to this call** while it is active.
3. Answer the owner phone to speak directly to the contact. A voicemail answering that number can also answer the owner leg; an answered leg alone is not proof you joined or booked. This version does not add a press-key screening step.
4. If unanswered/busy/failed, the original contact hears that the owner is unavailable and needs to follow up. Check the receipt. A transfer marked uncertain is not retried automatically. Stop targets the existing original call; no new dial is made.

The handoff redirects the existing Twilio call into a bounded Dial connection, not a new assistant conference. The AI media/transcript bridge ends on handoff; FRIDAY does not listen/transcribe your subsequent direct conversation. A transferred call cannot automatically claim a confirmed appointment from what you said after joining. Tell FRIDAY the final details afterward and use the existing separately approved Calendar event workflow. Existing five-minute original-call and 25-second ring limits remain; owner Dial is also bounded. No audio recording is requested on either leg.

## Voice/typed examples

- “Remember my phone number is [number].” / “Load my saved phone.”
- “Prepare a doctor appointment call to [contact and phone] for a routine checkup, [exact date/window/name], Personal calendar.”
- “Allow transferring that call to my saved phone if you need me.” (Include it before reviewing/approving.)
- “Approve that call.” / “Cancel it.” / “Stop the call.”
- “Review a retry of the disconnected test call.” / “Connect me to the call.”

Non-restaurant briefs, destinations, names, windows and calendar still need exact values. Phone menus/DTMF, existing appointment cancellation/rescheduling, payment/insurance verification and arbitrary non-appointment calls are not implemented. Those need owner handoff/follow-up. A reported confirmation offers the existing exact Personal/Nationwide Calendar review; it never auto-saves. The appointment type/request is included in the draft; tests remain labelled TEST.

## Connection/configuration and rollback

Reuse the existing Twilio/OpenAI/Calendar configuration from v23. No new credentials or public hostname are supplied. Signed callback paths under `/phone/appointments/hooks/` now also handle transfer result/status; media still uses `/phone/appointments/media/`. Your existing Cloudflare tunnel must allow those exact signed callbacks/WebSockets without exposing private owner APIs. The app preserves authentication and does not modify your network.

On iPhone Chrome, use the existing `https://friday.dangelvi.com/` or `/dashboard`, not localhost. The PC and tunnel must be running. Answering a call on the same iPhone may pause browser audio; return to FRIDAY and check its receipt. Real iPhone/microphone/OAuth/provider behavior still needs your device test.

To roll back, end active calls, stop both servers, then run the backup folder's `Restore-Appointment-Controls.ps1` by its full path with process-scoped ExecutionPolicy Bypass. Restore rejects later source edits and preserves private call receipts and the owner-contact database table. It does not undo calls, transfers or calendar changes. See VALIDATION.md and the proposed AGENTS merge; no existing AGENTS.md is replaced.
