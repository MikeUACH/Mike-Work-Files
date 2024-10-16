import pandas as pd
import os
import re

# Rutas de las carpetas que contienen los archivos XLS
folder1_path = r"C:\Users\EJRuiz\Desktop\Proyecto Merge\CCR\ArchivoCCR(Dinamic dates files)"
folder2_path = r"C:\Users\EJRuiz\Desktop\Proyecto Merge\CCR\ArchivosCCR Merged"

# Obtener listas de archivos en ambas carpetas
archivos_acum = [f for f in os.listdir(folder1_path) if f.endswith('.xls')]
archivos_xls = [f for f in os.listdir(folder2_path) if f.endswith('.xls')]

# Crear un diccionario para almacenar los DataFrames de la carpeta ArchivosXLS
dataframes_xls = {}
for archivo in archivos_xls:
    # Usar una expresión regular para extraer el patrón deseado
    match = re.search(r'(ccr.*?)', archivo)
    if match:
        key = match.group(1)  # Tomar el patrón como clave
        # Leer el archivo y almacenar en el diccionario
        dataframes_xls[key] = pd.read_csv(os.path.join(folder2_path, archivo), delimiter='\t', encoding='latin1')

# Actualizar los DataFrames con los archivos de ArchivosXLS Acum
for archivo in archivos_acum:
    match = re.search(r'(ccr.*?)', archivo)
    if match:
        key = match.group(1)  # Tomar el patrón como clave
        # Si existe en el diccionario, actualizarlo
        if key in dataframes_xls:
            # Leer el archivo acumulado
            df_acum = pd.read_csv(os.path.join(folder1_path, archivo), delimiter='\t', encoding='latin1')

            # Verificar si hay duplicados en 'TimeStarted' antes de combinar
            existing_dates = dataframes_xls[key]['TimeStarted'].unique()

            # Filtrar las fechas del DataFrame acumulado para evitar duplicados
            df_acum_filtered = df_acum[~df_acum['TimeStarted'].isin(existing_dates)]
            
            # Concatenar los DataFrames
            dataframes_xls[key] = pd.concat([dataframes_xls[key], df_acum_filtered], ignore_index=True)

            # Eliminar filas duplicadas completas
            dataframes_xls[key].drop_duplicates(inplace=True)

            # Limpiar posibles filas vacías creadas al concatenar
            dataframes_xls[key].dropna(how='all', inplace=True)
            dataframes_xls[key].reset_index(drop=True, inplace=True)

            # Guardar el archivo actualizado en la carpeta ArchivosXLS con el nombre del archivo en Archivos Acum
            nuevo_nombre = archivo  # El nombre del archivo en Archivos Acum
            output_file_path = os.path.join(folder2_path, nuevo_nombre)  # Sobrescribir archivo en ArchivosXLS
            dataframes_xls[key].to_csv(output_file_path, sep='\t', index=False, encoding='latin1')

