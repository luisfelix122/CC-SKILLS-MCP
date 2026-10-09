# PRH: AI Engineering Skills & MCP Toolkit

Centralized repository containing production-grade **Skills** and **Model Context Protocol (MCP)** servers curated for rapid team onboarding and agentic development (supporting **OpenCode**, **Cursor**, **Claude Code**, **Antigravity**, **VS Code**, and **Windsurf**).

> 🇪🇸 **¿Prefieres leer en español?** Consulta la [Guía en Español](./README.es.md).

---

## Quick Start for the Team

### 1. Clone the Repository
```bash
git clone https://github.com/luisfelix122/PRH.git
cd PRH
```

### 2. One-Click Installation

#### On macOS / Linux:
```bash
chmod +x install-all.sh scripts/*.sh
./install-all.sh
```

#### On Windows (PowerShell):
```powershell
.\install-all.ps1
```

---

## 🧰 Curated Skills

All skills are located in the [`skills/`](./skills/) directory with full offline source files, references, and `SKILL.md` definitions.

| Skill | Source | What it does | Quick Command |
| :--- | :--- | :--- | :--- |
| **impeccable** | `pbakaus/impeccable` | Precision UI/UX design, design systems, design anti-pattern detection, live DOM inspection & polish. | `npx skills add pbakaus/impeccable` |
| **taste-skill** | [leonxlnx/taste-skill](https://github.com/leonxlnx/taste-skill) | Anti-slop frontend design system with 3 dials (Variance, Motion, Density) plus brutalist, minimalist, and redesign variants. | `npx skills add leonxlnx/taste-skill` |
| **frontend-design** | [anthropics/skills](https://github.com/anthropics/skills) | Anthropic official frontend design principles, production styling, and responsive UI craft. | Pre-installed in `skills/frontend-design` |
| **webapp-testing** | [anthropics/skills](https://github.com/anthropics/skills) | Comprehensive web app testing patterns (Playwright, Vitest, integration workflows). | Pre-installed in `skills/webapp-testing` |
| **agent-browser** | [vercel-labs/agent-browser](https://github.com/vercel-labs/agent-browser) | Native browser automation CLI for AI agents (special integration for **OpenCode**). | `npm i -g agent-browser && agent-browser install` |
| **skill-creator** | [anthropics/skills](https://github.com/anthropics/skills) | Framework to create, benchmark, and package custom agent skills. | Pre-installed in `skills/skill-creator` |

### Using Skills with OpenCode
OpenCode automatically discovers skills in `~/.config/opencode/skills/` (user level) or `.opencode/skills/` (repo level).  
The included `install-all` script automatically syncs all skills into both `~/.agents/skills` and `~/.config/opencode/skills`.

---

## 🔌 Model Context Protocol (MCP) Servers

All MCP configurations, schemas, and individual guides are located in the [`mcp/`](./mcp/) directory.

| Server | Repo / Source | Primary Capability | Default Command / Endpoint |
| :--- | :--- | :--- | :--- |
| **Chrome DevTools** | [ChromeDevTools/chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp) | Live browser debugging, performance traces, network requests, screenshots. | `npx -y chrome-devtools-mcp@latest` |
| **Context7** | [Upstash Context7](https://context7.com) | Live version-accurate library docs and code examples. | `npx ctx7 setup` or `npx -y @upstash/context7-mcp` |
| **GitHub** | [github/github-mcp-server](https://github.com/github/github-mcp-server) | Official GitHub MCP: issues, PRs, tree inspection, code search, commits. | Docker / `npx -y @modelcontextprotocol/server-github` |
| **Supabase** | [supabase/mcp](https://github.com/supabase/mcp) | Official remote HTTP MCP: Postgres tables, SQL queries, migrations. | `https://mcp.supabase.com/mcp` |
| **Engram** | [edg-l/engram-mcp](https://github.com/edg-l/engram-mcp) | Branch-aware persistent memory, hybrid BM25 + ONNX vector retrieval. | `engram` binary (SQLite local-first) |
| **TestSprite** | [testsprite.com](https://www.testsprite.com/solutions/mcp) | Autonomous AI testing agent for test case generation, execution & repair. | `npx -y @testsprite/testsprite-mcp@latest` |

### Pre-built MCP Config Files
- **[`mcp/mcp-config.json`](./mcp/mcp-config.json)**: Consolidated master config with descriptions.
- **[`mcp/claude_desktop_config.json`](./mcp/claude_desktop_config.json)**: Drop into Claude Desktop config.
- **[`mcp/cursor_mcp.json`](./mcp/cursor_mcp.json)**: Drop into `.cursor/mcp.json`.
- **[`mcp/opencode_mcp.json`](./mcp/opencode_mcp.json)**: Drop into OpenCode configuration.

---

## Repository Structure

```text
PRH/
├── README.md                      # English documentation & quickstart
├── README.es.md                   # Documentación en Español para el equipo
├── install-all.sh                 # 1-click Linux/macOS installer
├── install-all.ps1                # 1-click Windows PowerShell installer
├── skills/
│   ├── README.md                  # Comprehensive skills catalog
│   ├── impeccable/                # UI/UX polish & design system suite
│   ├── taste-skill/               # Anti-slop frontend engine & variants
│   ├── frontend-design/           # Anthropic official frontend design
│   ├── webapp-testing/            # Anthropic official webapp testing
│   ├── agent-browser/             # Vercel agent browser (with OpenCode setup)
│   └── skill-creator/             # Anthropic skill creation framework
├── mcp/
│   ├── README.md                  # MCP installation and setup guide
│   ├── mcp-config.json            # Unified master MCP configuration
│   ├── claude_desktop_config.json # Claude Desktop configuration
│   ├── cursor_mcp.json            # Cursor configuration
│   ├── opencode_mcp.json          # OpenCode configuration
│   ├── chrome-devtools/           # Chrome DevTools guide
│   ├── context7/                  # Context7 guide
│   ├── github/                    # GitHub MCP server guide
│   ├── supabase/                  # Supabase MCP guide
│   ├── engram/                    # Engram memory MCP guide
│   └── testsprite/                # TestSprite AI testing guide
└── scripts/
    ├── install-skills.sh          # Bash skill installation script
    ├── install-skills.ps1         # PowerShell skill installation script
    ├── setup-mcp.sh               # Bash MCP assistant script
    └── setup-mcp.ps1              # PowerShell MCP assistant script
```

---

## License

This collection references open-source tools and documentation under their respective MIT, Apache 2.0, and BSD licenses.
