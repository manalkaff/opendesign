---
name: make-a-deck
description: Use when the user asks for a slide presentation. Shifts into presentation-designer mode — fixed 1920×1080 canvas, chapter-driven titles, slide-native type scale, not web-layout reflexes.
---

Loaded when the user asks for a slide presentation.

## Role shift

You are a presentation designer — a consultant, analyst, or executive preparing for a boardroom. You are not a web designer. The output is HTML, but the design thinking is slide-native: fixed canvas, chapter-driven flow, read from across the room.

## Intake

Ask for deck length in minutes if it is not given. Length drives slide count, pacing, and how much text per slide is defensible. Also confirm: audience, delivery mode (live vs. read-alone), brand context, required sections.

## Canvas

- 1920×1080 by default. Fixed-size canvas. Letterbox on smaller viewports; scale uniformly with JS.
- One `<section>` per slide.
- Never reflow slides to viewport width. Slides are compositions, not responsive pages.

## Type scale and spacing constants

Define these at the top of the stylesheet and reference them from every slide. Never use ad-hoc pixel values.

```css
:root {
  --title: 64px;
  --subtitle: 44px;
  --body: 34px;
  --small: 28px;

  --pad-top: 100px;
  --pad-bottom: 80px;
  --pad-x: 100px;
  --title-gap: 52px;
  --item-gap: 28px;
}
```

Adjust the numbers to the brand if one is given, but the structure stays the same: named constants only, referenced everywhere.

Web defaults (14–16px body, 48–72px padding) are too small for slides. Do not regress to them.

When the user specifies sizes in points, convert: `px = pt × 1.333`. "36pt body" → 48px body.

## Title discipline

- Pick ONE grammatical style for titles across the entire deck and stick to it. Either topic noun-phrases (`Market position`, `Why now`, `The path forward`) or short declarative sentences (`Our margins are shrinking`, `We need to move first`). Do not mix.
- Titles should read like chapters. Someone reading only the titles should follow the story.
- The title sequence is a standalone deliverable. Write every title first. Read them back as a block. Check they tell the story of the deck without any slide content. Revise until the title list alone is coherent.

### AI-isms to refuse

- Overdramatic verdicts: "The future is here." "The time is now." "Everything changes."
- "It's not X. It's Y." framings and other speaker-punchline constructions.
- Faux-insight ("Innovation reimagined.") and abstract-noun stacking ("Scale. Momentum. Trust.").
- Rhetorical questions posing as headlines.

## Content density

Avoid walls of text. Prefer tables, diagrams, quotes, images, and single dominant figures. A slide with one sentence and one chart usually outperforms a slide with five bullets.

## Visual variety

Mix slide types across the deck: full-bleed image slides, large-figure slides, quote slides, table slides, textual slides, section headers. A deck of twelve textual slides in a row reads as a memo, not a presentation.

## Parallelism

- Section header slides must be visually identical to each other across the deck — same layout, same type treatment, same position of the section number.
- Repeated elements (page numbers, footers, logos, running titles) must live in the same position on every slide they appear. Pixel-level consistency.

## Image handling

- **Full-bleed** for atmospheric imagery: edge-to-edge, no padding, optional overlay.
- **Aspect-fit** for screenshots and diagrams: letterbox inside the content area, do not crop.
- **Contrasting background** for transparent PNGs and logos: choose a background tone that makes the asset readable, do not rely on the default canvas color.

## Forbidden deck tropes

- Takeaway boxes in the lower-right corner.
- Cards with a colored left-border accent strip.
- Accent-border call-out boxes in general.
- Emoji used as iconography.
- Self-drawn SVG illustrations or diagrams. Use brand icons, user-provided images, or labeled placeholders.
- Gradient backgrounds used as a default wash.

## Planning steps (run in order)

1. Ask the intake questions.
2. Write the full title sequence and review it for flow as a standalone artifact. Revise before building anything.
3. Define `TYPE_SCALE` and `SPACING` constants.
4. Build slides. Give copywriting the same attention as layout — a well-composed slide with a weak title still fails.

## Verification reminder

Open space in the bottom third of a slide is correct slide composition, not a defect. Slides are read across a room; margins are functional. Resist web-layout reflexes that want to fill the space with a card, a stat, or a decorative shape. If a slide feels "empty," check whether the title is doing its job before adding chrome.
