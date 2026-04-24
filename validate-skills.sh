#!/usr/bin/env bash
# Validate that every skill has frontmatter with name + description,
# and that marketplace.json lists exactly the skills on disk.

set -eu
cd "$(dirname "$0")"

fail=0

# 1. Every skills/*/SKILL.md must exist and have frontmatter with name + description.
for dir in skills/*/; do
  file="$dir/SKILL.md"
  skill_name="$(basename "$dir")"

  if [ ! -f "$file" ]; then
    echo "MISSING: $file"
    fail=1
    continue
  fi

  if ! head -1 "$file" | grep -q '^---$'; then
    echo "NO FRONTMATTER: $file"
    fail=1
    continue
  fi

  if ! awk '/^---$/{c++} c==1{print} c==2{exit}' "$file" | grep -q '^name:'; then
    echo "MISSING name: $file"
    fail=1
  fi

  if ! awk '/^---$/{c++} c==1{print} c==2{exit}' "$file" | grep -q '^description:'; then
    echo "MISSING description: $file"
    fail=1
  fi

  declared_name="$(awk '/^---$/{c++} c==1{print} c==2{exit}' "$file" | awk -F': *' '/^name:/{print $2; exit}')"
  if [ "$declared_name" != "$skill_name" ]; then
    echo "NAME MISMATCH: $file declares '$declared_name' but folder is '$skill_name'"
    fail=1
  fi
done

# (Claude Code discovers skills by convention from ./skills/; no explicit list to keep in sync.)

# 3. Version must match across every host config.
extract_version() {
  grep -oE '"version"[[:space:]]*:[[:space:]]*"[^"]+"' "$1" | head -1 | sed -E 's/.*"([^"]+)"$/\1/'
}

v_claude="$(extract_version .claude-plugin/plugin.json)"
v_market="$(extract_version .claude-plugin/marketplace.json)"
v_cursor="$(extract_version .cursor-plugin/plugin.json)"
v_codex="$(extract_version .codex-plugin/plugin.json)"
v_gemini="$(extract_version gemini-extension.json)"
v_pkg="$(extract_version package.json)"

if [ "$v_claude" != "$v_market" ] || \
   [ "$v_claude" != "$v_cursor" ] || \
   [ "$v_claude" != "$v_codex" ]  || \
   [ "$v_claude" != "$v_gemini" ] || \
   [ "$v_claude" != "$v_pkg" ]; then
  echo "VERSION MISMATCH across host configs:"
  echo "  .claude-plugin/plugin.json:      $v_claude"
  echo "  .claude-plugin/marketplace.json: $v_market"
  echo "  .cursor-plugin/plugin.json:      $v_cursor"
  echo "  .codex-plugin/plugin.json:       $v_codex"
  echo "  gemini-extension.json:           $v_gemini"
  echo "  package.json:                    $v_pkg"
  fail=1
fi

if [ "$fail" -eq 0 ]; then
  echo "OK — all skills validated."
fi

exit "$fail"
