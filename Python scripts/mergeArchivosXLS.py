import os
import pandas as pd
from datetime import datetime, timedelta
import re

# Rutas de las carpetas y archivos
carpeta_origen = r"C:\Users\EJRuiz\Desktop\ArchivosXLS Acum"
carpeta_destino = r"C:\Users\EJRuiz\Desktop\ArchivosXLS"
archivo_bat = r"C:\Users\EJRuiz\Desktop\GasInOilExporter\ProcesaExtraccionesGOLAuto.bat"
                
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
        base_nombre = re.match(r'(gas-in-oil_.*?_[0-3]_)', os.path.basename(archivo))
        if base_nombre:
            dict_destino[base_nombre.group()] = archivo

    for archivo_origen in archivos_origen:
        base_nombre_origen = re.match(r'(gas-in-oil_.*?_[0-3]_)', os.path.basename(archivo_origen))
        if not base_nombre_origen:
            print(f"Nombre de archivo no coincide con el patrón esperado: {archivo_origen}")
            continue

        base_nombre_origen = base_nombre_origen.group()
        archivo_destino = dict_destino.get(base_nombre_origen)

        if archivo_destino:
            # Leer el archivo de origen
            df_origen = pd.read_csv(os.path.join(carpeta_origen, archivo_origen), delimiter='\t', encoding='latin1')

            # Leer el archivo de destino
            df_destino = pd.read_csv(os.path.join(carpeta_destino, archivo_destino), delimiter='\t', encoding='latin1')

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
    df['Event Date'] = pd.to_datetime(df['Event Date'], errors='coerce')
    df['Heat Start Time'] = pd.to_datetime(df['Heat Start Time'], errors='coerce')
    df['Heat End Time'] = pd.to_datetime(df['Heat End Time'], errors='coerce')

    # Filtrar fechas de 'Event Date' dentro del último año
    fecha_limite = df['Event Date'].max() - pd.DateOffset(years=1)
    df = df[df['Event Date'] >= fecha_limite]

    # Eliminar duplicados basados en 'Heat Start Time', asegurando que se conserve la fecha más reciente
    df = df.sort_values(by='Heat End Time')
    no_vacios = df[df['Heat Start Time'].notna()]
    vacios = df[df['Heat Start Time'].isna()]
    no_vacios = no_vacios.drop_duplicates(subset='Heat Start Time', keep='last')
    
    df = pd.concat([no_vacios, vacios], ignore_index=True)

    # Eliminar duplicados basados en 'Event Date', asegurando que se conserve la fecha más reciente
    df = df.sort_values(by='Event Date').drop_duplicates(subset='Event Date', keep='last')

    return df

combinar_archivos(carpeta_origen, carpeta_destino)