# Agent Skills Catalog

This directory contains pre-packaged, production-ready AI coding skills for the team.

## Included Skills

| Skill | Source | Purpose | Quick Command |
| :--- | :--- | :--- | :--- |
| **impeccable** | `pbakaus/impeccable` | Precision UI/UX design, design systems, polish, anti-pattern detection, live DOM tools | `npx skills add pbakaus/impeccable` |
| **taste-skill** | [leonxlnx/taste-skill](https://github.com/leonxlnx/taste-skill) | Anti-slop frontend aesthetic engine, 3 dials (Variance, Motion, Density), brutalist/minimalist variants | `npx skills add leonxlnx/taste-skill` |
| **frontend-design** | [anthropics/skills](https://github.com/anthropics/skills/tree/main/skills/frontend-design) | Anthropic official frontend design system & production UI styling standards | Copy `skills/frontend-design` |
| **webapp-testing** | [anthropics/skills](https://github.com/anthropics/skills/tree/main/skills/webapp-testing) | Anthropic official web application testing, Playwright, Vitest, Cypress best practices | Copy `skills/webapp-testing` |
| **agent-browser** | [vercel-labs/agent-browser](https://github.com/vercel-labs/agent-browser) | Native browser automation CLI for AI agents (specially tuned for OpenCode) | `npx skills add vercel-labs/agent-browser` |
| **skill-creator** | [anthropics/skills](https://github.com/anthropics/skills/tree/main/skills/skill-creator) | Anthropic official framework for authoring, evaluating, and packaging new agent skills | Copy `skills/skill-creator` |

---

## How to Install into Your Agent

### Method 1: The Automated Installer Scripts (Recommended)
From the root of this repo, run:
```bash
# Linux / macOS
./scripts/install-skills.sh

# Windows PowerShell
.\scripts\install-skills.ps1
```

### Method 2: OpenCode
OpenCode checks `.opencode/skills/` (project-level) and `~/.config/opencode/skills/` (user-level):
```bash
# Install all skills into your user OpenCode directory
mkdir -p ~/.config/opencode/skills
cp -r skills/* ~/.config/opencode/skills/
```

### Method 3: Cursor / Windsurf / Antigravity / Claude Code
Most modern agents support either `.agents/skills/` in the project root or user home directory:
```bash
# Project level
mkdir -p .agents/skills
cp -r skills/* .agents/skills/

# Or User home level
mkdir -p ~/.agents/skills
cp -r skills/* ~/.agents/skills/
```

### Method 4: Using `npx skills`
If you prefer managing skills via the universal `npx skills` CLI:
```bash
npx skills add pbakaus/impeccable
npx skills add leonxlnx/taste-skill
npx skills add vercel-labs/agent-browser
```
