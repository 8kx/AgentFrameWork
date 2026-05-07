# AgentFrameWork Skill Installer - Windows (PowerShell)
# Installs personal skills to ~/.cursor/skills/ and records the local framework path.
#
# Usage: from the AgentFrameWork repo root, run:
#   .\scripts\install.ps1

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$cursorDir = Join-Path $env:USERPROFILE ".cursor"
$cursorSkillsDir = Join-Path $cursorDir "skills"
$skillsSource = Join-Path $repoRoot ".cursor\skills"
$pathFile = Join-Path $cursorDir "agentframework.path"

Write-Host "AgentFrameWork Skill Installer" -ForegroundColor Cyan
Write-Host "Repo:        $repoRoot"
Write-Host "Skills to:   $cursorSkillsDir"
Write-Host ""

# Create ~/.cursor/skills if it doesn't exist
if (-not (Test-Path $cursorSkillsDir)) {
    New-Item -ItemType Directory -Path $cursorSkillsDir -Force | Out-Null
}

# Write the local framework path so skills can read files directly
$repoRoot | Set-Content -Path $pathFile -Encoding UTF8
Write-Host "Framework path recorded: $pathFile" -ForegroundColor Green

# Install each skill
$skills = Get-ChildItem -Path $skillsSource -Directory
$installed = 0

foreach ($skill in $skills) {
    $dest = Join-Path $cursorSkillsDir $skill.Name

    if (Test-Path $dest) {
        Write-Host "  [$($skill.Name)] updating..." -ForegroundColor Yellow
        Remove-Item -Recurse -Force $dest
    }

    Copy-Item -Recurse -Path $skill.FullName -Destination $dest
    Write-Host "  [$($skill.Name)] installed" -ForegroundColor Green
    $installed++
}

Write-Host ""
Write-Host "Done. $installed skill(s) installed." -ForegroundColor Cyan
Write-Host ""
Write-Host "Available trigger phrases:"
Write-Host "  'init framework'    - bootstrap AgentFrameWork into any project"
Write-Host "  'upgrade framework' - audit and upgrade an existing project"
Write-Host ""
Write-Host "Re-run after pulling updates to keep skills current."
