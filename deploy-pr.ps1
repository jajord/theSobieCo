param (
  [string]$User
)
$baseDir = "C:\Users\Tester\Desktop\PRs\$User"
New-Item $baseDir -ItemType Directory
Set-Location $baseDir

$env:PORT = [int] $env:PORT + 1
$port = $env:PORT

Write-Host ""

# Kill any existing process on that port
Get-NetTCPConnection -LocalPort $port -ErrorAction SilentlyContinue | ForEach-Object {
    Stop-Process -Id $_.OwningProcess -Force -ErrorAction SilentlyContinue
}

# Install dependencies and start the app
# npm install

Invoke-Expression "pm2 start app.js --name $User"
Write-Host "App should be running at http://$User.fridayoclock.com on (Port $port)"
