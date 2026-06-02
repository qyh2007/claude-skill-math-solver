#!/usr/bin/env bash
# install.sh — Install math-solver skill for Claude Code
# Usage: bash install.sh [target-dir]
#   Default target: ~/.claude/skills/math-solver

set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_NAME="math-solver"
DEFAULT_TARGET="${HOME}/.claude/skills/${SKILL_NAME}"
TARGET="${1:-$DEFAULT_TARGET}"

mkdir -p "$TARGET"

cp "$SOURCE_DIR/SKILL.md" "$TARGET/SKILL.md"

echo "✓ Installed ${SKILL_NAME} to ${TARGET}"
echo "  Restart Claude Code or run /${SKILL_NAME} to use it."
