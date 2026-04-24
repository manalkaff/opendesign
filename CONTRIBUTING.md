# Contributing to OpenDesign

Thanks for considering a contribution. OpenDesign is an open-source, skills-based version of [Claude Design](https://claude.ai/design) — the goal is parity with that experience, not feature creep. This repo ships a small, opinionated set of skills; quality bar is higher than coverage. Before adding a new skill, strongly consider whether an existing one can be extended instead.

## Ground rules

- Every `SKILL.md` is written in direct imperative voice. No marketing language, no apologies, no emoji, no "as we discussed".
- Concrete beats vague. Specific rules, forbidden patterns, and measured constants beat aspirational prose.
- Skills describe *behavior under specific conditions*, not philosophies. If your skill body is abstract, it's not ready.

## SKILL.md format

```markdown
---
name: your-skill-name
description: Use when [specific triggering conditions]. [One-line summary of what it produces.]
---

Loaded when [restate trigger].

## [Section]

[Rules, constants, forbidden patterns, required paths. Be concrete.]
```

Rules:

- `name` uses lowercase and hyphens. Must match the folder name.
- `description` starts with "Use when..." and describes *when the skill applies*, not what it does internally. The agent reads this to decide whether to load the skill.
- Do not summarize the skill's workflow in the description — the skill body is authoritative.

## Adding a new skill

1. Create `skills/<name>/SKILL.md` with frontmatter and body.
2. Add a row to the "Available skills" table in `README.md`.
3. Open a PR. In the description, state:
   - What the skill does.
   - Why existing skills can't cover this case.
   - Any risk of overlap with `opendesign`, `frontend-design`, `create-design-system`, or `make-a-deck`.

## Editing an existing skill

- Keep the frontmatter `name` stable — changing it is a breaking change for users.
- If you're narrowing or widening the trigger, update the `description` in the same change.
- Bump the version in `plugin.json` and `marketplace.json` for any user-visible change.

## Things I'll reject

- Skills that replicate what an existing skill covers with minor variation.
- Skill bodies that read like a blog post or pitch.
- Emoji, marketing adjectives, or aspirational prose.
- Frontmatter that summarizes the skill's workflow instead of its trigger.
- PRs that add a skill file but forget the `marketplace.json` or README updates.
