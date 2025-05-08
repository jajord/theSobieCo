param (
  [string]$User
)
New-Item -Force -Path .. -Name "$User" -ItemType Directory
Set-Location ..\$User
Copy-Item -Recurse -Force -Path ..\temp\* -Destination .

# Install dependencies and start the app
Invoke-Expression "npm install"
Invoke-Expression "pm2 start app.js --name $User"
