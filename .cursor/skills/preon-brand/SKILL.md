---
name: preon-brand
description: Applies Preon Solutions brand identity, visual system, voice, and logo assets when creating UI, copy, slides, documents, or marketing for Preon. Use when the user mentions Preon, preon.solutions, Preon branding, Preon design system, or asks to create something on-brand for Preon.
---

# Preon Brand Identity

Canonical source: [preon-solutions/preon-brand-identity](https://github.com/preon-solutions/preon-brand-identity)

Before creating or reviewing Preon-branded work, read the relevant docs from this repo (local paths if available, otherwise GitHub raw URLs below).

## Source docs

| Doc | Local | GitHub raw |
| --- | --- | --- |
| Brand overview | `brand.md` | https://raw.githubusercontent.com/preon-solutions/preon-brand-identity/main/brand.md |
| Voice and messaging | `voice.md` | https://raw.githubusercontent.com/preon-solutions/preon-brand-identity/main/voice.md |
| Visual system | `visual-system.md` | https://raw.githubusercontent.com/preon-solutions/preon-brand-identity/main/visual-system.md |

For asset URLs and CSS tokens, see [tokens.md](tokens.md).

## Workflow

1. Identify the deliverable: UI, copy, slide, document, social asset, or code.
2. Read `visual-system.md` for layout, color, typography, and logo rules.
3. Read `voice.md` for tone, taglines, and forbidden phrases.
4. Read `brand.md` when positioning, personality, or strategic framing matters.
5. Use official logo URLs from `tokens.md`. Do not redraw or approximate the mark.
6. Validate output against the checklists below.

## Visual defaults

- Background: `#F7F4EF` (warm cream), not pure black
- Primary text: `#1C1917`
- Brand color: `#7C6FAF`
- Display font: Source Serif 4 (semibold/bold headlines only)
- Body/UI font: IBM Plex Mono (regular/medium)
- Direction: warm, editorial, spacious, quiet authority

## Logo usage

- Full brand presence → wordmark
- Avatars, favicons, square placements → icon
- Favicon/browser tab → 16px or 32px icon assets
- Prefer dusty amethyst on warm cream, or transparent SVG on supported backgrounds

## Copy defaults

- One-liner: "Preon Solutions crafts bespoke SaaS products from zero to scale for founders who refuse to ship something generic."
- Tone: quietly authoritative, warm but not casual, precise but not cold
- Prefer: craft, architecture, foundation, build, structure, material, partner
- Never say: ship faster, disrupt, cutting-edge, end-to-end solution, leverage

## Avoid

- Pure black default backgrounds
- Neon greens, candy gradients, glassmorphism
- Generic terminal aesthetics or startup flash
- Crowded layouts or hyperactive motion
- Mixing serif and monospace at the same hierarchy level

## UI checklist

- [ ] Uses palette from visual system
- [ ] Source Serif 4 for headlines only; IBM Plex Mono for body/UI
- [ ] Generous spacing and calm contrast
- [ ] Official logo asset URL, not a recreated mark
- [ ] No glossy gradients, glass effects, or trend-driven polish

## Copy checklist

- [ ] Matches Preon tone and personality
- [ ] No forbidden phrases from `voice.md`
- [ ] Short declarative anchors with one clarifying sentence when needed
- [ ] Substance over speed theater

## Web implementation

When embedding assets in HTML/CSS/React:

```html
<img
  src="https://raw.githubusercontent.com/preon-solutions/preon-brand-identity/main/assets/logo/preon-wordmark-transparent.svg"
  alt="Preon"
/>
```

```css
:root {
  --preon-primary: #7c6faf;
  --preon-secondary: #5b8f95;
  --preon-secondary-light: #96c0c4;
  --preon-accent: #7f6478;
  --preon-bg: #f7f4ef;
  --preon-surface: #ede8e0;
  --preon-border: #ddd8d0;
  --preon-text: #1c1917;
  --preon-text-secondary: #78716c;
}
```

Load fonts from Google Fonts: Source Serif 4 and IBM Plex Mono.
