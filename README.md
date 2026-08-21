# Talks

Astro monorepo for La Zuricata's technical presentation decks. Every talk is a standalone Astro project under `charlas/<slug>/` that shares the brand design system through `@talks/shared`.

Published site: <https://cardugarte.github.io/talks/> — landing at `/talks/`, each deck at `/talks/<slug>/`.

## Quick path

```sh
bun install
bun run dev:punatech        # dev server for a specific deck
bun run build:all           # build every deck + assemble site/
```

## How we work on presentations

### 1. Create a talk

```sh
bun run new:talk -- mi-charla
bun install
bun run --cwd charlas/mi-charla dev
```

The scaffold creates a minimal Astro deck with `base: /talks/mi-charla/` and registers it in the explicit root workspaces list. Then build the deck: slides in `src/slides/0X-*.astro`, sequenced in `src/pages/index.astro`.

### 2. Develop

Run the deck locally (`bun run --cwd charlas/<slug> dev`), write slides using the shared design system. When a talk is ready, add its card to the root `index.html` landing page.

### 3. Verify before publishing

```sh
bun run --cwd charlas/<slug> build
bun run --cwd charlas/<slug> preview --host 127.0.0.1 --port 4321
```

The deck must be **projection-safe**: at 1280×720 no slide content may overflow the viewport (check with a headless browser measuring `getBoundingClientRect` against the viewport). If a slide overflows, tighten it with a `@media (max-height: 760px)` block in the deck's `global.css` — never by removing content.

### 4. Publish

Push to `main`. GitHub Actions builds every `charlas/*` workspace declared in `package.json`, copies each `dist/` into `site/<slug>/`, and deploys `site/` with GitHub Pages artifact actions (workflow deployment source; no `gh-pages` branch).

## Design system conventions

| Path | Responsibility |
|------|----------------|
| `shared/` | Brand tokens (`styles/tokens.css`), reusable CSS patterns (`styles/patterns.css`), generic UI components (`SlideShell`, `Navigation`, `CodeBlock`, `Quote`, `Terminal`) |
| `charlas/<slug>/` | Independent Astro deck: slide content, talk-specific components, talk-specific CSS |
| `scripts/` | Workspace-aware build (`build-all.sh`) and talk scaffolding (`nueva-charla.sh`) |
| `index.html` | Static landing page for published talks |

Golden rules:

- **`shared/` only holds presentation primitives with stable APIs.** Components tied to a deck's content, animation, or markup API stay in the deck.
- **Migrations and refactors preserve design.** When migrating a deck into the monorepo, swap in shared components only when the rendered result is equivalent. No "improvements", no scope creep — the punatech-2026 cover was broken by exactly this (a compact typing cursor replaced with the taller shared `Terminal`). When in doubt, keep the deck's local version.
- Deck-specific CSS stays in the deck's `global.css`, imported after shared tokens/patterns, in labeled blocks (`/* ══ SLIDE N — NAME ══ */`).

## Repo hygiene

- **GitHub is the source of truth.** Local clones of historical repos (e.g. the old `openclaw-workshop` clone that held `agents-at-work`) are disposable once the deck lives here — delete them; nothing is lost.
- **Never store credentials in git remote URLs.** Use `gh auth` or SSH. A `gho_*` token embedded in a remote URL was found and removed with its repo; revoke any token that may have leaked.
- **Historical repos keep serving old URLs.** `cardugarte/punatech-2026` and `cardugarte/openclaw-workshop` remain online for backward-compatible links; new work happens only in this repo.