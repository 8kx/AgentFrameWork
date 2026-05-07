# Folder Structure

← [Architecture _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

Abstract principles for organising a project. Stack-specific structures go in the project's own architecture docs.

## Core Principles

**Feature-first, not type-first.** Group by what the code does, not what type it is. `features/auth/` beats `controllers/ + models/ + views/` when a project grows past a handful of files.

**Flat until it hurts.** Start with a flat structure and only nest when it genuinely aids navigation. Premature nesting creates cognitive overhead without benefit.

**Co-location.** Tests, styles, and types for a module live next to the module, not in a parallel tree.

**`index` files are navigation aids, not logic containers.** Use `index.ts` / `index.py` etc. only to re-export; put logic in named files.

## Common Top-Level Structure

```
project-root/
├── .cursor/          # Agent rules and skills (this framework)
├── src/              # Application source code
├── tests/            # Integration and E2E tests (unit tests co-located)
├── docs/             # Project-specific living documentation
├── scripts/          # Build, migration, tooling scripts
├── .env.example      # Environment variable template (never .env itself)
└── [config files]    # package.json, pyproject.toml, etc. at root
```

## Inside `src/`

```
src/
├── features/         # Feature modules (each self-contained)
│   └── auth/
│       ├── index.ts
│       ├── auth.service.ts
│       ├── auth.types.ts
│       └── auth.test.ts
├── shared/           # Code used by 2+ features
│   ├── components/   # (UI projects)
│   ├── utils/
│   └── types/
├── config/           # Environment and app configuration
└── main.ts           # Entry point
```

## Rules

- If a file is used by only one feature, it lives in that feature's folder
- When a file is needed by a second feature, move it to `shared/`
- Never create a `helpers/` or `misc/` folder — name things by what they do
- `docs/` in the project mirrors the framework's subsystem structure where relevant

## Project-Level Override

Create `docs/architecture/folder-structure.md` in the project with the actual structure once it's established.

## Last Updated
2026-05-07
