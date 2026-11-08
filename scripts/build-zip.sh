#!/usr/bin/env bash
# Builds dist/leeward-web.zip for uploading to claude.ai (Settings → Capabilities → Skills).
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p dist
rm -f dist/leeward-web.zip
(cd skills && zip -rq ../dist/leeward-web.zip leeward-web)
echo "dist/leeward-web.zip"
