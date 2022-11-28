[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $ContainerName
)

for ($i = 0; $i -lt 10; $i++) {
    New-Item -Name "$i.txt" 
}
az storage container create --account-name "levelupexample" -n $ContainerName.Replace(" ", "").ToLower() --public-access blob --auth-mode login

foreach ($item in $(Get-ChildItem | Where-Object {$_.Name -like "*.txt"})) {
    $item
}