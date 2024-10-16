import os
import re
import pandas as pd
import pyodbc

# Ruta a la carpeta de archivos CCR
carpeta_origen = r"C:\Users\EJRuiz\Desktop\Proyecto Merge\CCR\ArchivoCCR (Dinamic dates files)"

# Conectar a la base de datos
conn_str = pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};Server=tcp:txcare.database.windows.net,1433;Database=Txcare;Uid=fmariscal;Pwd=Pancho49193@2')
print("Conexión exitosa")
cursor = conn_str.cursor()

# Obtener datos de la tabla URERMDSSummary incluyendo generanComando
query = "SELECT furnaceID, zipCCR, ccrFile, generaComando FROM [dbo].[URERMDSSummary]"
cursor.execute(query)
rows = cursor.fetchall()

# Mapeo de ccrFile a filas de base de datos
datos_base_datos = {row.ccrFile: row for row in rows}

# Función para obtener fechas de archivos
def obtener_fechas_de_archivos(carpeta_origen):
    archivos_origen = [f for f in os.listdir(carpeta_origen) if f.endswith('.xls')]
    fechas_por_archivo = {}

    for archivo in archivos_origen:
        try:
            # Extraer el nombre base del archivo
            base_nombre = re.match(r'(.+?)\.xls$', os.path.basename(archivo))
            if base_nombre:
                base_nombre = base_nombre.group(1)  # Extraer solo el nombre base sin extensión
                archivo_xls = os.path.join(carpeta_origen, archivo)

                # Buscar el nombre en la base de datos
                datos_db = datos_base_datos.get(base_nombre)

                if datos_db is not None:
                    # Leer archivo XLS como CSV delimitado por tabulaciones
                    df = pd.read_csv(archivo_xls, delimiter='\t', encoding='latin1')

                    # Convertir fechas a datetime en el formato adecuado
                    df['TimeStarted'] = pd.to_datetime(df['TimeStarted'], format='%m/%d/%Y %H:%M', errors='coerce')

                    # Obtener la fecha del último 'TimeStarted'
                    fecha_TimeStarted = df['TimeStarted'].max()

                    # Asegurarse de que la fecha está en el formato correcto para SQL Server
                    if pd.notnull(fecha_TimeStarted):
                        fecha_TimeStarted = fecha_TimeStarted.strftime('%Y-%m-%d %H:%M:%S')

                        # Actualizar en la base de datos
                        query = """
                            UPDATE [dbo].[URERMDSSummary]
                            SET FechaUltimoCCR = ?
                            WHERE zipCCR = ?
                        """
                        cursor.execute(query, (fecha_TimeStarted, datos_db.zipCCR))
                        fechas_por_archivo[base_nombre] = fecha_TimeStarted
        except Exception as e:
            print(f"Error procesando el archivo {archivo}: {e}")

    # Confirmar los cambios en la base de datos
    conn_str.commit()
    print("Actualización de la base de datos completada.")

# Llamar a la función
obtener_fechas_de_archivos(carpeta_origen)

# Cerrar la conexión
cursor.close()
conn_str.close()
