# Visual System

← [Design _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

The master visual guide. These principles apply to every UI regardless of stack. Project-specific brand values go in [tokens.md](tokens.md).

## Layout Principles

**Consistent spacing.** Use the spacing scale from `tokens.md` for all margins, padding, and gaps. Never use arbitrary pixel values.

**Clear hierarchy.** Every screen has one primary action. Secondary actions are visually subordinate. Avoid competing calls to action.

**Breathing room.** Whitespace is not wasted space. Dense UIs cause cognitive overload. When in doubt, add space.

**Responsive by default.** Design for mobile first, enhance for larger screens. Content should never overflow or break at any viewport width.

## Typography

- Use the type scale from `tokens.md`
- Maximum of 2 type sizes per component (label + value, heading + body)
- Line length should sit between 60-80 characters for body text
- Never use `font-weight` lower than 400 for body text; it becomes illegible at small sizes

## Color Usage

| Slot | Usage |
|------|-------|
| `primary` | Main actions, active states, brand emphasis |
| `surface` | Background layers (page, card, modal) |
| `text` | Body copy and labels |
| `accent` | Highlights, badges, secondary emphasis |
| `error` | Errors, destructive actions, validation failures |
| `success` | Confirmations, completed states |
| `border` | Dividers, input outlines, card edges |

**Contrast requirement:** Text on any background must meet WCAG AA minimum (4.5:1 for normal text, 3:1 for large text).

## Elevation & Shadow

Use elevation to communicate layering, not decoration. Levels:
- **0** — flat, same layer as page (cards on coloured backgrounds)
- **1** — slightly raised (default cards, inputs)
- **2** — floating (dropdowns, tooltips)
- **3** — overlays (modals, drawers, sheets)

Never mix elevation levels arbitrarily. A card on a modal should not use a higher elevation than the modal itself.

## Border Radius

- Use one or two radius values per project, defined in `tokens.md`
- Be consistent — mixing sharp and rounded corners in one component looks accidental

## Interaction States

Every interactive element needs all four states styled:
1. **Default** — resting state
2. **Hover** — cursor-triggered feedback (desktop only)
3. **Active/Pressed** — click/tap feedback
4. **Disabled** — visually distinct, not just reduced opacity

Focus state is mandatory for accessibility. Never remove the focus ring without providing a visible alternative.

## Motion & Animation

- Motion should have a purpose: guide attention, confirm an action, show context change
- Keep durations short: 150-300ms for micro-interactions, up to 500ms for page transitions
- Use easing (ease-out for enter, ease-in for exit)
- Respect `prefers-reduced-motion` — all animations should have a no-motion fallback

## Iconography

- Use one icon library per project; never mix styles
- Icons should always be accompanied by a label unless the icon is universally understood (close, search, menu)
- Minimum touch target: 44×44px

## Last Updated
2026-05-07
