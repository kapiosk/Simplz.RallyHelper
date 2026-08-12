#!/usr/bin/env bash
# Deploys the Rally Helper PWA to Cloudflare Pages.
#
# Auth (one of):
#   1) Run `wrangler login` once (opens a browser) — token is stored locally, or
#   2) Set CLOUDFLARE_API_TOKEN and CLOUDFLARE_ACCOUNT_ID env vars.
#
# Usage:
#   ./deploy-cloudflare.sh [project-name] [branch]
#
# Requires: .NET SDK and Wrangler (npm i -g wrangler, or run via npx wrangler).

set -euo pipefail

PROJECT_NAME="${1:-${CLOUDFLARE_PAGES_PROJECT:-rally-helper}}"
BRANCH="${2:-main}"
BUILD_DIR="./build"

if ! command -v dotnet >/dev/null 2>&1; then
    echo "Error: .NET SDK not found. Install it from https://dotnet.microsoft.com/download"
    exit 1
fi

if command -v wrangler >/dev/null 2>&1; then
    WRANGLER=(wrangler)
elif command -v npx >/dev/null 2>&1; then
    WRANGLER=(npx wrangler)
else
    echo "Error: wrangler not found and npx is unavailable."
    echo "Install Node.js (https://nodejs.org) and run: npm i -g wrangler"
    exit 1
fi

echo "==> Building Rally Helper PWA..."
dotnet publish RallyHelper.Pwa/RallyHelper.Pwa.csproj -c Release -o "$BUILD_DIR"

if [ ! -f "$BUILD_DIR/wwwroot/index.html" ]; then
    echo "Error: build output missing ($BUILD_DIR/wwwroot/index.html)"
    exit 1
fi

echo "==> Deploying to Cloudflare Pages project '$PROJECT_NAME' (branch: $BRANCH)"
"${WRANGLER[@]}" pages deploy "$BUILD_DIR/wwwroot" \
    --project-name="$PROJECT_NAME" \
    --branch="$BRANCH"

echo "==> Done: https://$PROJECT_NAME.pages.dev"
