@echo off
setlocal
if not exist "%~dp0Configure-FRIDAY-Google-Ads.ps1" (
  echo Extract the entire ZIP first. The matching PowerShell helper is missing.
  pause
  exit /b 1
)
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Configure-FRIDAY-Google-Ads.ps1" -ProjectPath "S:\AI\friday-ai"
if errorlevel 1 (
  echo Configuration did not finish. Read the error above. Do not force past it.
  pause
  exit /b 1
)
echo.
echo Configuration saved. Restart your existing FRIDAY backend and frontend once.
echo Then open AITAN - Nationwide - Google Ads Manager - Connect with Google.
echo No ads have been launched.
pause
