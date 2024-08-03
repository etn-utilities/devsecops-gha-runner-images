# Ensure Chocolatey is installed
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

if (-Not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force; 
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; 
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Install AzCopy using Chocolatey
choco install azcopy10 -y

# # Example usage of AzCopy
# # This command copies a file from a local path to an Azure Blob Storage container
# $source = "C:\path\to\your\file.txt"
# $destination = "https://youraccount.blob.core.windows.net/yourcontainer/file.txt?yourSASToken"
# & "C:\Program Files (x86)\Microsoft SDKs\Azure\AzCopy\azcopy.exe" cp $source $destination
