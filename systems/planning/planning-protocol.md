# Planning Protocol

← [Planning _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

## Core Principle

A concept doc is written before any code. No feature enters Stage 3 (Design) without a reviewed concept. This is not bureaucracy — it is the single most effective way to avoid building the wrong thing.

## When the Agent Creates a Planning Doc

The agent creates a planning doc automatically when:
- User says "concept [feature]", "write a brief", "plan [feature]", "design the approach"
- A new feature is discussed for more than a few exchanges without a doc existing
- The tracker shows Stage 1 or 2 in `ACTIVE.md` but no doc exists in `docs/planning/`

The agent asks before creating: "Want me to capture this as a concept doc?" — except when explicitly triggered.

## Document Visual Style

All planning docs follow these conventions derived from [design/visual-system.md](../design/visual-system.md):

**Structure hierarchy:**
```
# Title (H1) — document name only, one per doc
## Section (H2) — major sections
### Subsection (H3) — only when genuinely needed
```

**Callout blocks** for important information:
```markdown
> **Decision:** [a significant choice made in this doc]

> **Risk:** [something that could go wrong]

> **Open question:** [something not yet resolved]

> **Assumption:** [something taken as true that should be validated]
```

**Tables** for comparisons, options, or structured data — never prose lists for things that are inherently tabular.

**Status badge** at the top of every doc (after the breadcrumb):
```
**Status:** Draft | In Review | Approved | Superseded | Shipped
**Stage:** 1 Discover | 2 Concept | 3 Design | 4 Build | 5 Ship
**Last Updated:** YYYY-MM-DD
```

**No walls of text.** If a section exceeds 200 words, consider whether it should be a table, a list, or a separate doc.

## Review Protocol

When a concept doc is complete, the agent:
1. Presents a summary: "Concept doc created at `docs/planning/concepts/[name].md`. Here are the key points and open questions."
2. Asks: "Ready to review it together, or would you like to read it first?"
3. On review: works through open questions and risks one at a time
4. On approval: updates status to `Approved`, logs in tracker, advances stage in `ACTIVE.md`

## Stage Gate Checks

At each stage gate, the agent runs a quick check against the gate criteria in [stages.md](stages.md) and reports:

```
Stage 2 Gate Check — [feature name]
✓ Problem is clearly defined
✓ Approach is described without implementation detail
⚠ 2 open questions remain — should these be resolved before moving forward?
✗ Key risks not identified

Recommendation: Resolve the open questions and risks before moving to Stage 3.
```

## Connecting to Other Subsystems

**On concept approval:**
- Log in tracker: `[HH:MM] concept approved: [feature] | planning | advancing to Stage 3`
- Update `ACTIVE.md` current stage
- Add a learning if any useful insight emerged during concepting

**On technical approach approval:**
- Add significant decisions to `docs/decisions/` (architecture decision log)
- Seed `docs/features/[feature].md` from the approved concept doc

**On ship:**
- Update concept doc status to `Shipped`
- Capture build learnings in `systems/learnings/log/raw/`

## Last Updated
2026-05-07
