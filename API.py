#API requerimientos personalizados
####################################

#Librerías complementarias
import os
#os.system('pwsh camera.ps1')
#os.system('pwsh menu.ps1')

#Requerimiento 3
def mayorMenorRuta(ruta):	
	stream = os.popen('pwsh requerimiento3API.ps1 '+ruta)
	output = stream.read()
	#print(type(output))	
	return output.splitlines()
