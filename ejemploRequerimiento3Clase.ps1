param([Int32]$menu = -1)

#Tercer requerimiento
function ArchivoMenor( [string] $ruta )
{
	#Exploracion del directorio recibido
	$infoMayor = Get-ChildItem -Path $ruta -Recurse -Force -File | Select-Object -Property FullName,@{Name='SizeGB';Expression={$_.Length / 1GB}},@{Name='SizeMB';Expression={$_.Length / 1MB}},@{Name='SizeKB';Expression={$_.Length / 1KB}} | Sort-Object { $_.SizeKB } -Descending
	$infoMenor = Get-ChildItem -Path $ruta -Recurse -Force -File | Select-Object -Property FullName,@{Name='SizeGB';Expression={$_.Length / 1GB}},@{Name='SizeMB';Expression={$_.Length / 1MB}},@{Name='SizeKB';Expression={$_.Length / 1KB}} | Sort-Object { $_.SizeKB } 
	#Mostrar el archivo identificado en la ruta
	Write-Host "Menor Archivo de la ruta " $ruta " es " $infoMenor[0].FullName
	Write-Host "Mayor Archivo de la ruta " $ruta " es " $infoMayor[0].FullName
	#Apertura de los archivos con la aplicacion asociada en el sistema
	Invoke-Item $infoMenor[0].FullName
	Invoke-Item $infoMayor[0].FullName
	
}

function Show-Menu
{
    param (
        [string]$Title = 'My Menu'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    
    Write-Host "1: Mayor y menor de ruta especificada"
    Write-Host "2: Press '2' for this option."
    Write-Host "3: Press '3' for this option."
    Write-Host "Q: Press 'Q' to quit."
}




if ($menu -eq -1){

	Write-Host "FLUJO FLUJO FLUJO"

}else{

	do
	 {
		 Show-Menu
		 $selection = Read-Host "Please make a selection"
		 switch ($selection)
		 {
			 '1' {
				 'You chose option #1'
				 $ruta = Read-Host "Ingresar la ruta"
				 ArchivoMenor $ruta
				 
				 
			 } '2' {
				 'You chose option #2'
			 } '3' {
				 'You chose option #3'
			 }
		 }
		 pause
	 }
	 until ($selection -eq 'q')

}


 
 
