# Design: silent-war-25min

## Technical Approach

Hybrid in-place rewrite of `@talks/guerra-silenciosa-ia` (already in `build:all`, `base: /talks/guerra-silenciosa-ia/`). Keep `SlideLayout.astro` (keys, dots, progress; counts `.slide`). Freeze `@talks/shared`. New acts; reuse cover + close; chain as a 20s `.loop` inset on `07-cuellos.astro`. Copy estudio-01 SVG/PNG to `public/`; serve with `BASE_URL`. Deck-local `.hero-figure` and `@media (max-height: 760px)` for 1280×720. Landing card + `brief/adaptacion-25-min.md`. Spec absent; implements `guerra-silenciosa-five-act-deck`.

One `.slide` per named file, `total="11"`. Rioplatense copy; ledgered numbers only. Reuse `SlideShell`, `Navigation`, `Quote`, `.card`, `.loop`, `.ilist`. No Tailwind, tsconfig, GSAP, touch, or particles.

## Architecture Decisions

| Decision | Options | Tradeoff | Choice |
|----------|---------|----------|--------|
| Spine | Squeeze / greenfield / hybrid | Squeeze lies in filenames; greenfield dumps working chrome | **Hybrid.** New acts; reuse `01-cover` + `11-cierre`; delete orphans after rewire |
| Count | 12 (chain flash) / 11 named | Proposal says “12-slide”; locked list is 11; 13th flash is out of scope | **11 `.slide`s.** “12” leftover from rejected chain flash |
| Graphics | Edit SVG / JPEG / copy SVG+PNG | 11px SVG sources; dual titles waste height | **Byte-copy** to `public/estudio-01/`. `<img>` → SVG; PNG served, not default. **No `h2`.** `<figcaption>` in Exo 2 / JetBrains Mono |
| Chain | Flash / drop / inset | Flash blows the 25-min clock | **Inset on `07-cuellos`** (markup from `03-cadena-material`) |
| SpaceXAI | Figures / omit / name | Figures unledgered | **Name only** on `05-piezas`. No Colossus/GPU/Memphis/lease numbers |
| Shared | Port GSAP / restyle / freeze | APIs already match | **Freeze `@talks/shared`** |
| Projection | Shared CSS / this deck | punatech `58vh` is local | **Deck-local** `@media (max-height: 760px)`: padding 8vw → 3–4vw; `.hero-figure img { max-height: 58vh; max-width: min(1180px, 94vw) }` |
| Ledger | URL list / new file / extend | SVGs already bake figures | **Extend** `citation-ledger.json` with `claims[]` |
| Nav | Port GSAP | Out of scope | **`SlideLayout.astro` unchanged** |

## Data Flow

```
brief/assets/estudio-01/* --copy--> public/estudio-01/*.{svg,png}
claims[] --> on-slide figures + captions only
Astro (BASE_URL=/talks/guerra-silenciosa-ia/) --> dist/ --> site/<slug>/
index.astro --> SlideLayout counts .slide --> keys / dots / progress
03-paradoja + 06-mapa: img = BASE_URL + estudio-01/*.svg
```

Clock lives in `brief/adaptacion-25-min.md`, not JS.

## File Changes

| File | Action | Description |
|------|--------|-------------|
| `src/pages/index.astro` | Modify | Cover → Voto → Paradoja → Doctrinas → Piezas → Mapa → Cuellos → Latam → Debate → Futuros → Cierre |
| `src/slides/01-cover.astro` | Modify | Badge **25 minutos**; `total="11"` |
| `src/slides/02-voto.astro` | Create | EE. UU. / China / empresas / bloques |
| `src/slides/03-paradoja.astro` | Create | Hero SVG + caption [20][21][22] |
| `src/slides/04-doctrinas.astro` | Create | Doctrines + API / open-weight / OSI |
| `src/slides/05-piezas.astro` | Create | DeepSeek · Qwen · US stack; SpaceXAI name-only |
| `src/slides/06-mapa.astro` | Create | Hero map + caption [2][3][4][5][14][20] |
| `src/slides/07-cuellos.astro` | Create | Three bottleneck cards + chain inset |
| `src/slides/08-latam.astro` | Create | Right of exit + layers |
| `src/slides/09-debate.astro` | Create | Debate + closing vote |
| `src/slides/10-futuros.astro` | Create | Hegemonía / bloques / distribución beat |
| `src/slides/11-cierre.astro` | Modify | Keep `Quote`; `total="11"` |
| `02-apertura` … `10-interaccion` | Delete | Nine 10-block orphans |
| `src/styles/global.css` | Modify | Drop orphan blocks; keep `.content-slide` `.chain` `.future-grid` `.final-quote`; add `.hero-figure` `.hero-caption` compact `.chain` + projection media |
| `src/layouts/SlideLayout.astro` | Unchanged | Keyboard + dots |
| `public/estudio-01/*` | Create | Four byte-copies from `brief/assets/estudio-01/` |
| `brief/adaptacion-25-min.md` | Create | Live 25-min map |
| `brief/citation-ledger.json` | Modify | Add `claims[]` |
| `brief/INDEX.md` | Modify | One-line pointer to 25-min map; leave 33-min table |
| `index.html` | Modify | Third `.talk` → `/talks/guerra-silenciosa-ia/` |
| `astro.config.mjs`, root `package.json`, `@talks/shared` | Unchanged | Already wired / frozen |

## Interfaces / Contracts

**SlideShell:** zero-padded `number`, `total="11"`, short `label` (no SVG title repeat).

**Asset URL** (punatech slash-collapse):

```astro
const asset = (f) => `${import.meta.env.BASE_URL}estudio-01/${f}`.replace(/\/+/g, '/');
```

**Hero** (one `.slide` root, no `h2`):

```html
<figure class="hero-figure">
  <img src={asset('….svg')} alt="…Spanish description…" />
  <figcaption class="hero-caption">…sources…</figcaption>
</figure>
```

**Ledger** `version: 2` keeps `sources[]`. Add `"claims": [{ "id", "text", "source_ids", "on_slide" }]`. SVG-baked 59 vs 35 [20], US$285.9B vs US$12.4B [22], Elo 1503 vs 1464 / 2.7% [21] MUST be claimed before ship.

## Testing Strategy

| Layer | What | Approach |
|-------|------|----------|
| Unit | N/A | No runner |
| Integration | Build; 11 dots; `BASE_URL` images | `bun run --cwd charlas/guerra-silenciosa-ia build` + `preview` |
| Projection | 1280×720 no overflow; cover 25 min; landing href; no 13th slide; no unledgered SpaceXAI figures | `getBoundingClientRect`; `bun run build:all` |

## Threat Matrix

N/A — no routing, shell, subprocess, VCS/PR automation, executable-file classification, or process-integration boundary. Static slides, copied public assets, one landing `<a href>`.

## Migration / Rollout

No data migration. Delete nine orphans after `index.astro` drops them. 20/33-min briefs stay. Rollback = revert branch. Diff likely High vs 400 lines; `sdd-tasks` MUST forecast chained PRs under `ask-on-risk` (structure/landing → Acts 1–2 + paradox → Acts 3–5 + map/projection).

## Open Questions

- [x] 11 vs 12 slides — 11 named files.
- [ ] Spec absent; RFC 2119 copy may refine wording, not this architecture.
