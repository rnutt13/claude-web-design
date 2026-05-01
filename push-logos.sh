#!/usr/bin/env bash
set -e

# Run this from your webDesign directory to upload logos to GitHub.
# Usage: cd /Users/rnutt/Brains/webDesign && bash push-logos.sh
#
# Requires git and that you have push access to the repo.

REPO="https://github.com/rnutt13/claude-web-design.git"
LOGOS_SRC="$(pwd)/assets/logos"
TEMP_DIR=$(mktemp -d)

if [ ! -d "$LOGOS_SRC" ]; then
  echo "Error: assets/logos not found. Run this script from your webDesign directory."
  exit 1
fi

echo "Cloning repo..."
git clone "$REPO" "$TEMP_DIR" --quiet

echo "Copying logos..."
mkdir -p "$TEMP_DIR/assets"
cp -r "$LOGOS_SRC" "$TEMP_DIR/assets/"

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
