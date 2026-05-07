# Planning Subsystem

← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

Governs how projects and features move from idea to execution. Every concept produces a reviewable doc before any code is written. Documents follow the visual style defined in [systems/design/visual-system.md](../design/visual-system.md).

## Contents

| File | Purpose |
|------|---------|
| [planning-protocol.md](planning-protocol.md) | How to move through stages, when to produce docs |
| [stages.md](stages.md) | Stage definitions — what each stage is, what it produces |
| [templates/concept-doc.md](templates/concept-doc.md) | Feature or idea concept document |
| [templates/project-brief.md](templates/project-brief.md) | High-level project overview and goals |
| [templates/technical-approach.md](templates/technical-approach.md) | Technical design and approach document |
| [templates/stage-review.md](templates/stage-review.md) | Stage gate review — what passed, what needs work |

## Trigger Phrases

| Phrase | Action |
|--------|--------|
| `"create a concept doc"` / `"concept [feature]"` | Generate a concept doc from template for review |
| `"project brief"` / `"write a brief"` | Generate a project brief doc |
| `"technical approach"` / `"design the approach"` | Generate a technical approach doc |
| `"stage review"` / `"review this stage"` | Generate a stage gate review doc |
| `"what stage are we in"` | Read ACTIVE.md and summarise current stage + next gate |

## Document Storage

Planning docs live in `docs/planning/` inside the project:

```
docs/
└── planning/
    ├── brief.md                          # Project brief (one per project)
    ├── concepts/
    │   └── YYYY-MM-DD-[feature].md       # Concept docs (one per feature/idea)
    ├── technical/
    │   └── YYYY-MM-DD-[topic].md         # Technical approach docs
    └── reviews/
        └── YYYY-MM-DD-stage-[N]-review.md
```

## Connection to Other Subsystems

- **Design**: all docs use the visual style conventions from [design/visual-system.md](../design/visual-system.md)
- **Tracker**: current stage is reflected in `ACTIVE.md` goals
- **Architecture**: technical approach docs feed into [architecture/decision-log.md](../architecture/decision-log.md)
- **Documentation**: approved concept docs become the seed for feature docs in `docs/features/`

## Last Updated
2026-05-07
