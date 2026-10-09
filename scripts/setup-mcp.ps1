# PowerShell script to assist with MCP setup for Windows users
$ErrorActionPreference = "Stop"

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "    MCP Configuration Assistant           " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Split-Path -Parent $ScriptDir
$McpSrc = Join-Path $RepoRoot "mcp"

Write-Host "[1] Checking Node.js and NPX..." -ForegroundColor Green
if ((Get-Command "node" -ErrorAction SilentlyContinue) -and (Get-Command "npx" -ErrorAction SilentlyContinue)) {
    $nodeVer = node -v
    $npxVer = npx -v
    Write-Host "    Node.js: $nodeVer" -ForegroundColor Gray
    Write-Host "    npx: $npxVer" -ForegroundColor Gray
} else {
    Write-Host "    [ERROR] Node.js is required for Chrome DevTools, Context7, and TestSprite MCPs." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "[2] Available MCP configs:" -ForegroundColor Green
Write-Host "    - Master JSON: $(Join-Path $McpSrc 'mcp-config.json')" -ForegroundColor Gray
Write-Host "    - Claude Desktop: $(Join-Path $McpSrc 'claude_desktop_config.json')" -ForegroundColor Gray
Write-Host "    - Cursor IDE: $(Join-Path $McpSrc 'cursor_mcp.json')" -ForegroundColor Gray
Write-Host "    - OpenCode: $(Join-Path $McpSrc 'opencode_mcp.json')" -ForegroundColor Gray

Write-Host ""
$runCtx7 = Read-Host "[3] Run Context7 interactive setup now? (y/N)"
if ($runCtx7 -eq 'y' -or $runCtx7 -eq 'Y') {
    npx ctx7 setup
}

Write-Host ""
Write-Host "[✓] MCP setup review complete! Check $(Join-Path $McpSrc 'README.md') for details." -ForegroundColor Green
