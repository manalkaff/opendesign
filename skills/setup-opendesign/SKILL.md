---
name: setup-opendesign
description: Use when ./opendesign/index.html does not exist in the current project. Initialises the OpenDesign output folder structure, copies the viewer, and writes an empty manifest.
---

You are setting up the OpenDesign output environment for this project for the first time. Complete all steps below in order, then announce completion.

## Steps

1. **Locate `viewer.html` in the plugin cache.**

   Try each glob below in order. Take the first match found across all of them. Each covers a different agent platform:

   | Platform | Glob |
   |----------|------|
   | Claude Code | `~/.claude/plugins/cache/**/skills/opendesign/viewer.html` |
   | OpenCode | `~/.local/share/opencode/plugins/**/skills/opendesign/viewer.html` |
   | OpenCode (alt) | `~/.config/opencode/plugins/**/skills/opendesign/viewer.html` |
   | OpenCode (npm) | `**/node_modules/opendesign/skills/opendesign/viewer.html` |
   | Codex | `~/.codex/plugins/**/skills/opendesign/viewer.html` |
   | Cursor | `~/.cursor/plugins/cache/**/skills/opendesign/viewer.html` |
   | Gemini CLI | `~/.gemini/extensions/*/skills/opendesign/viewer.html` |

   If no match is found across all globs, tell the user:
   > Could not locate `viewer.html` automatically. Please copy it manually: find `viewer.html` inside your opendesign plugin installation and copy it to `./opendesign/index.html`. Then re-run this skill.

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
