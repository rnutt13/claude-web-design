#!/usr/bin/env bash
set -e

REPO="https://raw.githubusercontent.com/rnutt13/claude-web-design/main"
PROJECT_DIR="$HOME/Claude Web Design"

echo ""
echo "Installing Claude Web Design — NVIDIA team"
echo "==========================================="

mkdir -p "$PROJECT_DIR/.claude/commands"
mkdir -p "$PROJECT_DIR/assets/logos/nvidia"
mkdir -p "$PROJECT_DIR/assets/logos/salesforce"
mkdir -p "$PROJECT_DIR/projects/nvidia"
mkdir -p "$PROJECT_DIR/projects/salesforce"

echo "Pulling config files..."
curl -fsSL "$REPO/config/CLAUDE.md" -o "$PROJECT_DIR/CLAUDE.md"
curl -fsSL "$REPO/config/commands/salesforce-brand.md" -o "$PROJECT_DIR/.claude/commands/salesforce-brand.md"
curl -fsSL "$REPO/config/commands/nvidia-brand.md" -o "$PROJECT_DIR/.claude/commands/nvidia-brand.md"

echo "nvidia" > "$PROJECT_DIR/.team"
curl -fsSL "$REPO/VERSION" -o "$PROJECT_DIR/.version"

echo "Installing claude-wd CLI..."
if [ -w "/usr/local/bin" ]; then
  curl -fsSL "$REPO/bin/claude-wd" -o "/usr/local/bin/claude-wd"
  chmod +x "/usr/local/bin/claude-wd"
else
  sudo curl -fsSL "$REPO/bin/claude-wd" -o "/usr/local/bin/claude-wd"
  sudo chmod +x "/usr/local/bin/claude-wd"
fi

cat > "$PROJECT_DIR/assets/logos/nvidia/README.md" << 'EOF'
# NVIDIA Logos

Drop the following file here:

- `nvidia.png` — NVIDIA eye mark logo (white background)
  Use `mix-blend-mode: screen` in CSS to make the white bg invisible on dark pages.
EOF

cat > "$PROJECT_DIR/assets/logos/salesforce/README.md" << 'EOF'
# Salesforce Logos

Drop the following file here:

- `Salesforce.png` — Salesforce cloud wordmark
  No special CSS treatment needed — works as-is on white backgrounds.
EOF

echo ""
echo "Done. Installed to: $PROJECT_DIR"
echo ""
echo "Next steps:"
echo "  1. Add logos to $PROJECT_DIR/assets/logos/"
echo "     See the README in each subfolder for exactly which files to drop in."
echo "  2. Open \"$PROJECT_DIR\" in Claude Code."
echo "  3. Run /nvidia-brand or /salesforce-brand to load brand tokens."
echo "  4. New HTML files will be saved to $PROJECT_DIR/projects/"
echo ""
echo "To update later:  claude-wd --update"
echo "To check version: claude-wd --version"
echo ""
