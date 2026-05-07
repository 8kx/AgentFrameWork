# Deployment Subsystem

← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

Governs how projects are shipped — environment management, CI/CD philosophy, and release protocol. Stack-agnostic principles; project-specific config lives in the project's docs.

## Contents

| File | Purpose |
|------|---------|
| [environments.md](environments.md) | Environment stages and configuration strategy |
| [cicd-philosophy.md](cicd-philosophy.md) | What CI/CD should always do, at minimum |
| [release-protocol.md](release-protocol.md) | Versioning, release notes, and rollback |

## When to Load This Subsystem

- Setting up CI/CD for a new project
- Configuring environment variables across stages
- Planning a release
- Diagnosing a deployment failure

## Last Updated
2026-05-07
