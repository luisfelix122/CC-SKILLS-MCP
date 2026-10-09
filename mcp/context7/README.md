# Context7 MCP Server & Setup

Website: [context7.com](https://context7.com)  
Powered by Upstash.

Context7 provides AI coding assistants with up-to-date, version-specific library documentation, SDK signatures, and code examples to eliminate LLM hallucinations on modern APIs.

## Automatic Interactive Setup

Run the official interactive CLI setup:
```bash
npx ctx7 setup
```

This command will:
1. Authenticate with your Upstash / Context7 account via browser OAuth.
2. Generate your API key.
3. Automatically detect and configure your coding environment (Cursor, Claude Code, OpenCode).

### Non-Interactive / Specific Target Flags
```bash
# For Cursor
npx ctx7 setup --cursor

# For Claude Code
npx ctx7 setup --claude

# For OpenCode
npx ctx7 setup --opencode

# Skip all confirmation prompts
npx ctx7 setup --yes
```

## Manual MCP Configuration

If you prefer configuring MCP directly in `mcp.json` or `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp"]
    }
  }
}
```

Or with an API key if you have a custom or team plan:
```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp"],
      "env": {
        "CONTEXT7_API_KEY": "YOUR_CONTEXT7_API_KEY"
      }
    }
  }
}
```

## Available Tools

- `resolve-library-id`: Search for libraries and map package names to documentation IDs.
- `query-docs`: Query version-specific documentation and usage examples for any popular package or framework.
