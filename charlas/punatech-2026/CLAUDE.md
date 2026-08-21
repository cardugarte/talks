# PunaTech 2026 deck guide

This is the PunaTech 2026 single-route Astro deck inside the Talks monorepo. Run commands from the monorepo root with Bun whenever possible.

## Commands

```sh
bun run --cwd charlas/punatech-2026 dev
bun run --cwd charlas/punatech-2026 build
bun run --cwd charlas/punatech-2026 preview
```

## Architecture

All 19 slides are imported and sequenced in `src/pages/index.astro`, then rendered inside `src/layouts/SlideLayout.astro`. The deck has no client-side framework. The layout owns the HTML shell, Google Fonts, background visuals, Mermaid, particles, GSAP transitions, keyboard navigation, touch navigation, dots, and progress bar.

Every slide must remain a `.slide` element. Use `SlideShell` from `@talks/shared` for the number and optional label. Keep slide order and content unchanged when working on shared infrastructure.

## Styling

`src/styles/global.css` imports `@talks/shared/styles/tokens.css` and `@talks/shared/styles/patterns.css` first. It then contains only PunaTech layout and slide-specific CSS. Add new content styles at the bottom with a labeled block comment such as `/* ══ SLIDE N — NAME ══ */`.

The shared components used here are `SlideShell`, `Navigation`, `CodeBlock`, `Quote`, and `Terminal`. PunaTech-only components remain in `src/components/` when their markup or animation is tied to this deck.

## Assets and base path

Static assets live in `public/`. Use `import.meta.env.BASE_URL` when building asset URLs. The production base is `/talks/punatech-2026/`, matching the monorepo deploy layout.
