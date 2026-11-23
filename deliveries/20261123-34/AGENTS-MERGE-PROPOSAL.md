# Proposal only — keep existing AGENTS.md

Verify taxonomy selections through supported live schema/connection reads. Use category labels only to narrow search; require exact Shopify category IDs. Handle connection pagination and fail closed on incomplete/missing IDs. Synthetic fixtures must model the provider schema, so they cannot conceal a singular/plural field error. Preserve category-dependency, current-value, owner/store and native-approval checks. Keep sanitized validation diagnostics and do not reset older native submission guards.
