# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```sh
npm run dev       # dev server at localhost:4321
npm run build     # production build to ./dist/
npm run preview   # preview build locally
```

There are no tests and no linter configured.

## Architecture

**Single-route slide deck built with Astro 6.**

All 12 slides are imported in `src/pages/index.astro` and rendered inside `src/layouts/SlideLayout.astro`. The deck is a fully static, single-page app — no routing, no client-side framework.

### Key files

| File | Role |
|------|------|
| `src/layouts/SlideLayout.astro` | HTML shell, background visuals (stars canvas, SVG mountains), and **all navigation JS** (keyboard, touch, dot nav, progress bar) |
| `src/pages/index.astro` | Imports and sequences all 12 slides |
| `src/slides/0X-*.astro` | One `.astro` file per slide, numbered 01–12 |
| `src/components/SlideShell.astro` | Utility fragment for slide number badge + optional label |
| `src/styles/global.css` | **All CSS** — design tokens, layout, component styles |

### Slide anatomy

Each slide must be a `<div class="slide">` wrapper. The navigation JS in `SlideLayout.astro` queries `.slide` elements and manages `.active` / `.exit` classes for transitions. Adding a new slide requires:
1. Create `src/slides/0N-name.astro` with a `.slide` div.
2. Import and add it to `src/pages/index.astro`.

### CSS

Tailwind is installed (`@tailwindcss/vite`) but **only the reset is excluded** — utilities are not used. All styles live in `src/styles/global.css` using raw CSS with custom properties.

Design tokens (defined in `:root`):
- Colors: `--bg`, `--green` (`#00e87a`), `--purple`, `--cyan`, `--red`, `--muted`, `--text`
- Fonts: `--font-d` (Orbitron, display), `--font-m` (JetBrains Mono), `--font-b` (Exo 2, body)

Reusable CSS patterns: `.card`, `.two-col`, `.stat-grid`, `.quote`, `.loop`, `.code`, `.ilist`, `.infra`, `.warn` — all defined and commented in `global.css`.

When adding slide-specific styles, append them to the bottom of `global.css` with a labeled block comment matching the existing style (e.g. `/* ══ SLIDE N — NAME ══ */`).

### Fonts

Loaded from Google Fonts CDN in `SlideLayout.astro`. Do not use local font packages.
