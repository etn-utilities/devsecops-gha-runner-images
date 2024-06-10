
$ModuleManifestName = 'ImageHelpers.psd1'
$ModuleManifestPath = "$PSScriptRoot\..\$ModuleManifestName"



Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
       $result = Test-ModuleManifest -Path $ModuleManifestPath -PassThru
        $result | Should Not BeNullOrEmpty
        if ($result.FailedCount -gt 0) {
            Write-Error "Test-ModuleManifest failed for $ModuleManifestPath"
    }
}
}
