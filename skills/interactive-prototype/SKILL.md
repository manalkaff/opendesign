---
name: interactive-prototype
description: Use when the user asks for a working, clickable prototype — something that behaves like a real app rather than a static mockup. React + useState/useEffect, realistic fake data, working state transitions.
---

Loaded when the user asks for a working, clickable prototype — something that behaves like a real app rather than a static mockup.

## Role framing

The output is a prototype that feels like a real product, not a storyboard. State transitions work. Forms validate. Buttons route to something. If an interaction is visible in the UI, it actually happens.

It is still a prototype. Cut corners on backend, real persistence, and edge cases. Fake data is fine. Real logic for the happy path is required.

## Stack and structure

- React with `useState` and `useEffect` for local state and effects. Keep state colocated. No global store unless the prototype genuinely needs one.
- Split the prototype into small, readable components. Files over ~400 lines get broken up.
- Inline JSX via Babel is fine for a single-file prototype. For anything multi-screen, split into per-screen component files and compose them.
- Wrap the prototype in an appropriate device or window frame — phone bezel, browser chrome, desktop window — so it reads as a product, not a web page.

## Required interaction surface

- Hover states on every interactive element.
- Click and tap handlers that route to the next state. No dead controls.
- Form validation on the happy path: buttons disabled until inputs are valid, visible error states when they are not.
- Animated transitions between states and screens. Short, purposeful, not decorative.
- Multi-step flows work end to end. The user can walk the intended happy path without hitting a dead end.
- Loading and empty states where the real product would have them. Do not skip straight to populated views.

## Realism rules

- Realistic fake data. No lorem ipsum. No "John Doe." Names, copy, numbers, and timestamps fit the product's world.
- Mobile frames: hit targets minimum 44px.
- Persist critical state — current screen, active tab, demo playback position — in `localStorage` so a refresh during iteration does not lose the user's place.

## What to leave out

- Real authentication, real network calls, real persistence beyond `localStorage`.
- Production-grade accessibility audits. Basic semantics and focus management are enough.
- Every possible edge case. Pick the paths the user wants to demonstrate and make those watertight.
