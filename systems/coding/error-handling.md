# Error Handling

← [Coding _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

## Core Principle

Errors are information. Handle them where you have context to act on them. Propagate them when you don't. Never swallow them silently.

## The Three Responses to an Error

1. **Recover** — you can fix the problem and continue (retry, fallback, default value)
2. **Propagate** — you can't fix it here, pass it up with context added
3. **Crash** — the error is unrecoverable; fail loudly and early

Never choose silence as a fourth option.

## Rules

**Add context when propagating.** Don't just rethrow a bare error. Add what you were trying to do:
- Bad: `throw err`
- Good: `throw new Error("Failed to fetch user profile", { cause: err })`

**Distinguish error types.** Separate:
- User errors (invalid input) — return a structured error response, don't log as system error
- System errors (unexpected failures) — log with full context, alert if production-critical
- External errors (third-party APIs, network) — log, implement retry/circuit-breaker where appropriate

**Never use exceptions for control flow.** Exceptions are for exceptional conditions, not expected branching logic.

**Log what you need to debug, not what looks comprehensive.** Include: what was being attempted, the relevant input/state, the error message, and a correlation ID if applicable.

## Async Error Handling

Every async call must have an error path. Unhandled promise rejections are bugs, not edge cases.

## Error Response Shape (APIs)

When returning errors from an API, use a consistent shape:
```
{
  error: {
    code: "VALIDATION_FAILED",       // machine-readable
    message: "Email is required",    // human-readable
    field: "email"                   // context (optional)
  }
}
```

Project-level overrides define the exact shape; this pattern is the baseline.

## Last Updated
2026-05-07
