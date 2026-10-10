# ==============================================================================
# Pitch-Win: Universal One-Line Installer (Windows PowerShell)
# Open-Source AI Skill for 3-Minute Winning Pitches
# Repository: https://github.com/luisfelix122/CC-SKILLS-MCP
# ==============================================================================
[CmdletBinding()]
param(
    [switch]$Global,
    [string]$TargetDir = ""
)

$ErrorActionPreference = "Stop"

Write-Host "====================================================" -ForegroundColor Cyan
Write-Host "   PITCH-WIN: 3-Minute Hackathon Pitch Skill       " -ForegroundColor Yellow
Write-Host "   Open Source AI Agent Skill for Winners           " -ForegroundColor Cyan
Write-Host "====================================================" -ForegroundColor Cyan

# Determine target directory
if ($TargetDir -ne "") {
    $Dest = $TargetDir
} elseif ($Global -or (-not (Test-Path ".git") -and -not (Test-Path "package.json"))) {
    $Dest = Join-Path $env:USERPROFILE ".agents\skills\pitch-win"
    Write-Host "[*] Target mode: Global installation (~/.agents/skills/pitch-win)" -ForegroundColor Gray
} else {
    $Dest = Join-Path (Get-Location) ".agents\skills\pitch-win"
    Write-Host "[*] Target mode: Project-local (.agents/skills/pitch-win)" -ForegroundColor Gray
}

# Source base URL
$BaseUrl = "https://raw.githubusercontent.com/luisfelix122/CC-SKILLS-MCP/main/skills/pitch-win"

$Files = @(
    "SKILL.md",
    "references/delivery-techniques.md",
    "references/piura-ecosystem.md",
    "references/canvas-guidelines.md",
    "assets/template-pitch.html"
)

Write-Host "[+] Installing pitch-win to: $Dest" -ForegroundColor Green

# Ensure directories exist
New-Item -ItemType Directory -Path (Join-Path $Dest "references") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $Dest "assets") -Force | Out-Null

# Check if installing from local repo or remote URL
$LocalScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path -ErrorAction SilentlyContinue
$IsLocal = ($LocalScriptDir -and (Test-Path (Join-Path $LocalScriptDir "SKILL.md")))

foreach ($file in $Files) {
    $targetFilePath = Join-Path $Dest $file
    if ($IsLocal) {
        $sourcePath = Join-Path $LocalScriptDir $file
        Write-Host "    -> Copying $file" -ForegroundColor Gray
        Copy-Item -Path $sourcePath -Destination $targetFilePath -Force
    } else {
        $downloadUrl = "$BaseUrl/$file"
        Write-Host "    -> Downloading $file" -ForegroundColor Gray
        Invoke-WebRequest -Uri $downloadUrl -OutFile $targetFilePath -UseBasicParsing
    }
}

Write-Host ""
Write-Host "[OK] Pitch-Win installed successfully!" -ForegroundColor Green
Write-Host "     Your AI agent (Antigravity, Claude, Cursor, OpenCode) can now use:" -ForegroundColor White
Write-Host "     'pitch-win' whenever you ask for a 3-minute hackathon pitch." -ForegroundColor Yellow
Write-Host "====================================================" -ForegroundColor Cyan
