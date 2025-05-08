param (
  [string]$User
)
# Maximum verbosity to appease Bill Gates
New-Item -Force -Path .. -Name "$User" -ItemType Directory
Set-Location -Path ..\$User
Copy-Item -Recurse -Force -Path ..\temp\* -Destination .
Copy-Item -Force -Path "$env:dotenvPath\.env" -Destination .env

# Install dependencies and start the app
Invoke-Expression -Command "npm install"
Invoke-Expression -Command "pm2 start app.js --name $User"
