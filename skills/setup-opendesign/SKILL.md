---
name: setup-opendesign
description: Use when ./opendesign/index.html does not exist in the current project. Initialises the OpenDesign output folder structure, copies the viewer, and writes an empty manifest.
---

You are setting up the OpenDesign output environment for this project for the first time. Complete all steps below in order, then announce completion.

## Steps

1. **Locate `viewer.html` in the plugin cache.**

   Run this glob to find the file:
   ```
   ~/.claude/plugins/cache/**/skills/opendesign/viewer.html
   ```
   Take the first match. If no match is found, tell the user that the opendesign plugin may not be installed and stop.

2. **Create output folders** if they do not already exist:
   - `./opendesign/`
   - `./opendesign/mockups/`
   - `./opendesign/design-systems/`

3. **Copy `viewer.html`** from the plugin cache path to `./opendesign/index.html`.

4. **Write `./opendesign/manifest.json`** if it does not already exist:

   ```json
   {
     "generated": "<current ISO 8601 timestamp>",
     "sections": [
       {
         "id": "mockups",
         "label": "Mockups",
         "groups": []
       },
       {
         "id": "design-systems",
         "label": "Design Systems",
         "groups": []
       }
     ]
   }
   ```

5. **Announce to the user:**
   > OpenDesign is set up. Open `./opendesign/index.html` in your browser to view mockups. If previews don't load, serve the folder with `python -m http.server 8080` and open `http://localhost:8080/opendesign/`.
