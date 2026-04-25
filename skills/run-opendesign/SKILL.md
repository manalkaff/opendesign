---
name: run-opendesign
description: Use after any OpenDesign build to serve ./opendesign/ over HTTP and give the user a clickable preview link. Handles duplicate server prevention and python/node runtime detection.
---

You are starting the OpenDesign preview server. Complete all steps below in order.

## Port

Always use **8289**.

## Steps

1. **Check if a server is already running on port 8289.**

   Run:
   ```bash
   lsof -ti tcp:8289
   ```
   - If a PID is returned, a server is already running. Skip to step 4.
   - If no output, continue to step 2.

2. **Detect available runtime.** Check in this order:

   ```bash
   python3 --version 2>/dev/null || python --version 2>/dev/null || node --version 2>/dev/null
   ```

   - `python3` found → use it
   - `python3` not found, `python` found → use it
   - Neither found, `node` found → use node
   - None found → tell the user: "Could not start the preview server — python3, python, and node are all unavailable. Open `./opendesign/index.html` manually or install Python." Then stop.

3. **Start the server in the background**, serving from the project root (not from `./opendesign/`):

   - python3: `python3 -m http.server 8289 --directory . &`
   - python: `python -m http.server 8289 &`  (serves from cwd, ensure cwd is project root)
   - node: `npx --yes serve -l 8289 . &`

   Wait 1 second after starting to confirm the port is now bound:
   ```bash
   lsof -ti tcp:8289
   ```
   If still no PID after the wait, report: "Server failed to start. Try running `python3 -m http.server 8289` manually from your project root."

4. **Print the clickable link** to the user:

   > OpenDesign viewer is live: **http://localhost:8289/opendesign/**
   >
   > Sidebar lists all mockups. Click any file to preview it in the iframe.
