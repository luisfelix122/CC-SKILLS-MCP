# Model Context Protocol (MCP) Hub

This folder contains configurations, documentation, and setup guides for the team's MCP servers.

## Quick Summary

| MCP Server | Provider / Repo | Primary Capability | Command / URL |
| :--- | :--- | :--- | :--- |
| **Chrome DevTools** | [ChromeDevTools/chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp) | Live browser debugging, performance traces, screenshots, console logs | `npx -y chrome-devtools-mcp@latest` |
| **Context7** | [Upstash Context7](https://context7.com) | Live version-accurate library docs & code examples | `npx -y @upstash/context7-mcp` or `npx ctx7 setup` |
| **GitHub** | [github/github-mcp-server](https://github.com/github/github-mcp-server) | Issues, PRs, file edits, git tree inspection, code search | Docker / `npx -y @modelcontextprotocol/server-github` |
| **Supabase** | [supabase/mcp](https://github.com/supabase/mcp) | DB schemas, SQL execution, migrations, edge functions | `https://mcp.supabase.com/mcp` |
| **Engram** | [edg-l/engram-mcp](https://github.com/edg-l/engram-mcp) | Branch-aware persistent memory, hybrid retrieval (BM25 + vector) | `engram` binary (SQLite + ONNX) |
| **TestSprite** | [testsprite.com](https://www.testsprite.com/solutions/mcp) | Autonomous AI testing, test case generation, execution & repair | `npx -y @testsprite/testsprite-mcp@latest` |
| **Filesystem** | [modelcontextprotocol/servers](https://github.com/modelcontextprotocol/servers/tree/main/src/filesystem) | Scoped local filesystem read/write/edit and directory tree traversal | `npx -y @modelcontextprotocol/server-filesystem <dirs>` |
| **Log Analyzer** | [djm81/log_analyzer_mcp](https://github.com/djm81/log_analyzer_mcp) | Test log summarization, targeted test runs, coverage reports & log searching | `uvx log-analyzer-mcp` |

---

## Configuration Files in this Directory

- [`mcp-config.json`](./mcp-config.json) - Master MCP configuration reference with descriptions.
- [`claude_desktop_config.json`](./claude_desktop_config.json) - Drop-in config for Claude Desktop.
- [`cursor_mcp.json`](./cursor_mcp.json) - Drop-in config for Cursor (`.cursor/mcp.json`).
- [`opencode_mcp.json`](./opencode_mcp.json) - Drop-in config for OpenCode (`opencode.json`).

---

## Client Setup Instructions

### 1. Cursor IDE
1. Open Cursor Settings -> **Features** -> **MCP**.
2. Click **+ Add New MCP Server**.
3. Or paste the contents of [`cursor_mcp.json`](./cursor_mcp.json) into:
   - Project level: `<project_root>/.cursor/mcp.json`
   - User level: Global Cursor configuration.

### 2. Claude Desktop
1. Open Claude Desktop Settings -> **Developer** -> **Edit Config**.
2. Or open the configuration file directly:
   - **macOS**: `~/Library/Application Support/Claude/claude_desktop_config.json`
   - **Windows**: `%APPDATA%\Claude\claude_desktop_config.json`
3. Paste the contents of [`claude_desktop_config.json`](./claude_desktop_config.json).
4. Restart Claude Desktop.

### 3. OpenCode
Run in your terminal:
```bash
npx ctx7 setup --opencode
```
Or merge [`opencode_mcp.json`](./opencode_mcp.json) into your `~/.config/opencode/config.json` or project `opencode.json`.

### 4. Claude Code CLI
Add individual servers via the CLI:
```bash
claude mcp add chrome-devtools -- npx -y chrome-devtools-mcp@latest
claude mcp add context7 -- npx -y @upstash/context7-mcp
claude mcp add github --env GITHUB_PERSONAL_ACCESS_TOKEN=YOUR_TOKEN -- npx -y @modelcontextprotocol/server-github
claude mcp add supabase --transport http https://mcp.supabase.com/mcp
claude mcp add testsprite --env API_KEY=YOUR_KEY -- npx -y @testsprite/testsprite-mcp@latest
claude mcp add filesystem -- npx -y @modelcontextprotocol/server-filesystem /path/to/project
claude mcp add log-analyzer -- uvx log-analyzer-mcp
```

---

## Server Documentation Subfolders

- [Chrome DevTools MCP Guide](./chrome-devtools/README.md)
- [Context7 MCP Guide](./context7/README.md)
- [GitHub MCP Server Guide](./github/README.md)
- [Supabase MCP Guide](./supabase/README.md)
- [Engram MCP Guide](./engram/README.md)
- [TestSprite MCP Guide](./testsprite/README.md)
- [Filesystem MCP Guide](./filesystem/README.md)
- [Log Analyzer MCP Guide](./log-analyzer/README.md)
