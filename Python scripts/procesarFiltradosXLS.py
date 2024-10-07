import os
import pandas as pd
from datetime import datetime, timedelta

def eliminar_filas_antiguas(df):
    #df['Event Date'] = pd.to_datetime(df['Event Date'], errors='coerce')
    df['TimeStarted'] = pd.to_datetime(df['TimeStarted'], errors='coerce')
    # Obtener la fecha de hoy
    fecha_hoy =  df['TimeStarted'].max()
    # Calcular la fecha límite (hoy - 15 días)
    fecha_limite = fecha_hoy - timedelta(days=10)

    # Convertir la columna 'TimeStarted' a datetime si no lo está
    df['TimeStarted'] = pd.to_datetime(df['TimeStarted'], errors='coerce')

    # Filtrar filas donde 'TimeStarted' está dentro de los últimos 15 días
    df_filtrado = df[(df['TimeStarted'] >= fecha_limite) & (df['TimeStarted'] <= fecha_hoy)]
    
    return df_filtrado

def procesar_archivos(carpeta_origen, carpeta_destino):
    # Crear la carpeta de destino si no existe
    os.makedirs(carpeta_destino, exist_ok=True)

    # Procesar cada archivo en la carpeta origen
    for archivo in os.listdir(carpeta_origen):
        if archivo.endswith('.xls'):
            ruta_archivo = os.path.join(carpeta_origen, archivo)
            df = pd.read_csv(ruta_archivo, delimiter='\t', encoding='latin1', low_memory=False)
            
            # Aplicar la función de eliminación de filas antiguas
            df_filtrado = eliminar_filas_antiguas(df)

            # Guardar el resultado en la carpeta de destino como .xls
            nombre_archivo_filtrado = os.path.join(carpeta_destino, archivo)
            df_filtrado.to_csv(nombre_archivo_filtrado, sep='\t', index=False, encoding='latin1')
            print(f"Procesado: {archivo}")

# Rutas de origen y destino
carpeta_origen = r'C:\Users\EJRuiz\Desktop\Proyecto Merge\CCR\ArchivoCCR(Dinamic dates files)'
carpeta_destino = r'C:\Users\EJRuiz\Desktop\Proyecto Merge\CCR'

# Ejecutar el procesamiento de archivos
procesar_archivos(carpeta_origen, carpeta_destino)
