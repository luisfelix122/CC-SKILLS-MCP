#!/usr/bin/env bash
set -e

echo "=========================================="
echo "    MCP Configuration Assistant           "
echo "=========================================="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
MCP_SRC="$REPO_ROOT/mcp"

echo "[1] Checking Node.js and NPX..."
if command -v node &> /dev/null && command -v npx &> /dev/null; then
  echo "    Node.js: $(node -v)"
  echo "    npx: $(npx -v)"
else
  echo "    [ERROR] Node.js is required for Chrome DevTools, Context7, and TestSprite MCPs."
  exit 1
fi

echo ""
echo "[2] Available MCP configs:"
echo "    - Master JSON: $MCP_SRC/mcp-config.json"
echo "    - Claude Desktop: $MCP_SRC/claude_desktop_config.json"
echo "    - Cursor IDE: $MCP_SRC/cursor_mcp.json"
echo "    - OpenCode: $MCP_SRC/opencode_mcp.json"

echo ""
echo "[3] Interactive Context7 Setup:"
read -p "    Run Context7 setup now? (y/N): " run_ctx7
if [[ "$run_ctx7" =~ ^[Yy]$ ]]; then
  npx ctx7 setup
fi

echo ""
echo "[✓] MCP setup review complete! Check $MCP_SRC/README.md for details."
