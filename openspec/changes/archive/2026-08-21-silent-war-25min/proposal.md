# Proposal: silent-war-25min

## Intent

Reshape `charlas/guerra-silenciosa-ia` into a 25-minute five-act talk (US–China silent war; open vs closed as a weapon, not the only front). Today the spine is a 10-block 20/33-min tour, the cover says 20 minutes, ledgered graphics are unserved, and landing omits the deck.

## Scope

### In Scope
- Hybrid 12-slide sequence: reuse cover + close; new act files; delete orphan 10-block slides
- Copy estudio-01 SVG/PNG to `public/estudio-01/`; graphic-as-hero; 1280×720-safe
- Claim-to-source map; SpaceXAI named in company/state cast only (no Colossus/GPU/Memphis/lease figures)
- Root landing card; live brief `adaptacion-25-min.md`
- Deck-local figure CSS and `@media (max-height: 760px)`

### Out of Scope
- 13th chain-flash (chain stays 20s inset on bottlenecks)
- Shared restyle/API; GSAP/touch/particles; Tailwind/tsconfig
- Rewriting 20/33-min briefs as the live spine
- Later SpaceXAI/Colossus figures until ledgered

## Capabilities

### New Capabilities
- `guerra-silenciosa-five-act-deck`: 12-slide five-act Spanish deck, ledgered graphics, 25-min map, landing card

### Modified Capabilities
- None

## Approach

Hybrid rewrite of the existing Astro 6 workspace (already in `build:all`). New act files; reuse cover/close; chain as `.loop` inset on `07-cuellos.astro`. Serve graphics via `BASE_URL`. Rioplatense Spanish copy; ledgered numbers only. Freeze `@talks/shared`; keep keyboard/dots. Sequence: `01-cover` (25 min) · `02-voto` · `03-paradoja` · `04-doctrinas` · `05-piezas` · `06-mapa` · `07-cuellos` · `08-latam` · `09-debate` · `10-futuros` · `11-cierre`. Diff likely >400 lines; `sdd-tasks` MUST forecast chained PRs under `ask-on-risk` (structure/landing → Acts 1–2 + paradox → Acts 3–5 + map/projection).

## Affected Areas

| Area | Impact | Description |
|------|--------|-------------|
| `charlas/guerra-silenciosa-ia/src/pages/index.astro` | Modified | Five-act imports |
| `charlas/guerra-silenciosa-ia/src/slides/` | Modified | New acts; delete orphans |
| `charlas/guerra-silenciosa-ia/src/styles/global.css` | Modified | Figure + projection CSS |
| `charlas/guerra-silenciosa-ia/public/estudio-01/` | New | Served SVG/PNG |
| `charlas/guerra-silenciosa-ia/brief/` | Modified | 25-min map; claim ledger |
| `index.html` | Modified | Landing card |
| `@talks/shared` | Unchanged | Frozen |

## Risks

| Risk | Likelihood | Mitigation |
|------|------------|------------|
| Dense SVGs overflow 1280×720 | High | Graphic-as-hero; caption; `max-height: 58vh` |
| Unledgered SpaceXAI figures | Med | Name only; no Colossus/GPU/Memphis/lease numbers |
| PR exceeds 400-line budget | High | `sdd-tasks` chained-PR forecast; apply waits on ask-on-risk |
| Orphan slides re-imported | Med | Delete unused files after rewire |

## Rollback Plan

Revert the feature branch or chained PRs. Landing card and `public/` copies revert with them. Historical 20/33-min briefs remain as fallback. Shared package is untouched.

## Dependencies

- `brief/assets/estudio-01/` graphics
- Extend `citation-ledger.json` to claim-to-source before on-screen numbers
- Workspace already in `build:all`
- `delivery_strategy=ask-on-risk`; 400-line review budget

## Success Criteria

- [ ] 12-slide five-act sequence; cover 25 minutos; correct SlideShell totals
- [ ] Paradox and map as heroes with readable captions; no overflow at 1280×720
- [ ] Numbers match the claim ledger; SpaceXAI named without Colossus/GPU/Memphis/lease figures
- [ ] Chain is a 20s bottlenecks inset; no 13th flash
- [ ] Landing lists `/talks/guerra-silenciosa-ia/`; `adaptacion-25-min.md` is the live map
- [ ] `@talks/shared` unchanged; `bun run build:all` succeeds
