for ($i = 0; $i -lt 10; $i++) {
    New-Item -Name "$i.txt" 
}

foreach ($item in $(Get-ChildItem | Where-Object {$_.Name -like "*.txt"})) {
    $item
}