# TestSprite MCP Server

Official Website: [testsprite.com/solutions/mcp](https://www.testsprite.com/solutions/mcp)  
Package: `@testsprite/testsprite-mcp`

TestSprite is an autonomous AI software testing agent that plugs directly into IDEs via the Model Context Protocol (MCP). It generates, executes, debugs, and maintains automated test suites for frontend and backend web applications.

## How It Works

1. You start your local dev server (e.g. `npm run dev`).
2. You ask your AI coding assistant: *"Test the user authentication flow with TestSprite"*.
3. TestSprite explores the application, identifies edge cases, generates Playwright / Jest / Vitest test cases, runs them against the live environment, and reports failures with code fixes.

## Prerequisites

1. An API Key from [testsprite.com](https://testsprite.com) (register and copy key from settings).
2. Node.js LTS installed.

## Configuration

### Cursor / VS Code / Antigravity MCP Config
```json
{
  "mcpServers": {
    "TestSprite": {
      "command": "npx",
      "args": ["-y", "@testsprite/testsprite-mcp@latest"],
      "env": {
        "API_KEY": "YOUR_TESTSPRITE_API_KEY"
      }
    }
  }
}
```

### Claude Code CLI Command
```bash
claude mcp add TestSprite --env API_KEY="YOUR_TESTSPRITE_API_KEY" -- npx -y @testsprite/testsprite-mcp@latest
```

## Recommended Workflow

```text
1. Start your local dev server: npm run dev
2. In your agent chat:
   "Analyze this project and generate test suites using TestSprite."
3. Run and fix:
   "Execute the TestSprite suite against http://localhost:3000 and fix failing tests."
```
