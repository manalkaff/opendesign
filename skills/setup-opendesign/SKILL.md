---
name: setup-opendesign
description: Use when ./opendesign/index.html does not exist in the current project. Initialises the OpenDesign output folder structure, copies the viewer, and writes an empty manifest.
---

You are setting up the OpenDesign output environment for this project for the first time. Complete all steps below in order, then announce completion.

## Steps

1. **Download `viewer.html` from GitHub.**

   Fetch the file from:
   ```
   https://raw.githubusercontent.com/manalkaff/open-design/main/skills/opendesign/viewer.html
   ```
   Write the response body directly to `./opendesign/index.html` (create `./opendesign/` first if it does not exist). If the fetch fails, tell the user:
   > Could not download the OpenDesign viewer. Check your internet connection and try again, or manually copy `viewer.html` from the opendesign plugin to `./opendesign/index.html`.

2. **Create output folders** if they do not already exist:
   - `./opendesign/mockups/`
   - `./opendesign/design-systems/`

3. **Write `./opendesign/manifest.json`** if it does not already exist:

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

4. **Announce to the user:**
   > OpenDesign is set up. Open `./opendesign/index.html` in your browser to view mockups. If previews don't load, serve the folder with `python -m http.server 8080` and open `http://localhost:8080/opendesign/`.
