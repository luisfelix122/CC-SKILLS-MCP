# Chrome DevTools MCP Server

Repository: [ChromeDevTools/chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp)

The official Chrome DevTools Model Context Protocol (MCP) server lets AI coding assistants (Cursor, Claude, OpenCode, Antigravity) control, inspect, and automate a live Google Chrome browser instance.

## Features

- **Live Browser Automation**: Click, fill, navigate, evaluate JavaScript, take screenshots.
- **Performance Traces**: Record traces and extract Core Web Vitals insights.
- **Console & Network Inspection**: Capture console warnings/errors with source maps and inspect network requests.
- **Puppeteer Integration**: High-fidelity DOM interaction.

## Prerequisites

- [Node.js](https://nodejs.org/) (LTS recommended).
- [Google Chrome](https://www.google.com/chrome/) installed.

## Configuration

### Full Mode (Default)
```json
{
  "mcpServers": {
    "chrome-devtools": {
      "command": "npx",
      "args": ["-y", "chrome-devtools-mcp@latest"]
    }
  }
}
```

### Slim Headless Mode (Faster, lightweight)
```json
{
  "mcpServers": {
    "chrome-devtools": {
      "command": "npx",
      "args": ["-y", "chrome-devtools-mcp@latest", "--slim", "--headless"]
    }
  }
}
```

### Disable Telemetry
```json
{
  "mcpServers": {
    "chrome-devtools": {
      "command": "npx",
      "args": ["-y", "chrome-devtools-mcp@latest", "--no-usage-statistics"]
    }
  }
}
```

## Quick Verification Prompt

In your AI assistant chat, run:
```text
Navigate to https://example.com, take a screenshot, and report the page title and headings.
```
