#!/usr/bin/env bash
set -e

echo "=========================================="
echo "    CC-SKILLS-MCP: Fast Setup             "
echo "=========================================="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Run skills installation
bash "$SCRIPT_DIR/scripts/install-skills.sh"

echo ""
# Run MCP assistant
bash "$SCRIPT_DIR/scripts/setup-mcp.sh"

echo ""
echo "=========================================="
echo "  All Done! See README.md for next steps. "
echo "=========================================="
