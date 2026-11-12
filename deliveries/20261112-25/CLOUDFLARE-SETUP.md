# Private Chrome access, Cloudflare One and Apple passkeys

Your team is `dangelviteam.cloudflareaccess.com` (team name `dangelviteam`). Your iPhone was shown enrolled. This does not establish that the Access application, all other devices or the device rules are complete. These are manual account/device steps; the installer makes no Cloudflare changes.

## Finish the Access applications without breaking calls

1. In Zero Trust, keep the **FRIDAY PRIVATE** self-hosted application for `friday.dangelvi.com`. Leave Path blank to cover the entire hostname, including `/` and `/dashboard`. The duplicate dashboard destination is unnecessary.
2. Create/associate **FRIDAY Owners**, Action **Allow**. **Include -> Emails**: only the two owners' actual approved login emails. Remove the empty Include row. Under **Require**, choose **Gateway**, requiring requests through your organization's Cloudflare One/Gateway connection. Do not put Gateway under Include: Include rules use OR. Do not add Everyone as an owner Include or use Bypass for the private application. A generic WARP check alone does not establish membership in your team or approval of a particular browser.
3. Before relying on the hostname-wide rule, create a separate self-hosted application **FRIDAY Twilio callbacks** on that same hostname with only these paths (enter paths without a leading slash if the form already supplies it):

```
phone/appointments/hooks/*
phone/appointments/media/*
phone/appointments/consult/*
phone/instructions/hooks/*
phone/call-status
phone/twiml
```

Use **Bypass -> Include -> Everyone** only for this narrow callback application. These more-specific service paths let Twilio send signed callbacks and its media WebSocket without an interactive owner login. Backend Twilio signatures, job tokens, provider call identity and owner binding remain mandatory. Never bypass the whole hostname, dashboard, `/phone/*`, private appointments APIs, `/session/*` or `/chat/*`. If your Cloudflare form does not permit multiple destinations, create separate callback applications with the same narrow policy. Confirm the more-specific application takes precedence over the private catch-all. Bot challenges on these service paths can also interrupt Twilio; never disable protection site-wide to solve that.
4. Save both applications with their exact policies. From **FRIDAY PRIVATE -> Details**, copy its **Application Audience (AUD)** value into FRIDAY Settings privately. Use the audience of the private application, not the callback app. The audience is configuration, not a password; never share an API token.
5. Access enrollment permissions should admit only the intended owners. Keep the current PC access path available while testing. Save the recovery procedure below before enabling the in-app restriction.

## Enroll the four intended devices

On Salvador's iPhone, Dayanna's phone, the iPad and laptop:

- Install Cloudflare One Agent/WARP from the official device store/client, log in to team `dangelviteam` and verify Connected under that team. DNS-only consumer 1.1.1.1 is not an enrolled team connection. Use the organization's traffic/Gateway mode required by its policy. VPN-style permission is expected on Apple because the client routes protected traffic; it is not FRIDAY requesting a MAC address.
- Open **Chrome**, ordinary browsing mode, at `https://friday.dangelvi.com/`. Complete the owner's Cloudflare login and existing FRIDAY sign-in. Confirm the hostname-wide policy permits this owner/device. Do not use localhost on the phone.
- In FRIDAY **Settings**, give the browser an understandable name and choose **Enroll this Chrome browser**. The initial trusted browser is established before restrictions are enabled. Later new browsers request approval; compare their pairing code/time directly with the intended physical device before approving from an already approved browser. Never approve an unexpected request just because its label says iPhone.
- The approved entry represents a Chrome browser/profile with a protected cookie, not a MAC address or hardware attestation. Clearing cookies, private mode, a reinstall or another Chrome profile needs enrollment again. Chrome identification by user-agent is a convenience check, not a substitute for Cloudflare and owner authentication. Keep approved device cookies private.

Once the intended browsers are enrolled, choose **Restrict to approved Chrome browsers** and review the exact policy. For Cloudflare enforcement in FRIDAY, also set team `dangelviteam.cloudflareaccess.com`, paste the real private-app AUD and choose **Require Cloudflare Access**. Apply only while visiting through the working protected public hostname. The backend rejects enabling this option unless the current request carries a cryptographically valid Access token for that team/audience. This validates the token, not the account's device-posture policy; the real login tests below still matter.

The Gateway requirement checks your organization's connection; the FRIDAY approved-browser list supplies the additional explicit allowlist. A device appearing in Cloudflare's inventory does not automatically approve every browser in FRIDAY. Do not open broad device enrollment or add a second permissive Access policy that bypasses the restrictions.

## Test before considering it active

- Each approved device + Chrome + connected team client + correct owner can open both root and dashboard and use Chat without repeated module passwords.
- An unapproved Chrome profile/browser is denied private pages/data and can only request enrollment after owner login. Do not approve it during this test.
- A device with no team connection is rejected by the Cloudflare policy even with the correct owner email. An unapproved email is rejected too.
- Revoking an approved test browser denies its next private request and clears the app view. Active pages recheck periodically. Do not revoke your last approved browser.
- An own-phone simulation still reaches the signed Twilio callbacks/media and owner-consult screen without an Access HTML login challenge. Invalid signatures remain denied. No actual call is made by installation or these configuration instructions alone.

If any test fails, keep the setup marked incomplete and correct the specific rule. Do not add a broad Everyone Allow/Bypass workaround.

## Face ID / passkeys

Use the public FRIDAY HTTPS hostname consistently. Sign in freshly as the correct owner; within five minutes open Settings, choose a passkey label and **Create passkey**. Apple handles Face ID/passcode on the device. FRIDAY verifies the signed WebAuthn response and stores the public key, not the face scan. Next time the FRIDAY owner session is locked, use its passkey sign-in option. Face ID might fall back to the Apple device passcode; it is not guaranteed to show a biometric prompt every time an already-signed-in page opens. Cloudflare may also require its own login/session renewal. Synced iCloud passkeys do not approve a new browser/device by themselves.

## Recovery on the main PC only

Keep a private backup of `S:\AI\friday-ai\credentials\friday-approved-devices.json` before enabling restrictions. If the in-app policy locks you out, stop both FRIDAY servers, back up this private file locally, and edit **only** its top-level `enabled` and `requireCloudflare` fields to `false`. Preserve its devices and other fields; do not print/upload the file or erase identities to work around a failed check. Restart, repair/review the policy, enroll/test and re-enable it. This does not bypass Cloudflare Access; recover that separately through your authenticated Cloudflare admin account. Anyone with local control of the hosting PC can modify its app, so protect Windows access too.

Rolling the application back to v24 removes these new app-level guards but does not remove Cloudflare's independent policy. Source backups do not substitute for private-data backups. No MAC-address access control, physical hardware attestation or automatic Cloudflare account configuration is claimed.
