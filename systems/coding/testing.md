# Testing

← [Coding _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

## Philosophy

Tests are a design tool first, a safety net second. If a piece of code is hard to test, that is a signal about the design, not the test.

## Test Types and When to Write Them

| Type | What it tests | Write when |
|------|--------------|-----------|
| Unit | One function/module in isolation | Pure logic, transformations, edge cases |
| Integration | Two or more real modules together | A module boundary where bugs commonly hide |
| End-to-end | A full user journey | Critical paths that must never break |
| Snapshot | UI output hasn't changed unexpectedly | After a UI component is stable |

Default to unit tests. Add integration tests at boundaries. Reserve E2E for the 3-5 most critical user journeys.

## What Makes a Good Test

- Tests behaviour, not implementation. If you can refactor without changing tests, the tests are well-written.
- One assertion per test (or one logical concept per test)
- Test the unhappy path as deliberately as the happy path
- Test names are sentences: `"returns an error when email is missing"`

## What Not to Test

- Framework or library internals
- Code that is trivially a wrapper with no logic
- Implementation details that will change as the design evolves

## Test-After vs TDD

Both are valid. TDD works best for pure logic with well-defined inputs/outputs. Test-after works best for exploratory code where the design is still emerging. The only wrong choice is no tests for critical paths.

## AI-Generated Tests

Review AI-generated tests carefully. Common failure modes:
- Tests that only test the happy path
- Assertions that confirm the output is what the AI assumed, not what is correct
- Missing edge cases that are not obvious from the function signature

## Coverage

Coverage is a proxy metric, not a goal. 100% coverage with bad tests is worse than 60% coverage with good tests. Use coverage to find untested areas, not to chase a number.

## Last Updated
2026-05-07
