import os
import pandas as pd
from datetime import datetime, timedelta

def eliminar_filas_antiguas(df):
    # Obtener la fecha de hoy
    fecha_hoy = datetime.now()
    # Calcular la fecha límite (hoy - 17 días)
    fecha_limite = fecha_hoy - timedelta(days=17)

    # Convertir la columna 'Event Date' a datetime si no lo está
    df['Event Date'] = pd.to_datetime(df['Event Date'], errors='coerce')

    # Filtrar filas donde 'Event Date' es mayor o igual a la fecha límite
    df_filtrado = df[df['Event Date'] < fecha_limite]

    return df_filtrado

def procesar_archivos(carpeta_origen, carpeta_destino):
    # Crear la carpeta de destino si no existe
    os.makedirs(carpeta_destino, exist_ok=True)

    # Procesar cada archivo en la carpeta origen
    for archivo in os.listdir(carpeta_origen):
        if archivo.endswith('.xls'):
            ruta_archivo = os.path.join(carpeta_origen, archivo)
            df = pd.read_csv(ruta_archivo, delimiter='\t', encoding='latin1')
            
            # Aplicar la función de eliminación de filas antiguas
            df_filtrado = eliminar_filas_antiguas(df)

            # Guardar el resultado en la carpeta de destino como .xls
            nombre_archivo_filtrado = os.path.join(carpeta_destino, archivo)
            df_filtrado.to_csv(nombre_archivo_filtrado, sep='\t', index=False, encoding='latin1')
            print(f"Procesado: {archivo}")

# Rutas de origen y destino
carpeta_origen = r'C:\Users\EJRuiz\Desktop\ArchivosXLS'
carpeta_destino = r'C:\Users\EJRuiz\Desktop\ArchivosXLS Filtrados'

# Ejecutar el procesamiento de archivos
procesar_archivos(carpeta_origen, carpeta_destino)