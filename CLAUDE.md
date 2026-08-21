# Talks monorepo guide

## Commands

```sh
bun install
bun run dev:punatech
bun run build:punatech
bun run build:all
bun run new:talk -- my-talk
```

Run a deck command from its own directory with `bun run dev`, `bun run build`, or `bun run preview` when focused work is more convenient.

## Architecture

The repository root is `presentations/talks/`. Every published deck is an independent Astro 6 single-route project under `charlas/<slug>/`. Its `astro.config.mjs` owns the GitHub Pages base path: `/talks/<slug>/`.

The root `package.json` intentionally uses an explicit workspace list. Both `charlas/punatech-2026/` and the migrated `charlas/agents-at-work/` workspace are included in `build:all`.

## Shared design system

`shared/` is the `@talks/shared` package:

- `styles/tokens.css` contains the brand colors, fonts, radius values, and content widths.
- `styles/patterns.css` contains generic patterns: terminal, card, two-column, stat grid, quote, loop, code, item list, infrastructure grid, and warning grid.
- `components/SlideShell.astro` renders the slide number and optional label.
- `components/Navigation.astro` renders the navigation chrome; the deck layout owns its navigation behavior.
- `components/CodeBlock.astro`, `Quote.astro`, and `Terminal.astro` provide reusable semantic UI fragments.

The components extracted to `shared/` are presentation primitives with stable APIs across decks. `Mountains.astro`, `Stars.astro`, `LoopDiagram.astro`, `InfraGrid.astro`, `StepList.astro`, `WarnGrid.astro`, and `Card.astro` remain in PunaTech because they are either tied to that deck's content/animation implementation or use its former Tailwind markup API. The shared `.card` pattern covers the reusable visual primitive without carrying that coupling forward.

## PunaTech deck

`charlas/punatech-2026/src/pages/index.astro` is the canonical slide sequence. Every slide remains a `.slide` element, and `SlideLayout.astro` owns keyboard, touch, dots, progress, GSAP transitions, particles, and Mermaid initialization. Do not reorder or rewrite slide content while extracting infrastructure.

`src/styles/global.css` imports shared tokens and patterns first. It contains only PunaTech layout and slide-specific blocks, which must stay labeled with comments such as `/* ══ SLIDE 08 — ANATOMY JSPLUMB ══ */`.

## Deployment

`.github/workflows/deploy.yml` runs `scripts/build-all.sh`. That script reads only the explicit root workspaces, builds each `charlas/<slug>`, copies its `dist/` into `site/<slug>/`, copies the root landing page, and uploads the complete site to GitHub Pages.
