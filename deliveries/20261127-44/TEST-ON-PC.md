# v44 PC test

1. After install/build/restart, close all old FRIDAY tabs, hard-refresh and reconnect. Existing Google authorization/selected Nationwide account and saved plan should remain. Use normal backend startup; the temporary diagnostic runner is not needed for these UI checks.
2. Select Nationwide and open Draft review. Verify your private plan, date/time/budget/ad copy/negative list and research status. Open draft / edit and confirm it loads the same saved draft. Unsaved changes require save/discard before switching. Google Ads native campaigns are separate.
3. Ask FRIDAY to show Nationwide's saved draft. Check the explicit OpenAI disclosure checkbox, then choose Allow this company for 15 minutes. Continue with view/edit/save/research steps for that company. A fresh popup should not appear for each step within the grant.
4. Verify Stop AI sharing is visible. Stop it and ask another Ads question: a new unchecked disclosure must appear. Allow once should cover only one request. Company switch, owner lock, reload and 15-minute expiry must end the grant. No approval of an ad launch or spending is implied.
5. If research succeeds, ask for the same unchanged research again within 15 minutes. The response should identify saved reused evidence and retain its actual timestamp. If Google rejects research, the same unchanged automatic request should report the cached failure without another provider request. Use the direct dashboard research button once after access is corrected for an explicit fresh retry.
6. If DEVELOPER_TOKEN_NOT_APPROVED remains, capture only the safe displayed error including its operation, and use GOOGLE-ACCESS-NEXT.md. This is still a Google access issue, not successful research or a reason to delete/recreate the private plan.

No live campaign creation or publishing is implemented here. Complete the real-PC checks before changing the public policy's consent wording. Windows/iPhone/Google behavior is not established by cloud fixtures.
