# PowerShell script voor installatie van .NET SDK, Git, het clonen van de repository en uitvoeren van de EasyDevOps app

# Functie om te controleren of een commando bestaat
function Check-Command {
    param([string]$command)
    $commandPath = Get-Command $command -ErrorAction SilentlyContinue
    if ($null -eq $commandPath) {
        Write-Host "$command is niet geïnstalleerd. Aan het installeren..." -ForegroundColor Red
        return $false
    }
    return $true
}

# Installeren van .NET SDK 8
Write-Host "Controleren op .NET SDK installatie..." -ForegroundColor Cyan
if (-not (Check-Command "dotnet")) {
    Write-Host "Bezig met installeren van .NET SDK 8..." -ForegroundColor Cyan
    # Download de .NET SDK 8 installer
    $dotnetInstallerUrl = "https://download.visualstudio.microsoft.com/download/pr/e16e09a1-539d-4b9f-a473-ccfe389f30ff/97337c3b2eaf7a3b4081b89350b1d29e/dotnet-sdk-8.0.100-win-x64.exe"
    $installerPath = "$env:Temp\dotnet-sdk-8.0.100-win-x64.exe"
    
    # Download en installeer
    Invoke-WebRequest -Uri $dotnetInstallerUrl -OutFile $installerPath
    Start-Process -FilePath $installerPath -ArgumentList "/quiet" -Wait
    Write-Host ".NET SDK 8 is succesvol geïnstalleerd!" -ForegroundColor Green
}

# Installeren van Git
Write-Host "Controleren op Git installatie..." -ForegroundColor Cyan
if (-not (Check-Command "git")) {
    Write-Host "Bezig met installeren van Git..." -ForegroundColor Cyan
    # Download Git installer
    $gitInstallerUrl = "https://github.com/git-for-windows/git/releases/download/v2.41.0.windows.1/Git-2.41.0-64-bit.exe"
    $gitInstallerPath = "$env:Temp\Git-2.41.0-64-bit.exe"
    
    # Download en installeer Git
    Invoke-WebRequest -Uri $gitInstallerUrl -OutFile $gitInstallerPath
    Start-Process -FilePath $gitInstallerPath -ArgumentList "/VERYSILENT" -Wait
    Write-Host "Git is succesvol geïnstalleerd!" -ForegroundColor Green
}

# Clonen van de GitHub repository
$repoUrl = "git@github.com:cdemmer04/easydevops.git" # Vervang dit met je eigen repository URL
$repoDirectory = "C:/easydevops"  # Specificeer het pad waar je de repository wilt clonen

Write-Host "Clonen van de repository..." -ForegroundColor Cyan
if (-not (Test-Path -Path $repoDirectory)) {
    git clone $repoUrl $repoDirectory
    Write-Host "Repository succesvol gecloned!" -ForegroundColor Green
} else {
    Write-Host "De repository bestaat al op de opgegeven locatie." -ForegroundColor Yellow
}

# Uitvoeren van de .NET frontend EasyDevOps app
Write-Host "De .NET frontend EasyDevOps app uitvoeren..." -ForegroundColor Cyan
$frontendAppPath = "$repoDirectory\frontend"  # Aangenomen dat 'frontend' de map is voor de app

# Navigeer naar de map en voer de app uit
Set-Location -Path $frontendAppPath
dotnet run

Write-Host "De .NET EasyDevOps app is nu actief!" -ForegroundColor Green
