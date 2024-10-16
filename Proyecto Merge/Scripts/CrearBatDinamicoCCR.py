import os
from datetime import datetime, timedelta
import pyodbc
import subprocess

# Configurar conexión a SQL Server
conn_str = pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};Server=tcp:txcare.database.windows.net,1433;Database=Txcare;Uid=fmariscal;Pwd=Pancho49193@2')
print("Conexión exitosa")
cursor = conn_str.cursor()

# Obtener datos de la tabla URERMDSSummary con generaComando y ultimaActualizacion
query = "SELECT furnaceID, zipCCR, ccrFile, generaComando, ultimaActualizacion FROM [dbo].[URERMDSSummary]"
cursor.execute(query)
rows = cursor.fetchall()
erase_ccr_prefix = "ccr_"
erase_ccr_suffix = ".xls"
# Función para generar comandos basados únicamente en la base de datos
def generar_comandos(cursor, rows):
    comandos = []
    fecha_hoy = datetime.now()

    for row in rows:
        furnaceID, zipCCR, ccrFile, generaComando, ultimaActualizacion = row
        # Solo generar comando si generaComando es 1
        if generaComando == 1:
            # Si existe una ultimaActualizacion válida, usarla para el cálculo
            if ultimaActualizacion:
                fecha_comando = ultimaActualizacion - timedelta(days=10)
            else:
                # Si no hay ultimaActualizacion, usar la fecha actual menos 10 días como fallback
                fecha_comando = fecha_hoy - timedelta(days=10)

            # Formatear la fecha para que solo tenga año, mes y día
            fecha_comando_str = fecha_comando.strftime('%Y-%m-%d')

            # Generar el comando basado en los datos
            if ccrFile in ['ccr_NSBS South_awv.xls', 'ccr_NSBS North_awv.xls']:
                print("Es NSBS")
                ccrFile_stripped = ccrFile.replace(erase_ccr_prefix, "").replace(erase_ccr_suffix, "")
                comando = f"""
                
::--------------------{ccrFile_stripped}     ------------------------------------------------------
::hornos={furnaceID}		{ccrFile}           
call "D:\\Sincronizar\\VM2\\extraerCCR\\VM2 Exporter\\ExtraerVm2FALSE_2.bat" "D:\\Sincronizar\\VM2\\extraerCCR\\VM2 Exporter" 
"D:\\Sincronizar\\VM2\\extraerCCR\\VM2 Exporter\\ExtraccionesVarias\\TrabajoTemporal" "D:\\Sincronizar\\VM2\\extraerCCR\\VM2 Exporter\\Configuraciones\\ZZZArchConfigVM2_{furnaceID}.txt"  "{furnaceID}" "{fecha_comando_str}" 
"D:\\Sincronizar\\VM2\\extraerCCR\\VM2 Exporter\\ExtraccionesVarias\\TrabajoTemporal\\ultimos\\{zipCCR}"
D:
cd "D:\\Sincronizar\\VM2\\extraerCCR\\VM2 Exporter\\ExtraccionesVarias\\TrabajoTemporal\\ultimos"
"c:\\Program Files\\7-Zip\\7z.exe" x "{zipCCR}"

del "{zipCCR}"
rename "{ccrFile}" "{ccrFile.replace('.xls', '_awv.xls')}"

"c:\\Program Files\\7-Zip\\7z.exe" -tzip a "D:\\Sincronizar\\VM2\\extraerCCR\\VM2 Exporter\\ExtraccionesVarias\\TrabajoTemporal\\ultimos\\{zipCCR.replace('.zip', '_awv.zip')}" *.xls

del *.xls

copy /Y "D:\\Sincronizar\\VM2\\extraerCCR\\VM2 Exporter\\ExtraccionesVarias\\TrabajoTemporal\\ultimos\\{zipCCR.replace('.zip', '_awv.zip')}" "D:\\Sincronizar\\VM2\\extraerCCR\\VM2 Exporter\\ExtraccionesVarias\\Sistemas"
"""
            else:
                print("No es NSBS")
                ccrFile_stripped = ccrFile.replace(erase_ccr_prefix, "").replace(erase_ccr_suffix, "")
                comando = f"""
::--------------------{ccrFile_stripped}     ------------------------------------------------------
::hornos={furnaceID}		{ccrFile}                  
call "D:\\Sincronizar\\VM2\\extraerCCR\\VM2 Exporter\\ExtraerVm2FALSE_2.bat" "D:\\Sincronizar\\VM2\\extraerCCR\\VM2 Exporter" 
"D:\\Sincronizar\\VM2\\extraerCCR\\VM2 Exporter\\ExtraccionesVarias\\TrabajoTemporal" "D:\\Sincronizar\\VM2\\extraerCCR\\VM2 Exporter\\Configuraciones\\ZZZArchConfigVM2_{furnaceID}.txt"  "{furnaceID}" "{fecha_comando_str}" 
"D:\\Sincronizar\\VM2\\extraerCCR\\VM2 Exporter\\ExtraccionesVarias\\TrabajoTemporal\\ultimos\\{zipCCR}"
"""
            comandos.append(comando.strip())

            # Actualizar la base de datos con el comando generado y actualizar ultimaActualizacion
            update_query = """
                UPDATE [dbo].[URERMDSSummary]
                SET comandoBat = ?, ultimaActualizacion = ?
                WHERE ccrFile = ? AND zipCCR = ?
            """
            cursor.execute(update_query, (comando.strip(), fecha_comando, ccrFile, zipCCR))
            conn_str.commit()  # Confirmar los cambios en la base de datos
        else:
            print(f"El comando no se genera para {zipCCR} debido a que generaComando es 0")

    return comandos

# Generar comandos
comandos = generar_comandos(cursor, rows)

# Crear un nuevo archivo .bat y escribir los comandos en él
archivo_bat = r"C:\Users\EJRuiz\Desktop\extraerVarios_2PlantasSistemas_activas.bat"

# Borrar el archivo .bat si ya existe para asegurarse de que sea creado desde cero
if os.path.exists(archivo_bat):
    os.remove(archivo_bat)
    print(f"Archivo .bat existente eliminado: {archivo_bat}")

# Crear y escribir en el nuevo archivo .bat
with open(archivo_bat, 'w') as bat_file:
    bat_file.write(r"""
D:
cd "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias"

del "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\ultimos\ccr*.*"
del "D:\Sincronizar\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\TrabajoTemporal\*.zip"    
""")           
    for comando in comandos:
        bat_file.write(comando)
        bat_file.write("\n\n")

print(f"Nuevo archivo .bat creado: {archivo_bat}")

'''
# Ejecutar el archivo .bat
try:
    subprocess.run([archivo_bat], check=True)
    print(f"Archivo .bat ejecutado exitosamente.")
except subprocess.CalledProcessError as e:
    print(f"Error al ejecutar el archivo .bat: {e}")
'''
# Cerrar conexión
cursor.close()
conn_str.close()
