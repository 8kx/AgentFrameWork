# AgentFrameWork Skill Installer - Windows (PowerShell)
# Installs personal skills to ~/.cursor/skills/ so they are available in all projects
#
# Usage: from the AgentFrameWork repo root, run:
#   .\scripts\install.ps1

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$cursorSkillsDir = Join-Path $env:USERPROFILE ".cursor\skills"
$skillsSource = Join-Path $repoRoot ".cursor\skills"

Write-Host "AgentFrameWork Skill Installer" -ForegroundColor Cyan
Write-Host "Source:      $skillsSource"
Write-Host "Destination: $cursorSkillsDir"
Write-Host ""

if (-not (Test-Path $cursorSkillsDir)) {
    New-Item -ItemType Directory -Path $cursorSkillsDir -Force | Out-Null
    Write-Host "Created $cursorSkillsDir" -ForegroundColor Green
}

$skills = Get-ChildItem -Path $skillsSource -Directory
$installed = 0

foreach ($skill in $skills) {
    $dest = Join-Path $cursorSkillsDir $skill.Name

    if (Test-Path $dest) {
        Write-Host "  [$($skill.Name)] already exists - updating..." -ForegroundColor Yellow
        Remove-Item -Recurse -Force $dest
    }

    Copy-Item -Recurse -Path $skill.FullName -Destination $dest
    Write-Host "  [$($skill.Name)] installed" -ForegroundColor Green
    $installed++
}

Write-Host ""
Write-Host "Done. $installed skill(s) installed to $cursorSkillsDir" -ForegroundColor Cyan
Write-Host ""
Write-Host "Available trigger phrases:"
Write-Host "  'init framework'    - bootstrap AgentFrameWork into any project"
Write-Host "  'upgrade framework' - audit and upgrade an existing project"
Write-Host ""
Write-Host "Re-run this script after pulling updates to keep skills current."
