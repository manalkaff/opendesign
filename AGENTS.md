# Agent instructions for this repository

This repo is **OpenDesign** — an open-source, skills-based version of [Claude Design](https://claude.ai/design) (the web design mode on claude.ai), packaged as a Claude Code plugin. When working inside this repository, your job is to maintain and extend those skills — not to run them.

## Repo layout

- `skills/<skill-name>/SKILL.md` — one folder per skill. Each `SKILL.md` has YAML frontmatter (`name`, `description`) followed by the skill body.
- `.claude-plugin/plugin.json` — Claude Code plugin metadata.
- `.claude-plugin/marketplace.json` — Claude Code marketplace entry. Skills are discovered by convention from `./skills/`; do not add a `skills[]` field (Claude Code's schema rejects it).
- `.cursor-plugin/plugin.json` — Cursor plugin metadata.
- `.codex-plugin/plugin.json` — Codex plugin metadata (richer `interface` block for app UI).
- `.opencode/plugins/opendesign.js` — OpenCode plugin (registers skills dir + injects `opendesign` bootstrap into the first user message).
- `.opencode/INSTALL.md` — user-facing install notes for OpenCode.
- `gemini-extension.json` + `GEMINI.md` — Gemini CLI extension. `GEMINI.md` `@-`imports the `opendesign` skill as context.
- `package.json` — required so OpenCode can install the repo via `git+https://...`. `main` points at the OpenCode plugin entry.
- `README.md` — user-facing. The "Available skills" table must match the actual skills shipped.

## Rules when editing skills

- Skills are written in direct imperative voice. No marketing language, no apologies, no emoji.
- Every `SKILL.md` must start with frontmatter containing `name` and `description`. `description` is a "Use when..." sentence that describes triggering conditions, not a summary of what the skill does.
- Keep `opendesign/SKILL.md` as the entry-point/base skill. Specialist skills (`wireframe`, `make-a-deck`, etc.) are loaded on demand by the workflow described there.
- If you add a new skill: create `skills/<name>/SKILL.md` with frontmatter, add the path to `marketplace.json`, and add a row to the README table.
- If you rename or remove a skill: update `marketplace.json` and the README table in the same change.

## Rules when editing the plugin config

- `name` must match across every host config: `.claude-plugin/plugin.json`, `.claude-plugin/marketplace.json` (both top-level and `plugins[0].name`), `.cursor-plugin/plugin.json`, `.codex-plugin/plugin.json`, `gemini-extension.json`, and `package.json`.
- Bump `version` everywhere together: both `.claude-plugin/*.json` files, `.cursor-plugin/plugin.json`, `.codex-plugin/plugin.json`, `gemini-extension.json`, and `package.json`. Also add a new section to `VERSIONS.md`.
- `.opencode/plugins/opendesign.js` bootstraps from `skills/opendesign/SKILL.md`. If you rename or remove that skill, update the path in the JS.
- Do not add secrets or personal paths to any config file.

## Style

- Concrete beats vague ("Use `#246BFD` for primary buttons" beats "use a blue tone").
- Specific rules and forbidden patterns beat aspirational prose.
- Prefer editing existing skills over adding new ones.
