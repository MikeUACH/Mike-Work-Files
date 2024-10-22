# Importar pathlib
from pathlib import Path
import os
import pandas as pd
import re
import zipfile

from descomprimirZIPSCcr import descomprimir_y_eliminar_zips, recomprimir_archivo

# Directorio donde se encuentran los archivos zip
directorio_zips = Path(r"C:\Users\EJRuiz\Desktop\Mike-Work-Files\Proyecto Merge\CCR\ArchivosCCR Merged")
directorio_zips_CCRS_10_dias = Path(r"C:\Users\EJRuiz\Desktop\Mike-Work-Files\Proyecto Merge\CCR\ArchivoCCR(Dinamic dates files)")
# Rutas de las carpetas y archivos
folder2_path = r"C:\Users\EJRuiz\Desktop\Mike-Work-Files\Proyecto Merge\CCR\ArchivoCCR(Dinamic dates files)"
folder1_path = r"C:\Users\EJRuiz\Desktop\Mike-Work-Files\Proyecto Merge\CCR\ArchivosCCR Merged"

def combinar_archivos(folder2_path, folder1_path):
    # Obtener listas de archivos en ambas carpetas
    archivos_acum = [f for f in os.listdir(folder1_path) if f.endswith('.xls')]
    archivos_xls = [f for f in os.listdir(folder2_path) if f.endswith('.xls')]

    # Crear un diccionario para almacenar los DataFrames de la carpeta ArchivosXLS
    dataframes_xls = {}
    for archivo in archivos_xls:
        # Usar una expresión regular para extraer el patrón deseado
        match = re.search(r'(ccr_[A-Za-z]+(?: [A-Za-z]+)*)', archivo)
        if match:
            key = match.group(1)  # Tomar el patrón como clave
            # Leer el archivo y almacenar en el diccionario
            dataframes_xls[key] = pd.read_csv(os.path.join(folder2_path, archivo), delimiter='\t', encoding='latin1')

    # Actualizar los DataFrames con los archivos de ArchivosXLS Acum
    for archivo in archivos_acum:
        match = re.search(r'(ccr_[A-Za-z]+(?: [A-Za-z]+)*)', archivo)
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
   
def recomprimir_archivo(carpeta, nombre_base_archivo):
    # Definir la ruta completa del archivo XLS
    ruta_archivo_xls = os.path.join(carpeta, f"{nombre_base_archivo}.xls")
    
    # Crear el archivo zip con el mismo nombre base que el archivo XLS
    ruta_zip = os.path.join(carpeta, f"{nombre_base_archivo}.zip")
    
    with zipfile.ZipFile(ruta_zip, 'w') as zipf:
        # Añadir el archivo XLS al zip
        zipf.write(ruta_archivo_xls, arcname=f"{nombre_base_archivo}.xls")
        
    print(f"Archivo comprimido: {ruta_zip}")
          
if __name__ == '__main__':
    #descomprimir_y_eliminar_zips(directorio_zips_CCRS_10_dias)
    #descomprimir_y_eliminar_zips(directorio_zips)
    
    
    combinar_archivos(folder1_path, folder2_path)
    
    # Procesar los archivos de la primera carpeta
    '''
    archivos_xls = [f for f in os.listdir(directorio_zips) if f.endswith('.xls')]
    for archivo_xls in archivos_xls:
        base_nombre = re.match(r'(.+?)\.xls$', archivo_xls)
        if base_nombre:
            recomprimir_archivo(directorio_zips, base_nombre.group(1))
            os.remove(os.path.join(directorio_zips, archivo_xls))
            print(f"Archivo XLS eliminado: {archivo_xls}")

    # Procesar los archivos de la segunda carpeta
    archivos_xls_10_dias = [f for f in os.listdir(directorio_zips_CCRS_10_dias) if f.endswith('.xls')]
    for archivo_xls_10 in archivos_xls_10_dias:
        base_nombre_archivos_10 = re.match(r'(.+?)\.xls$', archivo_xls_10)
        if base_nombre_archivos_10:
            recomprimir_archivo(directorio_zips_CCRS_10_dias, base_nombre_archivos_10.group(1))
            os.remove(os.path.join(directorio_zips_CCRS_10_dias, archivo_xls_10))
            print(f"Archivo XLS eliminado: {archivo_xls_10}") 
    '''