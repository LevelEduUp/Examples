[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $ContainerName,
    
    [Parameter()]
    [string]
    $accountname = 'levelupexample'

)

# Generating files step
#for ($i = 0; $i -lt 10; $i++) {
#    New-Item -Name "$i.txt" 
#}

$files = $(Get-ChildItem | Where-Object {$_.Name -like "*.txt"})

if ($files.count -gt 0) {
    Write-Output "new files found"
    $Container = $ContainerName.Replace(" ", "").ToLower()
    az storage container create --account-name $accountname -n $Container --public-access blob --auth-mode login
    foreach ($item in $files) {
        $item.Name
        az storage blob upload -f "$item" -n $item.Name -c $Container --account-name $accountname  
    }
}
else {
    Write-Output "no files - skip"
}