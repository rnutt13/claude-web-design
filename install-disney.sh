#!/usr/bin/env bash
set -e

REPO="https://raw.githubusercontent.com/rnutt13/claude-web-design/main"
PROJECT_DIR="$HOME/Claude Web Design"

echo ""
echo "Installing Claude Web Design — Disney team"
echo "==========================================="

# Directories
mkdir -p "$PROJECT_DIR/.claude/commands"
mkdir -p "$PROJECT_DIR/assets/logos/disney"
mkdir -p "$PROJECT_DIR/assets/logos/salesforce"
mkdir -p "$PROJECT_DIR/assets/logos/common"
mkdir -p "$PROJECT_DIR/projects/disney"
mkdir -p "$PROJECT_DIR/projects/salesforce"

# Config files
echo "Pulling config files..."
curl -fsSL "$REPO/config/CLAUDE.md" -o "$PROJECT_DIR/CLAUDE.md"
curl -fsSL "$REPO/config/commands/salesforce-brand.md" -o "$PROJECT_DIR/.claude/commands/salesforce-brand.md"
curl -fsSL "$REPO/config/commands/disney-brand.md" -o "$PROJECT_DIR/.claude/commands/disney-brand.md"
curl -fsSL "$REPO/config/commands/disneyplus-brand.md" -o "$PROJECT_DIR/.claude/commands/disneyplus-brand.md"

# Disney logos
echo "Downloading Disney logos..."
DISNEY="$PROJECT_DIR/assets/logos/disney"
curl -fsSL "$REPO/assets/logos/disney/imgi_34_The-Walt-Disney-Studios1.png" -o "$DISNEY/imgi_34_The-Walt-Disney-Studios1.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_35_Walt-Disney-Animation-Studios-Logo.jpg" -o "$DISNEY/imgi_35_Walt-Disney-Animation-Studios-Logo.jpg"
curl -fsSL "$REPO/assets/logos/disney/imgi_36_Pixar-Logo.jpg" -o "$DISNEY/imgi_36_Pixar-Logo.jpg"
curl -fsSL "$REPO/assets/logos/disney/imgi_37_MARVEL_STUDIOS_LOGO.jpg" -o "$DISNEY/imgi_37_MARVEL_STUDIOS_LOGO.jpg"
curl -fsSL "$REPO/assets/logos/disney/imgi_38_1920-lucasfilm-logo.jpg" -o "$DISNEY/imgi_38_1920-lucasfilm-logo.jpg"
curl -fsSL "$REPO/assets/logos/disney/imgi_39_Disney-Theatrical-Group1.png" -o "$DISNEY/imgi_39_Disney-Theatrical-Group1.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_40_20th_century_studios.png" -o "$DISNEY/imgi_40_20th_century_studios.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_41_SLP-logo.png" -o "$DISNEY/imgi_41_SLP-logo.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_42_200723_20th_01.jpg" -o "$DISNEY/imgi_42_200723_20th_01.jpg"
curl -fsSL "$REPO/assets/logos/disney/imgi_43_ABCEnt_2018LogoForRelease.png" -o "$DISNEY/imgi_43_ABCEnt_2018LogoForRelease.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_44_2018-abc-news-logo-promo-black.png" -o "$DISNEY/imgi_44_2018-abc-news-logo-promo-black.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_45_ABC_signature_png.png" -o "$DISNEY/imgi_45_ABC_signature_png.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_46_ABC_OTV-HORIZONTAL-STACKED_BW-FLAT_2022.png" -o "$DISNEY/imgi_46_ABC_OTV-HORIZONTAL-STACKED_BW-FLAT_2022.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_47_Disney-Branded-Television_horizontal.png" -o "$DISNEY/imgi_47_Disney-Branded-Television_horizontal.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_48_Freeform_Wordmark_RGB_Electric-Pink91.png" -o "$DISNEY/imgi_48_Freeform_Wordmark_RGB_Electric-Pink91.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_49_FX-Logo-.png" -o "$DISNEY/imgi_49_FX-Logo-.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_50_HuluOriginals_800px.png" -o "$DISNEY/imgi_50_HuluOriginals_800px.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_51_NG_logo_black.png" -o "$DISNEY/imgi_51_NG_logo_black.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_52_D_Blue-Logo.png" -o "$DISNEY/imgi_52_D_Blue-Logo.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_53_hulu-logo.png" -o "$DISNEY/imgi_53_hulu-logo.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_54_Hotstar-reverse-logo.jpg" -o "$DISNEY/imgi_54_Hotstar-reverse-logo.jpg"
curl -fsSL "$REPO/assets/logos/disney/imgi_55_Disney-Music-Group1.png" -o "$DISNEY/imgi_55_Disney-Music-Group1.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_56_ESPN-Logo.jpg" -o "$DISNEY/imgi_56_ESPN-Logo.jpg"
curl -fsSL "$REPO/assets/logos/disney/imgi_57_ESPN_PLUS_LOGO-1.png" -o "$DISNEY/imgi_57_ESPN_PLUS_LOGO-1.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_58_Disneyland-Logo.jpg" -o "$DISNEY/imgi_58_Disneyland-Logo.jpg"
curl -fsSL "$REPO/assets/logos/disney/imgi_59_Walt-Disney-World.png" -o "$DISNEY/imgi_59_Walt-Disney-World.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_60_Shanghai-Disney-Resort-Logo1.jpg" -o "$DISNEY/imgi_60_Shanghai-Disney-Resort-Logo1.jpg"
curl -fsSL "$REPO/assets/logos/disney/imgi_61_Disneyland-Paris-Logo-Jan-2026.png" -o "$DISNEY/imgi_61_Disneyland-Paris-Logo-Jan-2026.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_62_Tokyo-Disney-Resort-Logo.jpg" -o "$DISNEY/imgi_62_Tokyo-Disney-Resort-Logo.jpg"
curl -fsSL "$REPO/assets/logos/disney/imgi_63_Hong-Kong-Disneyland-Logo.jpg" -o "$DISNEY/imgi_63_Hong-Kong-Disneyland-Logo.jpg"
curl -fsSL "$REPO/assets/logos/disney/imgi_64_DCL_logo_vert_BLUE_Crop.png" -o "$DISNEY/imgi_64_DCL_logo_vert_BLUE_Crop.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_65_Disney-Vacation-Club.png" -o "$DISNEY/imgi_65_Disney-Vacation-Club.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_66_Aulani-Logo.jpg" -o "$DISNEY/imgi_66_Aulani-Logo.jpg"
curl -fsSL "$REPO/assets/logos/disney/imgi_67_AdventuresbyDisney.png" -o "$DISNEY/imgi_67_AdventuresbyDisney.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_68_WDI_Logo.png" -o "$DISNEY/imgi_68_WDI_Logo.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_69_Disney-Publishing-Worldwide-041.png" -o "$DISNEY/imgi_69_Disney-Publishing-Worldwide-041.png"
curl -fsSL "$REPO/assets/logos/disney/imgi_70_CPC-Disney-store_shopDisney_Logo-Blue_2019_10_15.jpg" -o "$DISNEY/imgi_70_CPC-Disney-store_shopDisney_Logo-Blue_2019_10_15.jpg"
curl -fsSL "$REPO/assets/logos/disney/imgi_71_ot_company_logo.png" -o "$DISNEY/imgi_71_ot_company_logo.png"
curl -fsSL "$REPO/assets/logos/disney/MickeyMouse.png" -o "$DISNEY/MickeyMouse.png"
curl -fsSL "$REPO/assets/logos/disney/The%20Walt%20Disney%20Company.svg" -o "$DISNEY/The Walt Disney Company.svg"

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
echo "disney" > "$PROJECT_DIR/.team"
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
echo "  2. Run /disney-brand, /disneyplus-brand, or /salesforce-brand to load brand tokens."
echo "  3. New HTML files will be saved to $PROJECT_DIR/projects/"
echo ""
echo "To update later:  claude-wd --update"
echo "To check version: claude-wd --version"
echo ""
