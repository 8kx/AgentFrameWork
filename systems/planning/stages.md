# Stages

← [Planning _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

A project or feature moves through five stages. Each stage has a clear entry condition, a defined output, and a review gate before moving forward. Nothing moves to the next stage without the gate passing.

## The Five Stages

```
1. DISCOVER  →  2. CONCEPT  →  3. DESIGN  →  4. BUILD  →  5. SHIP
```

---

## Stage 1: Discover

**What it is:** Understand the problem before proposing a solution.

**Entry condition:** An idea, a request, or a problem statement exists.

**Activities:**
- Define the problem in one sentence
- Identify who is affected and how
- List what is known and what is unknown
- Determine the scope boundary (what is in / out)

**Output:** A filled-in `project-brief.md` or a problem statement block inside a `concept-doc.md`.

**Gate:** Can you state the problem clearly without describing a solution? If yes, move to Concept.

---

## Stage 2: Concept

**What it is:** Design the solution at a high level before any technical decisions.

**Entry condition:** Stage 1 gate passed. Problem is clearly defined.

**Activities:**
- Propose the approach (not the implementation)
- Identify the key user flows or behaviours
- List the main risks and open questions
- Optionally: sketch the UI or data model at a high level

**Output:** `concepts/YYYY-MM-DD-[feature].md` — a concept doc for review.

**Gate:** Is the concept clear enough that someone else could review it and give meaningful feedback? If yes, move to Design.

---

## Stage 3: Design

**What it is:** Make the detailed decisions — architecture, UI, data model, integrations.

**Entry condition:** Stage 2 gate passed. Concept is approved.

**Activities:**
- Technical approach document
- UI design (wireframes, token application, component decisions)
- Architecture decisions (add to decision log)
- Dependency identification

**Output:** `technical/YYYY-MM-DD-[topic].md` + any UI design artefacts.

**Gate:** Are all significant unknowns resolved? Is the approach unambiguous enough to start building? If yes, move to Build.

---

## Stage 4: Build

**What it is:** Implementation.

**Entry condition:** Stage 3 gate passed. Design is approved.

**Activities:**
- Code the solution following framework coding standards
- Update docs alongside code (living-docs protocol)
- Track progress in `ACTIVE.md`

**Output:** Working code + updated docs.

**Gate:** Does it work? Does it match the concept doc? Have the tests passed? If yes, move to Ship.

---

## Stage 5: Ship

**What it is:** Deploy and close the loop.

**Entry condition:** Stage 4 gate passed.

**Activities:**
- Deploy following deployment subsystem protocol
- Write release notes
- Update the concept doc status to `Shipped`
- Capture any learnings from the build into `systems/learnings/`

**Output:** Deployed feature + release notes + learnings captured.

**Gate:** Is it live and stable? Done.

---

## Tracking Stage in ACTIVE.md

The current stage is always reflected in `ACTIVE.md`:

```
## Current Stage
Stage 2: Concept — [feature name]
Gate: Awaiting review of concept-doc
```

## Last Updated
2026-05-07
