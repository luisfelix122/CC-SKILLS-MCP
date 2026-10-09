# Log Analyzer MCP Server

Official Repository: [djm81/log_analyzer_mcp](https://github.com/djm81/log_analyzer_mcp)  
Package: `log-analyzer-mcp` (PyPI)

Log Analyzer MCP provides AI coding assistants with log parsing, error extraction, test run summarization, and coverage reporting capabilities directly inside Cursor, Claude, OpenCode, and VS Code.

## Features

- **Test Log Summarization (`analyze_tests`)**: Parses unit, integration, and E2E test output, isolating failures, stack traces, and slow tests.
- **Targeted Test Execution (`run_unit_test`)**: Triggers specific unit test executions directly from your AI assistant.
- **Code Coverage Reports (`create_coverage_report`)**: Generates and formats on-demand test coverage summaries.
- **Advanced Log Searching**: Filter log records across time windows, regex patterns, or first/last N records with configurable context lines.

## Prerequisites

- Python 3.9+ installed.
- [`uv`](https://github.com/astral-sh/uv) (recommended for running isolated tools via `uvx`) or `pip`.

```bash
# Recommended runner: install uv
pip install uv
```

## Configuration

### Using `uvx` (Recommended - No global install required)

Add to your MCP configuration (e.g. `.cursor/mcp.json` or `claude_desktop_config.json`):

```json
{
  "mcpServers": {
    "log-analyzer": {
      "command": "uvx",
      "args": [
        "log-analyzer-mcp"
      ],
      "env": {
        "PYTHONUNBUFFERED": "1",
        "PYTHONIOENCODING": "utf-8",
        "MCP_LOG_LEVEL": "INFO",
        "LOG_DIRECTORIES": "[\"./logs\", \"./test-results\"]"
      }
    }
  }
}
```

### Using Python / Pip Direct Entrypoint

If you installed via `pip install log-analyzer-mcp`:

```json
{
  "mcpServers": {
    "log-analyzer": {
      "command": "log-analyzer-mcp",
      "args": ["--transport", "stdio"],
      "env": {
        "PYTHONUNBUFFERED": "1",
        "PYTHONIOENCODING": "utf-8",
        "LOG_DIRECTORIES": "[\"./logs\"]"
      }
    }
  }
}
```

## Environment Variables

| Variable | Description | Example |
| :--- | :--- | :--- |
| `LOG_DIRECTORIES` | JSON array of directories to scan for logs | `["./logs", "./var/log"]` |
| `LOG_PATTERNS_ERROR` | Regex patterns to identify error lines | `["Exception:.*", "ERROR.*"]` |
| `LOG_CONTEXT_LINES_BEFORE` | Number of context lines before an error | `3` |
| `LOG_CONTEXT_LINES_AFTER` | Number of context lines after an error | `5` |
| `MCP_LOG_LEVEL` | Log level for the MCP server | `INFO` |
