[Download v27 ZIP](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261112-27/FRIDAY-Office-History-v27.zip) · [Chat preview](chat-preview.png) · [Mobile preview](mobile-chat-preview.png)

# FRIDAY Office Calls & Seven-Day History v27 — November 12, 2026

Incremental update for installed v25 or v26, preserving both original voice-source families. It includes the v26 explicit Vite config import fix, so you do not need to install v26 separately first. Your existing modular dashboard, moving hologram, single natural voice conversation, visible pointer, company/owner reviews, provider connections and separated Sara employee system remain.

## Office employee calls: status after approval

The previous office tool described history but did not accept a `history` action, and the native voice approval summary did not carry the canonical office task ID/status. A caller could approve a task and then get an unhelpful receipt-check response. That message alone did not establish whether the call was actually submitted.

- `open`, `history` and `list` now read real office task history. `status`, `receipt` and `check_receipt` inspect the selected task. These names are accepted by the actual OpenAI Agents SDK schema.
- Approval returns an **office task ID** and structured workflow status. It is different from the approval window's registry ID. FRIDAY is instructed to use real task IDs from the office workflow and check status automatically without asking permission for a read.
- A missing/incorrect/other-owner receipt ID returns only the authenticated owner's actual office history so FRIDAY can resolve the intended entry. It does not invent an ID, silently claim nothing happened, prepare another task or redial to obtain evidence.
- The dashboard automatically refreshes an approved selected task, showing scheduled, pending/uncertain submission, recorded submission and final outcome. Scheduled is waiting; a provider call ID means a submission was recorded, not that someone answered or completed the office work. Quiet mode keeps these updates as visible text.
- “Call Yngrid and remind her…” means a direct call after the exact owner review unless you specify future delivery. Saved contact lookup stays owner/company-scoped. Missing contact details or the exact reminder text still need your input. Original one-time scheduling, Spanish courtesy, U.S. ten-digit normalization, permitted text records, two-repeat limit and call/email claims remain.

**After installing, first ask “Show my office call history, then check the latest task for Yngrid.” Inspect the existing task before requesting a new call. This update does not establish the outcome of the earlier call on your PC. Do not delete receipts/claims or automatically repeat an uncertain call.**

## Seven-day command and conversation history

Recognized spoken and typed commands/questions and FRIDAY's replies use the existing private Chat history even while another dashboard module is open. **Unarchived turns expire individually after seven days.** Archived conversations and their chat attachments are kept until you explicitly delete them. Use **Dashboard -> Chat -> Archive conversation**, or say **“Archive this conversation.”** Archived entries are marked in the saved-conversation list. Voice also supports archiving/unarchiving a specified actual conversation ID.

Cleanup runs once a minute while the backend is running and on authenticated chat requests. Expired chat attachments are removed with the same owner/thread rules; recent attachments are preserved. An empty expired thread is removed when no recent files remain. Archived data is protected from this cleanup. Unarchiving gives that conversation a new seven-day grace period without changing the original message dates.

Existing history receives a seven-day grace period when the updated schema first initializes, giving you time to archive it. If the PC is off, cleanup catches up when FRIDAY runs again. Existing limits and secrets protection still apply: raw passwords/detected keys are not chat history, and failed saves remain visibly reported. Saving needs the PC/backend/database to be available. This policy covers FRIDAY's private chat database and chat upload folder; saved contacts/preferences, phone receipts/claims, calendars, QuickBooks/Shopify records and employee data retain their existing rules. Independent backups and provider-side retention are separate. Source rollback cannot recover expired private chat records/files.

## Install

Stop both FRIDAY terminals with Ctrl+C. Existing approved office schedules/claims are preserved; cancel any scheduled task you no longer want through its existing controls. Extract the ZIP's single folder into `S:\AI\Fixing-Files-Folder`, then run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Office-History-v27\Install-Office-History.ps1' -ProjectPath 'S:\AI\friday-ai'
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

No dependency reinstall is required. Hard-refresh the dashboard; close old review tabs and reconnect the original voice session so it receives the corrected tools. The installer checks exact supported source/payload hashes, creates verified backups, rejects unknown edits and preserves private configuration/data. New private chat columns initialize through the existing database. It does not connect to an unrelated account or itself submit a call, email or business write. Previously approved due office tasks may resume normally when the backend restarts.

## Check it

1. Ask FRIDAY to show office instruction history and check the existing Yngrid task. She should retrieve it herself and report the actual stored status. A missing entry must not cause a new call.
2. For a new own-phone simulation, explicitly give the test contact, exact harmless reminder and timing, with both email options Off if not needed. Approve the single exact office review. Status should update without a second approval or a duplicate task. A live call still needs working Twilio callbacks/tunnel.
3. Speak/type a harmless Chat question, navigate to another module and return. Both your question and reply should remain in the saved conversation. Archive it, verify its Archived marker, then reopen it. You can unarchive with the stated seven-day grace period. Do not alter database timestamps on the live PC just to test expiry; automated isolated-database tests cover the boundary.

## Restore

Stop both servers. Run the **backup folder's** Restore-Office-History.ps1 by its full path using process-scoped ExecutionPolicy Bypass, then build/restart. It verifies installed/backup hashes and stops on later source edits. Private calls, schedules, claims, chat rows/files and archive metadata remain. Rollback cannot undo calls/emails or restore expired history. Rolling back to v25/v26 stops this new retention worker; arrange private-data backups separately if needed. Existing AGENTS.md is never replaced; AGENTS-MERGE-PROPOSAL.md is informational.
