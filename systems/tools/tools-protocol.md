# Tools Protocol

← [Tools _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

## Tool Categories

| Category | What it is | Where it lives |
|----------|-----------|---------------|
| Cursor Skill | Agent capability trigger via SKILL.md | `~/.cursor/skills/` (personal) or `.cursor/skills/` (project) |
| MCP Server | External tool server the agent can call | Connected via Cursor or Claude settings |

## Adding a New Tool

**New Skill:**
1. Create directory `.cursor/skills/[name]/` or `~/.cursor/skills/[name]/`
2. Write `SKILL.md` following the create-skill pattern
3. Add entry to `tools/skills/registry.md`
4. If personal skill: add to install scripts so it travels to new machines

**New MCP Server:**
1. Connect the server in Cursor settings (Settings → MCP)
2. Create `tools/mcp-servers/servers/[name].md` documenting the server
3. Add entry to `tools/mcp-servers/registry.md`

## Retiring a Tool

- Mark it `deprecated` in the registry (do not delete the entry)
- Note the date and reason
- For skills: move the SKILL.md to an `_archived/` folder rather than deleting

## Last Updated
2026-05-07
