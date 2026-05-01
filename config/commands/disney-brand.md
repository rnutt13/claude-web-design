You are creating an HTML presentation file in Disney's brand style. Read CLAUDE.md first for global rules, then apply everything below.

## What Disney is
A 100-year entertainment company built on franchise universes — Marvel, Star Wars, Pixar, Disney Animation, National Geographic. The design aesthetic is cinematic and dark: deep navy backgrounds, rich blue accents, soft ambient glows. It feels like a premiere, not a pitch deck. Content covers storytelling scale, franchise reach, subscriber platforms, and cultural impact.

## Design tokens
```css
:root {
  --blue: #0063e5;
  --blue-bright: #1b78f0;
  --blue-glow: rgba(0, 99, 229, 0.4);
  --purple: #7c3aed;
  --purple-glow: rgba(124, 58, 237, 0.35);
  --bg: #0a0a14;
  --bg-alt: #0d0d1a;
  --bg-card: #13131f;
  --text: #ffffff;
  --text-dim: #8888a0;
  --text-muted: #44445a;
  --border: #1e1e30;
  --font: 'Poppins', -apple-system, sans-serif;
  --radius: 12px;
  --radius-lg: 16px;
}
```

## Typography
- Google Font: `Poppins` (weights 400, 500, 600, 700, 800, 900)
- Major headlines: weight 900, letter-spacing -0.025em, line-height 0.97–1.05
- Gradient text on hero headlines:
  ```css
  background: linear-gradient(90deg, #7cb8ff 0%, #c084fc 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  ```
- Body: weight 400, `var(--text-dim)`, line-height 1.65
- Section labels/eyebrows: weight 700, letter-spacing 0.2em, uppercase, `var(--blue-bright)`

## Visual motifs
- **Rounded cards**: `border-radius: 12px` on all cards and containers
- **Glow orbs**: blurred radial gradients for ambient light in hero sections
  ```css
  position: absolute; border-radius: 50%; filter: blur(40–80px); pointer-events: none;
  background: radial-gradient(circle, rgba(0,99,229,0.12) 0%, transparent 70%);
  ```
- **Hero gradient background**: `radial-gradient` ellipses layered over the dark bg, not a flat color
- **Bottom fade**: hero sections fade into bg with `linear-gradient(to bottom, transparent, var(--bg))`
- **Hero badge**: pill-shaped label with a glowing dot — `background: rgba(0,99,229,0.15); border: 1px solid rgba(0,99,229,0.3); border-radius: 100px`
- **Stats**: large gradient numbers (`linear-gradient(135deg, var(--blue-bright), var(--purple))`) with `-webkit-background-clip: text`
- **Horizontal scroll carousels**: `scroll-snap-type: x mandatory`, `scrollbar-width: none`
- **Card hover**: `transform: translateY(-4px)` + `box-shadow: 0 16px 40px rgba(0,99,229,0.15)`
- **Sticky nav**: `backdrop-filter: blur(16px)` with `background: rgba(10,10,20,0.9)`

## Logos
```html
<!-- Disney+ wordmark — invert black logo to white -->
<img src="../assets/logos/disney/imgi_52_D_Blue-Logo.png" alt="Disney" style="height:26px; filter:brightness(0) invert(1);">

<!-- Marvel Studios — screen blend removes red background on dark -->
<img src="../assets/logos/disney/imgi_37_MARVEL_STUDIOS_LOGO.jpg" style="height:32px; mix-blend-mode:screen;">

<!-- Lucasfilm — invert -->
<img src="../assets/logos/disney/imgi_38_1920-lucasfilm-logo.jpg" style="height:28px; filter:brightness(0) invert(1); mix-blend-mode:screen;">

<!-- Pixar — invert -->
<img src="../assets/logos/disney/imgi_36_Pixar-Logo.jpg" style="height:28px; filter:brightness(0) invert(1); mix-blend-mode:screen;">

<!-- Disney Animation — invert -->
<img src="../assets/logos/disney/imgi_35_Walt-Disney-Animation-Studios-Logo.jpg" style="height:32px; filter:brightness(0) invert(1); mix-blend-mode:screen;">

<!-- National Geographic — screen blend removes yellow rectangle -->
<img src="../assets/logos/disney/imgi_51_NG_logo_black.png" style="height:28px; mix-blend-mode:screen;">

<!-- FX — invert -->
<img src="../assets/logos/disney/imgi_49_FX-Logo-.png" style="height:24px; filter:brightness(0) invert(1);">

<!-- Walt Disney Company corporate -->
<img src="../assets/logos/disney/The Walt Disney Company.svg" style="height:24px; filter:brightness(0) invert(1);">
```

## Buttons
```css
.btn-primary {
  background: var(--blue);
  color: #ffffff;
  font-size: 14px;
  font-weight: 700;
  padding: 15px 36px;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: background 0.2s, box-shadow 0.2s;
}
.btn-primary:hover { background: var(--blue-bright); box-shadow: 0 0 30px var(--blue-glow); }

.btn-ghost {
  background: rgba(255,255,255,0.06);
  color: #ffffff;
  font-size: 14px;
  font-weight: 600;
  padding: 15px 28px;
  border: 1px solid rgba(255,255,255,0.12);
  border-radius: 8px;
  cursor: pointer;
  transition: background 0.2s, border-color 0.2s;
}
.btn-ghost:hover { background: rgba(255,255,255,0.1); border-color: rgba(255,255,255,0.25); }
```

## Common mistakes to avoid
- No emojis — franchise tiles and card thumbnails must use real logo files from assets, not emoji placeholders
- No pure `#000000` black — the bg is `#0a0a14` navy-black, which reads warmer and more cinematic
- No flat white headline text — major headlines get the blue-to-purple gradient treatment
- No sharp corners — `border-radius: 12px` is fundamental to this aesthetic
- No flat hero — heroes need layered radial-gradient backgrounds and a bottom fade into the page

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
