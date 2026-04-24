---
name: make-tweakable
description: Use when the user wants in-design controls for toggling variants, swapping colors, editing copy, or flipping feature flags directly inside a design artifact. Adds a Tweaks panel and host handshake.
---

Loaded when the user wants in-design controls for toggling variants, swapping colors, editing copy, or flipping feature flags directly inside a design artifact.

## What to expose

A small number of high-impact values. Good candidates: one or two key colors, a layout variant toggle, a feature flag, a headline copy field. Do not over-expose. Every additional control raises the cost of the design and dilutes the point.

If the user does not specify what should be tweakable, pick 2–3 interesting things yourself and explain why in the summary.

## Where the panel lives

A small floating panel anchored bottom-right. Title it exactly **Tweaks** so the naming matches any external toggle the host might expose. Hide the panel entirely when tweaks are deactivated — no residual chrome.

Keep the control surface tasteful. Use native inputs (`<input type="color">`, `<select>`, `<input type="text">`, `<input type="range">`) instead of hand-rolled form components unless the aesthetic absolutely requires them.

## Activation protocol

Order matters. Run these steps in this sequence:

1. Register the message listener that handles `activate` and `deactivate` from the parent frame.
2. **Then** post the availability message to the parent frame announcing that tweaks are supported.

If you post availability first, the host's `activate` message can land before your handler exists and the toggle silently does nothing.

## Deactivation and external sync

When the user closes the panel from inside the design, post a message to the parent so any external toggle flips off in lockstep. The host and the in-design panel must agree on state at all times.

## Persistence

Persist tweak state somewhere the host can read back on reload. Pick one that fits the artifact:

- A tagged JSON block inside the source (for single-file HTML artifacts that the host re-serves).
- `localStorage` keyed by artifact id (for long-lived previews).
- A write-back hook the host provides (when the host exposes one).

State the persistence choice in the summary.
