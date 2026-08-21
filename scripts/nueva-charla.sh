#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  printf 'Usage: %s <slug>\n' "$0" >&2
  exit 1
fi

slug="$1"
if [[ ! "$slug" =~ ^[a-z0-9]+([a-z0-9-]*[a-z0-9])?$ ]]; then
  printf 'Invalid slug: use lowercase letters, numbers, and hyphens.\n' >&2
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="$ROOT_DIR/charlas/$slug"

if [ -e "$TARGET" ]; then
  printf 'Talk already exists: %s\n' "$TARGET" >&2
  exit 1
fi

mkdir -p "$TARGET/src/layouts" "$TARGET/src/pages" "$TARGET/src/slides" "$TARGET/src/styles"

cat > "$TARGET/package.json" <<'EOF'
{
  "name": "@talks/__SLUG__",
  "private": true,
  "type": "module",
  "version": "0.1.0",
  "scripts": {
    "dev": "astro dev",
    "build": "astro build",
    "preview": "astro preview",
    "astro": "astro"
  },
  "dependencies": {
    "@talks/shared": "file:../../shared",
    "astro": "^6.1.2"
  }
}
EOF

cat > "$TARGET/astro.config.mjs" <<'EOF'
import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://cardugarte.github.io',
  base: '/talks/__SLUG__/',
});
EOF

cat > "$TARGET/src/layouts/SlideLayout.astro" <<'EOF'
---
import Navigation from '@talks/shared/components/Navigation.astro';
import '../styles/global.css';
---
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>__SLUG__</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=JetBrains+Mono:wght@300;400;700&family=Exo+2:wght@300;400;600;700&display=swap" rel="stylesheet" />
  </head>
  <body>
    <div id="deck"><slot /></div>
    <Navigation />

    <script>
      const slides = Array.from(document.querySelectorAll('.slide'));
      const dots = document.getElementById('nav');
      const progress = document.getElementById('progress');
      let current = 0;

      slides.forEach((slide, index) => {
        const dot = document.createElement('button');
        dot.className = `ndot${index === 0 ? ' active' : ''}`;
        dot.type = 'button';
        dot.ariaLabel = `Slide ${index + 1}`;
        dot.addEventListener('click', () => goTo(index));
        dots?.appendChild(dot);
      });

      function update() {
        slides.forEach((slide, index) => slide.classList.toggle('active', index === current));
        document.querySelectorAll('.ndot').forEach((dot, index) => dot.classList.toggle('active', index === current));
        if (progress) progress.style.width = `${((current + 1) / slides.length) * 100}%`;
      }

      function goTo(index) {
        if (index < 0 || index >= slides.length) return;
        current = index;
        update();
      }

      document.addEventListener('keydown', (event) => {
        if (event.key === 'ArrowRight' || event.key === ' ') { event.preventDefault(); goTo(current + 1); }
        if (event.key === 'ArrowLeft') { event.preventDefault(); goTo(current - 1); }
      });

      update();
    </script>
  </body>
</html>
EOF

cat > "$TARGET/src/pages/index.astro" <<'EOF'
---
import SlideLayout from '../layouts/SlideLayout.astro';
import Cover from '../slides/01-cover.astro';
---
<SlideLayout>
  <Cover />
</SlideLayout>
EOF

cat > "$TARGET/src/slides/01-cover.astro" <<'EOF'
---
import SlideShell from '@talks/shared/components/SlideShell.astro';
---
<div class="slide">
  <SlideShell number="01" total="01" label="Cover" />
  <h1 class="title"><em>__SLUG__</em></h1>
  <p class="body">Replace this slide with the talk opening.</p>
</div>
EOF

cat > "$TARGET/src/styles/global.css" <<'EOF'
@import '@talks/shared/styles/tokens.css';
@import '@talks/shared/styles/patterns.css';

* { box-sizing: border-box; }
html, body { margin: 0; width: 100%; height: 100%; overflow: hidden; background: var(--bg); color: var(--text); }
body { font-family: var(--font-b); }
#deck { position: relative; width: 100%; height: 100%; }
.slide { position: absolute; inset: 0; display: flex; flex-direction: column; align-items: center; justify-content: center; padding: 8vw; text-align: center; opacity: 0; pointer-events: none; transition: opacity 0.35s ease; }
.slide.active { opacity: 1; pointer-events: auto; }
.slide-num { position: absolute; top: 28px; right: 40px; font-family: var(--font-m); color: var(--muted); }
.lbl { margin-bottom: 16px; color: var(--green); font-family: var(--font-m); letter-spacing: 0.2em; text-transform: uppercase; }
.title { margin: 0 0 24px; font-family: var(--font-d); text-transform: uppercase; }
.title em { color: var(--green); font-style: normal; }
.body { max-width: 60ch; font-size: 1.25rem; line-height: 1.6; color: #a8c8b8; }
#progress { position: fixed; top: 0; left: 0; height: 2px; z-index: 10; background: linear-gradient(to right, var(--green), var(--purple)); }
#nav { position: fixed; bottom: 28px; left: 50%; z-index: 10; display: flex; gap: 7px; transform: translateX(-50%); }
.ndot { width: 6px; height: 6px; padding: 0; border: 1px solid var(--muted); border-radius: 50%; background: var(--stone); cursor: pointer; }
.ndot.active { border-color: var(--green); background: var(--green); box-shadow: 0 0 6px var(--green); transform: scale(1.5); }
#hint { position: fixed; right: 40px; bottom: 20px; color: var(--muted); font-family: var(--font-m); font-size: 0.7rem; }
EOF

SLUG="$slug" bun -e '
  const slug = process.env.SLUG;
  const root = `${process.cwd()}/charlas/${slug}`;
  const files = ["package.json", "astro.config.mjs", "src/layouts/SlideLayout.astro", "src/pages/index.astro", "src/slides/01-cover.astro", "src/styles/global.css"];
  for (const file of files) {
    const path = `${root}/${file}`;
    const content = await Bun.file(path).text();
    await Bun.write(path, content.replaceAll("__SLUG__", slug));
  }
  const packagePath = `${process.cwd()}/package.json`;
  const pkg = await Bun.file(packagePath).json();
  const workspace = `charlas/${slug}`;
  if (!pkg.workspaces.includes(workspace)) pkg.workspaces.push(workspace);
  await Bun.write(packagePath, `${JSON.stringify(pkg, null, 2)}\n`);
'
