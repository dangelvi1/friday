# v30 findings and compatible changes

The original handoff/suggested rules and current modular source were already read for v29. The reference remains historical intent, not proof of implementation; no applicable AGENTS.md was supplied and none is replaced. This update builds only on the confirmed installed v29 source and the owner's receipt screenshot/requests.

## Findings

1. The screenshot's newest result has writeAttempted false and a duplicate submission guard. Confirmation did reach the batch; the earlier guard blocked the native request. The old executor stopped the whole batch at its first guarded product, with no explicit link to that earlier receipt.
2. Existing previews could mark current matching fields applied privately, but the UI did not refresh the report when there were no remaining ready changes. The final batch message discarded the specific result error.
3. Shared voice approval returns its own reviewId. The listing action also used reviewId for its business receipt, so the approval wrapper overwrote it. An assistant could then search for an approval ID as if it were a batch receipt. v30 returns explicit receiptId and typed workflow receipt IDs for listing and receipt-visibility outcomes.
4. Listing receipts had no recorded creation/approval/completion labels and sorted by expiry. The dropdown could not visually distinguish many similar needs_review batches. Connection checks replaced the displayed receipt details with another diagnostic object, hiding the original cause.
5. Product ambiguity rendered the matches far below the current viewport without revealing them. Generic dashboard feedback did not consistently follow the changed active result across modules. The Today cards were summaries only; order and transaction item details were not retained for a drill-down.

## Files

| Files | Change |
| --- | --- |
| commerce/daily/seo.ts | Real receipt event timestamps, owner/company-scoped old file-time fallback, linked blocked results and continuation of independent approved products, safe read-only field verification, private receipt Trash/restore and clear permanent guard semantics. Verification uses the existing proposal/cost/report-visibility locks when marking exact matching private suggestions. |
| commerce/daily/catalog-reservation.ts | Exclusive retained recovery journal for only exact, owned, terminal receipts whose complete result evidence proves no write attempt. Submitted/uncertain/active/missing evidence is not retried; original claims are not removed or rewritten. |
| commerce/daily/routes.ts | Existing authenticated daily-commerce endpoints for current-value verification and receipt visibility; normal/Trash receipt lists. No new provider account/authentication bypass. |
| commerce/daily/today.ts | Complete accessible order line summaries and successful transaction rows retained beside existing metrics, with actual pinned-store order links. Missing item summaries remain unavailable. |
| src/receipt-labels.ts, commerce-receipts.ts | Eastern dated labels, pinned IDs and original error context, linked blockers, chunked stoppable current-value reads, dated voice history, and one exact Delete/Restore review. |
| src/commerce-workspace.ts/.css, daily-commerce-panel.ts | Clickable Today cards and linked item detail views; result reveal for ambiguity/commands; exact batch receipt ID and clear problem/receipt affordance; matching/no-change preview refresh. |
| src/result-reveal.ts, friday-dashboard.ts | Presentation-only scrolling/pointing in current result areas and accessible same-origin frames. Changed results take precedence over older visible results. Typing, manual scroll, hidden panes, background notices and active reviews are respected. |
| src/main.ts, both variants | Same voice tool gains dated receipt history, verification, visibility review and metric details. Clarifies business receipt IDs versus approval IDs; preserves all other voice tools and guards. |
| Tests | Backend recovery/verification/visibility cases, actual receipt/Today/scroll browser flows and the existing receipt error assertion adjusted to the newly visible real reason. |

No native action was made merely to test. No guard is erased to unblock a write. New recovery still requires a fresh exact owner approval and current source values, and a read-only match never rewrites the original uncertain submission as successful. Receipt Trash is reversible visibility only; it does not authorize resubmission. Private settings, schedules, data and the Nationwide/Sara employee separation remain in place.
