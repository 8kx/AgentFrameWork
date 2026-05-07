# [Feature/Component] — Technical Approach

← [Planning _INDEX.md](../_INDEX.md) ← [FRAMEWORK.mdc](../../../.cursor/rules/FRAMEWORK.mdc)

**Status:** Draft
**Stage:** 3 Design
**Concept doc:** [link to concept-doc.md]
**Last Updated:** YYYY-MM-DD

---

## Summary

> One paragraph: what is being built technically, and what approach has been chosen?

---

## Architecture

> How does this fit into the existing system? What are the main components?

```
[ASCII diagram or description of the data/component flow]

e.g.
Client → API endpoint → Service layer → Database
                      ↘ External API
```

---

## Key Technical Decisions

> **Decision:** [choice made]
> Alternatives considered: [what else was evaluated]
> Rationale: [why this one]

---

## Data Model

> What data structures are involved? New tables, schemas, or types?

```
[Entity or schema definition]
```

| Field | Type | Purpose |
|-------|------|---------|
| [field] | [type] | [why it exists] |

---

## API / Interface Design

> What does the public interface look like? (endpoints, function signatures, events)

```
[Interface definition]
```

---

## Dependencies

| Dependency | New or existing | Why needed |
|-----------|----------------|-----------|
| [library/service/module] | New / Existing | [reason] |

See [architecture/dependencies.md](../../architecture/dependencies.md) for evaluation criteria before adding new dependencies.

---

## Security Considerations

> Are there auth checks, data validation, or sensitive data handling involved?

- [ ] Input validated
- [ ] Auth checks in place
- [ ] No secrets in code
- [ ] Sensitive data handled per [security/secrets-management.md](../../security/secrets-management.md)

---

## Testing Approach

| Layer | What gets tested | How |
|-------|----------------|-----|
| Unit | [logic] | [test type] |
| Integration | [boundary] | [test type] |
| Manual | [user flow] | [steps] |

---

## Risks & Gotchas

> **Risk:** [something that could go wrong technically]
> Mitigation: [what we'll do about it]

---

## Rollout Plan

How does this get deployed? Any feature flags, migrations, or coordination needed?

---

## Open Questions

| # | Question | Blocking? |
|---|----------|----------|
| 1 | [technical unknown] | Yes / No |

---
*Template from [AgentFrameWork](https://github.com/8kx/AgentFrameWork) — systems/planning/templates/technical-approach.md*
