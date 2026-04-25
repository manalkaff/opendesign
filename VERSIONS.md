# Versions

## 0.3.0

Preview server — clickable link after every build, no manual terminal commands.

- `run-opendesign` — new skill. Checks if port 8289 is already in use, detects python3/python/node, starts the server in the background, prints `http://localhost:8289/opendesign/` as a clickable link.
- `opendesign` — step 5 now dispatches `run-opendesign` after writing the manifest instead of telling the user to open the file manually.

## 0.2.0

Mockup viewer — browse and preview all mockups from a single page.

- `setup-opendesign` — new first-run setup skill. Downloads `viewer.html` from GitHub, creates output folders, initialises `manifest.json`. Called automatically by `opendesign`.
- `opendesign` — step 1 now dispatches `setup-opendesign` on first run; step 5 now scans and rewrites `manifest.json` after every build.
- `viewer.html` — pre-built HTML viewer shipped with the plugin. Dark sidebar, iframe preview, collapsible groups, empty state. No dependencies.

## 0.1.0

Initial release. Open-source, skills-based implementation of [Claude Design](https://claude.ai/design) for Claude Code.

- `opendesign` — entry-point skill. Workflow, questioning protocol, taste rules, design-system discovery.
- `create-design-system` — builds reusable systems at `./design-systems/<name>/` with discovery markers.
- `frontend-design` — committed, distinctive aesthetic when no brand exists.
- `wireframe` — low-fi breadth-first exploration, 3–5 structurally distinct options.
- `interactive-prototype` — clickable React prototypes with working state.
- `make-a-deck` — slide-native presentations on a fixed 1920×1080 canvas.
- `make-tweakable` — in-design Tweaks panel with host handshake.
- `handoff-to-claude-code` — developer handoff folder, spec README, zipped.
