# Get all files sorted by size.
#$info = Get-ChildItem -Path '/Users/luismiguelescobarfalcon/Dropbox/UniLibre/SistemasOperativos/' -Recurse -Force -File | Select-Object -Property FullName,@{Name='SizeGB';Expression={$_.Length / 1GB}},@{Name='SizeMB';Expression={$_.Length / 1MB}},@{Name='SizeKB';Expression={$_.Length / 1KB}} | Sort-Object { $_.SizeKB } -Descending
$info = Get-ChildItem -Path '/Users/luismiguelescobarfalcon/' -Recurse -Force -File | Select-Object -Property FullName,@{Name='SizeGB';Expression={$_.Length / 1GB}},@{Name='SizeMB';Expression={$_.Length / 1MB}},@{Name='SizeKB';Expression={$_.Length / 1KB}} | Sort-Object { $_.SizeKB } -Descending
Write-Host "Mayor Ordenamiento " $info[0].FullName
Write-Host "Segundo Mayor " $info[1].FullName
#Invoke-Item $info[0].FullName
#Invoke-Item $info[1].FullName
