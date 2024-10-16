import pandas as pd
import os
import re
from datetime import datetime, timedelta

# Rutas de las carpetas que contienen los archivos XLS
folder1_path = r"C:\Users\EJRuiz\Desktop\Proyecto Merge\Xls\ArchivosXLS Acum"
folder2_path = r"C:\Users\EJRuiz\Desktop\Proyecto Merge\Xls\ArchivosXLS"

# Obtener listas de archivos en ambas carpetas
archivos_acum = [f for f in os.listdir(folder1_path) if f.endswith('.xls')]
archivos_xls = [f for f in os.listdir(folder2_path) if f.endswith('.xls')]

# Crear un diccionario para almacenar los DataFrames de la carpeta ArchivosXLS
dataframes_xls = {}
for archivo in archivos_xls:
    # Usar una expresión regular para extraer el patrón deseado
    match = re.search(r'(gas-in-oil_.*?_[0-3]_)', archivo)
    if match:
        key = match.group(1)  # Tomar el patrón como clave
        # Leer el archivo y almacenar en el diccionario
        dataframes_xls[key] = pd.read_csv(os.path.join(folder2_path, archivo), delimiter='\t', encoding='latin1')

# Actualizar los DataFrames con los archivos de ArchivosXLS Acum
for archivo in archivos_acum:
    match = re.search(r'(gas-in-oil_.*?_[0-3]_)', archivo)
    if match:
        key = match.group(1)  # Tomar el patrón como clave
        # Si existe en el diccionario, actualizarlo
        if key in dataframes_xls:
            # Leer el archivo acumulado
            df_acum = pd.read_csv(os.path.join(folder1_path, archivo), delimiter='\t', encoding='latin1')
            
            # Verificar si hay duplicados en 'Event Date' antes de combinar
            existing_dates = dataframes_xls[key]['Event Date'].unique()
            
            # Filtrar las fechas del DataFrame acumulado para evitar duplicados
            df_acum_filtered = df_acum[~df_acum['Event Date'].isin(existing_dates)]
            
            # Combinar los DataFrames (concatenar primero)
            combined_df = pd.concat([dataframes_xls[key], df_acum_filtered], ignore_index=True)

            # Limpiar posibles filas vacías creadas al concatenar
            combined_df = combined_df.dropna(how='all').reset_index(drop=True)

            # Hacer un merge para actualizar los valores del DataFrame acumulado
            # Realizar un merge left usando el df acumulado como base para actualizar valores
            dataframes_xls[key] = pd.merge(combined_df, df_acum, on='Event Date', how='left', suffixes=('', '_new'))

            # Actualizar las celdas con valores del archivo de folder1_path
            for col in df_acum.columns:
                if col != 'Event Date':  # No actualizar la columna de fecha
                    dataframes_xls[key][col] = dataframes_xls[key].apply(
                        lambda row: row[f"{col}_new"] if pd.notnull(row[f"{col}_new"]) else row[col], axis=1
                    )

            # Eliminar las columnas temporales que no son necesarias
            dataframes_xls[key].drop(columns=[f"{col}_new" for col in df_acum.columns if col != 'Event Date'], inplace=True)

            # Aplicar el filtro para que el archivo resultante solo contenga información del último año
            dataframes_xls[key]['Event Date'] = pd.to_datetime(dataframes_xls[key]['Event Date'], errors='coerce')
            one_year_ago = dataframes_xls[key]['Event Date'].max() - timedelta(days=365)
            dataframes_xls[key] = dataframes_xls[key][dataframes_xls[key]['Event Date'] >= one_year_ago]

            # Si el archivo tiene un nombre diferente (por cambio de fecha), eliminar el archivo antiguo
            for archivo_xls in archivos_xls:
                if key in archivo_xls and archivo_xls != archivo:
                    os.remove(os.path.join(folder2_path, archivo_xls))
                    break

            # Guardar el archivo actualizado en la carpeta ArchivosXLS con el nuevo nombre
            output_file_path = os.path.join(folder2_path, archivo)  # Usar el nombre del archivo en Archivos Acum
            dataframes_xls[key].to_csv(output_file_path, sep='\t', index=False, encoding='latin1')