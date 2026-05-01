#!/usr/bin/env bash
set -e

# Run this from your webDesign directory to upload logos to GitHub.
# Usage: cd /Users/rnutt/Brains/webDesign && bash push-logos.sh
#
# Requires gh CLI (brew install gh) and that you are logged in (gh auth login).

LOGOS_SRC="$(pwd)/assets/logos"
TEMP_DIR=$(mktemp -d)

if [ ! -d "$LOGOS_SRC" ]; then
  echo "Error: assets/logos not found. Run this script from your webDesign directory."
  exit 1
fi

if ! command -v gh &>/dev/null; then
  echo "Error: gh CLI not found. Install it with: brew install gh"
  exit 1
fi

# Get auth token from gh CLI
GH_TOKEN=$(gh auth token)
REMOTE="https://rnutt13:${GH_TOKEN}@github.com/rnutt13/claude-web-design.git"

echo "Cloning repo..."
git clone "$REMOTE" "$TEMP_DIR" --quiet

echo "Copying logos..."
mkdir -p "$TEMP_DIR/assets"
cp -r "$LOGOS_SRC" "$TEMP_DIR/assets/"

# Remove .DS_Store files
find "$TEMP_DIR/assets" -name '.DS_Store' -delete

cd "$TEMP_DIR"
git add assets/

if git diff --cached --quiet; then
  echo "No changes — logos are already up to date."
else
  git commit -m "Add logo assets"
  git push
  echo "Done. Logos uploaded to GitHub."
fi

rm -rf "$TEMP_DIR"
