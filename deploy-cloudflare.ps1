# Deploys the Rally Helper PWA to Cloudflare Pages.
#
# Auth (one of):
#   1) Run `wrangler login` once (opens a browser) - token is stored locally, or
#   2) Set $env:CLOUDFLARE_API_TOKEN and $env:CLOUDFLARE_ACCOUNT_ID.
#
# Usage:
#   .\deploy-cloudflare.ps1 [-ProjectName rally-helper] [-Branch main]
#
# Requires: .NET SDK and Wrangler (npm i -g wrangler, or run via npx wrangler).

param(
    [string]$ProjectName = "",
    [string]$Branch = "main"
)

$ErrorActionPreference = "Stop"

if (-not $ProjectName) { $ProjectName = $env:CLOUDFLARE_PAGES_PROJECT }
if (-not $ProjectName) { $ProjectName = "rally-helper" }

$BuildDir = "./build"

if (-not (Get-Command dotnet -ErrorAction SilentlyContinue)) {
    Write-Error ".NET SDK not found. Install it from https://dotnet.microsoft.com/download"
    exit 1
}

if (Get-Command wrangler -ErrorAction SilentlyContinue) {
    $Wrangler = "wrangler"
} elseif (Get-Command npx -ErrorAction SilentlyContinue) {
    $Wrangler = "npx wrangler"
} else {
    Write-Error "wrangler not found and npx is unavailable. Install Node.js (https://nodejs.org) and run: npm i -g wrangler"
    exit 1
}

Write-Host "==> Building Rally Helper PWA..."
dotnet publish RallyHelper.Pwa/RallyHelper.Pwa.csproj -c Release -o $BuildDir

if (-not (Test-Path "$BuildDir/wwwroot/index.html")) {
    Write-Error "Build output missing ($BuildDir/wwwroot/index.html)"
    exit 1
}

Write-Host "==> Deploying to Cloudflare Pages project '$ProjectName' (branch: $Branch)"
Invoke-Expression "$Wrangler pages deploy `"$BuildDir/wwwroot`" --project-name=$ProjectName --branch=$Branch"

Write-Host "==> Done: https://$ProjectName.pages.dev"
