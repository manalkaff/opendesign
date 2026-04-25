# Installing OpenDesign for OpenCode

## Prerequisites

- [OpenCode.ai](https://opencode.ai) installed

## Installation

### Project-level (recommended)

Add opendesign to `.opencode/opencode.json` in your project root (create the file if it does not exist):

```json
{
  "$schema": "../opencode-schema.json",
  "plugin": [
    "opendesign@git+https://github.com/manalkaff/opendesign.git"
  ]
}
```

> **Note:** Current OpenCode reads project-level config from `.opencode/opencode.json`, not from `opencode.json` or `.opencode.json` at the repo root. If you added the plugin to one of those locations and it is not loading, move it here.

Restart OpenCode. The first install fetches the package from GitHub and may take 10–30 seconds while dependencies are reified — wait for it before assuming something failed.

### Global (all projects)

Add opendesign to your global config at `~/.config/opencode/opencode.json` or `~/.opencode/opencode.json`:

```json
{
  "plugin": [
    "opendesign@git+https://github.com/manalkaff/opendesign.git"
  ]
}
```

Restart OpenCode.

## Verifying install

After restarting, verify by asking: "What design skills do you have?"

You should see opendesign skills listed. If skill count did not increase, check the logs (see Troubleshooting below).

## Usage

Use OpenCode's native `skill` tool:

```
use skill tool to list skills
use skill tool to load opendesign
```

## Updating

OpenDesign updates automatically when you restart OpenCode.

To pin a specific version:

```json
{
  "plugin": ["opendesign@git+https://github.com/manalkaff/opendesign.git#v0.1.0"]
}
```

## Troubleshooting

### Plugin not loading

1. Check logs for these key lines:

   ```
   project config loaded from .opencode/opencode.json   ← confirms correct config path
   project .opencode reify                              ← npm install in progress
   loading plugin                                       ← plugin being initialized
   ```

   Run: `opencode run --print-logs "hello" 2>&1 | grep -iE "opendesign|reify|project config|plugin"`

2. Make sure the plugin entry is in `.opencode/opencode.json` (not `opencode.json` or `.opencode.json` at the repo root — those may be ignored by current OpenCode builds for project-level plugin loading).

3. Make sure you are running a recent version of OpenCode.

4. If you just added the plugin for the first time, wait 30 seconds on the next restart — the git package download and npm reify take time.

### Skills not found

1. Use `skill` tool to list what is discovered.
2. Confirm the plugin loaded (see log check above).
3. Confirm skill count increased after restart.

### Tool mapping

When skills reference Claude Code tools:
- `TodoWrite` → `todowrite`
- `Task` with subagents → `@mention` syntax
- `Skill` tool → OpenCode's native `skill` tool
- File operations → your native tools

## Getting help

- Report issues: https://github.com/manalkaff/opendesign/issues
- Repo: https://github.com/manalkaff/opendesign
