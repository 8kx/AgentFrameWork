# Component Patterns

← [Design _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

Reusable UI patterns. These are stack-agnostic — they describe what to build and why, not how to build it in a specific framework.

## Pattern: Form

**Structure:** Label → Input → Helper/Error text (vertical stack)
- Labels are always visible; never use placeholder-only inputs
- Error messages appear immediately below the failing field
- Required fields are marked; optional fields are the exception (mark them instead)
- Submit button is at the bottom, aligned with the form's left edge
- Disable submit during submission; show a loading state

## Pattern: Card

**Structure:** Optional image → Header → Body → Optional footer actions
- Cards are interactive (clickable) or static — never ambiguously both
- Clickable cards have a hover/focus state on the entire surface
- Actions inside a card (like a "Delete" button) use `stopPropagation` to prevent triggering the card click

## Pattern: Empty State

Every list, table, or feed must have an empty state. It should:
- Explain why the view is empty (no results, no items created yet, error)
- Provide a direct action to fill it (e.g. "Create your first project →")
- Use illustration or icon sparingly — one per screen maximum

## Pattern: Loading State

- Use skeleton screens for content that has a known shape (lists, cards)
- Use a spinner only for actions (submitting a form, loading without shape)
- Never leave the user staring at a blank area — always replace content with its skeleton equivalent

## Pattern: Modal / Dialog

- One modal on screen at a time
- Always has a close mechanism (button + Escape key)
- Destructive modals (delete, irreversible actions) use a red confirm button and state the consequence explicitly
- Modal content should not scroll unless unavoidable; prefer drawers/sheets for large content

## Pattern: Navigation

- Active state is always clearly marked
- Mobile navigation collapses to a drawer or bottom tab bar
- Breadcrumbs for deep navigation trees (3+ levels)
- Back button available on every drill-down view

## Pattern: Data Table

- Sortable columns are visually indicated
- Pagination or infinite scroll (not both)
- Row actions (edit, delete) appear on hover or are in a context menu
- Empty state follows the Empty State pattern above
- Mobile: tables collapse to a card list view

## Accessibility Baseline

Every component must:
- Be keyboard navigable
- Have appropriate ARIA roles and labels
- Communicate state changes to screen readers (`aria-live` for dynamic updates)
- Meet WCAG AA contrast requirements (see [visual-system.md](visual-system.md))

## Last Updated
2026-05-07
