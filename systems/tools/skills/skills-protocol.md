# Skills Protocol

← [Skills _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../../.cursor/rules/FRAMEWORK.mdc)

## Skill File Structure

```
skill-name/
├── SKILL.md          # Required — instructions (keep under 500 lines)
├── reference.md      # Optional — detailed docs the agent reads on demand
└── scripts/          # Optional — executable tools the skill uses
    ├── tool.py       # Python tool scripts
    ├── tool.sh       # Shell scripts
    └── tool.ps1      # PowerShell scripts
```

### SKILL.md + Scripts: The Two-File Pattern

This mirrors the pattern described by Anthropic's own internal tooling:
- **SKILL.md** = the agent's instructions (what to do, how to think about it)
- **scripts/** = the actual executable tools (what to run, what to call)

The agent reads SKILL.md for instructions, then executes scripts as needed. This separation keeps instructions readable and tools reliable. A script that does one thing repeatably is more dependable than asking the agent to generate the same code each time.

When to add a script:
- The task involves a repeatable operation (file transformation, API call, data parse)
- Consistency matters more than flexibility
- The operation is fragile enough that generated code would vary dangerously

## SKILL.md Requirements

```yaml
---
name: skill-name           # lowercase, hyphens, max 64 chars
description: >-
  [Third person. What it does (WHAT) and when to use it (WHEN). Include trigger terms.]
disable-model-invocation: true   # omit only if skill should auto-invoke from context
---
```

## Where Skills Live

| Type | Path | Scope |
|------|------|-------|
| Personal | `~/.cursor/skills/skill-name/` | All your projects on this machine |
| Project | `.cursor/skills/skill-name/` | Anyone working in this repo |

Skills in this framework repo live at `.cursor/skills/` and are installed to `~/.cursor/skills/` by the install scripts.

## Creating a New Skill

1. Create the directory at the appropriate location
2. Write `SKILL.md` with frontmatter and clear step-by-step instructions
3. Test it by triggering it in a project
4. Add it to `skills/registry.md`
5. If personal: add it to `scripts/install.ps1` and `scripts/install.sh`

## Content Principles

- Concise: the agent is smart — only add context it doesn't already have
- Progressive disclosure: essential in SKILL.md, detail in reference.md
- Specific triggers: the description must include the exact phrases that should invoke the skill
- No time-sensitive content: skills should not become outdated

## Last Updated
2026-05-07
