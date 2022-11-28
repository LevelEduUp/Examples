[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $ContainerName
)

for ($i = 0; $i -lt 10; $i++) {
    New-Item -Name "$i.txt" 
}
Get-Module -ListAvailable -Name Az.Accounts

#$storage = Get-AzStorageContainer -Name "levelupexample"
#az storage container create -n mystoragecontainer --public-access blob

#New-AzStorageContainer -Name $ContainerName -Context $storage.Context -Permission Blob

foreach ($item in $(Get-ChildItem | Where-Object {$_.Name -like "*.txt"})) {
    $item
}