# AITAN manager → Nationwide Google Ads: private setup

This update implements a real OAuth/account-read/Keyword Planner connection interface. It has no Google campaign-create, enable, campaign-budget mutation or launch endpoint. A successful connection is not a submitted campaign. An existing Google Ads login alone does not configure API access.

## Account structure

Create an AITAN Google Ads Manager account (MCC). Link Nationwide's EXISTING advertiser account and accept the invitation in that account. Preserve Nationwide's history, billing, conversion settings and account identity. Do not replace its account or put all client advertising into one mixed advertiser account. Later, link each other company/customer's separate client account. AITAN's manager is not the advertiser target.

FRIDAY supports one advertiser account binding per business and refuses assigning the same advertiser account to another business. Both Salvador and Dayanna are administrators through existing FRIDAY sign-in; outside customers have no access. With a manager configured the account selector lists enabled direct advertiser clients, not an exhaustive nested-manager hierarchy.

## Private Google prerequisites

Use the official Google Ads/Google Cloud consoles, not a password-sharing service:

1. A Google Ads developer token obtained/configured through the manager account's API access workflow. Google permission/access-level approval may be required for production advertiser accounts. Test-only access is not proof of production eligibility and may not be enough to connect Nationwide today.
2. A Google Cloud OAuth Web application client and appropriate consent configuration for the intended users. Configure the exact authorized redirect URI below. Follow Google's current API enablement/consent requirements; testing-mode token restrictions may apply.
3. An API version currently supported by Google Ads, selected from current official documentation. No default version is invented or silently upgraded by this package.
4. A stable private encryption key generated on the FRIDAY server. Keep a secure backup of it together with the private database backup. Changing/deleting it prevents decryption of saved refresh tokens.

Official starting references (not live-verified from this cloud session):

- https://ads.google.com/home/tools/manager-accounts/
- https://developers.google.com/google-ads/api/docs/get-started/introduction
- https://developers.google.com/google-ads/api/docs/oauth/overview
- https://developers.google.com/google-ads/api/docs/release-notes

The implementation uses Google's unified `https://www.googleapis.com/auth/adwords` OAuth scope. That scope can support broader actions in other software; this FRIDAY update exposes only fixed read endpoints. Assign suitable account permissions and review Google's consent screen. No Google password, developer token, client secret or encryption key belongs in chat, campaign forms, browser storage or Git.

## Server environment

Set these on the PC backend privately using the existing `.env`/environment process. Add only the new settings; preserve all existing FRIDAY configuration. The installer does NOT edit `.env` or install credentials.

| Environment name | Value to set privately |
| --- | --- |
| FRIDAY_GOOGLE_ADS_CLIENT_ID | OAuth Web client ID |
| FRIDAY_GOOGLE_ADS_CLIENT_SECRET | OAuth client secret |
| FRIDAY_GOOGLE_ADS_DEVELOPER_TOKEN | Authorized Google Ads developer token |
| FRIDAY_GOOGLE_ADS_API_VERSION | Currently supported version string, as listed by Google |
| FRIDAY_GOOGLE_ADS_CREDENTIAL_KEY | Exactly 32 cryptographically random bytes encoded as base64 |
| FRIDAY_GOOGLE_ADS_REDIRECT_URI | `https://friday.dangelvi.com/marketing/google-ads/callback` if using that existing private address |
| FRIDAY_GOOGLE_ADS_MANAGER_ID | AITAN MCC's ten-digit customer ID, without dashes; optional for direct advertiser access |

To generate a NEW key locally when there is no existing Ads credential key, run this on your PC and save the output only in the private environment:

```powershell
$keyBytes = New-Object byte[] 32
$rng = [System.Security.Cryptography.RandomNumberGenerator]::Create()
try { $rng.GetBytes($keyBytes) } finally { $rng.Dispose() }
[Convert]::ToBase64String($keyBytes)
```

Do not generate a replacement after authorization merely because the app restarts. Never paste that output into this chat. Keep `.env` and full database/credential backups private. This key encrypts Ads refresh tokens in PostgreSQL; access tokens are kept only for individual server requests and are not returned to the model/browser.

Restart the backend after setting the environment. Open FRIDAY at the SAME HTTPS origin as the configured callback. If the callback uses friday.dangelvi.com, connect from that address rather than localhost:5173. Keep existing Cloudflare/device/owner protections in place; this browser OAuth callback does not require exposing a Twilio-like public webhook or bypass rule.

## First real test

1. In AITAN Marketing Studio select Nationwide, then Google Ads Manager.
2. Initialize Ads workspace once. This adds isolated tables and retains original company data.
3. Click Connect with Google and permit the popup. Sign in through Google as the user authorized for the AITAN MCC/linked Nationwide account. FRIDAY never asks for that password.
4. After Google authorization, click List linked advertiser accounts. Select Nationwide's actual advertiser client and Verify and assign this account. Do not select the MCC itself or another company. Confirm returned account name/ID, currency and time zone.
5. Click Test connection. Only a fresh successful account API read reports connection success. The result explicitly says no campaign mutation/spending occurred. Stored status alone is not a fresh verification.
6. Create the Manhattan water test and review its start date. The preset is restricted to the existing Nationwide workspace and creates a private draft using Eastern date at creation. Reopening never shifts its saved date. A requested start date does not schedule or launch anything.
7. Click Read Keyword Planner to research the selected draft's distinct seeds (up to 100), in bounded batches of 20. The real API must resolve Manhattan specifically; the code refuses to substitute all NYC. First-page results per batch are saved separately from the seed list with location, account currency and retrieval time. Some seed terms may not receive exact estimates; results are historical research leads, not complete market coverage.
8. Inspect/adjust keywords, negative phrases, competitor starters, ad copy and landing page; save the private plan. Conversion/landing-page verification checkboxes are owner assertions, not automated verification. No claim of complete local competitor research or an enforced spending cap is made.

Missing configuration, Google permissions, retired API version, revoked authorization or a network error is displayed rather than represented as a connection. No automatic provider retry is performed. A consumed/expired/superseded OAuth state requires a new explicit authorization; it is not reused. Disconnect locally removes this business's saved encrypted authorization, cancels outstanding authorizations and does not pause existing external Google campaigns or revoke Google-side grants. A late response cannot silently restore a disconnected connection.

## Campaign scope and launch boundary

The proposed test is Manhattan only, water damage/extraction/flood cleanup, commercial priority plus residential. Budget is $350 average/day over three calendar days: planned $1,050. The proposed split is $280 commercial and $70 general/residential per day; this is editable and has not been submitted. Generic local queries can bring either customer type.

Daily Google budgets are averages, not strict daily ceilings. This implementation DOES NOT enforce either a $350 daily cap or $1,050 total, and it cannot enable ads. Before a later launch integration, verify supported budget/end-date controls, account currency/time zone, call destination, live landing-page/conversion tracking, actual location criteria and exact approval. The system must not automatically launch an outdated requested date to make up for a delay. Today was requested; an unconnected draft is not a live start today. If developer/API approval is unavailable today, that limitation is real and cannot be bypassed by FRIDAY.

Competitor exclusions are a starter set of industry brands and variants, not a verified list of every NYC/NJ company. Negative matching needs explicit spelling/plural variants. Preserve valuable service/buyer terms such as restoration, water damage, flood cleanup, commercial, Manhattan, estimate, cost and insurance. Generic school/rental queries are not blanket-excluded because commercial-property leads may use them. Local competitor discovery and ongoing real search-term review remain part of the prelaunch/monitoring work.
