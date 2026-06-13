# Preon Brand Identity

Final brand package for Preon. This folder gathers the usable outputs in one place: brand foundation, voice, visual system, and ready-to-use logo assets.

![Preon wordmark](assets/logo/preon-wordmark-transparent.svg)

![Preon icon](assets/logo/preon-icon-transparent-512.svg)

## Quick Snapshot

- Positioning: Preon Solutions crafts bespoke SaaS products from zero to scale for founders who refuse to ship something generic.
- Archetype: The Creator
- Personality: Intentional, warm-blooded, masterful, substantive, unhurried
- Core impression: warm premium authority with editorial restraint and technical credibility

## Read First

- [Brand Overview](brand.md)
- [Voice and Messaging](voice.md)
- [Visual System](visual-system.md)

## Logo Assets

### Wordmark

- [Master SVG](assets/logo/preon-wordmark.svg)
- [Transparent SVG](assets/logo/preon-wordmark-transparent.svg)
- [PNG 2048](assets/logo/preon-wordmark-2048.png)
- [PNG 4096](assets/logo/preon-wordmark-4096.png)
- [Transparent PNG 4096](assets/logo/preon-wordmark-transparent-4096.png)
- [JPG 2048](assets/logo/preon-wordmark-2048.jpg)
- [JPG 4096](assets/logo/preon-wordmark-4096.jpg)

### Icon / Favicon

- [Master SVG](assets/logo/preon-icon.svg)
- [SVG 16](assets/logo/preon-icon-16.svg)
- [SVG 32](assets/logo/preon-icon-32.svg)
- [SVG 512](assets/logo/preon-icon-512.svg)
- [PNG 16](assets/logo/preon-icon-16.png)
- [PNG 32](assets/logo/preon-icon-32.png)
- [PNG 512](assets/logo/preon-icon-512.png)
- [PNG 2048](assets/logo/preon-icon-2048.png)
- [PNG 4096](assets/logo/preon-icon-4096.png)
- [JPG 2048](assets/logo/preon-icon-2048.jpg)
- [JPG 4096](assets/logo/preon-icon-4096.jpg)
- [Transparent SVG](assets/logo/preon-icon-transparent.svg)
- [Transparent SVG 16](assets/logo/preon-icon-transparent-16.svg)
- [Transparent SVG 32](assets/logo/preon-icon-transparent-32.svg)
- [Transparent SVG 512](assets/logo/preon-icon-transparent-512.svg)
- [Transparent PNG 4096](assets/logo/preon-icon-transparent-4096.png)

## Installation

Install the Cursor skill globally (works across all your Preon projects):

```bash
curl -fsSL https://raw.githubusercontent.com/preon-solutions/preon-brand-identity/main/install.sh | bash
```

If you already cloned this repo:

```bash
./install.sh
```

Optional: also install the frontend rule in a product repo:

```bash
./install.sh --project /path/to/your-preon-project
```

This installs:

- Global skill: `~/.cursor/skills/preon-brand/`
- Optional project rule: `.cursor/rules/preon-brand.mdc`

After install, ask Cursor to create Preon-branded UI, copy, or assets. The agent should follow the design system via the `preon-brand` skill.

Official docs and assets: [preon-solutions/preon-brand-identity](https://github.com/preon-solutions/preon-brand-identity)

## Cursor / AI

Source files in this repo:

- Skill: `.cursor/skills/preon-brand/SKILL.md`
- Asset/token reference: `.cursor/skills/preon-brand/tokens.md`
- Rule template: `.cursor/rules/preon-brand-template.mdc`
- Installer: `install.sh`

## Best Use

- Use the wordmark for websites, proposals, slide covers, documents, and any full brand presence.
- Use the icon for avatars, app icons, profile images, and tight square placements.
- Use the 16px and 32px icon files for browser tabs and other very small digital surfaces.
- Start any new branded surface with the guidance in [Visual System](visual-system.md).