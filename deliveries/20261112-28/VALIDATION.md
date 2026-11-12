# v28 validation

**69 automated checks passed** across natural office audio, existing office script/state, actual dashboard Chat/office UI, actual Agents SDK office history/actions, signed phone routes, phone panel and shared contextual voice approvals.

New natural-voice tests exercise the real office service/routes and TwiML Play with a mocked OpenAI speech provider and synthetic MP3 fixture bytes. They verify:

- No speech generation before owner approval; greeting/message/repeat/goodbye are prepared before one call submission.
- Marin/gpt-4o-mini-tts voice configuration, Spanish/English choice, exact source text/leading-zero identifiers and no spoken keypad menu instructions.
- Signed POST callbacks remain mandatory even with device restrictions enabled. Audio GET works under the existing narrow callback namespace only with a valid job-bound active token; wrong job/token, completion and expiry deny playback.
- Confirmed names normalize natural introductory phrases, repeat count stays at two and repeated messages reuse cached clips without another paid generation.
- No-call/non-submission outcome on pre-dial voice failure, mid-call stop without fallback system speech/redial, and cancellation while generation is pending without waiting on the provider.
- Private generated-cache cleanup on completion/expiry, preservation of business receipts and exclusion of speech keys from public receipts.

The older office state/script tests inject a text-rendering speech fixture to assert their exact message and consent logic. Those assertions are not evidence of the production voice's sound. No microphone, real OpenAI audio generation, Twilio call, email or external business write was performed here. A real own-phone test remains necessary for pronunciation, sound quality, latency and public audio delivery through the user's Cloudflare tunnel.

Frontend TypeScript and strict changed-office-module types pass. Production assets build using configFile:false because the Linux workspace does not have the PC's private Windows TLS files; the existing large-bundle warning remains. The unrelated whole-server QuickBooks type limitations recorded in v27 were not addressed by this scoped patch. There are no dependency changes.

Package/source hashes, unknown-edit rejection, verified backup/install/guarded restore modeling and private-file/secret-pattern scans pass for both supported v27 source families and with/without historical test files. ZIP CRC is checked. Native Windows PowerShell execution remains a PC check; only source-level installer verification/modeling is claimed.

The dashboard Realtime session, appointment call voice, approvals, US phone validation, company/owner/employee isolation, callback signatures, call/email claim guards, chat retention/archive and private provider configuration remain. Installation does not itself generate audio or submit a new call. Already-approved due tasks remain authorized and may resume after backend restart.
