# Local System Information v3
# Shows details of currently running PC
# Thom McKiernan 11/09/2014

#$computerSystem = Get-CimInstance CIM_ComputerSystem
#Write-Host "System Information for: " $computerSystem.Name -BackgroundColor DarkCyan

#$hardwareDispositivo = Get-VMHostHardware



#$info = Get-WmiObject 

$info = Get-ChildItem -Path Env:

#Write-Host "Contenido->" $info
#Write-Host "Contenido->" $info.GetEnumerator()
#Write-Host "Contenido->" $info.GetEnumerator()

#$info | Get-Member -MemberType Properties  

#$info.GetEnumerator() | Get-Member -MemberType Properties

#$info.Values()

$info | Out-String | Write-Host

Write-Host "Nombre de Usuario->" $env:USER

Write-Host $env:OSVersion.Version 

Write-Host "Obteniendo valor SO-----> " $env:SHELL
Write-Host "Modulos-----> " $env:PSModulePath
Get-Module -ListAvailable

#Metodo extenso
#function Get-MacOsXsysteminformation {
#    [xml]$infos = system_profiler -xml
#
#    return $infos
#}
#
#$InfoMAC = Get-MacOsXsysteminformation
#Write-Host "***ProbandoInfoMAC--.... " $InfoMAC


#Invoke-Item "/Users/luismiguelescobarfalcon/Downloads/lick.jpg"


    if ($IsLinux) {
        Write-Host Linux
    }
    elseif ($IsMacOS) {
        Write-Host is This is a dirty, dirty Mac
    }
    elseif ($IsWindows) {
        Write-Host is Windows
    }


Write-Host "-------------"
Write-Host "SistemaOperativo por XML"
[xml]$xml = system_profiler SPSoftwareDataType -xml   
$xml.plist.array.dict.array.dict.string -match 'macos' 

Write-Host "-------------"
Write-Host "Hardware y SW Encontrado"
[xml]$xml = system_profiler SPHardwareDataType SPSoftwareDataType -xml   
$xml.plist.array.dict.array.dict.string 

Write-Host "-------------"
Write-Host "Energia"
[xml]$xml = system_profiler SPPowerDataType -xml   
$xml.plist.array.dict.array.dict.string 

#Write-Host "-------------"
#$xml.plist.array.dict.array.dict | Out-String | Write-Host

Write-Host "-------------"
Write-Host "Pantallas"
[xml]$xml = system_profiler SPDisplaysDataType -xml   
$xml.plist.array.dict.array.dict.string 

Write-Host "-------------"
Write-Host "USBs"
[xml]$xml = system_profiler SPUSBDataType -xml   
$xml.plist.array.dict.array.dict.string 


 


#foreach ($i in $info) {
#    
#    if ($i -eq $IsLinux) {
#        Write-Host $i is Linux
#    }
#    elseif ($i -eq $IsMacOS) {
#        Write-Host $i is This is a dirty, dirty Mac
#    }
#    elseif ($i -eq $IsWindows) {
#        Write-Host $i is Windows
#    }
#
#   }

#Ejemplos en Windows
#$computerBIOS = Get-CimInstance CIM_BIOSElement
#$computerOS = Get-CimInstance CIM_OperatingSystem
#$computerCPU = Get-CimInstance CIM_Processor
#$computerHDD = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID = 'C:'"
#Clear-Host
#
#Write-Host "System Information for: " $computerSystem.Name -BackgroundColor DarkCyan
#"Manufacturer: " + $computerSystem.Manufacturer
#"Model: " + $computerSystem.Model
#"Serial Number: " + $computerBIOS.SerialNumber
#"CPU: " + $computerCPU.Name
#"HDD Capacity: "  + "{0:N2}" -f ($computerHDD.Size/1GB) + "GB"
#"HDD Space: " + "{0:P2}" -f ($computerHDD.FreeSpace/$computerHDD.Size) + " Free (" + "{0:N2}" -f ($computerHDD.FreeSpace/1GB) + "GB)"
#"RAM: " + "{0:N2}" -f ($computerSystem.TotalPhysicalMemory/1GB) + "GB"
#"Operating System: " + $computerOS.caption + ", Service Pack: " + $computerOS.ServicePackMajorVersion
#"User logged In: " + $computerSystem.UserName
#"Last Reboot: " + $computerOS.LastBootUpTime
