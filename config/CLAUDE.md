# Web Design — Project Rules

These rules apply to every HTML file created in this project.

## Non-negotiable rules
- **No emojis anywhere** — not in copy, not as icons, not as placeholders. Use real logos or CSS shapes.
- **No Bootstrap, Tailwind, or any CSS framework** — pure CSS with custom properties only.
- **No Lorem Ipsum** — all copy must be real, contextually appropriate content for the brand.
- **No external JS libraries** — vanilla JS only.
- **No generic AI-looking UI** — no cards with three bullet points and a blue gradient on every page.
- **Single self-contained HTML files** — no imports, no bundlers, no server required. Open directly in browser.
- Google Fonts `@import` is allowed (it's a stylesheet link, not a framework).

## Purpose
These HTML files replace PowerPoint/slide decks for customer presentations. Each file is a branded experience for a specific company or pitch. The user will describe the purpose; Claude picks components that match whether it's more slide-like (full-viewport sections) or content-heavy (scrolling page).

## Project location
This project lives at `~/Claude Web Design/`. All HTML files should be created inside `projects/` organized by brand:
```
~/Claude Web Design/projects/nvidia/blackwell-overview.html
~/Claude Web Design/projects/disney/streaming-strategy.html
~/Claude Web Design/projects/salesforce/q2-pipeline-review.html
```

Asset paths from inside `projects/[brand]/` use two levels up:
```
../../assets/logos/nvidia/nvidia.png
../../assets/logos/salesforce/Salesforce.png
../../assets/logos/disney/imgi_52_D_Blue-Logo.png
```

## Asset locations

### Logos
```
../../assets/logos/nvidia/nvidia.png           — NVIDIA eye mark (white bg; use mix-blend-mode:screen on dark)
../../assets/logos/salesforce/Salesforce.png   — Salesforce cloud wordmark (works as-is on light bg)
../../assets/logos/disney/imgi_52_D_Blue-Logo.png          — Disney+ wordmark (black on white; invert for dark bg)
../../assets/logos/disney/imgi_37_MARVEL_STUDIOS_LOGO.jpg  — Marvel Studios (red bg; mix-blend-mode:screen)
../../assets/logos/disney/imgi_38_1920-lucasfilm-logo.jpg  — Lucasfilm (black; invert for dark)
../../assets/logos/disney/imgi_36_Pixar-Logo.jpg           — Pixar (black; invert for dark)
../../assets/logos/disney/imgi_35_Walt-Disney-Animation-Studios-Logo.jpg — Disney Animation (black; invert)
../../assets/logos/disney/imgi_51_NG_logo_black.png        — National Geographic (yellow rect; mix-blend-mode:screen)
../../assets/logos/disney/imgi_49_FX-Logo-.png             — FX (black; invert for dark)
../../assets/logos/disney/imgi_50_HuluOriginals_800px.png  — Hulu Originals
../../assets/logos/disney/imgi_57_ESPN_PLUS_LOGO-1.png     — ESPN+
../../assets/logos/disney/The Walt Disney Company.svg      — Walt Disney Company corporate mark
../../assets/logos/aws.png         — AWS
../../assets/logos/Slack.png       — Slack
../../assets/logos/mulesoft.png    — MuleSoft
../../assets/logos/claude.svg      — Claude / Anthropic
../../assets/logos/cursor.webp     — Cursor
../../assets/logos/ChatGPT.png     — ChatGPT / OpenAI
../../assets/logos/GCP small.avif  — Google Cloud
```

Absolute paths for reference: `~/Claude Web Design/assets/logos/[brand]/[filename]`

### Logo CSS treatments
- Black logo on dark background: `filter: brightness(0) invert(1)`
- White-background logo on dark background: `mix-blend-mode: screen`
- Colored-background logo on dark background: `mix-blend-mode: screen` or `mix-blend-mode: lighten`

## Component library
Reference file: `../../components/library.html`

Available components (use these as building blocks):
- **ValueAccordion** — collapsed rows that expand on click to show detail
- **FeatureRevealCard** — card shows headline; click opens a detail drawer below with stats
- **StepTimeline** — numbered steps, click to expand each
- **ScrollCardRow** — horizontal scroll rail with arrow buttons, scroll-snap
- **TabbedContent** — tab bar switches between content panels
- **StatTicker** — large animated number with label
- **SplitValuePanel** — two-column text + visual panel
- **ComparisonTable** — side-by-side comparison rows
- **IconFeatureGrid** — grid of feature cards with logo/icon + copy
- **HeroSlide** — full-viewport opening section
- **PullQuote** — large blockquote with attribution
- **CTABand** — full-width call-to-action strip

## Brand commands
Use the appropriate slash command to load full brand tokens before starting a new file:
- `/nvidia-brand` — NVIDIA (dark, green, sharp/angular, technical)
- `/disney-brand` — Disney brand (dark cinematic, `#0063e5` blue, Poppins, franchise-forward)
- `/disneyplus-brand` — Disney+ streaming platform (dark navy, `#0063e5` blue, cinematic, franchise-forward)
- `/salesforce-brand` — Salesforce (light, `#0176d3` blue, enterprise, clean/spacious)

More Disney sub-brands (ESPN, Hulu, ABC, Marvel, etc.) will be added as needed.
