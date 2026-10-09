# One-click PowerShell installer for Windows
$ErrorActionPreference = "Stop"

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "    PRH: Skills & MCP Fast Setup          " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# 1. Install skills
& (Join-Path $ScriptDir "scripts\install-skills.ps1")

Write-Host ""
# 2. Setup MCPs
& (Join-Path $ScriptDir "scripts\setup-mcp.ps1")

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  All Done! See README.md for next steps. " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
