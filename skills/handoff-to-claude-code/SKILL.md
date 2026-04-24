---
name: handoff-to-claude-code
description: Use when the user asks to hand a finished design off to a developer or a coding agent for implementation in a real codebase. Produces a self-sufficient handoff folder with a spec README, zipped for download.
---

Loaded when the user asks to hand a finished design off to a developer or a coding agent for implementation in a real codebase. The output of this skill is a self-sufficient handoff folder, zipped and presented to the user for download.

## Folder setup

- Create a folder at the project root named `design_handoff_<feature-slug>/`. Slug describes the feature (e.g. `design_handoff_onboarding_flow`, `design_handoff_settings_redesign`). Never `handoff/`, `export/`, or similar generics.
- Copy every relevant HTML prototype, component file, image, font, and referenced asset into the folder. The developer must not have to trace paths back into the main project tree.
- Generate `README.md` at the root of the folder. Everything the developer needs to act on lives in the README.

## README structure

Every section below is required. Use these exact headings in this order.

1. **Overview.** One short paragraph: what the feature is and what it accomplishes. No design history.
2. **About the design files.** Disclaimer up front, verbatim in spirit: the HTML files in this bundle are *design references*, not production code to copy directly. The developer's task is to recreate the designs in the target codebase's existing framework (React, Vue, SwiftUI, native, etc.) using its established patterns and libraries. If no codebase exists yet, pick the most appropriate framework for the project.
3. **Fidelity.** State explicitly whether the designs are high-fidelity (pixel-perfect; recreate exactly) or low-fidelity (wireframe; use for layout and flow, apply the existing design system for styling). This call changes how much of the rest of the README is authoritative.
4. **Screens / views.** For every screen in the design, document:
   - Name and purpose.
   - Layout — grid structure, flex direction, widths, heights, margins, padding. Exact values.
   - Components. For each: position and size, exact colors (hex), typography (family, size, weight, line-height, letter-spacing), border radius, shadows, borders, hover / active / focus states, exact copy.
5. **Interactions and behavior.** Click handlers, navigation flows, animations (duration, easing, animated properties), hover states, loading states, error states, form validation rules, responsive behavior where applicable.
6. **State management.** State variables, transitions and their triggers, data-fetching requirements.
7. **Design tokens.** Colors (with hex), spacing scale, type scale, border radii, shadows. Flat list, not prose.
8. **Assets.** Every image, icon, font, or other asset used in the design, with its source.
9. **Files.** List the HTML/CSS/JS files included in the bundle and what each one corresponds to.

## Hard rules

- Be extremely precise about measurements, colors, and typography. The developer is implementing from this document, not eyeballing the HTML.
- State up front that the HTML is a reference, not the shipping artifact. This is the single most important thing for the developer to understand — without it they may paste the prototype into the codebase and ship it.
- If the design uses brand assets, tell the developer to pull from the codebase's existing brand system, not to copy the embedded copies from the HTML.
- Before finishing, ask the user whether they want screenshots of the designs included in the bundle. Do not include them by default.
- After writing the folder, zip it and present the archive to the user for download. Name the zip after the folder.

## README tone

- Write for a developer who was not in the design conversation. No "as we discussed." No assumed context.
- Imperative and concrete. "Use `#246BFD` for primary buttons" beats "the primary button should use a blue tone."
- No rationale or design justification unless the developer needs it to implement correctly. This is a spec, not a pitch.
