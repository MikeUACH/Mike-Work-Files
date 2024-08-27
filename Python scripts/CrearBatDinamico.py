import os
import pandas as pd
from datetime import datetime, timedelta
import pyodbc
import re

# Configurar conexión a SQL Server
conn_str = pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};Server=tcp:txcare.database.windows.net,1433;Database=Txcare;Uid=fmariscal;Pwd=Pancho49193@2')
print("Conexión exitosa")
cursor = conn_str.cursor()

# Obtener datos de la tabla PlantasGOL
query = "SELECT ComboKey, FileGOL, furnaceID, Tank FROM dbo.PlantasGOL"
cursor.execute(query)
rows = cursor.fetchall()

# Ruta de archivos XLS
carpeta_origen = r"C:\Users\EJRuiz\Desktop\ArchivosXLS"

def obtener_fechas_de_archivos(carpeta_origen):
    archivos_origen = [f for f in os.listdir(carpeta_origen) if f.endswith('.xls')]
    fechas_por_archivo = {}

    for archivo in archivos_origen:
        base_nombre = re.match(r'(gas-in-oil_[\w\s]+_[0-3]_)', os.path.basename(archivo))
        if base_nombre:
            base_nombre = base_nombre.group()
            archivo_xls = os.path.join(carpeta_origen, archivo)

            # Leer archivo XLS como CSV delimitado por tabulaciones
            df = pd.read_csv(archivo_xls, delimiter='\t', encoding='latin1')

            # Convertir fechas a datetime, ignorando errores y llenando con NaT (Not a Time)
            df['Event Date'] = pd.to_datetime(df['Event Date'], errors='coerce')
            df['Heat Start Time'] = pd.to_datetime(df['Heat Start Time'], errors='coerce')

            # Obtener la fecha del último 'Event Date' y 'Heat Start Time'
            fecha_event_date = df['Event Date'].max()
            fecha_heat_start_time = df['Heat Start Time'].max()

            # Actualizar en la base de datos
            query = """
                UPDATE dbo.PlantasGOL
                SET FechaUltimoHeatXls = ?, FechaUltimoEventDateXls = ?
                WHERE FileGOL = ?
            """
            cursor.execute(query, (fecha_heat_start_time, fecha_event_date, base_nombre))
            conn_str.commit()  # Confirmar los cambios en la base de datos
            
            fechas_por_archivo[base_nombre] = (fecha_event_date, fecha_heat_start_time)

    return fechas_por_archivo

def generar_comandos(cursor, fechas_por_archivo):
    comandos = []

    for row in rows:  # Cambiado de cursor a rows
        ComboKey, FileGOL, furnaceID, Tank = row
        #FileGOL = FileGOL.strip()
        print(f"Procesando FileGOL: {FileGOL}")  # Depuración

        for base_nombre, fechas in fechas_por_archivo.items():
            if base_nombre in FileGOL:
                print(f"Match found: {base_nombre} in {FileGOL}")  # Depuración

                fecha_event_date, fecha_heat_start_time = fechas

                # Calcular fecha para el comando basado en la lógica proporcionada
                if fecha_event_date > fecha_heat_start_time:
                    fecha_comando = fecha_heat_start_time - timedelta(days=10)
                else:
                    fecha_comando = fecha_event_date - timedelta(days=10)

                # Formatear la fecha en el formato necesario para el comando
                fecha_comando_str = fecha_comando.strftime('%Y-%m-%d')

                # Generar comando basado en las variables
                comando = f"""
                D:
                cd D:\\Sincronizar\\VM2\\extraerCCR\\GasInOilExporter
                del "D:\\Sincronizar\\VM2\\extraerCCR\\GasInOilExporter\\salida\\{FileGOL}*"
                VM2_GasInOil_Exporter_multiTank_072020.exe "D:\\Sincronizar\\VM2\\extraerCCR\\GasInOilExporter\\salida" "{furnaceID}" "{fecha_comando_str}" "{Tank}"
                del "D:\\Sincronizar\\VM2\\extraerCCR\\GasInOilExporter\\ArchivosXLS\\{FileGOL}*"
                move /y "D:\\Sincronizar\\VM2\\extraerCCR\\GasInOilExporter\\salida\\{FileGOL}*" "D:\\Sincronizar\\VM2\\extraerCCR\\GasInOilExporter\\ArchivosXLS\\"
                "D:\\Sincronizar\\VM2\\extraerCCR\\GasInOilExporter\\actualizaBDGOL.vbs" "PROCESO" "{ComboKey}"
                """
                comandos.append(comando)

    return comandos

# Obtener fechas de los archivos en la carpeta de origen
fechas_por_archivo = obtener_fechas_de_archivos(carpeta_origen)

# Generar comandos
comandos = generar_comandos(cursor, fechas_por_archivo)

# Crear un nuevo archivo .bat y escribir los comandos en él
archivo_bat = r"C:\Users\EJRuiz\Desktop\ProcesaExtraccionesGOLAuto.txt"

# Borrar el archivo .bat si ya existe para asegurarse de que sea creado desde cero
if os.path.exists(archivo_bat):
    os.remove(archivo_bat)
    print(f"Archivo .bat existente eliminado: {archivo_bat}")

# Crear y escribir en el nuevo archivo .bat
with open(archivo_bat, 'w') as bat_file:
    for comando in comandos:
        bat_file.write(comando)
        bat_file.write("\n")

print(f"Nuevo archivo .bat creado: {archivo_bat}")

# Cerrar conexión
cursor.close()
conn_str.close()
