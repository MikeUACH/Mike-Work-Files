import os
import pandas as pd
from datetime import datetime
import win32com.client as win32
import re
# Rutas de las carpetas
carpeta_origen = r"C:\Users\EJRuiz\Desktop\ArchivosXLS"
carpeta_destino = r"C:\Users\EJRuiz\Desktop\ArchivosXLS Acum"

# Función para combinar archivos Excel (texto plano)
def combinar_archivos(carpeta_origen, carpeta_destino):
    # Leer todos los archivos de la carpeta de destino y combinarlos
    archivos_destino = [os.path.join(carpeta_destino, f) for f in os.listdir(carpeta_destino) if f.endswith('.xls')]
    if archivos_destino:
        df_acumulado = pd.concat([pd.read_csv(f, delimiter='\t', encoding='latin1') for f in archivos_destino], ignore_index=True)
    else:
        df_acumulado = pd.DataFrame()  # En caso de que no haya archivos en la carpeta destino

    # Leer y combinar los archivos de la carpeta origen
    archivos_origen = [os.path.join(carpeta_origen, f) for f in os.listdir(carpeta_origen) if f.endswith('.xls')]
    for archivo in archivos_origen:
        df_nuevo = pd.read_csv(archivo, delimiter='\t', encoding='latin1')
        df_acumulado = pd.concat([df_acumulado, df_nuevo], ignore_index=True)

        # Filtrar los datos para mantener solo un año
        df_acumulado['Event Date'] = pd.to_datetime(df_acumulado['Event Date'])
        fecha_limite = df_acumulado['Event Date'].max() - pd.DateOffset(years=1)
        df_acumulado = df_acumulado[df_acumulado['Event Date'] >= fecha_limite]

        # Eliminar duplicados, conservando solo la última fila del día para Heat Start Time y Heat End Time
        df_acumulado['Heat Start Time'] = pd.to_datetime(df_acumulado['Heat Start Time'])
        df_acumulado['Heat End Time'] = pd.to_datetime(df_acumulado['Heat End Time'])

        # Crear una columna con solo la fecha (sin hora) para Heat Start Time
        df_acumulado['Heat Start Date'] = df_acumulado['Heat Start Time'].dt.date

        # Ordenar por Heat End Time y eliminar duplicados basados en la fecha
        df_acumulado = df_acumulado.sort_values(by='Heat End Time').drop_duplicates(subset='Heat Start Date', keep='last')

        # Eliminar la columna auxiliar 'Heat Start Date'
        df_acumulado.drop(columns=['Heat Start Date'], inplace=True)

        # Guardar el archivo combinado con el nombre original en formato .xlsx
        nombre_archivo = os.path.basename(archivo)
        archivo_xlsx = os.path.join(carpeta_destino, f"{os.path.splitext(nombre_archivo)[0]}.xlsx")
        
        with pd.ExcelWriter(archivo_xlsx, engine='openpyxl') as writer:
            df_acumulado.to_excel(writer, index=False)

        # Convertir el archivo .xlsx a .xls
        archivo_xls = os.path.join(carpeta_destino, f"{os.path.splitext(nombre_archivo)[0]}.xls")
        convertir_xlsx_a_xls(archivo_xlsx, archivo_xls)

        # Eliminar el archivo .xlsx después de convertirlo a .xls
        os.remove(archivo_xlsx)

        # Eliminar los archivos .xls viejos (si existen)
        eliminar_archivos_viejos(carpeta_destino, archivo_xls)

    # Eliminar los archivos procesados de la carpeta origen
    #for archivo in archivos_origen:
       # os.remove(archivo)

    print(f"Archivos combinados, guardados en formato .xls y archivos antiguos eliminados.")

def convertir_xlsx_a_xls(archivo_xlsx, archivo_xls):
    # Convertir el archivo .xlsx a .xls usando win32com
    excel = win32.gencache.EnsureDispatch('Excel.Application')
    wb = excel.Workbooks.Open(archivo_xlsx)
    wb.SaveAs(archivo_xls, FileFormat=56)  # 56 es el formato para .xls
    wb.Close()
    excel.Application.Quit()

def eliminar_archivos_viejos(carpeta_destino, archivo_xls_nuevo):
    # Obtener el nombre base del archivo nuevo (sin la fecha y hora)
    nombre_base_nuevo = os.path.splitext(os.path.basename(archivo_xls_nuevo))[0]
    print(f'Nombre base del nuevo archivo: "{nombre_base_nuevo}"')

    # Listar archivos .xls en la carpeta de destino
    archivos_xls = [os.path.join(carpeta_destino, f) for f in os.listdir(carpeta_destino) if f.endswith('.xls')]
    print(f'Archivos .xls en la carpeta: {archivos_xls}')

    # Crear un diccionario para rastrear el archivo más reciente por nombre base
    archivos_mas_recientes = {}

    for archivo_xls in archivos_xls:
        nombre_archivo = os.path.basename(archivo_xls)
        
        # Extraer el nombre base del archivo (sin la fecha y hora)
        base_name_match = re.match(r"(.+?)(?=_\d{8}_\d{6})", nombre_archivo)
        
        if base_name_match:
            base_name = base_name_match.group(1)
            
            # Obtener la fecha y hora del archivo
            fecha_hora_str = re.search(r"_(\d{8}_\d{6})\.xls$", nombre_archivo)
            if fecha_hora_str:
                fecha_hora = datetime.strptime(fecha_hora_str.group(1), "%Y%m%d_%H%M%S")
            else:
                continue  # Si no se puede extraer la fecha y hora, pasar al siguiente archivo
            
            # Actualizar el archivo más reciente para este nombre base
            if base_name not in archivos_mas_recientes or fecha_hora > archivos_mas_recientes[base_name][1]:
                archivos_mas_recientes[base_name] = (archivo_xls, fecha_hora)

    # Eliminar archivos viejos (mantener solo el más reciente por nombre base)
    for archivo_xls in archivos_xls:
        nombre_archivo = os.path.basename(archivo_xls)
        base_name_match = re.match(r"(.+?)(?=_\d{8}_\d{6})", nombre_archivo)
        
        if base_name_match:
            base_name = base_name_match.group(1)
            if base_name in archivos_mas_recientes and archivo_xls != archivos_mas_recientes[base_name][0]:
                print(f'Eliminando archivo antiguo: {archivo_xls}')
                os.remove(archivo_xls)
            else:
                print(f'No se elimina: {archivo_xls}')

            
# Ejecutar la función de combinación
combinar_archivos(carpeta_origen, carpeta_destino)
