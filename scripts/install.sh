#!/usr/bin/env bash
# AgentFrameWork Skill Installer — macOS / Linux
# Installs personal skills to ~/.cursor/skills/ so they are available in all projects
#
# Usage: from the AgentFrameWork repo root, run:
#   bash scripts/install.sh

set -e

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CURSOR_SKILLS_DIR="$HOME/.cursor/skills"
SKILLS_SOURCE="$REPO_ROOT/.cursor/skills"

echo ""
echo "AgentFrameWork Skill Installer"
echo "Source:      $SKILLS_SOURCE"
echo "Destination: $CURSOR_SKILLS_DIR"
echo ""

# Create ~/.cursor/skills if it doesn't exist
mkdir -p "$CURSOR_SKILLS_DIR"

# Install each skill
installed=0

for skill_dir in "$SKILLS_SOURCE"/*/; do
    skill_name="$(basename "$skill_dir")"
    dest="$CURSOR_SKILLS_DIR/$skill_name"

    if [ -d "$dest" ]; then
        echo "  [$skill_name] already exists — updating..."
        rm -rf "$dest"
    fi

    cp -r "$skill_dir" "$dest"
    echo "  [$skill_name] installed"
    installed=$((installed + 1))
done

echo ""
echo "Done. $installed skill(s) installed to $CURSOR_SKILLS_DIR"
echo ""
echo "Available trigger phrases:"
echo "  'init framework'     — bootstrap AgentFrameWork into any project"
echo "  'upgrade framework'  — audit and upgrade an existing project"
echo ""
echo "Re-run this script after pulling framework updates to keep skills current."
