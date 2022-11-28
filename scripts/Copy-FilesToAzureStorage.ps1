[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $ContainerName
)

for ($i = 0; $i -lt 10; $i++) {
    New-Item -Name "$i.txt" 
}
$storage = Get-AzStorageContainer -Name "levelupexample"

New-AzStorageContainer -Name $ContainerName -Context $storage.Context -Permission Blob

foreach ($item in $(Get-ChildItem | Where-Object {$_.Name -like "*.txt"})) {
    $item
}