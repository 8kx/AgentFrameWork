# Tracking Protocol

← [Tracker _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

## Silent Logging Rules

After every significant agent action, silently:

1. Append one line to `log/raw/YYYY-MM-DD.md`:
   ```
   [HH:MM] <action> | <area> | <outcome>
   ```
2. Update the "Last 3 Actions" block in `ACTIVE.md` (keep only the 3 most recent)
3. Do not narrate this to the user

**What counts as significant:**
- Creating or modifying a file
- Making an architectural decision
- Completing a feature or fix
- Running a compile or review

**What does not count:**
- Reading files
- Answering questions without making changes
- Planning discussions

## Raw Log Format

One file per day: `log/raw/YYYY-MM-DD.md`

```markdown
# Log — YYYY-MM-DD

[09:14] created user-auth module | systems/coding | linked in _INDEX.md
[09:31] added JWT token validation | feature/auth | tests passing
[10:02] updated ACTIVE.md goals | tracker | removed completed item
```

Create the file if it does not exist. Append to it if it does.

## ACTIVE.md Rules

- Maximum 25 lines at all times
- "Current Focus" = one sentence describing the active work
- "Active Goals" = 3-5 items max, with checkboxes (`[x]` done, `[~]` in-progress, `[ ]` pending)
- "Current Task" = sub-steps of the single `[~]` goal — **updated in real-time as each step completes**. Omit this section when no goal is in-progress.
- "Blockers" = honest current blockers or "None"
- "Last 3 Actions" = the three most recent raw log entries (condensed to one line each)
- Agent updates this file after every significant action, but only the relevant section

### Current Task — Real-Time Update Rule

Whenever a goal has `[~]` status, maintain a `## Current Task` block directly below Active Goals:

```markdown
## Current Task
**Goal:** <name of the [~] goal>
- [x] Step already done
- [x] Another completed step
- [ ] Next step to do  ← this is the live resume point
- [ ] Future step
```

**Mandate:** After completing any sub-step, immediately check it off and update Current Focus to name the next unchecked step. Do not batch updates to end of session. This block is the primary resume signal for any agent or session picking up mid-task.

When all sub-steps are checked, mark the parent goal `[x]` in Active Goals and remove the Current Task block.

## Compile Protocol

Triggered by: `"compile log"`, `"what have I done"`, `"project summary"`

1. Read all `log/raw/` files since the date in "Last Compiled"
2. Group entries by week
3. Summarise into `log/compiled/YYYY-WXX.md` using the template below
4. Update "Last Compiled" in `ACTIVE.md`
5. Present the summary to the user

### Compiled Summary Template

```markdown
# Week Summary — YYYY-WXX (Mon DD – Sun DD)

## Work Done
[Grouped by area: what was built, fixed, or changed]

## Completed Goals
- [items checked off ACTIVE.md during this period]

## Time Distribution (approximate)
- Coding: X sessions
- Design: X sessions
- Architecture/Planning: X sessions

## Patterns Noticed
[Anything worth flagging from the log — recurring friction, wins, scope creep]

## Open Items
[Goals that were active but not completed]
```

## Last Updated
2026-05-10
