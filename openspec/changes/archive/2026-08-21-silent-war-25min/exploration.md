# Exploration: silent-war-25min

Reshape `charlas/guerra-silenciosa-ia` from an 11-slide 10-block survey into a 25-minute five-act talk (architecture B, already approved). Recommendation: hybrid 12-slide sequence — reuse cover, close, and the mineral-chain visual; replace the 10-block tour with new act files; copy ledgered graphics into `public/`; add the missing landing card.

## Current State

The deck is an independent Astro 6 workspace (`@talks/guerra-silenciosa-ia`, base `/talks/guerra-silenciosa-ia/`) already listed in root workspaces. It uses `@talks/shared` primitives only: `SlideShell`, `Navigation`, `Quote`. No Tailwind, no tsconfig, no `public/`, no GSAP/touch. `SlideLayout.astro` is keyboard + dots + progress. `html lang="es"`.

Sequence in `src/pages/index.astro` is the 10-block 30–35 min tour compressed to a 20-min map (`brief/adaptacion-20-min.md`):

| File | On-screen idea |
|------|----------------|
| `01-cover.astro` | Badge still says **20 minutos**; `SlideShell` total is wrongly `01` |
| `02-apertura.astro` | ¿Quién controlará la IA? |
| `03-cadena-material.astro` | 7-step mineral→apps loop (full slide) |
| `04-chips.astro` | Diseño / equipos / fabricación / acceso |
| `05-actores.astro` | EE. UU. / China / Taiwán / Europa cards |
| `06-nube-fisica.astro` | Territorio / energía / agua / infraestructura |
| `07-empresas-estados.astro` | Empresas ↔ Estados |
| `08-america-latina.astro` | Talento / energía / datos / universidades / aplicaciones |
| `09-tres-futuros.astro` | Hegemonía / bloques / distribución (full chapter) |
| `10-interaccion.astro` | Parked Q&A-style participation |
| `11-cierre.astro` | Quote close |

Copy is conceptual (no on-slide figures), which matches the brief editorial rule. CSS in `src/styles/global.css` imports shared tokens/patterns then labeled slide blocks. There is a `max-width: 768px` block and **no** `@media (max-height: 760px)` — unlike punatech and agents-at-work. Projection-safe 1280×720 is documented in README but not implemented for this deck.

Research lives in `brief/`. Architecture B is **not** in those files: INDEX, dossier, and `slides-charla.md` still describe 10 blocks / 33 min. `estudio-01` supplies the five-act content (Stanford paradox, open vs closed as state policy, vocabulary, DeepSeek/Qwen, chips-as-valve, LATAM right of exit). Graphics already exist at `brief/assets/estudio-01/paradoja-eeuu-china-2026.{png,svg}` and `mapa-guerra-fria-ia.{png,svg}` (1600×900, Spanish, sources baked in at 11px). They are **not** served: Astro only publishes `public/`.

`citation-ledger.json` is a 24-entry URL list (Stanford [2][20][21][22], White House [3], BIS [4][23][24], OSI [7][8], DeepSeek [10], Qwen [11][19], USCC [14], etc.). It is not a claim ledger. **SpaceXAI / Colossus are absent.** TSMC appears once as a caution in estudio-01; ASML is unnamed (Netherlands machinery). Landing `index.html` lists punatech-2026 and agents-at-work only; `site/` likewise omits this slug.

Pattern to copy for graphics (do not migrate animation): punatech `02-context.astro` uses `import.meta.env.BASE_URL` + `<figure>` + deck-local `max-height` CSS.

## Affected Areas

- `charlas/guerra-silenciosa-ia/src/pages/index.astro` — new import order and five-act sequence
- `charlas/guerra-silenciosa-ia/src/slides/*.astro` — replace 10-block files; reuse cover + close; optional chain flash
- `charlas/guerra-silenciosa-ia/src/styles/global.css` — drop old labeled blocks; add graphic/figure CSS and `@media (max-height: 760px)`
- `charlas/guerra-silenciosa-ia/src/layouts/SlideLayout.astro` — title stays; nav auto-counts `.slide`; no GSAP/touch
- `charlas/guerra-silenciosa-ia/public/estudio-01/` — **new**; copy SVG (and PNG fallback) from `brief/assets/`
- `index.html` — add landing card (README: add card when a talk is ready)
- `brief/citation-ledger.json` — claim-to-source map for any on-screen number; no SpaceXAI until sourced
- `brief/` timing docs — add a 25-min map; do not rewrite historical 20/33-min files as if they were the live spine
- `@talks/shared` — **no API change**. Reuse `SlideShell`, `Navigation`, `Quote`, `.card`, `.loop`, `.ilist`
- Root `package.json` / `astro.config.mjs` / CI — already wired; `build:all` will pick the deck up

## Approaches

1. **Rewrite in place (keep 11 files)** — Squeeze five acts into the current 01–11 slots.
   - Pros: smallest diff; SlideShell totals stay 11; less file churn.
   - Cons: filenames still say cadena/chips/actores/nube; Act 2 (7 min of doctrine + set-pieces) cannot fit two leftover slots; three-futures stays a peer of LATAM; debate stays a parked slide; fights the required cuts.
   - Effort: Medium (content) but High editorial risk.

2. **Greenfield 12–14 act files** — Delete all current slides; write a new set; rewire `index.astro`.
   - Pros: filesystem matches the spine; no leftover 10-block names.
   - Cons: throws away working cover/close/chain markup and CSS; larger review diff; more 1280×720 re-risk on chrome that already fits.
   - Effort: High.

3. **Hybrid (recommended)** — New act files for Acts 1–3; rewrite LATAM/debate/futures; reuse cover, close, and the chain visual as a 20s inset (or optional flash). Copy graphics to `public/`. Add landing card.
   - Pros: spine is visible in filenames; reuses proven shells; Carlos can cut optional scenes without a rewrite; shared package untouched.
   - Cons: more files than today (12 vs 11); must delete orphans so they cannot be re-imported; graphic slides need new CSS.
   - Effort: Medium.

## Recommendation

**Approach 3, 12 slides.** Architecture B is locked; this is how to implement it in this repo.

| # | File | Act | Clock | What |
|--:|------|-----|-------|------|
| 1 | `01-cover.astro` | — | 0:00–0:20 | Reuse; badge **25 minutos**; fix `total` |
| 2 | `02-voto.astro` | 1 | 0:20–2:00 | Opening vote: EE. UU. / China / empresas / bloques |
| 3 | `03-paradoja.astro` | 1 | 2:00–4:00 | Stanford graphic as hero; visible caption [20][21][22] |
| 4 | `04-doctrinas.astro` | 2 | 4:00–7:00 | Two doctrines + vocab API / open-weight / OSI; pulse: abierto vs API |
| 5 | `05-piezas.astro` | 2 | 7:00–11:00 | DeepSeek · Qwen · US stack export as **state/company web**, not product pitch. SpaceXAI/Colossus **off-slide** until ledgered |
| 6 | `06-mapa.astro` | 3 | 11:00–14:00 | `mapa-guerra-fria-ia` hero; caption [2][3][4][5][14][20] |
| 7 | `07-cuellos.astro` | 3 | 14:00–17:00 | Three bottlenecks: chips as valve, cloud as territory, TSMC/ASML as third actors; mineral chain = 20s `.loop` inset |
| 8 | `08-latam.astro` | 4 | 17:00–22:00 | Right of exit + realistic layers; pulse: ¿qué capa? |
| 9 | `09-debate.astro` | 5 | 22:00–24:20 | Debate + closing vote (not Q&A-only) |
| 10 | `10-futuros.astro` | 5 | ~40s | Hegemonía / bloques / distribución as a beat, not a chapter |
| 11 | `11-cierre.astro` | 5 | close | Reuse Quote |
| — | (optional 13th) | 3 | 20s | Dedicated chain flash if unbundled |

**Graphics:** copy SVG to `public/estudio-01/`; keep `brief/assets/` as research originals. Serve with `import.meta.env.BASE_URL`. Treat each graphic as the slide (no competing `h2` that duplicates the SVG title). SVG source lines are 11px on a 1600×900 artboard — unreadable at 1280×720 — so add a deck caption in Exo 2 / JetBrains Mono. Add `@media (max-height: 760px)` in **this** deck's `global.css` (punatech pattern: `max-height: 58vh` on the img).

**Tone:** on-screen Spanish (Rioplatense). Do not use the estudio-01 sales hook. Use countries-and-power wording (bottlenecks, stack export, diffusion, right of exit).

**Numbers:** only ledgered figures on slides. Paradox SVG already carries 59 vs 35 [20], US$285.9B vs US$12.4B [22], Elo 1503 vs 1464 / 2.7% [21]. TSMC/ASML stay namable without figures. SpaceXAI/Colossus stay off-slide until ledgered.

**Scene control:** MUST = cover 25 min, opening vote, paradox graphic, doctrines+vocab, DeepSeek/Qwen web, map, three bottlenecks, LATAM exit right, woven debate, 40s futures, close. OPTIONAL = dedicated chain flash, naming TSMC/ASML vs generic equipos/fábrica, any later SpaceXAI slide after ledgering.

**Landing + brief:** add the talks card now. Add `brief/adaptacion-25-min.md` as the live map; leave `adaptacion-20-min.md` and the 33-min dossier as historical.

**Shared:** no change. **SlideLayout:** keep keyboard/dots; do not port GSAP/particles/touch.

**Review budget:** likely High vs 400 authored lines (new slides + graphic CSS + landing + brief map). `delivery_strategy=ask-on-risk`; sdd-tasks must forecast chained PRs (structure/landing → Acts 1–2 + paradox → Acts 3–5 + map/projection).

## Risks

- 1600×900 dense SVGs overflow 1280×720, especially with 8vw padding and SlideShell chrome; map labels are 12–15px.
- Dual titles (slide `h2` + graphic title) waste vertical space; graphic-as-hero is required.
- SpaceXAI/Colossus named in the approved spine but unledgered — putting claims on-slide would break the no-improvised-figures rule.
- `citation-ledger.json` lists URLs, not claims; graphic numbers need an explicit claim map.
- TSMC/ASML have no dedicated sources; names without figures only.
- Brief/INDEX still describe 10 blocks / 20 or 33 min; without a 25-min map, speakers will follow the old tour.
- Cover still says 20 minutes; landing omits the deck — easy to ship the wrong duration/URL.
- Orphaned old slide files if not deleted after rewire.
- No test runner; verification is `astro build` + headless 1280×720 `getBoundingClientRect`.
- 400-line review budget likely exceeded in a single PR.

## Ready for Proposal

Yes. Architecture B is not reopened. Proposal should lock the 12-slide hybrid sequence, graphic-as-hero + `public/` copy, SpaceXAI treatment, landing card, 25-min brief map, shared-package freeze, and the 400-line delivery split.
