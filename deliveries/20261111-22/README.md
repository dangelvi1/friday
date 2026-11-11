# FRIDAY v22 — Moving hologram and direct calendars

- Front-facing translucent female hologram with blinking, gentle head/brow/lip movement and existing reply-audio animation. Same original voice connection and owner sign-in.
- Direct Personal/Nationwide month and phone agenda view, Google Calendar links retained, existing scoped event reviews preserved.
- iPhone Chrome uses the existing HTTPS Cloudflare voice/dashboard addresses. Live iPhone microphone and tunnel access still require a device-side test.
- Smart-home setup guide covers WiZ, Hue, Lutron, Resideo/Honeywell, Ring cameras and Alarm, SmartThings and Govee. No home integration or appointment-call workflow is installed by this release.

[Download installer ZIP](FRIDAY-Translucent-Hologram-v22.zip) · [SHA256](SHA256SUMS.txt) · [Silent movement demo, MP4](silent-movement-demo.mp4) · [Actual voice-home screenshot](voice-home-preview.png) · [Phone layout](iphone-layout-preview.png) · [Calendar fixture screenshot](calendar-month-fixture.png) · [Phone calendar fixture](calendar-agenda-fixture.png) · [Validation](VALIDATION.md) · [House setup](SMART-HOME-SETUP.md)

The video is explicitly labelled as a silent movement demonstration: no live voice or microphone connection. Calendar screenshots contain synthetic test appointments, not the owner’s real calendar.

## Installation

Stop the backend and disconnect voice. Extract the ZIP into **S:\AI\Fixing-Files-Folder**; it contains its own **FRIDAY-Translucent-Hologram-v22** folder. Do not create a second nested folder with the same name. Then run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Translucent-Hologram-v22\Install-Translucent-Hologram.ps1' -ProjectPath 'S:\AI\friday-ai'
if ($LASTEXITCODE -ne 0) { throw 'Installer failed. Do not continue.' }
Set-Location 'S:\AI\friday-ai'
npm run build
if ($LASTEXITCODE -ne 0) { throw 'Build failed. Do not continue.' }
npm run server
```

Keep npm run dev in the other terminal. Ctrl+F5 voice home on the PC, close old review tabs, and reconnect. Keep the printed verified backup path. Unknown source edits stop before copying; restore is guarded against later edits. AGENTS rules are proposed only.

Voice home: https://localhost:5173/ on the PC, or https://friday.dangelvi.com/ on your iPhone. Dashboard: the same address with /dashboard. Open Calendars to see the embedded month/agenda view; no public calendar sharing is required. “Use the translucent hologram” and “Show both my calendars for November” are available through the existing voice tools.

71 automated checks, current and preserved-family TypeScript, standalone production build, all 18 compatible source/backup/restore models and package scans passed. Windows PowerShell and live provider/device tests are not claimed.
