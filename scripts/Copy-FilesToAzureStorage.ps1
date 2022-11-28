for ($i = 0; $i -lt 10; $i++) {
    New-Item -Name "$i.txt" 
}

Get-ChildItem