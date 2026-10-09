#!/usr/bin/env bash
set -e

echo "=========================================="
echo "  Installing Skills for Coding Agents    "
echo "=========================================="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILLS_SRC="$REPO_ROOT/skills"

# 1. Target directories to support OpenCode, Claude Code, Cursor, Antigravity
TARGET_DIRS=(
  "$HOME/.agents/skills"
  "$HOME/.config/opencode/skills"
)

for TARGET in "${TARGET_DIRS[@]}"; do
  echo "[+] Setting up target: $TARGET"
  mkdir -p "$TARGET"
  
  for skill_dir in "$SKILLS_SRC"/*; do
    if [ -d "$skill_dir" ]; then
      skill_name="$(basename "$skill_dir")"
      echo "    -> Copying $skill_name to $TARGET"
      cp -R "$skill_dir" "$TARGET/"
    fi
  done
done

# 2. Check if agent-browser CLI is installed
if ! command -v agent-browser &> /dev/null; then
  echo ""
  echo "[!] Notice: agent-browser CLI is not installed globally."
  echo "    To enable browser automation for OpenCode, run:"
  echo "    npm install -g agent-browser && agent-browser install"
fi

echo ""
echo "[✓] All skills installed successfully!"
