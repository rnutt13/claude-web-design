You are creating an HTML presentation file in NVIDIA's brand style. Read CLAUDE.md first for global rules, then apply everything below.

## Brand personality
Sharp, technical, performance-obsessed. This is a company that makes the hardware the world runs AI on. The aesthetic should feel like a GPU datasheet crossed with a concept car reveal — precision and power, nothing decorative that doesn't earn its place.

## Design tokens
```css
:root {
  --green: #76b900;
  --green-dim: rgba(118, 185, 0, 0.15);
  --green-glow: rgba(118, 185, 0, 0.4);
  --bg: #0a0a0a;
  --bg-alt: #111111;
  --bg-card: #141414;
  --text: #ffffff;
  --text-dim: #b0b0b0;
  --text-muted: #555555;
  --border: #222222;
  --border-accent: #333333;
  --font: 'Inter', -apple-system, sans-serif;
  --radius: 0px;        /* NVIDIA uses sharp corners — no border-radius on key elements */
}
```

## Typography
- Google Font: `Inter` (weights 400, 600, 700, 800, 900)
- Headlines: weight 800–900, tight letter-spacing (-0.02em to -0.03em)
- Body: weight 400, color `var(--text-dim)`
- Labels/eyebrows: weight 700, letter-spacing 0.15–0.2em, uppercase, color `var(--green)`

## Key visual motifs
- **Sharp corners everywhere** — `border-radius: 0` on cards, buttons, inputs
- **Green accent lines** — 2–3px `border-top` or `border-left` in `var(--green)` to mark active/featured elements
- **Green glow** — `box-shadow: 0 0 24px var(--green-glow)` on hover states and highlighted stats
- **Geometric clip-paths** — triangular cuts on section dividers: `clip-path: polygon(0 0, 100% 0, 100% 85%, 0 100%)`
- **Technical grid** — subtle `background-image: linear-gradient(var(--border) 1px, transparent 1px), linear-gradient(90deg, var(--border) 1px, transparent 1px)` at low opacity as background texture
- **Green left-border rule** on active/featured cards: `border-left: 3px solid var(--green)`

## Logo
```html
<img src="../assets/logos/nvidia/nvidia.png" alt="NVIDIA" style="height:28px; mix-blend-mode:screen;">
```
The logo file has a white background — `mix-blend-mode: screen` makes it disappear on dark backgrounds, leaving only the green eye mark.

## Buttons
```css
.btn-primary {
  background: var(--green);
  color: #000000;
  font-weight: 700;
  font-size: 13px;
  letter-spacing: 0.06em;
  padding: 12px 28px;
  border: none;
  border-radius: 0;
  cursor: pointer;
  text-transform: uppercase;
}
.btn-ghost {
  background: none;
  color: var(--text-dim);
  border: 1px solid var(--border-accent);
  border-radius: 0;
  padding: 12px 28px;
  font-weight: 600;
  font-size: 13px;
  letter-spacing: 0.04em;
}
.btn-ghost:hover { border-color: var(--green); color: var(--text); }
```

## Slide/section structure (for full-viewport sections)
```css
.slide {
  width: 100vw;
  height: 100vh;
  position: absolute;
  inset: 0;
  display: flex;
  flex-direction: column;
  padding: 80px;
  background: var(--bg);
  opacity: 0;
  transform: translateY(20px);
  transition: opacity 0.3s ease, transform 0.3s ease;
  pointer-events: none;
}
.slide.active { opacity: 1; transform: translateY(0); pointer-events: all; }
.slide.exit-left { opacity: 0; transform: translateY(-20px); }
```

## Navigation JS (for slide-mode files)
```js
const slides = document.querySelectorAll('.slide');
let current = 0;
function goTo(n) {
  slides[current].classList.remove('active');
  slides[current].classList.add('exit-left');
  setTimeout(() => slides[current].classList.remove('exit-left'), 350);
  current = n;
  slides[current].classList.add('active');
  document.getElementById('counter').textContent = `${current+1} / ${slides.length}`;
  document.getElementById('progress').style.width = `${((current+1)/slides.length)*100}%`;
  document.getElementById('prevBtn').disabled = current === 0;
  document.getElementById('nextBtn').disabled = current === slides.length - 1;
}
function navigate(dir) { const n = current+dir; if (n>=0 && n<slides.length) goTo(n); }
document.addEventListener('keydown', e => {
  if (e.key==='ArrowRight'||e.key==='ArrowDown') navigate(1);
  if (e.key==='ArrowLeft'||e.key==='ArrowUp') navigate(-1);
});
```

## Common mistakes to avoid
- No emojis — use real logos, CSS shapes, or SVG icons only
- No rounded corners on cards or buttons — zero border-radius is the NVIDIA aesthetic
- No blue accents — the only accent color is `#76b900` green
- No soft gradient hero backgrounds — use the dark bg with geometric clip-paths and grid texture
- `mix-blend-mode: screen` on the NVIDIA logo is required — without it the white background renders as a white box on dark bg
