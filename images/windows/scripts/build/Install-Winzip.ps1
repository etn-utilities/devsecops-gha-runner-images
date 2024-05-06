$url = "https://download.winzip.com/gl/nkln/winzip28-downwz.exe?_gl=1*i593xu*_gcl_au*MTEyNTAzMTYyNC4xNzE0OTU1MTQz"
$outputFileName = "winzip28-downwz.exe"
$tempDir = $env:TEMP

# Create a WebClient object
$client = New-Object System.Net.WebClient

# Download the file
$client.DownloadFile($url, "$tempDir\$outputFileName")

# Silent installation
$installerPath = "$tempDir\$outputFileName"
Start-Process -FilePath $installerPath -ArgumentList "/S" -Wait

Write-Host "WinZip installation complete."
