import os
import pyodbc
from difflib import SequenceMatcher

# Función para calcular la similitud entre dos cadenas
def obtener_similitud(cadena1, cadena2):
    if cadena1 is None:
        cadena1 = ''
    if cadena2 is None:
        cadena2 = ''
    return SequenceMatcher(None, cadena1, cadena2).ratio()

# Configurar la conexión a la base de datos
conn_str = pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};'
                          'Server=tcp:txcare.database.windows.net,1433;'
                          'Database=Txcare;'
                          'Uid=fmariscal;'
                          'Pwd=Pancho49193@2;')
print("Conexión exitosa")
cursor = conn_str.cursor()

# Obtener los archivos .zip de la carpeta
ruta_carpeta = r'C:\Users\EJRuiz\Desktop\CCRs copia\ArchivosCCR De 10 dias'
archivos_zip = [os.path.splitext(f)[0] for f in os.listdir(ruta_carpeta) if f.endswith('.zip')]

# Consulta para obtener los datos de la base de datos
cursor.execute("SELECT PlantName, Directorio, EAF, ccrFile FROM dbo.URERMDSSummary")
resultados = cursor.fetchall()

# Crear un diccionario para guardar la mejor similitud por planta
mejor_similitud_por_plant = {}

# Procesar cada archivo .zip
for archivo in archivos_zip:
    nombre_archivo = archivo
    
    mejor_similitud = 0
    mejor_plant = None

    print(f"Procesando archivo: {nombre_archivo}.zip")

    for resultado in resultados:
        PlantName, Directorio, EAF, ccrFile = resultado
        
        # Concatenar Directorio y EAF
        directorio_concatenado = f"{Directorio} {EAF}"
        
        # Comparar con PlantName
        similitud_plant = obtener_similitud(nombre_archivo, PlantName)
        # Comparar con concatenación de Directorio y EAF
        similitud_directorio_eaf = obtener_similitud(nombre_archivo, directorio_concatenado)
        # Comparar con ccrFile
        similitud_ccrFile = obtener_similitud(nombre_archivo, ccrFile)
        
        # Encontrar la mejor similitud
        similitud_max = max(similitud_plant, similitud_directorio_eaf, similitud_ccrFile)
        
        if similitud_max > mejor_similitud:
            mejor_similitud = similitud_max
            mejor_plant = PlantName
            mejor_concatenacion = f"{PlantName} (similitud: {similitud_plant}), {directorio_concatenado} (similitud: {similitud_directorio_eaf}), {ccrFile} (similitud: {similitud_ccrFile})"

    if mejor_plant:
        mejor_similitud_por_plant[mejor_plant] = nombre_archivo
        print(f"Mejor match para {nombre_archivo}.zip: {mejor_plant} con similitud {mejor_similitud:.2f}")
        print(f"Detalles de similitud: {mejor_concatenacion}")

# Actualizar la tabla con los archivos zip encontrados
for plant, archivo in mejor_similitud_por_plant.items():
    cursor.execute("""
        UPDATE dbo.URERMDSSummary
        SET zipCCR = ?
        WHERE PlantName = ?
    """, archivo + '.zip', plant)
    print(f"Actualizado {plant} con archivo {archivo}.zip")

# Actualizar la columna zipCCR a NULL para las plantas que no tienen archivo zip correspondiente
for resultado in resultados:
    PlantName = resultado[0]
    if PlantName not in mejor_similitud_por_plant:
        cursor.execute("""
            UPDATE dbo.URERMDSSummary
            SET zipCCR = NULL
            WHERE PlantName = ?
        """, PlantName)
        print(f"Actualizado {PlantName} a NULL en zipCCR (sin archivo zip)")

# Asegúrate de hacer commit para guardar los cambios
conn_str.commit()

# Cerrar la conexión a la base de datos
conn_str.close()
