[Download temporary diagnostic runner](https://github.com/dangelvi1/friday/raw/refs/heads/main/deliveries/20261126-google-runner/FRIDAY-Google-Diagnostic-Runner.zip)

# Temporary FRIDAY Google Ads diagnostic backend

This launcher is not a FRIDAY installation/update. It starts your existing backend with an in-memory observer around the existing global fetch. It does not edit FRIDAY source, .env, private keys, OAuth settings or the database schema. Normal backend startup/background jobs still behave as they normally do. Stop it with Ctrl+C and return to npm.cmd run server afterward.

## Why this is needed

The owner confirmed v43 is installed and a fresh local authorization still reports only PERMISSION_DENIED. The v43 allowlist omitted current Google Ads v26 Cloud-project/organization reasons. Google may also return a reason only in a message, without the wrapper expected by that parser. The bundled official SDK enum names recognize additional native reasons without exposing raw provider messages. This does not prove which reason applies to the owner's actual response.

Sources inspected November 26, 2026 (Eastern):

- https://raw.githubusercontent.com/googleads/google-ads-python/main/google/ads/googleads/v26/errors/types/authorization_error.py
- https://raw.githubusercontent.com/googleads/google-ads-python/main/google/ads/googleads/v26/errors/types/authentication_error.py

These official v26 enums include CLOUD_PROJECT_NOT_APPROVED_FOR_PRODUCTION, CLOUD_PROJECT_NOT_UNDER_ORGANIZATION, ORGANIZATION_NOT_APPROVED and other codes absent from v43. Legacy developer-token labels in that SDK are marked deprecated in favor of Cloud-project permissions; confirm the actual returned reason and current project access before changing accounts. Explorer access shown in legacy API Center alone does not establish the actual OAuth Cloud project's access status. The SDK references https://console.cloud.google.com/google/ads-apis/overview for Ads terms/access context. This package does not grant Google permissions or establish a successful real connection.

## Run on the FRIDAY PC

1. Stop the existing backend with Ctrl+C. Leave the frontend running. The launcher refuses to start while local port 3001 is already listening on Windows; it never kills a process.
2. Extract the entire FRIDAY-Google-Diagnostic-Runner folder into S:\AI\Fixing-Files-Folder. All three runtime files must remain together: Start-Google-Diagnostic.ps1, google-diagnostic.mjs and google-reason-enums.json.
3. Run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'S:\AI\Fixing-Files-Folder\FRIDAY-Google-Diagnostic-Runner\Start-Google-Diagnostic.ps1' -ProjectPath 'S:\AI\friday-ai'
```

4. Wait for the usual backend listening/startup message. FRIDAY_GOOGLE_DIAG_READY confirms the observer/module fingerprint is loaded; it is not proof of successful server startup or Google access. Reconnect/sign in locally and make ONE fresh Connect with Google attempt for Nationwide.
5. The popup may still show the generic v43 error, because the application itself has not been modified. Look in this diagnostic PowerShell window for a line starting FRIDAY_GOOGLE_DIAG {. Copy that safe JSON line only. It contains recognized reason codes and/or fixed message classifications, HTTP/RPC status and normalized structure flags. Do not copy other server logs or OAuth URL parameters/codes, .env, tokens, passwords, client IDs or raw provider responses.
6. When finished, Ctrl+C this diagnostic backend. Restore normal startup:

```powershell
Set-Location 'S:\AI\friday-ai'
npm.cmd run server
```

The observer reports at most five failed exact HTTPS googleads.googleapis.com responses per process. It adds no request/retry, intercepts no OAuth token/OpenAI endpoint, preserves native request/response objects and clones only bounded error bodies. Native Google Ads secrets remain in their original server-side flow. The launcher itself sends no diagnostic reports to OpenAI or another external service; existing logging integrations may collect console output. Unknown enum values stay hidden; message patterns produce named classifications rather than raw messages or claims of an actual native reason. Recognized names found in a provider message are limited to the static official enum set. If the diagnostic still has no recognized reason/classification, report that fact instead of inventing the root cause.

## Validation

Ten automated checks passed with controlled native fetch responses: current official Cloud-project/organization codes, numeric enums and missing type wrappers, fixed message classification, no raw secrets/messages/metadata/IDs, exact request/response/native body preservation and no retries, host/scheme/status filtering and five-result cap, malformed/oversized body handling, logger/network failure isolation, integration with the real v43 Google client demonstrating its generic error alongside the new code, and an actual Linux PowerShell + Node/tsx fixture-server launch with unchanged source/private fixture files. Missing project startup refuses. Fake project package.json uses type:module like FRIDAY. Windows port/PowerShell behavior and actual Google/PC startup still require owner-side execution. No live provider/model/account/advertising action was performed in these tests.
