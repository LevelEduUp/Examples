[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $ContainerName,
    
    [Parameter()]
    [string]
    $accountname = 'levelupexample'

)

for ($i = 0; $i -lt 10; $i++) {
    New-Item -Name "$i.txt" 
}
$Container = $ContainerName.Replace(" ", "").ToLower()
az storage container create --account-name $accountname -n $Container --public-access blob --auth-mode login

foreach ($item in $(Get-ChildItem | Where-Object {$_.Name -like "*.txt999"})) {
    $item.Name
    az storage blob upload -f "$item" -n $item.Name -c $Container --account-name $accountname  
}