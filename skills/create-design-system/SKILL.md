---
name: create-design-system
description: Use when the user asks to produce a reusable design system or UI kit from an existing brand, codebase, or product. Writes to ./design-systems/<name>/ so opendesign can auto-discover it in future sessions.
---

Loaded when the user asks you to produce a reusable design system or UI kit from an existing brand, codebase, or product.

## Where design systems live

All design systems for a project live under `./design-systems/<name>/` at the project root. Multiple systems can coexist — for example, `./design-systems/marketing/`, `./design-systems/product/`, `./design-systems/deck-template/`. The name is required and descriptive of what the system is for (brand surface, product surface, deck template, co-brand partner). Never use `design-system/` singular or generic names like `main`.

A folder is recognized as a design system if it contains **either** a `SKILL.md` **or** a tokens file (`colors_and_type.css` at the root, or `tokens/colors_and_type.css` nested). `opendesign` accepts either marker when detecting systems. Always write both: the `SKILL.md` makes the folder portable as a standalone agent skill, and the tokens file is the canonical output of this skill.

## Required paths (non-negotiable)

Every generated system MUST write to these exact paths, relative to project root. `opendesign` auto-discovery depends on them — deviating breaks detection.

- `./design-systems/<name>/SKILL.md` — portable skill marker.
- `./design-systems/<name>/tokens/colors_and_type.css` — canonical tokens file. Nested under `tokens/`, not at the folder root. This is the discovery marker.
- `./design-systems/<name>/README.md` — human-facing index.

Do not write the tokens file to any other path (no `colors.css`, no `styles/tokens.css`, no flat `colors_and_type.css` at the root of the system folder). Do not omit `SKILL.md`. Do not rename the `design-systems/` parent.

## What a design system folder contains

```
design-systems/<name>/
  README.md
  tokens/
    colors_and_type.css
  fonts/
    [font files the brand actually ships]
  assets/
    logos/
    icons/
    imagery/
  brand/
    voice-and-tone.md
    style-notes.md
  ui-kit-<product>/
    components/        # JSX components, one per file
    index.html         # interactive showcase of core screens
  sample-slides/       # only if a deck template was provided
```

## Process

1. **Explore provided assets.** Read the codebase, the Figma file (via its design context API when available), screenshots, decks. Prefer codebase source and Figma data over screenshots in every case.
2. **Write the README.** State your understanding of the brand, list every source you consulted, and provide an index into the rest of the folder.
3. **Extract tokens.** Write color and type tokens to exactly `./design-systems/<name>/tokens/colors_and_type.css` — not the folder root, not a renamed file. Also write `./design-systems/<name>/SKILL.md` so the folder is recognized and portable. Define raw variables (`--fg-1`, `--fg-2`, `--bg-1`, `--accent-1`, font families, weights, size steps) and semantic variables (`--h1`, `--h2`, `--body`, `--caption`, `--surface-primary`, `--border-subtle`, etc.). Semantic vars reference raw vars.
4. **Document content fundamentals.** Voice, tone, casing (title case vs sentence case), punctuation rules, emoji use, numeric formatting, how the brand talks to users versus about itself.
5. **Document visual foundations.** Color (roles, not just swatches), type (scale, pairing, usage rules), spacing (scale + when to apply), backgrounds (treatments and when each appears), motion (timings, easing, common patterns), hover and press states, borders, shadows, radii, card patterns, imagery vibe.
6. **Document iconography.** Icon fonts, SVG sprites, raster assets, emoji policy, unicode usage. Copy the real asset files into `assets/`. Never hand-draw.
7. **Build UI kits per product.** Pixel-perfect recreations of existing components as JSX, one component per file, token-driven. Provide `index.html` that assembles the core screens so the kit can be reviewed interactively.
8. **Build sample slides.** Only if a deck template was given. Use the deck skill's conventions.

## Hard rules

- Never recreate UIs from screenshots alone when the codebase is available. Codebase is source of truth; screenshots are lossy.
- Never read SVG source files. They burn context for no benefit. Copy the file into `assets/` and reference it by filename.
- Never hand-draw SVGs. Copy the real assets.
- Never invent components. UI kits recreate what exists. If a component is not in the source, leave it out or stub it with a labeled placeholder. Do not fill gaps with your own interpretation.
- Stop and ask if key resources (codebase, Figma file, brand guidelines) are inaccessible. Do not proceed on guesswork.
- Avoid visual motif defaults the industry has exhausted: bluish-purple gradients, emoji-as-feature-cards, rounded cards with a colored left-border accent strip.

## Ending the task

Close with a clear ask to iterate: list the parts you were confident about, the parts you were unsure about, and the decisions you want the user to confirm before the system is considered canonical.
