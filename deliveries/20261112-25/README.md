[Download v25 ZIP](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261112-25/FRIDAY-Chat-Calls-Security-v25.zip) · [Chat preview](chat-preview.png) · [Mobile preview](mobile-chat-preview.png)

# FRIDAY Chat, Calls & Security v25 — November 12, 2026

Incremental update for the installed **v24 Appointment Controls** release. Both preserved voice-source families are supported. Unknown local edits stop the installer before replacement. This keeps the existing PC-hosted app, natural Realtime conversation, moving hologram, dashboard modules, pointer and owner/company approvals. No existing AGENTS.md is replaced; AGENTS-MERGE-PROPOSAL.md is a proposal only.

## Install on Salvador's PC

1. End active calls and cancel scheduled office tasks before installation or rollback. Stop both FRIDAY terminals with Ctrl+C. Leave other PC services alone.
2. Download the ZIP and extract its single folder to `S:\AI\Fixing-Files-Folder`. Confirm the full script path exists. Do not run the script inside a compressed-folder preview.
3. Run this exact full-path command in PowerShell:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Chat-Calls-Security-v25\Install-Chat-Calls-Security.ps1' -ProjectPath 'S:\AI\friday-ai'
if ($LASTEXITCODE -ne 0) { throw 'Installation failed. Stop here.' }
Set-Location 'S:\AI\friday-ai'
npm.cmd run build
if ($LASTEXITCODE -ne 0) { throw 'Build failed. Stop here.' }
npm.cmd run server
```

The installer verifies payload/source hashes and backups before copying, then runs **npm.cmd ci** for the exact lockfile. It requires Node 20.19+, 22.12+ or 24+. If npm fails, the source backup remains; resolve the install before starting FRIDAY, or restore and run npm ci against the old lock. It does not change the machine-wide PowerShell execution policy.

In a second PowerShell terminal:

```powershell
Set-Location 'S:\AI\friday-ai'
npm.cmd run dev
```

Hard-refresh `https://localhost:5173/dashboard`. On other devices use `https://friday.dangelvi.com/dashboard` with the PC and tunnel running. The initial `/` page keeps only the hologram and dashboard link. Routine results stay in the existing top notice without an X to dismiss; actual approvals still show the exact review. Database additions initialize through authenticated requests; private configuration is reused, never invented.

## Phone appointments

- Save your own name, U.S. 10-digit phone and reservation email once in the private phone profile. Each owner has their own profile. The supplied reservation email must be entered privately on the PC; it is deliberately not hardcoded in this public package. Optional DOB is used only for an explicitly reviewed doctor/travel call for that same owner/name, when asked. Never put passwords, payment details or medical records in a call brief.
- Supply U.S. phone numbers as ten digits by voice or typing. FRIDAY adds +1 and checks the country; ambiguous/incomplete/non-U.S. numbers are rejected. She does not need you to say “plus one.”
- Use 12-hour AM/PM times. Review the exact number, purpose, date/window, calendar and optional owner consultation before approval. Transcription is optional, permission-based private text; audio recording stays off.
- **Even with transcription Off**, the receipt shows the factual outcome/reason and a confirmed “Spoke with” name. FRIDAY asks politely if a name is unclear and does not assume the same person answers the next call. An answered call or completed transfer does not prove a reservation.
- For an offered time outside the approved window, FRIDAY asks the business to hold, then shows a private **Awaiting your answer** card. Type/tap Yes or No quietly from the dashboard on your iPhone. Only that exact offered time is approved. A different suggestion requires a new question. Questions expire after 90 seconds; no answer means follow-up, not a booking.
- **Call me while waiting** is optional and must be included in the original review. Without it, questions stay in the dashboard until you choose to call your approved phone. Direct owner handoff always calls the reviewed owner phone, asks if you are available, and connects the existing contact only after you actually answer and accept. It uses a bounded two-person conference. No arbitrary transfer destination, blind transfer, or uncertain automatic redial.
- A transferred call's AI bridge ends. FRIDAY does not transcribe your subsequent conversation. Tell her the result afterward; a Calendar event still uses its separate existing owner review.

### First test, using your own phone

Keep this a TEST simulation. Turn transcription Off and owner transfer Off initially. Say your name unclearly, then clearly when FRIDAY asks. Ask for a time outside the approved window. On a second device open the private dashboard, answer the exact question by typing, and let FRIDAY finish. Check the receipt for the name, outcome and reason with no verbatim transcript. Do not treat the test as a real booking. A transfer test needs two different answering phones.

## Scheduled Spanish office instructions

Inside **Phone appointments -> Office instructions**, save an exact company/office contact or supply its U.S. phone explicitly. No real secretary phone/email is bundled. Choose company, Spanish/English, date, AM/PM time and timezone. Enter the exact jobs/reminders. Choose whether to send the written instructions and/or an outcome email; preview shows the actual connected Gmail sender and exact recipient. Gmail access/sending permission must already work. It does not connect an unrelated account.

Review once, then approve. The task is one-time, not recurring. At the scheduled time FRIDAY calls only that approved contact and emails only the approved address/options. She verifies an authorized recipient before reading the work instructions, politely confirms their name and offers **at most two repeats after the original reading**. Telling the secretary to call customers does not authorize FRIDAY to call those customers herself. This bounded instruction-call flow is not unrestricted conversational appointment AI; optional saved text is a structured instruction/response record, not an audio recording.

Example to adapt with real contact/date privately: “For Nationwide, tomorrow at 8:30 AM Eastern, call Yngrid and email these two job reminders in Spanish. Read them and offer at most two repeats.” Supply the exact contact and full text before reviewing. The PC/backend/tunnel must remain on. If more than 15 minutes late, a task is marked missed and no surprise late call is made. An uncertain provider submission is kept for inspection without automatic retry. Use Stop/cancel on the selected task when needed.

## Chat with FRIDAY

Open **Chat** in the dashboard. Type or use the original microphone session. Both your recognized speech and FRIDAY's spoken text appear, stream and save privately to the selected conversation. Reopen saved conversations, start another or review deletion. Quiet replies mute spoken output; **Pause microphone** stops its hardware tracks while typed commands continue. You can keep working in QuickBooks with the same active FRIDAY conversation and return to Chat. Quiet does not itself turn off the microphone; use Pause microphone in meetings. The browser still requires a user gesture/permission for microphone access.

Upload pictures, PDFs or text/CSV/Markdown **in Chat**, then ask what you want analyzed. These uploads are private to the owner and conversation and are **not imported to QuickBooks**. Attachment analysis cannot run business action tools. Successful forms clear; failed analysis retains the prompt/files for retry. Limits are shown in the form: five files, 12 MB each, 20 MB combined; text has a separate bounded length. Explicit conversation deletion also removes its private uploaded files. Remembered preferences are separate from conversation deletion.

This uses FRIDAY's existing OpenAI API account and private PC database, not the consumer ChatGPT account/history. API usage costs may apply. File analysis uses gpt-4.1 by default (optional FRIDAY_CHAT_ANALYSIS_MODEL); the natural conversation keeps the existing Realtime model. Saved history is reference context, never permission to replay a past action. Large archives use a bounded excerpt in model context; the full saved thread remains visible. Explicitly ask FRIDAY to save a preference using the existing memory tools. This is not self-training and does not promise identical ChatGPT answers or speed. Back up the private PostgreSQL database and credentials/upload folders separately; the source installer is not a private-data backup.

## Access, Chrome and Face ID

Open **Settings -> device access/passkeys**. Restrictions start **Off**, so installation will not silently lock out your current PC. Enroll your primary Chrome browser, then follow **CLOUDFLARE-SETUP.md** to enroll/test the iPhone, wife's phone, iPad and laptop. Only then review enforcement. This package does not configure Cloudflare for you. Team enrollment on one iPhone is not proof all devices or the Access policy are ready.

Create a passkey from the trusted public HTTPS address after a fresh owner sign-in. iPhone/iPad may offer Face ID or the device passcode. FRIDAY stores only the public credential, never biometric data. Passkeys may sync through iCloud; the approved-browser key and Cloudflare policy still control access. localhost and the public hostname are different passkey origins. Real Apple/Chrome/Face ID behavior must be tested on the device; automated tests use a virtual authenticator.

## Rollback

End calls and cancel pending office tasks. Stop both servers. Run the **backup folder's** `Restore-Chat-Calls-Security.ps1` using its full path and process-scoped ExecutionPolicy Bypass, then `npm.cmd ci` in the project before restarting. Restore rejects later source edits. Private chats/uploads, contacts, profiles, call receipts, scheduled jobs, device policy and passkeys remain; rollback does not undo any call, email, booking or external business write. Returning to v24 removes the new app-level device/chat controls, so keep Cloudflare protection in place. No private data or AGENTS.md is overwritten by this package.

See VALIDATION.md for automated versus live checks and the pre-existing backend type-check limitation.
