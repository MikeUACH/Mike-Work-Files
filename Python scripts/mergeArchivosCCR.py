# Importar pathlib
from pathlib import Path
import os
import pandas as pd
from datetime import datetime, timedelta
import re
import time

from descomprimirZIPSCcr import descomprimir_y_eliminar_zips, recomprimir_archivo

# Directorio donde se encuentran los archivos zip
directorio_zips = Path(r"C:\Users\EJRuiz\Desktop\ArchivosCCR Merged")
directorio_zips_CCRS_10_dias = Path(r"C:\Users\EJRuiz\Desktop\ArchivoCCR (Dinamic dates files)")
# Rutas de las carpetas y archivos
carpeta_origen = r"C:\Users\EJRuiz\Desktop\ArchivoCCR (Dinamic dates files)"
carpeta_destino = r"C:\Users\EJRuiz\Desktop\ArchivosCCR Merged"

def verificar_archivo_completo(filepath, intentos=3, delay=2):
    for i in range(intentos):
        if os.path.exists(filepath) and os.path.getsize(filepath) > 0:
            return True
        time.sleep(delay)  # Espera antes del siguiente intento
    return False

def combinar_archivos(carpeta_origen, carpeta_destino):
    # Obtener lista de archivos en ambas carpetas
    archivos_origen = [f for f in os.listdir(carpeta_origen) if f.endswith('.xls')]
    archivos_destino = [f for f in os.listdir(carpeta_destino) if f.endswith('.xls')]

    # Ordenar los archivos alfabéticamente
    archivos_origen.sort()
    archivos_destino.sort()

    # Crear un diccionario para los archivos destino con su nombre base como clave
    dict_destino = {}
    for archivo in archivos_destino:
        base_nombre = re.match(r'(ccr.*?)', os.path.basename(archivo))
        if base_nombre:
            dict_destino[base_nombre.group()] = archivo

    for archivo_origen in archivos_origen:
        base_nombre_origen = re.match(r'(ccr.*?)', os.path.basename(archivo_origen))
        if not base_nombre_origen:
            print(f"Nombre de archivo no coincide con el patrón esperado: {archivo_origen}")
            continue

        base_nombre_origen = base_nombre_origen.group()
        archivo_destino = dict_destino.get(base_nombre_origen)

        if archivo_destino:
            ruta_destino = os.path.join(carpeta_destino, archivo_destino)

            # Verificar que el archivo de destino está completo
            if not verificar_archivo_completo(ruta_destino):
                print(f"Archivo de destino {archivo_destino} no está listo. Reintentando más tarde.")
                continue
            
            # Leer el archivo de origen
            df_origen = pd.read_csv(os.path.join(carpeta_origen, archivo_origen), delimiter='\t', encoding='latin1')

            # Leer el archivo de destino
            df_destino = pd.read_csv(os.path.join(carpeta_destino, archivo_destino), delimiter='\t', encoding='latin1')
            
            # Debugging: Asegúrate de que los DataFrames se están cargando correctamente
            print(f"Archivos combinando: {archivo_origen} con {archivo_destino}")
            print(f"df_origen columnas: {df_origen.columns}")
            print(f"df_destino columnas: {df_destino.columns}")
            
            # Alinear columnas del destino con las del origen antes de hacer el merge
            df_destino = df_destino.reindex(columns=df_origen.columns, fill_value=pd.NA)

            # Combinar los datos
            df_combinado = pd.concat([df_destino, df_origen], ignore_index=True)

            # Procesar el DataFrame combinado según sea necesario
            df_combinado = procesar_dataframe(df_combinado)

            # Guardar el DataFrame combinado de nuevo en el archivo de destino
            df_combinado.to_csv(os.path.join(carpeta_destino, archivo_destino), index=False, sep='\t', encoding='latin1')
            print(f"Archivo combinado guardado: {archivo_destino}")

        else:
            print(f"No se encontró archivo de destino correspondiente para: {archivo_origen}")

def procesar_dataframe(df):
    # Convertir fechas a datetime, ignorando errores y llenando con NaT (Not a Time)
    df['TimeStarted'] = pd.to_datetime(df['TimeStarted'], errors='coerce')
    df['TimeFinished'] = pd.to_datetime(df['TimeFinished'], errors='coerce')
    df['TimeUpdated'] = pd.to_datetime(df['TimeUpdated'], errors='coerce')
    
    # Filtrar fechas de 'TimeStarted' dentro de los ultimos 5 años
    fecha_limite = df['TimeStarted'].max() - pd.DateOffset(years=5)
    df = df[df['TimeStarted'] >= fecha_limite]
    
    return df

if __name__ == '__main__':
    descomprimir_y_eliminar_zips(directorio_zips)
    descomprimir_y_eliminar_zips(directorio_zips_CCRS_10_dias)
    
    combinar_archivos(carpeta_origen, carpeta_destino)
    
    archivos_xls = [f for f in os.listdir(directorio_zips) if f.endswith('.xls')]
    archivos_xls_10_dias = [f for f in os.listdir(directorio_zips_CCRS_10_dias) if f.endswith('.xls')]
    
    for archivo_xls in archivos_xls:
        base_nombre = re.match(r'(.+?)\.xls$', archivo_xls)
        print(base_nombre)
        if base_nombre:
            recomprimir_archivo(directorio_zips, base_nombre.group(1))
            os.remove(os.path.join(directorio_zips, archivo_xls))
            print(f"Archivo XLS eliminado: {archivo_xls}")
            
    for archivos_xls_10_dias in archivos_xls_10_dias:
        base_nombre_archivos_10 = re.match(r'(.+?)\.xls$', archivos_xls_10_dias)
        print(base_nombre_archivos_10)
        if base_nombre_archivos_10:
            recomprimir_archivo(directorio_zips_CCRS_10_dias, base_nombre_archivos_10.group(1))
            os.remove(os.path.join(directorio_zips_CCRS_10_dias, archivos_xls_10_dias))
            print(f"Archivo XLS eliminado: {archivos_xls_10_dias}")