param(
  [string]$ProjectPath = 'S:\AI\friday-ai',
  # Official Google Ads Python SDK main lists v26 as its default, checked 2026-11-26.
  # Existing nonempty API-version settings are retained. Override this for a NEW setting if needed.
  [ValidatePattern('^v[0-9]{1,3}$')][string]$ApiVersion = 'v26'
)
$ErrorActionPreference = 'Stop'
$envPath = Join-Path $ProjectPath '.env'
if (!(Test-Path -LiteralPath (Join-Path $ProjectPath 'server.ts'))) { throw 'FRIDAY project not found. No configuration changed.' }
$content = if (Test-Path -LiteralPath $envPath) { [IO.File]::ReadAllText($envPath) } else { '' }
function Pattern([string]$Name) { return '(?m)^[ \t]*(?:export[ \t]+)?' + [regex]::Escape($Name) + '[ \t]*=([^\r\n]*)' }
function Existing([string]$Name) {
  $matches = [regex]::Matches($script:content, (Pattern $Name))
  if ($matches.Count -gt 1) { throw "Duplicate $Name entries exist. Resolve those privately first; no configuration changed." }
  if (!$matches.Count) { return '' }
  $value = $matches[0].Groups[1].Value.Trim()
  if ($value.StartsWith("'")) { $m=[regex]::Match($value,"^'([^']*)'(?:\s*#.*)?$"); if (!$m.Success) { throw "Unsupported quoting for $Name. No configuration changed." }; return $m.Groups[1].Value }
  if ($value.StartsWith('"')) { $m=[regex]::Match($value,'^"([^"]*)"(?:\s*#.*)?$'); if (!$m.Success) { throw "Unsupported quoting for $Name. No configuration changed." }; return $m.Groups[1].Value }
  return ($value -split '#',2)[0].Trim()
}
function Set-Value([string]$Name,[string]$Value) {
  if (!$Value -or $Value -match "['\r\n\x00]") { throw "Invalid or empty value for $Name. No configuration changed." }
  $assignment = $Name + "='" + $Value + "'"
  $pattern = Pattern $Name
  if ([regex]::IsMatch($script:content,$pattern)) { $script:content=[regex]::Replace($script:content,$pattern,[System.Text.RegularExpressions.MatchEvaluator]{param($m) $assignment}) }
  else { if ($script:content.Length -gt 0 -and !$script:content.EndsWith("`n")) { $script:content += "`r`n" }; $script:content += $assignment + "`r`n" }
}
function Prompt-Secret([string]$Name,[string]$Label) {
  $old=Existing $Name
  $secret=Read-Host "$Label (input hidden; blank keeps an existing value)" -AsSecureString
  $pointer=[IntPtr]::Zero
  try { $pointer=[Runtime.InteropServices.Marshal]::SecureStringToBSTR($secret); $value=[Runtime.InteropServices.Marshal]::PtrToStringBSTR($pointer) }
  finally { if ($pointer -ne [IntPtr]::Zero) { [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($pointer) }; $secret.Dispose() }
  if ($value) { Set-Value $Name $value } elseif (!$old) { throw "$Name is required. No configuration changed." }
}
Write-Host 'Stop both FRIDAY servers before continuing. Enter Google API credentials only; never your Google login password.'
Prompt-Secret 'FRIDAY_GOOGLE_ADS_DEVELOPER_TOKEN' 'Google Ads developer token'
Prompt-Secret 'FRIDAY_GOOGLE_ADS_CLIENT_ID' 'Google OAuth client ID'
Prompt-Secret 'FRIDAY_GOOGLE_ADS_CLIENT_SECRET' 'Google OAuth client secret'
$managerOld=Existing 'FRIDAY_GOOGLE_ADS_MANAGER_ID'
$manager=(Read-Host 'AITAN Manager customer ID (10 digits; dashes allowed; blank keeps existing)').Replace('-','').Replace(' ','')
if ($manager) { if ($manager -notmatch '^\d{10}$') { throw 'Manager ID must contain ten digits. No configuration changed.' }; Set-Value 'FRIDAY_GOOGLE_ADS_MANAGER_ID' $manager }
elseif ($managerOld -notmatch '^\d{10}$') { throw 'An existing valid AITAN Manager ID or a new ten-digit ID is required. No configuration changed.' }
if (!(Existing 'FRIDAY_GOOGLE_ADS_API_VERSION')) { Set-Value 'FRIDAY_GOOGLE_ADS_API_VERSION' $ApiVersion }
if (!(Existing 'FRIDAY_GOOGLE_ADS_REDIRECT_URI')) { Set-Value 'FRIDAY_GOOGLE_ADS_REDIRECT_URI' 'https://friday.dangelvi.com/marketing/google-ads/callback' }
$key=Existing 'FRIDAY_GOOGLE_ADS_CREDENTIAL_KEY'
if ($key) { if ($key -notmatch '^[A-Za-z0-9+/]{43}=$' -or [Convert]::FromBase64String($key).Length -ne 32) { throw 'Existing Google credential key is invalid. It was NOT replaced. Resolve it privately to protect stored authorization.' } }
else { $bytes=New-Object byte[] 32; $rng=[Security.Cryptography.RandomNumberGenerator]::Create(); try { $rng.GetBytes($bytes) } finally { $rng.Dispose() }; Set-Value 'FRIDAY_GOOGLE_ADS_CREDENTIAL_KEY' ([Convert]::ToBase64String($bytes)) }
$backup=$null
if (Test-Path -LiteralPath $envPath) {
  $backup=Join-Path $ProjectPath ('backups\google-ads-config-' + (Get-Date -Format 'yyyyMMdd-HHmmss-fff') + '-' + [guid]::NewGuid().ToString('N').Substring(0,6))
  New-Item -ItemType Directory -Force -Path $backup | Out-Null
  $saved=Join-Path $backup '.env'
  Copy-Item -LiteralPath $envPath -Destination $saved
  if ((Get-FileHash -LiteralPath $envPath -Algorithm SHA256).Hash -ne (Get-FileHash -LiteralPath $saved -Algorithm SHA256).Hash) { throw 'Private backup verification failed. Existing configuration unchanged.' }
  if ($env:OS -eq 'Windows_NT') { Get-Acl -LiteralPath $envPath | Set-Acl -LiteralPath $saved }
}
$temp=$envPath+'.'+[guid]::NewGuid().ToString('N')+'.tmp'
try {
  [IO.File]::WriteAllText($temp,$content,(New-Object Text.UTF8Encoding($false)))
  if (Test-Path -LiteralPath $envPath) {
    if ($env:OS -eq 'Windows_NT') { Get-Acl -LiteralPath $envPath | Set-Acl -LiteralPath $temp }
    [IO.File]::Replace($temp,$envPath,[System.Management.Automation.Language.NullString]::Value)
  } else { [IO.File]::Move($temp,$envPath) }
} finally { if (Test-Path -LiteralPath $temp) { Remove-Item -LiteralPath $temp -Force } }
Write-Host 'Google Ads settings saved privately. Existing credential key and unrelated settings were preserved.'
if ($backup) { Write-Host "Verified PRIVATE .env backup: $backup" }
Write-Host 'Keep .env and its backup private. Restart FRIDAY, use Connect with Google, select Nationwide and Test connection.'
Write-Host 'No Google API request, advertising submission or spending was performed.'
