---
name: run-opendesign
description: Use after any OpenDesign build to serve ./opendesign/ over HTTP and give the user a clickable preview link. Handles duplicate server prevention and python/node runtime detection.
---

You are starting the OpenDesign preview server. Complete all steps below in order.

## Port

Always use **8289**.

## Steps

1. **Detect the platform.**

   Run:
   ```bash
   uname -s 2>/dev/null
   ```
   - If the output starts with `MINGW`, `CYGWIN`, or `MSYS`, or if `uname` is not found, treat the platform as **Windows**.
   - Otherwise treat it as **POSIX** (Linux / macOS / WSL).

2. **Check if a server is already running on port 8289.**

   **POSIX:**
   ```bash
   lsof -ti tcp:8289
   ```
   - If no output, nothing is bound — continue to step 3.
   - If a PID is returned, something is bound to :8289.

   **Windows (cmd/PowerShell):**
   ```powershell
   netstat -ano | findstr LISTENING | findstr :8289
   ```
   - If no output, nothing is bound — continue to step 3.
   - If output is returned, something is bound to :8289.

   When something is bound on either platform, probe whether it is the OpenDesign server:
   ```bash
   curl -sf -o /dev/null -w "%{http_code}" http://localhost:8289/opendesign/index.html
   ```
   - If the status code is `200`, the OpenDesign server is already running. Skip to step 5.
   - Otherwise, tell the user:
     > Port 8289 is in use by another process. Please free the port and try again.
     Then stop.

3. **Detect available runtime.** Check in this order:

   **POSIX:**
   ```bash
   python3 --version 2>/dev/null || python --version 2>/dev/null || node --version 2>/dev/null
   ```

   **Windows:**
   ```powershell
   python --version 2>$null; if ($LASTEXITCODE -ne 0) { python3 --version 2>$null }; if ($LASTEXITCODE -ne 0) { node --version 2>$null }
   ```

   Priority order (both platforms):
   - **POSIX:** `python3` → `python` → `node`
   - **Windows:** `python` → `python3` → `node` (Windows distributions ship as `python`, not `python3`)
   - None found → tell the user: "Could not start the preview server — python, python3, and node are all unavailable. Open `./opendesign/index.html` manually or install Python." Then stop.

4. **Start the server in the background**, serving from the project root (not from `./opendesign/`).

   **POSIX** — capture the absolute project root first:
   ```bash
   PROJECT_ROOT=$(pwd)
   ```
   Then start:
   - python3: `python3 -m http.server 8289 --directory "$PROJECT_ROOT" &`
   - python:  `python  -m http.server 8289 --directory "$PROJECT_ROOT" &`
   - node:    `npx --yes serve -l 8289 "$PROJECT_ROOT" &`

   **Windows** — `cd` to the project root first (the `--directory` flag is available on Python 3.7+ but `cd` is the safest cross-version approach), then start:
   - python:  `Start-Process python -ArgumentList '-m','http.server','8289' -WorkingDirectory (Get-Location) -WindowStyle Hidden`
   - python3: `Start-Process python3 -ArgumentList '-m','http.server','8289' -WorkingDirectory (Get-Location) -WindowStyle Hidden`
   - node:    `Start-Process npx -ArgumentList '--yes','serve','-l','8289',(Get-Location) -WindowStyle Hidden`

   Wait 1–2 seconds after starting, then confirm the port is now bound using the same check from step 2 for the detected platform. If nothing is bound after the wait, report: "Server failed to start. Try running `python -m http.server 8289` manually from your project root." Then stop.

5. **Print the clickable link** to the user:

   > OpenDesign viewer is live: **http://localhost:8289/opendesign/**
   >
   > Sidebar lists all mockups. Click any file to preview it in the iframe.
