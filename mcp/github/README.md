# GitHub MCP Server

Official Repository: [github/github-mcp-server](https://github.com/github/github-mcp-server)

The official GitHub Model Context Protocol (MCP) server gives AI agents deep integration with GitHub: managing repositories, viewing/opening pull requests, creating issues, searching code, managing files, and checking Git trees.

## Requirements

- A GitHub Personal Access Token (Classic PAT with `repo` scope, or Fine-grained PAT with Repository permissions for Contents, Issues, Pull Requests).
- Docker (recommended for the official binary container) OR Node.js (for the NPX runner).

---

## Configuration

### Option A: Official Docker Image (Recommended)
```json
{
  "mcpServers": {
    "github": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "-e",
        "GITHUB_PERSONAL_ACCESS_TOKEN",
        "ghcr.io/github/github-mcp-server:latest"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_GITHUB_PERSONAL_ACCESS_TOKEN"
      }
    }
  }
}
```

### Option B: Node.js / NPX Runner (No Docker required)
```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_GITHUB_PERSONAL_ACCESS_TOKEN"
      }
    }
  }
}
```

---

## Safety & Security Flags

- **Read-Only Mode**: Prevents modifying issues, branches, or PRs.
  Pass `--read-only` flag or set `GITHUB_READ_ONLY=1`.
- **Lockdown Mode**: Filters out untrusted user comments/issues from users without push permissions to prevent prompt injection attacks.
  Pass `--lockdown-mode` flag or set `GITHUB_LOCKDOWN_MODE=1`.
