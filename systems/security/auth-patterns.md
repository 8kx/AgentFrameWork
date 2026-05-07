# Auth Patterns

← [Security _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

Abstract authentication and authorisation patterns. Project-specific implementations extend these.

## Authentication vs Authorisation

- **Authentication** — who are you? (identity: login, token validation)
- **Authorisation** — what are you allowed to do? (permissions: role checks, ownership checks)

These are separate concerns. Keep them separate in code.

## Common Auth Patterns

### Session-Based Auth
- Server stores session state; client holds a session cookie
- Simple, stateful, good for traditional web apps
- Requires sticky sessions or shared session store in multi-server deployments

### Token-Based Auth (JWT)
- Server is stateless; client holds a signed token (usually in memory or httpOnly cookie)
- Good for APIs and SPAs
- Tokens cannot be revoked — use short expiry + refresh tokens
- Store JWTs in httpOnly cookies (not localStorage — vulnerable to XSS)

### OAuth 2.0 / OIDC
- Delegate auth to a trusted provider (Google, GitHub, etc.)
- Use an established library; never implement the OAuth flow from scratch
- Validate tokens server-side; never trust client-side claims alone

## Authorisation Principles

**Default deny.** Every route/resource is private unless explicitly made public.

**Check server-side.** Auth checks happen on the server. Client-side checks are UX, not security.

**Principle of least privilege.** Users and services get the minimum permissions required. Don't give admin scope when read scope is sufficient.

**Own resources, not roles alone.** For user-owned resources, check both: the user is authenticated AND the requested resource belongs to that user. Role check alone is not enough.

## Common Mistakes

- Checking auth only in middleware but not at the data access layer
- Using predictable IDs (sequential integers) for resources — use UUIDs
- Trusting `userId` from the request body instead of extracting it from the verified token
- Logging auth tokens or sensitive headers

## Last Updated
2026-05-07
