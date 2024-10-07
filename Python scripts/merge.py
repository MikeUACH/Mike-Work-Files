import pandas as pd
import os
import re

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
            
            # Realizar el merge entre el DataFrame existente y el nuevo de "ArchivosXLS Acum"
            merged_df = pd.merge(dataframes_xls[key], df_acum, on='Event Date', how='left', suffixes=('', '_acum'))

            # Actualizar las columnas con los datos de df_acum
            for column in df_acum.columns:
                if column != 'Event Date':  # No actualizar Event Date
                    # Reemplazar los valores de columnas vacías con los del acumulado
                    merged_df[column] = merged_df[column].combine_first(merged_df[column + '_acum'])
                    merged_df = merged_df.drop(columns=[column + '_acum'])  # Eliminar la columna temporal

            # Limpiar posibles filas vacías creadas al combinar
            merged_df = merged_df.dropna(how='all').reset_index(drop=True)

            # Guardar el archivo actualizado en la carpeta ArchivosXLS con el nuevo nombre
            output_file_path = os.path.join(folder2_path, archivo)  # Usar el nombre del archivo en Archivos Acum
            merged_df.to_csv(output_file_path, sep='\t', index=False, encoding='latin1')

            # Reemplazar el DataFrame original en el diccionario con el DataFrame combinado
            dataframes_xls[key] = merged_df

            # Si el archivo tiene un nombre diferente (por cambio de fecha), eliminar el archivo antiguo
            for archivo_xls in archivos_xls:
                if key in archivo_xls and archivo_xls != archivo:
                    os.remove(os.path.join(folder2_path, archivo_xls))
                    break
