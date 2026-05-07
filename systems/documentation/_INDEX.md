# Documentation Subsystem

← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

Governs how living documentation is created, maintained, and linked across the hierarchy. The doc-update-protocol is enforced from FRAMEWORK.mdc on every code change.

## Contents

| File | Purpose |
|------|---------|
| [doc-update-protocol.md](doc-update-protocol.md) | The living-docs cascade — when and how to update docs |
| [templates/module-doc.md](templates/module-doc.md) | Template for documenting a new code module |
| [templates/feature-doc.md](templates/feature-doc.md) | Template for documenting a new feature |

## The Core Mandate

Documentation is not written after the fact. It is written alongside code, and updated every time the code changes. This is enforced by FRAMEWORK.mdc's Living Documentation mandate.

## When to Load This Subsystem

- Creating a new module or feature
- Making changes that affect documented behaviour
- Reviewing whether docs are current
- Creating a new `_INDEX.md` for a new area

## Last Updated
2026-05-07
