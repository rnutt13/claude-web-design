#!/usr/bin/env bash
set -e

REPO="https://raw.githubusercontent.com/rnutt13/claude-web-design/main"
PROJECT_DIR="$HOME/Claude Web Design"

echo ""
echo "Installing Claude Web Design — Disney team"
echo "==========================================="

# Create directory structure
mkdir -p "$PROJECT_DIR/.claude/commands"
mkdir -p "$PROJECT_DIR/assets/logos/disney"
mkdir -p "$PROJECT_DIR/assets/logos/salesforce"
mkdir -p "$PROJECT_DIR/disney"
mkdir -p "$PROJECT_DIR/salesforce"

# Pull config files
echo "Pulling config files..."
curl -fsSL "$REPO/config/CLAUDE.md" -o "$PROJECT_DIR/CLAUDE.md"
curl -fsSL "$REPO/config/commands/salesforce-brand.md" -o "$PROJECT_DIR/.claude/commands/salesforce-brand.md"
curl -fsSL "$REPO/config/commands/disney-brand.md" -o "$PROJECT_DIR/.claude/commands/disney-brand.md"
curl -fsSL "$REPO/config/commands/disneyplus-brand.md" -o "$PROJECT_DIR/.claude/commands/disneyplus-brand.md"

# Record team and version
echo "disney" > "$PROJECT_DIR/.team"
curl -fsSL "$REPO/VERSION" -o "$PROJECT_DIR/.version"

# Install CLI
echo "Installing claude-wd CLI..."
curl -fsSL "$REPO/bin/claude-wd" -o "/usr/local/bin/claude-wd"
chmod +x "/usr/local/bin/claude-wd"

# Logo READMEs
cat > "$PROJECT_DIR/assets/logos/disney/README.md" << 'EOF'
# Disney Logos

Drop the following files here:

- `imgi_52_D_Blue-Logo.png`                    — Disney+ wordmark (black on white; invert for dark bg)
- `imgi_37_MARVEL_STUDIOS_LOGO.jpg`            — Marvel Studios (red bg; mix-blend-mode:screen)
- `imgi_38_1920-lucasfilm-logo.jpg`            — Lucasfilm (black; invert for dark)
- `imgi_36_Pixar-Logo.jpg`                     — Pixar (black; invert for dark)
- `imgi_35_Walt-Disney-Animation-Studios-Logo.jpg` — Disney Animation (black; invert)
- `imgi_51_NG_logo_black.png`                  — National Geographic (yellow rect; mix-blend-mode:screen)
- `imgi_49_FX-Logo-.png`                       — FX (black; invert for dark)
- `imgi_50_HuluOriginals_800px.png`            — Hulu Originals
- `imgi_57_ESPN_PLUS_LOGO-1.png`               — ESPN+
- `The Walt Disney Company.svg`                — Walt Disney Company corporate mark (invert for dark)
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
echo "  2. Open $PROJECT_DIR in Claude Code."
echo "  3. Run /disney-brand, /disneyplus-brand, or /salesforce-brand to load brand tokens."
echo ""
echo "To update later: claude-wd --update"
echo "To check version: claude-wd --version"
echo ""
