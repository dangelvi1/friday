[Download FRIDAY Campaign Analysis v45](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261127-45/FRIDAY-Ads-Analysis-v45.zip)

# FRIDAY Campaign Analysis & Returns v45

November 27, 2026 Eastern. Cumulative source update over the exact delivered v41/v42/v43/v44, supporting both existing voice families. Installation validates the baseline, backs up each replaced source file, and stops on unknown edits. No dependency reinstall or credential re-entry. Source install performs no migration, Google/OpenAI request, campaign mutation, spending or website change.

## What works

- **Client-specific intent memory:** independent persistent rules per managed company/customer: actual services, area, relevant phrases, low-value terms, unrelated service terms, ambiguous standalone words. Defaults come from each company's own profile. Existing saved rules survive restarts and initialization. New companies can load/configure their rules without changing source or connecting an advertiser. No customer login is added. Broad match remains disabled in this campaign planner.
- **Nationwide rules:** Manhattan, commercial-first water damage/extraction/removal/flood cleanup; cheap/free excluded, standalone restoration/restore flagged, unrelated antique/furniture/facade/art/photo/car restoration excluded. Commercial water damage restoration remains relevant. Other clients do not inherit Nationwide rules. These are review rules, not proof of search demand or profit. Exact/phrase close variants still need search-term monitoring. Negative keyword matching does not automatically cover every synonym/plural: review specific variants.
- **Existing drafts:** analysis lists exclusions missing from the saved draft. Load client rules, then Add saved exclusions to private campaign form. Review and Save separately. Existing/live campaigns are never silently rewritten. Saving a plan clears that draft's current Keyword Planner evidence; export the review bundle first. Newly created Nationwide presets include free and the unrelated-restoration exclusions.
- **Deterministic keyword audit:** exact normalized seed text joined to actual saved Google ideas. Exclusive categories: returned with bids, returned without bids, conflicting duplicate metrics, not returned, not researched. Zero volume is distinct from missing. Exact and phrase rows share historical text evidence, not separate forecasts. Additional ideas stay separate. No inference that an absent term has zero demand or missing bids mean cheap clicks.
- **Fresh public-source research:** explicit button or consented conversational action uses existing OpenAI Responses web_search. Input is the saved public landing-page URL plus this client's configured services/area/intent rules and audience. Google account IDs, metrics, keyword evidence, budgets, tokens, contacts and job outcomes are excluded. Sources come from actual search response citations/source lists; unsupported URLs are discarded, not invented. Public observations are AI-extracted, not independently verified reviews, live form tests, speed tests or guaranteed market facts. No CAPTCHA bypass or browser scraping. Up to 12 search-tool calls, bounded output and a 3-minute timeout; provider charges may apply. Provider token usage is recorded when returned; dollar cost remains unknown. Unchanged recent requests reuse their running/completed/failed receipt for 15 minutes; no automatic retries or daily scheduling.
- **Actual performance:** authenticated read-only Google Ads campaign totals and visible search terms for an explicit period (up to 91 calendar days), optionally a native Google campaign ID. Blank ID includes the entire selected advertiser, NOT just the private FRIDAY draft. Advertiser time zone/currency retained. Current-day results are provisional. Google may hide low-volume/private queries. Results bounded at 1,000 campaign and 1,000 term rows; truncation prevents reconciled profit claims. Client intent flags attach to actual visible search terms, suggesting review rather than writing Google negatives.
- **Lead/job feedback:** private internal reference, acquired date, native campaign, qualification, open/booked/completed/lost/spam/void stage, collected revenue and direct costs. Blank money means unknown; 0.00 must be explicit. Revision-checked editing prevents accidental duplicate references and stale overwrites. Records bind to both company and advertiser. Use void for erroneous entries. No customer PII belongs in these references. No QuickBooks transaction, invoice or Google offline conversion is created.
- **Returns:** collected revenue, direct costs, ad spend, recorded qualified leads, completed jobs, revenue ROAS, contribution after ads, contribution return on ad spend, and break-even cost per recorded qualified lead. Reconciled returns require owner attestation, closed outcomes, all entered costs/revenue, USD, complete retrieval, past-day cohort and outcome campaign IDs present in campaign totals. These are owner-entered observations, not audited invoices or guaranteed future returns. Report partial money transparently rather than filling gaps with zero. Fewer than 20 recorded qualified leads gets an exploratory-data warning; 20 is a conservative review gate, not statistical significance or an optimal sample calculation. Overhead/taxes/agency cost absent from entered direct costs remain excluded.
- **Learning history:** immutable dated research/performance snapshots and saved client rules persist across restarts and future draft campaigns. Analysis recalls the latest 10 reports for that company, with old draft/account flags. Compare equivalent acquired-lead cohorts, actual campaign IDs and settled jobs; repeated snapshots of the same cohort are not independent experiments. Changed feedback needs a new performance report. Job profit attribution is campaign/cohort-level; keyword-to-job/GCLID attribution is not implemented. FRIDAY can use returned evidence through the existing explicit OpenAI consent to recommend the next experiment, never change spending itself.
- **Privacy/backup:** expanded per-company Ads disclosure includes live metrics and manually recorded non-identifying financial/lead outcomes. Manual dashboard reads remain available without sending their results to OpenAI. Existing Stop AI sharing/15-minute scope and company/owner reset stay in place. Marketing Studio's private backup export now includes rules, reports and lead outcomes; it remains an export, not an automatic full PostgreSQL restore. Keep it private. New records have no automatic expiry in this release. Existing authorization/configuration/credential storage is preserved.

## Install

Stop both FRIDAY servers and temporary diagnostic backends. Finish calls/reviews. Extract the ENTIRE folder into S:\AI\Fixing-Files-Folder. Run Install-Ads-Analysis.cmd, or the PowerShell commands below. Do not overwrite files manually or force an incompatible baseline.

```powershell
& {
    $ErrorActionPreference = 'Stop'
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Ads-Analysis-v45\Install-Ads-Analysis.ps1' -ProjectPath 'S:\AI\friday-ai'
    if ($LASTEXITCODE -ne 0) { throw 'Installation failed. Stop here.' }
    Set-Location 'S:\AI\friday-ai'
    npm.cmd run build
    if ($LASTEXITCODE -ne 0) { throw 'Build failed. Stop here.' }
    npm.cmd run server
}
```

Second terminal:

```powershell
Set-Location 'S:\AI\friday-ai'
npm.cmd run dev
```

Close old tabs, hard-refresh and reconnect. If upgrading directly from v41, initialize/update Ads once for the included local callback column. Otherwise saved Google authorization does not need reconnecting just for this source update.

## First use

1. AITAN → select intended company → Google Ads Manager. Open/create the existing Nationwide draft for its campaign analysis.
2. Campaign Analysis & Returns → Initialize analysis tables once. This explicitly adds three private PostgreSQL tables, preserving existing schemas/data. It seeds separate client intent rules without overwriting saved preferences.
3. Load this client's rules. Review/save. For Nationwide's existing draft, use Add saved exclusions to private campaign form, review negatives, export its current bundle if wanted, then Save and run Keyword Planner only when needed.
4. Review saved analysis for deterministic keyword classifications. Research public sources once for a cited landing-page/intent/market/measurement/test-design report. Missing credentials/errors are displayed and recorded, never simulated.
5. Before spending, verify call/form conversion tracking, landing page and actual native Search targeting/settings. A private date/budget is not a campaign or enforced spend cap.
6. After actual traffic, enter every relevant lead/job outcome (including lost/spam and explicit known zeros), then read a performance window with the native campaign ID. Tick reconciliation only when complete. Revisit delayed jobs/refunds and compare matched cohorts in future campaigns.

Voice/chat examples: “Show Nationwide's client keyword rules”; “Analyze the saved keyword evidence”; “Research Nationwide's public website and service-market sources”; “Read performance from 2026-11-20 through 2026-11-26 for campaign [actual ID]”; “Compare saved company results and recommend the next controlled test.” Conversational Ads results still require explicit scoped consent. Lead-money entry, reconciliation attestation and client-rule saves use their dashboard forms; the model cannot fabricate these approvals.

## Pending / limits

No native campaign creation/launch/enable/pause, budget changes, spend cap enforcement, automatic bidding, automatic negative uploads, offline conversion uploads, GCLID/keyword-to-job attribution, automatic QuickBooks revenue reconciliation, statistical experiment engine, scheduled daily optimization, provider-cost pricing table, or customer portal. General non-Nationwide campaign draft presets remain future work; client rules themselves are available independently for every company. Existing launched native campaigns are read only. Public/Google credentials must be actually authorized; no live provider test was performed with the owner's credentials here.

Running research is not durably resumed after server restart. Its saved running receipt stays visible; inspect it, wait out the reuse window and explicitly start another request only if appropriate. Installation/source rollback never deletes private tables, rolls back provider actions, or changes ads. Other previously enabled FRIDAY workers can resume after restart.

## Rollback

The installer prints a verified source backup under S:\AI\friday-ai\backups\ads-analysis-v45-*. Stop both servers. Run Restore-Ads-Analysis.ps1 FROM THAT BACKUP FOLDER, rebuild, then restart both servers. Restore verifies installed and backup hashes, stops on later edits, and restores only this patch's source files. Additive private tables/records and credentials remain. Export private data and keep a separate established PostgreSQL backup before changing database operations; no destructive down migration is provided.

# Validation

Controlled local validation only, November 27, 2026. No owner Windows/iPhone installation or real Google/OpenAI/WordPress request was made.

- 65 focused reported Node tests/subtests passed: deterministic evidence audit, realized contribution math, unknown/zero and partial-data guards, client-specific intent isolation/revision checks, persistent PostgreSQL reports/outcomes, advertiser reassignment/race, source-citation filtering, charged-research reuse, actual authenticated Ads routes, existing safe diagnostics/local-public OAuth, and the actual consented SDK tool in both voice families.
- The real Chromium mobile dashboard flow covers loading/saving client rules, copying saved exclusions into the private form, preserving a separate plan Save, adding/editing lead outcomes, no horizontal overflow, and clearing private analysis/rules on owner reset. All Google/OpenAI native transports in tests use synthetic fixtures.
- 73 additional regression reported tests/subtests passed: existing company management, WordPress, owner sessions, dashboard chat and voice approvals.
- Total 138 reported entries across those non-overlapping suites (Node includes parent tests); overlapping reruns are not added to this count.
- Frontend type checks passed for both voice families; strict backend Ads type check passed. Production Vite bundle built with configFile:false in the test environment; existing >500KB chunk advisory remains. The owner's normal npm run build must still run after installation.
- 23 actual Linux PowerShell installer/rollback scenarios passed: v41/v42/v43/v44, both voice families, historical tests present/absent; baseline/payload verification, verified source backup, restored/new-file behavior; unknown source, collisions, modified payload, later edits and damaged backups stop safely. This is not a claim of an actual Windows test.

Credentials are configuration dependencies, not embedded in the package. External permissions, API support for the selected runtime version, actual landing-page behavior, conversion accuracy and real job margins require owner-side verification. There is no ad launch or spending endpoint.
