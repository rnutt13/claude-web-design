You are creating an HTML presentation file for Disney+ specifically. Read CLAUDE.md first for global rules, then apply everything below.

## What Disney+ is
The consumer streaming product — not the corporate parent. This is where subscribers browse and watch. The design is darker and more immersive than the general Disney brand: `#040714` authentic navy-black (vs `#0a0a14`), the same blue and rounded card family, but with a streaming-interface sensibility. Key content: subscriber numbers, content catalog depth, franchise streaming flywheel, pricing tiers, platform features.

## Design tokens
```css
:root {
  --blue: #0063e5;
  --blue-bright: #1b78f0;
  --blue-glow: rgba(0, 99, 229, 0.4);
  --purple: #7c3aed;
  --purple-dim: rgba(124, 58, 237, 0.12);
  --bg: #040714;           /* Disney+ navy-black — slightly darker than general Disney */
  --bg-alt: #0a0d1a;
  --bg-card: #0d1020;
  --bg-card-hover: #131627;
  --text: #ffffff;
  --text-dim: #9090b0;
  --text-muted: #40405a;
  --border: #1a1d30;
  --font: 'Poppins', -apple-system, sans-serif;
  --radius: 12px;
}
```

## Typography
Same as Disney brand: Poppins 400–900, gradient text on major headlines, blue-bright eyebrows.

Gradient text:
```css
background: linear-gradient(135deg, #ffffff 25%, #7cb8ff 65%, #c084fc 100%);
-webkit-background-clip: text;
-webkit-text-fill-color: transparent;
background-clip: text;
```

## Visual motifs specific to Disney+
- **Star field**: JS-generated twinkling stars in hero sections — makes it feel like the app opening screen
  ```js
  const container = document.getElementById('stars');
  for (let i = 0; i < 100; i++) {
    const s = document.createElement('div');
    s.className = 'star';
    s.style.cssText = `left:${Math.random()*100}%;top:${Math.random()*100}%;--dur:${2+Math.random()*4}s;--delay:${Math.random()*4}s;--max-op:${0.2+Math.random()*0.5};width:${1+Math.random()*2}px;height:${1+Math.random()*2}px;`;
    container.appendChild(s);
  }
  ```
  ```css
  .star { position:absolute; background:#fff; border-radius:50%; opacity:0; animation:twinkle var(--dur) var(--delay) infinite; }
  @keyframes twinkle { 0%,100%{opacity:0} 50%{opacity:var(--max-op)} }
  ```
- **Franchise logo strip**: horizontal row of studio logos (Marvel, Lucasfilm, Pixar, Disney Animation, NatGeo) below hero headline — the app's main identity moment
- **Content carousels**: horizontal scroll rails with franchise-colored thumbnail cards and progress indicators
- **Pricing tiers**: 3-column plan cards — Basic (with ads), Premium (no ads, featured), Bundle (Disney+/Hulu/ESPN+)
- **Gradient progress bar for slide nav**: `background: linear-gradient(90deg, var(--blue), var(--purple))`
- **Simulated streaming UI mockup**: CSS device frame showing the app interface (watchlist rows, mini card thumbnails) — used in split-panel sections

## Logos
Same CSS treatments as disney-brand. The primary identity mark for Disney+ pages is the wordmark:
```html
<img src="../assets/logos/disney/imgi_52_D_Blue-Logo.png" alt="Disney+" style="height:28px; filter:brightness(0) invert(1);">
```

Franchise logos in carousels and hero strips — use real files, not text labels:
- Marvel: `imgi_37_MARVEL_STUDIOS_LOGO.jpg` with `mix-blend-mode:screen`
- Lucasfilm: `imgi_38_1920-lucasfilm-logo.jpg` with `filter:brightness(0) invert(1); mix-blend-mode:screen`
- Pixar: `imgi_36_Pixar-Logo.jpg` with `filter:brightness(0) invert(1); mix-blend-mode:screen`
- Disney Animation: `imgi_35_Walt-Disney-Animation-Studios-Logo.jpg` with `filter:brightness(0) invert(1); mix-blend-mode:screen`
- NatGeo: `imgi_51_NG_logo_black.png` with `mix-blend-mode:screen`

## Buttons
```css
.btn-primary {
  background: var(--blue);
  color: #ffffff;
  font-size: 14px;
  font-weight: 700;
  padding: 14px 32px;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: background 0.2s, box-shadow 0.2s;
}
.btn-primary:hover { background: var(--blue-bright); box-shadow: 0 0 32px var(--blue-glow); }

.btn-ghost {
  background: none;
  color: var(--text-dim);
  border: 1px solid var(--border);
  border-radius: 8px;
  padding: 14px 28px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
}
.btn-ghost:hover { border-color: var(--text-dim); color: var(--text); }
```

## Common mistakes to avoid
- No emojis — franchise cards and carousels must use real logo files from assets, not emoji placeholders
- No `#0a0a14` background — Disney+ is `#040714`, measurably darker, and it matters for authenticity
- No text labels like "Marvel" or "Star Wars" in franchise grids — always use the actual logo image files
- No generic card grids — this is a streaming platform; use carousels with scroll-snap, progress bars, and franchise-colored thumbnails
- No plain blue buttons — the hover must include `box-shadow: 0 0 32px var(--blue-glow)`, that glow is the platform's signature interaction

## Slide structure (for full-viewport sections)
```css
.slide {
  position: absolute;
  inset: 0;
  display: flex;
  flex-direction: column;
  padding: 72px;
  opacity: 0;
  transform: scale(0.97) translateY(16px);
  transition: opacity 0.4s ease, transform 0.4s ease;
  pointer-events: none;
}
.slide.active { opacity: 1; transform: scale(1) translateY(0); pointer-events: all; }
.slide.exit-left { opacity: 0; transform: scale(1.02) translateY(-16px); }
```
