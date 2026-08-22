# Guerra Silenciosa Five-Act Deck Specification

## Purpose

`charlas/guerra-silenciosa-ia` MUST ship as a 25-minute five-act Spanish (Rioplatense) talk: US–China silent war; open vs closed as one weapon, not the only front. A 12th slide MUST NOT be added to satisfy the proposal label.

## Requirements

### Requirement: Locked five-act sequence

The deck MUST publish exactly these 11 slides in order and reuse cover and close. Leftover 10-block files MUST NOT stay imported. A chain-flash slide MUST NOT exist. SlideShell MUST number 01–11 with total 11. Acts: 1 voto+paradoja; 2 doctrinas+piezas; 3 mapa+cuellos; 4 latam; 5 debate+futuros+cierre.

| # | Slide | MUST show |
|--:|-------|-----------|
| 1 | `01-cover` | **25 minutos** |
| 2 | `02-voto` | Vote EE. UU. / China / empresas / bloques |
| 3 | `03-paradoja` | Paradox hero + caption |
| 4 | `04-doctrinas` | Doctrines; API / open-weight / OSI |
| 5 | `05-piezas` | DeepSeek, Qwen, US stack export as state/company web |
| 6 | `06-mapa` | Map hero + caption |
| 7 | `07-cuellos` | Three bottlenecks; chain ~20s inset only |
| 8 | `08-latam` | Right of exit + layers |
| 9 | `09-debate` | Debate + closing vote, not Q&A-only |
| 10 | `10-futuros` | Hegemonía / bloques / distribución, short beat |
| 11 | `11-cierre` | Existing Quote close |

#### Scenario: Spine matches the lock

- GIVEN production preview
- WHEN `.slide` nodes are listed in order
- THEN they match this table, the cover shows `25 minutos`, and every SlideShell total is `11`

#### Scenario: Orphans and extra flashes are absent

- GIVEN the rewired deck
- WHEN 10-block files (`02-apertura`–`10-interaccion`) or a 12th/13th slide are sought
- THEN those files are not imported and no extra `.slide` exists

### Requirement: Graphic heroes stay in frame

Paradox and map MUST be published with the deck as SVG and PNG. Each MUST be the slide hero, MUST NOT share a heading that repeats the graphic title, and MUST have a readable deck caption. No slide MUST overflow at 1280×720.

#### Scenario: Heroes visible and bounded

- GIVEN preview at 1280×720
- WHEN `03-paradoja` and `06-mapa` are shown
- THEN each graphic dominates, captions avoid in-SVG 11px type, and nothing overflows 1280×720

#### Scenario: Missing assets or dual titles fail

- GIVEN the production build
- WHEN paradox and map URLs are requested
- THEN SVG and PNG succeed and neither hero duplicates the graphic title in a heading

### Requirement: Editorial fidelity

Every on-screen numeral MUST match a claim-to-source ledger entry. SpaceXAI MAY be named in the `05-piezas` cast. Colossus, GPU-count, Memphis, and lease figures MUST NOT appear. Tone MUST be countries-and-power, not consumer-sales. On-screen copy MUST be Spanish.

#### Scenario: Ledgered numbers and allowed name

- GIVEN the claim-to-source ledger and preview
- WHEN numerals and `05-piezas` are checked
- THEN each numeral equals a ledgered claim and SpaceXAI appears only as a name if present

#### Scenario: Forbidden figures and sales copy

- GIVEN every published slide
- WHEN Colossus/GPU/Memphis/lease figures, unledgered numerals, or consumer-sales hooks are sought
- THEN none appear on-screen

### Requirement: Live map and landing card

Root landing MUST include a card href `/talks/guerra-silenciosa-ia/`. `brief/adaptacion-25-min.md` MUST be the live 25-minute map of this sequence (chain ~20s inset; futures a short beat). `adaptacion-20-min.md` and the 33-min dossier MUST remain historical.

#### Scenario: Talk is listed and mapped

- GIVEN root `index.html` and `brief/adaptacion-25-min.md`
- WHEN both are read
- THEN the card href is `/talks/guerra-silenciosa-ia/` and the brief maps the locked 11-slide 25-minute sequence

#### Scenario: Historical briefs are not the spine

- GIVEN `adaptacion-20-min.md` and the 33-min dossier
- WHEN compared to the live map
- THEN they still describe the old 20/33-minute tours and are not the live spine

### Requirement: Frozen chrome and green build

`@talks/shared` MUST be unchanged. Keyboard and dots MUST remain. This change MUST NOT add GSAP, touch, particles, Tailwind, or a deck `tsconfig`. Document language MUST remain `es`. `bun run build:all` MUST succeed.

#### Scenario: Build publishes the Spanish deck

- GIVEN the repository after the change
- WHEN `bun run build:all` runs
- THEN it succeeds and the deck `html` lang is `es`

#### Scenario: Shared package and excluded stack stay out

- GIVEN the change diff
- WHEN `shared/` and this deck’s tooling are inspected
- THEN `@talks/shared` is untouched and GSAP, touch, particles, Tailwind, and a new `tsconfig` are absent
