# Download the Coverity client .exe from Azure Blob Storage
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

New-Item -Path "C:\temp" -ItemType Directory -Force

# Define the source URL and destination path

$sourceUrl="https://stsmpdevopsimages.blob.core.windows.net/armimagelayeraddons/synopsys/coverity/cov-analysis-win64-2024.3.1.exe?sp=r&st=2024-07-29T23:34:03Z&se=2024-07-30T07:34:03Z&spr=https&sv=2022-11-02&sr=b&sig=F2csZ41pwktaTqJ9FJQTAixt0bvTEAdvqkqE96ADUyM%3D" 
# $DEVOPS_ST_SAS_TOKEN = $env:DEVOPS_ST_SAS_TOKEN
# $sourceUrl="https://stsmpdevopsimages.blob.core.windows.net/armimagelayeraddons/synopsys/coverity/cov-analysis-win64-2024.3.1.exe? + $DEVOPS_ST_SAS_TOKEN
$destinationPath = "C:\temp/cov-analysis-win64-2024.3.1.exe"
if (-not (Get-Command azcopy -ErrorAction SilentlyContinue)) {
    Write-Error "AzCopy is not installed or not in the system's PATH."
    exit 1
}
# Use AzCopy to copy the file from Azure Blob Storage to the local directory
azcopy copy $sourceUrl $destinationPath
if (-not (Test-Path $destinationPath)) {
    Write-Error "Failed to download the file."
    exit 1
}

# Install the Coverity client
Start-Process -FilePath "C:\temp/cov-analysis-win64-2024.3.1.exe" -ArgumentList "-q", "--license.region=1", "--license.agreement=agree", "--license.cov.path=""C:\temp\license.dat"""
# https://eaton-my.sharepoint.com/:f:/r/personal/catelleempei_eaton_com/Documents/cov.%20license?csf=1&web=1&e=aoBUNb.dat""" -NoNewWindow -Wait

#"azcopy https://stsmpdevopsimages.blob.core.windows.net/armimagelayeraddons/synopsys/coverity/cov-analysis-win64-2024.3.1.exe?sp=r&st=2024-07-08T15:07:19Z&se=2025-07-08T23:07:19Z&spr=https&sv=2022-11-02&sr=b&sig=Eme6QLzdls0MHWjvGflUtr4mGdvRmx0zPw8XeBDtLFo%3D",
      

      