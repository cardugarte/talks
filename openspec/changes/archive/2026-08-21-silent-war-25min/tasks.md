# Tasks: silent-war-25min

## Review Workload Forecast

| Field | Value |
|-------|-------|
| Estimated changed lines | 750–1100 authored; SVG/PNG copies extra |
| 400-line budget risk | High |
| Chained PRs recommended | Yes |
| Suggested split | PR 1 structure/landing → PR 2 Acts 1–2 + paradox → PR 3 Acts 3–5 + map/projection |
| Delivery strategy | ask-on-risk |
| Chain strategy | feature-branch-chain |

Decision needed before apply: Yes
Chained PRs recommended: Yes
Chain strategy: feature-branch-chain
400-line budget risk: High

### Suggested Work Units

| Unit | Goal | Likely PR | Focused test command | Runtime harness | Rollback boundary |
|------|------|-----------|----------------------|-----------------|-------------------|
| 1 | Assets, ledger, 25-min map, landing, cover, hero CSS | PR 1 | `bun run --cwd charlas/guerra-silenciosa-ia build` | Preview deck; open root landing card | `public/estudio-01/`, brief map/ledger/INDEX, `index.html`, `01-cover.astro`, additive CSS |
| 2 | Acts 1–2 + paradox; drop apertura/chips/actores | PR 2 | `bun run --cwd charlas/guerra-silenciosa-ia build` | Preview 1280×720 slides 02–05 | `02-voto.astro`–`05-piezas.astro`, `index.astro`, `02-apertura.astro`, `04-chips.astro`, `05-actores.astro` |
| 3 | Acts 3–5 + map, chain inset, CSS cleanup | PR 3 | `bun run build:all` | Preview 1280×720 slides 06–11; 11 dots; no overflow | `06-mapa.astro`–`10-futuros.astro`, leftover 10-block files, `index.astro`, `global.css` |

Prefer feature-branch-chain. Deck root: `charlas/guerra-silenciosa-ia/`. Spec: landing 1.3–1.5; heroes 1.1/1.6/2.2/3.1; editorial 1.2/2.4; sequence 2–3; chrome 1.7/4.

## Phase 1: Structure and landing

- [x] 1.1 Byte-copy `brief/assets/estudio-01/{paradoja-eeuu-china-2026,mapa-guerra-fria-ia}.{svg,png}` to `public/estudio-01/`.
- [x] 1.2 `brief/citation-ledger.json` `version` 2; `claims[]` `{id,text,source_ids,on_slide}` for 59 vs 35 [20], US$285.9B vs US$12.4B [22], Elo 1503 vs 1464 / 2.7% [21].
- [x] 1.3 Add `brief/adaptacion-25-min.md` (11-slide 25-min clock; chain ~20s; futuros short) and one `brief/INDEX.md` pointer; keep 20/33-min briefs historical.
- [x] 1.4 Root `index.html`: third `.talk` href `/talks/guerra-silenciosa-ia/`.
- [x] 1.5 `src/slides/01-cover.astro`: badge **25 minutos**; `SlideShell total="11"`.
- [x] 1.6 `src/styles/global.css`: `.hero-figure` `.hero-caption` compact `.chain`; `@media (max-height: 760px)` padding 3–4vw; `img { max-height: 58vh; max-width: min(1180px, 94vw) }`.
- [x] 1.7 `bun run --cwd charlas/guerra-silenciosa-ia build`. Do not edit `shared/`, `src/layouts/SlideLayout.astro`, `astro.config.mjs`, root `package.json`.

## Phase 2: Acts 1–2 + paradox

- [x] 2.1 Create `src/slides/02-voto.astro` (EE. UU. / China / empresas / bloques; `total="11"`; Spanish).
- [x] 2.2 Create `src/slides/03-paradoja.astro`: hero SVG via `asset()`; Spanish alt; figcaption [20][21][22]; no `h2`.
- [x] 2.3 Create `src/slides/04-doctrinas.astro` (API / open-weight / OSI; `total="11"`).
- [x] 2.4 Create `src/slides/05-piezas.astro` (DeepSeek · Qwen · US stack; SpaceXAI name-only; no Colossus/GPU/Memphis/lease).
- [x] 2.5 `src/pages/index.astro`: Cover → Voto → Paradoja → Doctrinas → Piezas; keep old 06–10 imported until Phase 3.
- [x] 2.6 Delete unimported `src/slides/02-apertura.astro`, `04-chips.astro`, `05-actores.astro`. Leave `03-cadena-material.astro` on disk for 3.2.
- [x] 2.7 Preview 1280×720: paradox in frame; caption readable; numerals match `claims[]`.

## Phase 3: Acts 3–5 + map/projection

- [x] 3.1 Create `src/slides/06-mapa.astro`: map hero SVG; caption [2][3][4][5][14][20]; no `h2`.
- [x] 3.2 Create `src/slides/07-cuellos.astro`: three bottleneck cards + `.loop.chain` inset copied from `03-cadena-material.astro`; no 12th/13th file.
- [x] 3.3 Create `src/slides/08-latam.astro` (right of exit + layers).
- [x] 3.4 Create `src/slides/09-debate.astro` (debate + closing vote, not Q&A-only).
- [x] 3.5 Create `src/slides/10-futuros.astro` (Hegemonía / bloques / distribución; `.future-grid`).
- [x] 3.6 Finish `index.astro`: Mapa → Cuellos → Latam → Debate → Futuros → Cierre; keep Quote on `11-cierre.astro` (`total="11"`).
- [x] 3.7 Delete `03-cadena-material.astro`, `06-nube-fisica.astro`, `07-empresas-estados.astro`, `08-america-latina.astro`, `09-tres-futuros.astro`, `10-interaccion.astro`.
- [x] 3.8 `global.css`: drop `.chip-grid` `.physical-cloud` `.power-balance` `.interaction-core`; keep `.actor-grid` (voto/piezas/debate), `.content-slide` `.chain` `.future-grid` `.final-quote`.

## Phase 4: Verification

- [x] 4.1 Preview: 11 dots; cover 25 min; no extra `.slide`.
- [x] 4.2 1280×720 `getBoundingClientRect` — no overflow on 03 and 06.
- [x] 4.3 `shared/` unchanged; no GSAP, touch, particles, Tailwind, or deck `tsconfig`.
- [x] 4.4 `bun run build:all`.
