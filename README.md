# Claude Web Design

Branded HTML presentation templates for Salesforce customer presentations. Built for account teams who want to replace PowerPoint with high-quality, self-contained HTML files — styled to match the customer's brand.

## Install

**NVIDIA account team:**
```bash
curl -s https://raw.githubusercontent.com/rnutt13/claude-web-design/main/install-nvidia.sh | bash
```

**Disney account team:**
```bash
curl -s https://raw.githubusercontent.com/rnutt13/claude-web-design/main/install-disney.sh | bash
```

This creates `~/Claude Web Design/` with the right folder structure, downloads all brand logos, and installs the `claude-wd` CLI.

---

## Setup

1. **Install Claude Code** if you haven't already:
   ```bash
   npm install -g @anthropic/claude-code
   ```

2. **Open the project in Claude Code:**
   ```bash
   claude "~/Claude Web Design"
   ```
   Or open it from the Claude Code desktop app by selecting `~/Claude Web Design` as your working directory.

3. You're ready. Claude will automatically load the project rules from `CLAUDE.md` every session.

---

## Building a presentation

### Step 1 — Load the brand

At the start of a new conversation, run the slash command for your customer's brand:

| Command | Use for |
|---|---|
| `/nvidia-brand` | NVIDIA presentations |
| `/disney-brand` | Walt Disney Company presentations |
| `/disneyplus-brand` | Disney+ streaming platform presentations |
| `/salesforce-brand` | Salesforce-branded sections |

This loads the full design system — colors, typography, logo paths, components, and rules — into Claude's context.

### Step 2 — Describe what you want

Tell Claude the purpose of the page. Be specific about content, not layout — Claude picks the right components.

**Examples:**
```
Build a 5-slide presentation for the NVIDIA Blackwell GPU launch. 
Audience is a CTO. Cover: platform overview, Blackwell architecture, 
Data Center revenue, software ecosystem, and a call to action for 
a technical deep dive.
```

```
Build a scrolling pitch page for Disney explaining how Salesforce 
Data Cloud unifies their streaming, parks, and merchandise customer 
data. Include a product suite overview, a stats section, and a 
Data Cloud demo mockup.
```

```
Create a Disney+ platform overview — 6 slides covering subscriber 
growth, franchise universe, content investment, platform features, 
pricing tiers, and next steps.
```

### Step 3 — Review and iterate

Claude saves the file to `~/Claude Web Design/projects/[brand]/[name].html`.

Open it directly in your browser:
```bash
open ~/Claude\ Web\ Design/projects/disney/data-cloud-pitch.html
```

Take a screenshot of anything that looks off and paste it into the chat. Claude will fix it.

### Step 4 — Present

Open the HTML file in a browser and present full-screen. Arrow keys navigate slides. No server needed.

---

## Available components

Claude knows about these components and will use them automatically based on your content:

| Component | What it does |
|---|---|
| **HeroSlide** | Full-viewport opening section |
| **FeatureRevealCard** | Card that expands on click to show detail and stats |
| **ValueAccordion** | Collapsed rows that expand on click |
| **StepTimeline** | Numbered steps, click to expand each |
| **ScrollCardRow** | Horizontal scroll carousel with arrow navigation |
| **TabbedContent** | Tab bar that switches between content panels |
| **StatTicker** | Large animated number with label |
| **SplitValuePanel** | Two-column text + visual panel |
| **ComparisonTable** | Side-by-side comparison rows |
| **PullQuote** | Large blockquote with attribution |
| **CTABand** | Full-width call-to-action strip |

You can also request them explicitly:
```
Add a FeatureRevealCard section showing the three Salesforce 
products most relevant to Disney's guest data problem.
```

---

## File naming

Files are saved to `projects/[brand]/[descriptive-name].html`. Name them by purpose:

```
projects/nvidia/blackwell-cto-overview.html
projects/disney/data-cloud-pitch.html
projects/disney/disneyplus-streaming-strategy.html
projects/salesforce/q2-pipeline-review.html
```

---

## Keeping up to date

Check if there's a newer version:
```bash
claude-wd --version
```

Pull the latest brand configs and logos:
```bash
claude-wd --update
```

Updates include: revised brand tokens, new slash commands, new logos, and component improvements.

---

## Tips

- **Always run the brand command first** in a new conversation — without it Claude won't have the color tokens, logo paths, or component rules loaded.
- **Paste screenshots** when something looks wrong — Claude can see images and will diagnose layout issues directly.
- **Be specific about the audience** — a CTO slide deck looks different from a VP of Sales slide deck. Tell Claude who's in the room.
- **One page per presentation** — each file is fully self-contained, opens in any browser, no internet required after opening.
