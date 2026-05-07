# Design Tokens

← [Design _INDEX.md](_INDEX.md) ← [FRAMEWORK.mdc](../../.cursor/rules/FRAMEWORK.mdc)

This file is a template. Copy it into each project and fill in the brand-specific values. The slot names are fixed; the values are project-specific.

## Color Palette

```
/* Primary */
--color-primary-50:   [lightest tint]
--color-primary-100:  [light tint]
--color-primary-500:  [base — main brand color]
--color-primary-700:  [dark shade]
--color-primary-900:  [darkest shade]

/* Neutrals (surface, text, border) */
--color-neutral-0:    #ffffff
--color-neutral-50:   [near-white surface]
--color-neutral-100:  [light surface / border]
--color-neutral-300:  [subtle border]
--color-neutral-500:  [muted text]
--color-neutral-700:  [secondary text]
--color-neutral-900:  [primary text / near-black]

/* Semantic */
--color-error:        [red variant]
--color-success:      [green variant]
--color-warning:      [amber variant]
--color-accent:       [optional secondary brand color]
```

## Semantic Aliases (map slots to palette)

```
--surface-page:       var(--color-neutral-50)
--surface-card:       var(--color-neutral-0)
--surface-overlay:    rgba(0,0,0,0.48)

--text-primary:       var(--color-neutral-900)
--text-secondary:     var(--color-neutral-700)
--text-muted:         var(--color-neutral-500)
--text-inverse:       var(--color-neutral-0)

--border-default:     var(--color-neutral-100)
--border-strong:      var(--color-neutral-300)

--action-primary:     var(--color-primary-500)
--action-primary-hover: var(--color-primary-700)
```

## Typography Scale

```
--font-family-base:   [e.g. 'Inter', system-ui, sans-serif]
--font-family-mono:   [e.g. 'JetBrains Mono', monospace]

--font-size-xs:   0.75rem   /* 12px */
--font-size-sm:   0.875rem  /* 14px */
--font-size-md:   1rem      /* 16px — base */
--font-size-lg:   1.125rem  /* 18px */
--font-size-xl:   1.25rem   /* 20px */
--font-size-2xl:  1.5rem    /* 24px */
--font-size-3xl:  1.875rem  /* 30px */
--font-size-4xl:  2.25rem   /* 36px */

--font-weight-normal:   400
--font-weight-medium:   500
--font-weight-semibold: 600
--font-weight-bold:     700

--line-height-tight:    1.25
--line-height-base:     1.5
--line-height-loose:    1.75
```

## Spacing Scale

```
--space-1:   0.25rem   /* 4px */
--space-2:   0.5rem    /* 8px */
--space-3:   0.75rem   /* 12px */
--space-4:   1rem      /* 16px */
--space-5:   1.25rem   /* 20px */
--space-6:   1.5rem    /* 24px */
--space-8:   2rem      /* 32px */
--space-10:  2.5rem    /* 40px */
--space-12:  3rem      /* 48px */
--space-16:  4rem      /* 64px */
--space-20:  5rem      /* 80px */
```

## Border Radius

```
--radius-sm:   0.25rem   /* 4px — subtle rounding */
--radius-md:   0.5rem    /* 8px — default cards, inputs */
--radius-lg:   0.75rem   /* 12px — modals, larger cards */
--radius-xl:   1rem      /* 16px — featured cards */
--radius-full: 9999px    /* pills, avatars */
```

## Elevation (box shadows)

```
--shadow-1: 0 1px 3px rgba(0,0,0,0.10), 0 1px 2px rgba(0,0,0,0.06);
--shadow-2: 0 4px 6px rgba(0,0,0,0.07), 0 2px 4px rgba(0,0,0,0.06);
--shadow-3: 0 10px 15px rgba(0,0,0,0.10), 0 4px 6px rgba(0,0,0,0.05);
```

## Breakpoints

```
--breakpoint-sm:  640px
--breakpoint-md:  768px
--breakpoint-lg:  1024px
--breakpoint-xl:  1280px
--breakpoint-2xl: 1536px
```

## Last Updated
2026-05-07
