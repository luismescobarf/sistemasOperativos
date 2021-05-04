import os
#stream = os.popen('pwsh menu.ps1')
stream = os.popen('pwsh ListadoDispositivos.ps1')
output = stream.read()
print("Resultado obtenido: ")
print(output)
