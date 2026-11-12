[Download v28 ZIP](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261112-28/FRIDAY-Natural-Office-Voice-v28.zip)

# FRIDAY Natural Office Voice v28 — November 12, 2026

Requires installed v27. This fixes the office reminder call's computer voice: the previous flow used Twilio Alice; office calls now play natural **OpenAI Marin** speech, the voice preset already used by FRIDAY appointment calls. The existing dashboard voice session and appointment conversation are preserved.

**Voice and language are separate.** Spanish remains the office default from your earlier preference. Choose **English** in Office instructions or tell FRIDAY to make that call in English before reviewing. The approved reminder text should be in the intended language; this update does not silently translate or rewrite an already approved message. The reminder flow remains bounded to the reviewed instructions, recipient/name checks and at most two repeats. It is not an unrestricted new conversational phone agent. Spoken prompts no longer read the press-one/press-two menu instructions, while keypad responses still work.

The review and receipt show **FRIDAY · Marin** and the selected language. Before dialing, the backend prepares the greeting, exact reminder, repeat question and goodbye. The dashboard shows voice preparation. Other short name/permission prompts use the same voice. Repeated messages reuse their audio. If voice preparation fails, the task reports that no call was placed; if playback generation fails during the call, FRIDAY stops the existing call and records the reason. There is no silent fallback to the computer voice and no automatic redial or paid-generation retry.

Speech generation uses the existing OpenAI key and adds OpenAI speech API usage to the phone workflow. No new account/key or dependency reinstall is required. No audio recording is enabled. Only generated prompts/messages are cached privately, bound to an approved active call with an unguessable expiring URL. Completed/expired clips are cleaned by the backend; unused clips expire after 30 minutes. Cleanup needs the backend running. Call receipts, private contacts, seven-day Chat retention and archived conversations are preserved.

## Install

End active calls, then stop both FRIDAY terminals with Ctrl+C. Existing approved future office tasks remain authorized; cancel any you no longer want through their existing controls. Extract the ZIP's single folder into `S:\AI\Fixing-Files-Folder` and run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Natural-Office-Voice-v28\Install-Natural-Office-Voice.ps1' -ProjectPath 'S:\AI\friday-ai'
if ($LASTEXITCODE -ne 0) { throw 'Installation failed. Stop here.' }
Set-Location 'S:\AI\friday-ai'
npm.cmd run build
if ($LASTEXITCODE -ne 0) { throw 'Build failed. Stop here.' }
npm.cmd run server
```

Second terminal:

```powershell
Set-Location 'S:\AI\friday-ai'
npm.cmd run dev
```

Hard-refresh the dashboard, close old review tabs and reconnect FRIDAY. The installer verifies source/payload hashes, creates verified source backups, rejects unknown edits and leaves private configuration/data intact. No call, email or paid speech generation is made by installation. Existing approved due tasks may resume after backend restart. No existing AGENTS.md is replaced.

Your working Cloudflare exception **phone/instructions/hooks/** already covers these audio requests and the signed callbacks. No new callback application/path is required. Keep FRIDAY PRIVATE protected; do not bypass the whole hostname or private phone APIs. GET audio is protected by its private active-call token; POST callbacks still require Twilio signatures and exact call identity.

## Test the sound

Use a new approved reminder call to your own phone, with email options Off if unnecessary. Select Spanish or English and enter a harmless reminder. Review should show **FRIDAY · Marin**. After approval, expect a brief voice-preparation stage, then the call. Confirm your name naturally, listen, and ask for repeats. She should use the natural voice throughout, with no old system-voice fallback. Check the existing office receipt for the real outcome. Phone-network quality and live OpenAI pronunciation/latency still need this test; automated tests do not produce a real voice sample.

## Restore

End calls and stop both servers. Run the **backup folder's** Restore-Natural-Office-Voice.ps1 by its full path using process-scoped ExecutionPolicy Bypass, then build/restart. Restore verifies installed/backup hashes and stops if later source edits exist. Returning to v27 restores its system voice for office reminders. It does not undo calls/emails, delete business receipts, alter contacts or change seven-day Chat/Archive data. v27 does not serve or clean the v28 generated-audio cache; after ending all calls, you may remove the private `credentials\friday-office-voice` cache locally. It contains generated prompts, not recorded conversations. Source backup is separate from private-data backup.
