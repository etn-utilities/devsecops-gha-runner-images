#  Download the Coverity client .exe from Azure Blob Storage
 Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

 New-Item -Path "C:\temp" -ItemType Directory -Force

#  Define the source URL and destination path

 $sourceUrl="https://stsmpdevopsimages.blob.core.windows.net/armimagelayeraddons/synopsys/coverity/cov-analysis-win64-2024.3.1.exe?sp=r&st=2024-08-21T02:20:59Z&se=2024-08-21T10:20:59Z&spr=https&sv=2022-11-02&sr=b&sig=AbEd8GEawLUr4TKjBZw7Y3cHtNXeN0Z5dSkFGKaiJqU%3D" 

 $destinationPath = "C:\temp/cov-analysis-win64-2024.3.1.exe"
if (-not (Get-Command azcopy -ErrorAction SilentlyContinue)) {
    Write-Error "AzCopy is not installed or not in the system's PATH."
    exit 1
}
#  Use AzCopy to copy the file from Azure Blob Storage to the local directory
 azcopy copy $sourceUrl $destinationPath
 if (-not (Test-Path $destinationPath)) {
     Write-Error "Failed to download the file."
     exit 1
 }

# Install the Coverity client
Start-Process -FilePath "c:\temp\cov-analysis-win64-2024.3.1.exe" -WorkingDirectory "c:\temp" -ArgumentList "-q","--license.region=1","--license.agreement=agree","--license.cov.path=""c:\images\scripts\build\license.dat""" -Wait


      