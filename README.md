# OpenDesign

An open-source, skills-based version of [Claude Design](https://claude.ai/design) — the design mode on claude.ai — packaged for Claude Code and any other agent that understands the skills format.

Turns the agent into a designer with taste, opinions, and the discipline to restrain them. HTML is the output medium. Inside that medium it embodies whichever specialist the task calls for — deck designer, UX designer, prototyper, brand designer.

Eight skills ship together. One is the entry point (`opendesign`); the others are loaded on demand by the workflow.

## Why this exists

Claude Design on claude.ai is excellent but lives behind the web app. OpenDesign is the same idea as a portable plugin: the skills run locally in your editor, on your files, with your existing design system in the loop. Same philosophy — intake, context-matching, taste, verifier handoff — just shipped as markdown skills you can read, fork, and extend.


## Available skills

<!-- SKILLS:START -->

| Skill | Use when |
|---|---|
| `opendesign` | Starting any design task. Establishes the base role, workflow, and taste rules, and routes to specialist skills. |
| `create-design-system` | Producing a reusable design system or UI kit from an existing brand, codebase, or product. |
| `frontend-design` | Designing without an existing brand system. Pushes for a committed, distinctive aesthetic. |
| `wireframe` | Exploring the design space quickly — many rough ideas, not one polished direction. |
| `interactive-prototype` | Asking for a working, clickable prototype that behaves like a real app. |
| `make-a-deck` | Asking for a slide presentation. Fixed 1920×1080 canvas, chapter-driven titles. |
| `make-tweakable` | Wanting in-design controls for toggling variants, colors, copy, or feature flags. |
| `handoff-to-claude-code` | Handing a finished design off to a developer or coding agent for implementation. |

<!-- SKILLS:END -->

## How the skills work together

`opendesign` is the front door. On invocation it:

1. Scans `./design-systems/*/` for existing systems (looking for `SKILL.md` or `tokens/colors_and_type.css` as markers).
2. Announces what it found and picks the right one, asks, or offers to create one.
3. Runs a structured intake if the work is new.
4. Routes to the specialist skill for the artifact (deck → `make-a-deck`, prototype → `interactive-prototype`, etc.).
5. Forks a verifier subagent to review against the brief.

Design systems created by `create-design-system` are written to `./design-systems/<name>/` so `opendesign` can auto-discover them in future sessions. Multiple systems per project are supported — a marketing system, a product system, a deck template — and the agent picks based on task shape.

## Installation

OpenDesign ships for every major agent host.

### Claude Code

```
/plugin marketplace add manalkaff/opendesign
/plugin install opendesign
```

### Cursor

Cursor reads `.cursor-plugin/plugin.json`. Install by pointing Cursor at this repo through its plugin settings.

### Codex CLI / Codex App

Codex reads `.codex-plugin/plugin.json`. Install by pointing Codex at this repo through its extension settings.

### Gemini CLI

```bash
gemini extensions add https://github.com/manalkaff/opendesign
```

### OpenCode

Add to the `plugin` array in your `opencode.json`:

```json
{
  "plugin": ["opendesign@git+https://github.com/manalkaff/opendesign.git"]
}
```

Full OpenCode install notes: [`.opencode/INSTALL.md`](.opencode/INSTALL.md).

### Manual (any agent that reads SKILL.md)

```bash
git clone https://github.com/manalkaff/opendesign.git
cp -r opendesign/skills /path/to/your/project/.claude/
```

Or as a submodule:

```bash
git submodule add https://github.com/manalkaff/opendesign.git .claude/opendesign
```

### Fork

Fork the repo, add your own skills under `skills/`, and install your fork through whichever host you use.

## Usage

Once installed, just describe what you want. The agent will pick up the right skills on its own.

```
> make a pitch deck for a seed-stage AI company, 10 slides
```

```
> design a settings page for this React app — use our existing design system
```

```
> I want to explore a few options for the onboarding flow. rough sketches, nothing polished yet
```

## Upgrading

If you installed via the plugin marketplace, run `/plugin update opendesign` inside Claude Code.

If you cloned or submoduled, `git pull` in the repo.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Quality bar is higher than coverage — consider extending an existing skill before adding a new one.

## License

[MIT](LICENSE)
