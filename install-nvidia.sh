#!/usr/bin/env bash
set -e

REPO="https://raw.githubusercontent.com/rnutt13/claude-web-design/main"
PROJECT_DIR="$HOME/Claude Web Design"

echo ""
echo "Installing Claude Web Design — NVIDIA team"
echo "==========================================="

# Directories
mkdir -p "$PROJECT_DIR/.claude/commands"
mkdir -p "$PROJECT_DIR/assets/logos/nvidia"
mkdir -p "$PROJECT_DIR/assets/logos/salesforce"
mkdir -p "$PROJECT_DIR/assets/logos/common"
mkdir -p "$PROJECT_DIR/projects/nvidia"
mkdir -p "$PROJECT_DIR/projects/salesforce"

# Config files
echo "Pulling config files..."
curl -fsSL "$REPO/config/CLAUDE.md" -o "$PROJECT_DIR/CLAUDE.md"
curl -fsSL "$REPO/config/commands/salesforce-brand.md" -o "$PROJECT_DIR/.claude/commands/salesforce-brand.md"
curl -fsSL "$REPO/config/commands/nvidia-brand.md" -o "$PROJECT_DIR/.claude/commands/nvidia-brand.md"

# NVIDIA logos
echo "Downloading NVIDIA logos..."
curl -fsSL "$REPO/assets/logos/nvidia/nvidia.png" -o "$PROJECT_DIR/assets/logos/nvidia/nvidia.png"

# Salesforce logos
echo "Downloading Salesforce logos..."
curl -fsSL "$REPO/assets/logos/salesforce/Salesforce.png" -o "$PROJECT_DIR/assets/logos/salesforce/Salesforce.png"

# Common logos
echo "Downloading common logos..."
curl -fsSL "$REPO/assets/logos/aws.png" -o "$PROJECT_DIR/assets/logos/common/aws.png"
curl -fsSL "$REPO/assets/logos/Slack.png" -o "$PROJECT_DIR/assets/logos/common/Slack.png"
curl -fsSL "$REPO/assets/logos/mulesoft.png" -o "$PROJECT_DIR/assets/logos/common/mulesoft.png"
curl -fsSL "$REPO/assets/logos/claude.svg" -o "$PROJECT_DIR/assets/logos/common/claude.svg"
curl -fsSL "$REPO/assets/logos/cursor.webp" -o "$PROJECT_DIR/assets/logos/common/cursor.webp"
curl -fsSL "$REPO/assets/logos/ChatGPT.png" -o "$PROJECT_DIR/assets/logos/common/ChatGPT.png"
curl -fsSL "$REPO/assets/logos/GCP small.avif" -o "$PROJECT_DIR/assets/logos/common/GCP small.avif"

# Team + version
echo "nvidia" > "$PROJECT_DIR/.team"
curl -fsSL "$REPO/VERSION" -o "$PROJECT_DIR/.version"

# CLI
echo "Installing claude-wd CLI..."
if [ -w "/usr/local/bin" ]; then
  curl -fsSL "$REPO/bin/claude-wd" -o "/usr/local/bin/claude-wd"
  chmod +x "/usr/local/bin/claude-wd"
else
  sudo curl -fsSL "$REPO/bin/claude-wd" -o "/usr/local/bin/claude-wd"
  sudo chmod +x "/usr/local/bin/claude-wd"
fi

echo ""
echo "Done. Installed to: $PROJECT_DIR"
echo ""
echo "Next steps:"
echo "  1. Open \"$PROJECT_DIR\" in Claude Code."
echo "  2. Run /nvidia-brand or /salesforce-brand to load brand tokens."
echo "  3. New HTML files will be saved to $PROJECT_DIR/projects/"
echo ""
echo "To update later:  claude-wd --update"
echo "To check version: claude-wd --version"
echo ""
