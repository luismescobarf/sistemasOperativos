param([string]$ruta = $env:HOME)

#Exploracion del directorio recibido
$infoMayor = Get-ChildItem -Path $ruta -Recurse -Force -File | Select-Object -Property FullName,@{Name='SizeGB';Expression={$_.Length / 1GB}},@{Name='SizeMB';Expression={$_.Length / 1MB}},@{Name='SizeKB';Expression={$_.Length / 1KB}} | Sort-Object { $_.SizeKB } -Descending
$infoMenor = Get-ChildItem -Path $ruta -Recurse -Force -File | Select-Object -Property FullName,@{Name='SizeGB';Expression={$_.Length / 1GB}},@{Name='SizeMB';Expression={$_.Length / 1MB}},@{Name='SizeKB';Expression={$_.Length / 1KB}} | Sort-Object { $_.SizeKB } 
#Mostrar el archivo identificado en la ruta
Write-Host $infoMenor[0].FullName
Write-Host $infoMayor[0].FullName
#Apertura de los archivos con la aplicacion asociada en el sistema
Invoke-Item $infoMenor[0].FullName
Invoke-Item $infoMayor[0].FullName



 
 
