# Proposed addition — do not overwrite AGENTS.md

Retry transient local Windows file replacement locks only with a bounded wait, using the same staged file. Keep the existing destination until successful replacement. Never delete/truncate the destination, weaken permissions or retry a provider mutation to work around local receipt persistence failures. Persist pre-submission evidence before dispatch and distinguish local storage errors from provider errors. Preserve original uncertain outcomes and permanent submission guards.
