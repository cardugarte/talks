# Talks

This repository is the Astro monorepo for La Zuricata's technical presentation decks. Each talk is a standalone Astro project that shares the brand design system through `@talks/shared`.

## Quick path

```sh
bun install
bun run dev:punatech
bun run build:all
```

The published site is assembled in `site/`: the landing page lives at `/talks/` and each deck at `/talks/<slug>/`.

## Add a talk

```sh
bun run new:talk -- mi-charla
bun install
bun run --cwd charlas/mi-charla dev
```

The generator creates the minimum Astro deck, uses `/talks/mi-charla/` as its base path, and adds the new project to the explicit root workspaces list. Add its landing card and publish entry to the deploy workflow when it is ready.

`charlas/agents-at-work/` is intentionally outside the workspaces list. It was moved without changing its contents and is not built by the monorepo.

## Deploy

Push to `main`. GitHub Actions installs the root workspaces, builds every `charlas/*` workspace declared in `package.json`, copies each `dist/` into `site/<slug>/`, and deploys `site/` with GitHub Pages artifact actions.

The repository must use GitHub Pages with the workflow deployment source. No `gh-pages` branch is required.

## Architecture

| Path | Responsibility |
|------|----------------|
| `shared/` | Tokens, reusable CSS patterns, and generic Astro UI components |
| `charlas/<slug>/` | Independent Astro deck, assets, slide content, and talk-specific CSS |
| `scripts/` | Workspace-aware build and talk scaffolding scripts |
| `index.html` | Static landing page for published talks |
