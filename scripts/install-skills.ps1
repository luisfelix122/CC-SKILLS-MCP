# PowerShell script to install skills for Windows users
$ErrorActionPreference = "Stop"

# Configurar la consola para manejar correctamente la codificación UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  Installing Skills for Coding Agents    " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Split-Path -Parent $ScriptDir
$SkillsSrc = Join-Path $RepoRoot "skills"

$TargetDirs = @(
    (Join-Path $env:USERPROFILE ".agents\skills"),
    (Join-Path $env:USERPROFILE ".config\opencode\skills")
)

foreach ($Target in $TargetDirs) {
    Write-Host "[+] Setting up target: $Target" -ForegroundColor Green
    if (-not (Test-Path $Target)) {
        New-Item -ItemType Directory -Path $Target -Force | Out-Null
    }

    if (Test-Path $SkillsSrc) {
        Get-ChildItem -Directory $SkillsSrc | ForEach-Object {
            $dest = Join-Path $Target $_.Name
            Write-Host "    -> Copying $($_.Name) to $Target" -ForegroundColor Gray
            Copy-Item -Recurse -Force $_.FullName $dest
        }
    } else {
        Write-Host "[-] Warning: Source folder '$SkillsSrc' not found." -ForegroundColor Yellow
    }
}

# Check agent-browser CLI
if (-not (Get-Command "agent-browser" -ErrorAction SilentlyContinue)) {
    Write-Host ""
    Write-Host "[!] Notice: agent-browser CLI is not installed globally." -ForegroundColor Yellow
    Write-Host "    To enable browser automation for OpenCode, run:" -ForegroundColor Yellow
    Write-Host "    npm install -g agent-browser; agent-browser install" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "[OK] All skills installed successfully!" -ForegroundColor Green
