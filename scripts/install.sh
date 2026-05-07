#!/usr/bin/env bash
# AgentFrameWork Skill Installer - macOS / Linux
# Installs personal skills to ~/.cursor/skills/ and records the local framework path.
#
# Usage: from the AgentFrameWork repo root, run:
#   bash scripts/install.sh

set -e

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CURSOR_DIR="$HOME/.cursor"
CURSOR_SKILLS_DIR="$CURSOR_DIR/skills"
SKILLS_SOURCE="$REPO_ROOT/.cursor/skills"
PATH_FILE="$CURSOR_DIR/agentframework.path"

echo ""
echo "AgentFrameWork Skill Installer"
echo "Repo:      $REPO_ROOT"
echo "Skills to: $CURSOR_SKILLS_DIR"
echo ""

mkdir -p "$CURSOR_SKILLS_DIR"

# Write the local framework path so skills can read files directly
echo "$REPO_ROOT" > "$PATH_FILE"
echo "Framework path recorded: $PATH_FILE"

installed=0

for skill_dir in "$SKILLS_SOURCE"/*/; do
    skill_name="$(basename "$skill_dir")"
    dest="$CURSOR_SKILLS_DIR/$skill_name"

    if [ -d "$dest" ]; then
        echo "  [$skill_name] updating..."
        rm -rf "$dest"
    fi

    cp -r "$skill_dir" "$dest"
    echo "  [$skill_name] installed"
    installed=$((installed + 1))
done

echo ""
echo "Done. $installed skill(s) installed."
echo ""
echo "Available trigger phrases:"
echo "  'init framework'    - bootstrap AgentFrameWork into any project"
echo "  'upgrade framework' - audit and upgrade an existing project"
echo ""
echo "Re-run after pulling updates to keep skills current."
