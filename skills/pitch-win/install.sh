#!/usr/bin/env bash
# ==============================================================================
# Pitch-Win: Universal One-Line Installer (Linux / macOS / WSL)
# Open-Source AI Skill for 3-Minute Winning Pitches
# Repository: https://github.com/luisfelix122/CC-SKILLS-MCP
# ==============================================================================
set -e

echo -e "\033[1;36m====================================================\033[0m"
echo -e "\033[1;33m   PITCH-WIN: 3-Minute Hackathon Pitch Skill       \033[0m"
echo -e "\033[1;36m   Open Source AI Agent Skill for Winners           \033[0m"
echo -e "\033[1;36m====================================================\033[0m"

# Target directory selection
if [ -n "$1" ]; then
    DEST="$1"
elif [ "$GLOBAL" = "1" ] || [ ! -d ".git" ]; then
    DEST="$HOME/.agents/skills/pitch-win"
    echo -e "\033[0;37m[*] Target mode: Global installation (~/.agents/skills/pitch-win)\033[0m"
else
    DEST="$(pwd)/.agents/skills/pitch-win"
    echo -e "\033[0;37m[*] Target mode: Project-local (.agents/skills/pitch-win)\033[0m"
fi

BASE_URL="https://raw.githubusercontent.com/luisfelix122/CC-SKILLS-MCP/main/skills/pitch-win"

FILES=(
    "SKILL.md"
    "references/delivery-techniques.md"
    "references/piura-ecosystem.md"
    "references/canvas-guidelines.md"
    "assets/template-pitch.html"
)

echo -e "\033[1;32m[+] Installing pitch-win to: $DEST\033[0m"

mkdir -p "$DEST/references"
mkdir -p "$DEST/assets"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" 2>/dev/null || echo ".")" && pwd)"

for file in "${FILES[@]}"; do
    TARGET_FILE="$DEST/$file"
    if [ -f "$SCRIPT_DIR/SKILL.md" ] && [ -f "$SCRIPT_DIR/$file" ]; then
        echo -e "\033[0;37m    -> Copying $file\033[0m"
        cp "$SCRIPT_DIR/$file" "$TARGET_FILE"
    else
        echo -e "\033[0;37m    -> Downloading $file\033[0m"
        curl -fsSL "$BASE_URL/$file" -o "$TARGET_FILE"
    fi
done

echo ""
echo -e "\033[1;32m[OK] Pitch-Win installed successfully!\033[0m"
echo -e "     Your AI agent can now craft winning 3-minute pitches."
echo -e "\033[1;36m====================================================\033[0m"
