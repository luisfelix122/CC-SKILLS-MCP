# Agent Browser (for OpenCode, Claude Code, Cursor)

Repository: [vercel-labs/agent-browser](https://github.com/vercel-labs/agent-browser)

A fast, native browser automation CLI designed specifically for AI agents (like **OpenCode**, Claude Code, Cursor, Codex). It connects directly to Chrome/Chromium via the Chrome DevTools Protocol (CDP) and produces compact accessibility-tree element references (`@e1`, `@e2`), saving context tokens while providing dependable web interaction.

---

## Installation

### 1. Global CLI Installation
```bash
npm install -g agent-browser
agent-browser install
```

### 2. Add as a Skill via CLI
```bash
# Add to your active agent environment
npx skills add vercel-labs/agent-browser
```

### 3. OpenCode Specific Setup
For **OpenCode**:
- OpenCode automatically discovers skills in `~/.config/opencode/skills/` or `.opencode/skills/` in your project root.
- To use this skill directly in OpenCode:
  ```bash
  # Project level
  mkdir -p .opencode/skills
  cp -r skills/agent-browser .opencode/skills/

  # Or user global level
  mkdir -p ~/.config/opencode/skills
  cp -r skills/agent-browser ~/.config/opencode/skills/
  ```

---

## Core Capabilities

- **Accessibility Snapshot Trees**: Compact refs like `@e3` instead of dumping hundreds of lines of raw HTML.
- **Session Management**: Persistent sessions across multiple commands.
- **CDP Mode**: Connects to your already-logged-in Chrome browser without needing credentials.
- **Specialized Workflows**:
  - `core`: General navigation, clicking, form submission, screenshots.
  - `electron`: Automate VS Code, Slack, Discord desktop apps.
  - `dogfood`: Exploratory QA and bug hunting on local apps.
  - `agentcore`: AWS Bedrock cloud browser runner.

---

## Essential CLI Commands

```bash
# Open a webpage
agent-browser open https://localhost:3000

# Take a screenshot
agent-browser screenshot app.png

# Click an element using an accessibility ref
agent-browser click @e3

# Fill an input field
agent-browser fill @e5 "test@example.com"

# Close session
agent-browser close
```
