# Onboarding Path

← [Scaffold _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../.cursor/rules/FRAMEWORK.mdc)

The deliberate reading order for anyone opening this project cold — including you, returning after months away.

## For a New Project (copy this into the project's `docs/`)

---

### Step 1: Understand what this is (5 min)

1. Read `README.md` — what is this project, what does it do?
2. Read `.cursor/rules/FRAMEWORK.mdc` — what framework version, what are the core mandates?
3. Read `systems/tracker/ACTIVE.md` — what is currently being worked on, what are the goals?

### Step 2: Understand the technical landscape (10 min)

4. Read `systems/architecture/_INDEX.md` → `folder-structure.md` — how is the project structured?
5. Read `docs/architecture/folder-structure.md` — the actual structure of *this* project
6. Skim `systems/coding/conventions.md` (and project overrides if present) — how is code written here?
7. Check `systems/architecture/dependencies.md` or `docs/architecture/dependencies.md` — what libraries are in use and why?

### Step 3: Understand the current state (5 min)

8. Read `systems/learnings/INSIGHTS.md` — what are the key things known about working in this codebase?
9. Read the latest `systems/tracker/log/compiled/` file — what has been done recently?
10. Check `docs/decisions/` — any recent architectural decisions to be aware of?

### Step 4: Get to work

11. Check `ACTIVE.md` for the current focus and open goals
12. Pick up the next open item or ask the agent: "what's next?"

---

## Agent Guidance

When a new session starts and context suggests it's a fresh session (no recent history), offer to walk through this path:

> "Looks like a fresh session. Want me to run through the onboarding path to get up to speed quickly?"

A "yes" triggers reading Steps 1-3 and producing a brief orientation summary.

## Last Updated
2026-05-07
