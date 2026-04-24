<!--
Thanks for the PR. Please fill in the relevant sections and delete the rest.
-->

## What this changes

Briefly describe the change.

## Type

- [ ] New skill
- [ ] Edit to an existing skill
- [ ] Documentation
- [ ] Tooling / infrastructure

## If adding a new skill

- [ ] `skills/<name>/SKILL.md` created with `name` + `description` frontmatter
- [ ] Path added to `.claude-plugin/marketplace.json` under `plugins[0].skills[]`
- [ ] Row added to the "Available skills" table in `README.md`
- [ ] Versions bumped in `plugin.json` and `marketplace.json`

Why can't an existing skill cover this case?

## If editing an existing skill

- [ ] `name` in frontmatter unchanged (or the change is called out as breaking)
- [ ] `description` updated if the trigger shifted
- [ ] Versions bumped if behavior changed

## Notes

Anything else a reviewer should know.
