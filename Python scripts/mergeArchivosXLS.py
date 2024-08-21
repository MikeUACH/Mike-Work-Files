import os
import pandas as pd
import subprocess
from datetime import datetime, timedelta
import win32com.client as win32
import re
import time

# Rutas de las carpetas y archivos
carpeta_origen = r"C:\Users\EJRuiz\Desktop\ArchivosXLS"
carpeta_destino = r"C:\Users\EJRuiz\Desktop\ArchivosXLS Acum"
archivo_bat = r"C:\Users\EJRuiz\Desktop\GasInOilExporter\ProcesaExtraccionesGOLAuto.bat"
archivo_bat_dinamico = r"C:\Users\EJRuiz\Desktop\GasInOilExporter"
    
# Función para generar y procesar el archivo .bat dinámico
def generar_y_procesar_bat_dinamico(carpeta_destino, archivo_bat_dinamico, archivo_bat):
    archivos_xls = [os.path.join(carpeta_destino, f) for f in os.listdir(carpeta_destino) if f.endswith('.xls')]
    
    for archivo in archivos_xls:
        nombre_archivo = os.path.splitext(os.path.basename(archivo))[0]
        archivo_xlsx = os.path.join(carpeta_destino, f"{nombre_archivo}.xls")
        
        if not os.path.exists(archivo_xlsx):
            print(f"No se encontró el archivo Excel para {nombre_archivo}")
            continue

        print(f"Procesando archivo: {archivo_xlsx}")

        # Leer como CSV con tabuladores
        df = pd.read_csv(archivo, delimiter='\t', encoding='latin1')
        
        # Verifica si hay filas donde 'Heat Start Time' y 'Heat End Time' estén vacíos
        df_vacios = df[df['Heat Start Time'].isna() & df['Heat End Time'].isna()]
        if not df_vacios.empty:
            # Convertir 'Heat End Time' a datetime con el formato correcto
            df['Heat End Time'] = pd.to_datetime(df['Heat End Time'], format='%m/%d/%Y %H:%M', errors='coerce')

            # Filtrar filas no vacías para calcular la última fecha válida
            df_validas = df.dropna(subset=['Heat End Time'])
            ultima_fecha = df_validas['Heat End Time'].max()
            
            if pd.isna(ultima_fecha):
                print(f"No se pudo determinar la última fecha válida para {nombre_archivo}")
                continue

            print(f"Última fecha válida encontrada: {ultima_fecha}")

            # Calcula la fecha de inicio como 5 días antes de la última fecha válida
            fecha_inicio = (ultima_fecha - timedelta(days=5)).strftime("%m/%d/%Y %H:%M")
            print(f'Fecha de inicio: {fecha_inicio}')
            fecha_inicio = convertir_fecha(fecha_inicio)  # Convertir a yyyy-mm-dd
            fecha_fin = datetime.now().strftime("%m/%d/%Y %H:%M")
            print(f'Fecha final: {fecha_fin}')
            fecha_fin = convertir_fecha(fecha_fin)  # Convertir a yyyy-mm-dd

            # Generar y guardar el comando .bat dinámico
            comando = construir_comando_bat(nombre_archivo, archivo_bat, fecha_inicio, fecha_fin)

            archivo_bat_dinamico_path = os.path.join(archivo_bat_dinamico, f"{nombre_archivo}_Dinamico.bat")
            with open(archivo_bat_dinamico_path, 'w') as f:
                f.write(comando)

            print(f"Archivo .bat generado para {nombre_archivo}: {archivo_bat_dinamico_path}")

            # Comentado: Ejecución del archivo .bat dinámico
            #subprocess.run([archivo_bat_dinamico_path], shell=True)

            # Opción para eliminar el archivo .bat dinámico después de la ejecución
            #os.remove(archivo_bat_dinamico_path)
        else:
            print(f"No se encontraron campos vacíos en {nombre_archivo}, no se generó el .bat")

def convertir_fecha(fecha_str):
    try:
        # Verificar si ya está en el formato yyyy-MM-dd
        fecha_datetime = datetime.strptime(fecha_str, '%Y-%m-%d %H:%M')
        return fecha_datetime.strftime('%Y-%m-%d')
    except ValueError:
        pass
    
    try:
        # Intentar convertir si la fecha incluye tiempo
        fecha_datetime = datetime.strptime(fecha_str, '%m/%d/%Y %H:%M')
        return fecha_datetime.strftime('%Y-%m-%d')
    except ValueError:
        pass

    try:
        # Intentar convertir si la fecha no incluye tiempo
        fecha_datetime = datetime.strptime(fecha_str, '%m/%d/%Y')
        return fecha_datetime.strftime('%Y-%m-%d')
    except ValueError:
        print(f"Error al convertir la fecha: {fecha_str}")
        return None
                
def combinar_archivos(carpeta_origen, carpeta_destino):
    # Combina archivos, elimina duplicados y guarda resultados en .xls
    archivos_destino = [os.path.join(carpeta_destino, f) for f in os.listdir(carpeta_destino) if f.endswith('.xls')]
    if archivos_destino:
        df_acumulado = pd.concat([pd.read_csv(f, delimiter='\t', encoding='latin1') for f in archivos_destino], ignore_index=True)
    else:
        df_acumulado = pd.DataFrame()

    archivos_origen = [os.path.join(carpeta_origen, f) for f in os.listdir(carpeta_origen) if f.endswith('.xls')]
    for archivo in archivos_origen:
        df_nuevo = pd.read_csv(archivo, delimiter='\t', encoding='latin1')
        df_acumulado = pd.concat([df_acumulado, df_nuevo], ignore_index=True)

    # Convertir fechas a datetime, ignorando errores y llenando con NaT (Not a Time)
    df_acumulado['Event Date'] = pd.to_datetime(df_acumulado['Event Date'], format='%m/%d/%Y %H:%M:%S', errors='coerce')
    df_acumulado['Heat Start Time'] = pd.to_datetime(df_acumulado['Heat Start Time'], format='%m/%d/%Y %H:%M:%S', errors='coerce')
    df_acumulado['Heat End Time'] = pd.to_datetime(df_acumulado['Heat End Time'], format='%m/%d/%Y %H:%M:%S', errors='coerce')

    # Aplicar el formato deseado para que se vea como '%m/%d/%Y %H:%M' al guardar en Excel
    df_acumulado['Event Date'] = df_acumulado['Event Date'].dt.strftime('%m/%d/%Y %H:%M')
    df_acumulado['Heat Start Time'] = df_acumulado['Heat Start Time'].dt.strftime('%m/%d/%Y %H:%M')
    df_acumulado['Heat End Time'] = df_acumulado['Heat End Time'].dt.strftime('%m/%d/%Y %H:%M')
    
    # Filtrar fechas de 'Event Date' dentro del último año
    fecha_limite = df_acumulado['Event Date'].max() - pd.DateOffset(years=1)
    df_acumulado = df_acumulado[df_acumulado['Event Date'] >= fecha_limite]

    # Eliminar duplicados basados en 'Heat Start Time', asegurando que se conserve la fecha más reciente
    df_acumulado = df_acumulado.sort_values(by='Heat End Time')
    no_vacios = df_acumulado[df_acumulado['Heat Start Time'].notna()]
    vacios = df_acumulado[df_acumulado['Heat Start Time'].isna()]
    no_vacios = no_vacios.drop_duplicates(subset='Heat Start Time', keep='last')
    
    df_acumulado = pd.concat([no_vacios, vacios], ignore_index=True)
    
    # Eliminar duplicados basados en 'Event Date', asegurando que se conserve la fecha más reciente
    df_acumulado = df_acumulado.sort_values(by='Event Date').drop_duplicates(subset='Event Date', keep='last')

    # Guardar el DataFrame combinado en formato .xlsx y luego convertir a .xls
    nombre_archivo = os.path.basename(archivo)
    archivo_xlsx = os.path.join(carpeta_destino, f"{os.path.splitext(nombre_archivo)[0]}.xlsx")
    
    with pd.ExcelWriter(archivo_xlsx, engine='openpyxl') as writer:
        df_acumulado.to_excel(writer, index=False)
        
    archivo_xls = os.path.join(carpeta_destino, f"{os.path.splitext(nombre_archivo)[0]}.xls")
    convertir_xlsx_a_xls(archivo_xlsx, archivo_xls)

    os.remove(archivo_xlsx)

    eliminar_archivos_viejos(carpeta_destino, archivo_xls)

    print(f"Archivos combinados, guardados en formato .xls y archivos antiguos eliminados.")

def convertir_xlsx_a_xls(archivo_xlsx, archivo_xls):
    excel = win32.gencache.EnsureDispatch('Excel.Application')
    wb = excel.Workbooks.Open(archivo_xlsx)
    wb.SaveAs(archivo_xls, FileFormat=56)
    wb.Close()
    excel.Application.Quit()

def eliminar_archivos_viejos(carpeta_destino, archivo_xls_nuevo):
    nombre_base_nuevo = os.path.splitext(os.path.basename(archivo_xls_nuevo))[0]
    archivos_xls = [os.path.join(carpeta_destino, f) for f in os.listdir(carpeta_destino) if f.endswith('.xls')]

    archivos_mas_recientes = {}

    for archivo_xls in archivos_xls:
        nombre_archivo = os.path.basename(archivo_xls)
        base_name_match = re.match(r"(.+?)(?=_\d{8}_\d{6})", nombre_archivo)
        
        if base_name_match:
            base_name = base_name_match.group(1)
            fecha_hora_str = re.search(r"_(\d{8}_\d{6})\.xls$", nombre_archivo)
            if fecha_hora_str:
                fecha_hora = datetime.strptime(fecha_hora_str.group(1), "%Y%m%d_%H%M%S")
            else:
                continue
            
            if base_name not in archivos_mas_recientes or fecha_hora > archivos_mas_recientes[base_name][1]:
                archivos_mas_recientes[base_name] = (archivo_xls, fecha_hora)

    for archivo_xls in archivos_xls:
        nombre_archivo = os.path.basename(archivo_xls)
        base_name_match = re.match(r"(.+?)(?=_\d{8}_\d{6})", nombre_archivo)
        
        if base_name_match:
            base_name = base_name_match.group(1)
            if base_name in archivos_mas_recientes and archivo_xls != archivos_mas_recientes[base_name][0]:
                os.remove(archivo_xls)
                
def construir_comando_bat(nombre_archivo, archivo_bat, fecha_inicio, fecha_fin):
    # Extraer la base del nombre del archivo sin la fecha
    base_nombre = re.match(r'(gas-in-oil_.*?_0_)', nombre_archivo)
    if base_nombre:
        base_nombre = base_nombre.group(1)
    else:
        raise ValueError(f"El nombre del archivo no sigue el formato esperado: {nombre_archivo}")

    # Leer el archivo .bat y buscar el bloque correspondiente al nombre del archivo
    with open(archivo_bat, 'r') as f:
        lineas = f.readlines()

    # Buscar la línea que contiene la base del nombre del archivo
    patron = re.compile(rf'{re.escape(base_nombre)}.*')
    lineas_encontradas = [i for i, linea in enumerate(lineas) if patron.search(linea)]

    if not lineas_encontradas:
        raise ValueError(f"No se encontró un bloque para el archivo: {nombre_archivo}")

    indice_linea = lineas_encontradas[0]

    # Obtener 2 líneas arriba y 4 líneas abajo de la línea encontrada
    inicio = max(0, indice_linea - 2)
    fin = min(len(lineas), indice_linea + 5)
    bloque_comando = lineas[inicio:fin]

    # Unir las líneas del bloque en un solo comando, separadas por un espacio
    comando = '\n'.join([linea.strip() for linea in bloque_comando])

    # Imprimir el comando antes de reemplazar las fechas para depuración
    print("Comando original:")
    print(comando)

    # Reemplazar las fechas en el comando
    comando = re.sub(r'\d{4}-\d{2}-\d{2}', fecha_inicio, comando, count=1)  # Cambia la primera fecha encontrada por fecha_inicio_bat

    # Imprimir el comando después de reemplazar las fechas para depuración
    print("Comando con fechas reemplazadas:")
    print(comando)

    return comando

# Ejecutar las funciones
generar_y_procesar_bat_dinamico(carpeta_destino, archivo_bat_dinamico, archivo_bat)
#time.sleep(10)
combinar_archivos(carpeta_origen, carpeta_destino)