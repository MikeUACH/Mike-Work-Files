import os
import pandas as pd
import subprocess
from datetime import datetime
import win32com.client as win32
import re

# Rutas de las carpetas y archivos
carpeta_origen = r"C:\Users\EJRuiz\Desktop\ArchivosXLS"
carpeta_destino = r"C:\Users\EJRuiz\Desktop\ArchivosXLS Acum"
archivo_bat = r"C:\Users\EJRuiz\Desktop\GasInOilExporter\ProcesaExtraccionesGOLAuto.bat"
archivo_bat_dinamico = r"C:\Users\EJRuiz\Desktop\GasInOilExporter"
nombre_archivo = "ProcesaExtraccionesGOL_Dinamico.bat"  # Debes definir el nombre del archivo apropiadamente

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

        df_acumulado['Event Date'] = pd.to_datetime(df_acumulado['Event Date'])
        fecha_limite = df_acumulado['Event Date'].max() - pd.DateOffset(years=1)
        df_acumulado = df_acumulado[df_acumulado['Event Date'] >= fecha_limite]

        df_acumulado['Heat Start Time'] = pd.to_datetime(df_acumulado['Heat Start Time'])
        df_acumulado['Heat End Time'] = pd.to_datetime(df_acumulado['Heat End Time'])

        df_acumulado['Heat Start Date'] = df_acumulado['Heat Start Time'].dt.date
        df_acumulado = df_acumulado.sort_values(by='Heat End Time').drop_duplicates(subset='Heat Start Date', keep='last')

        df_acumulado.drop(columns=['Heat Start Date'], inplace=True)

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

def construir_comando_bat(nombre_archivo, archivo_bat):
    # Leer el archivo .bat y buscar el bloque correspondiente al nombre del archivo
    with open(archivo_bat, 'r') as f:
        lineas = f.readlines()

    # Buscar la línea que contiene el nombre del archivo
    patron = re.compile(rf'gas-in-oil_{re.escape(nombre_archivo)}_.*')
    lineas_encontradas = [i for i, linea in enumerate(lineas) if patron.search(linea)]

    if not lineas_encontradas:
        raise ValueError(f"No se encontró un bloque para el archivo: {nombre_archivo}")

    indice_linea = lineas_encontradas[0]

    # Obtener 2 líneas arriba y 4 líneas abajo de la línea encontrada
    inicio = max(0, indice_linea - 2)
    fin = min(len(lineas), indice_linea + 5)
    bloque_comando = lineas[inicio:fin]

    # Unir las líneas del bloque en un solo comando, separadas por un espacio
    comando = ' '.join([linea.strip() for linea in bloque_comando])

    return comando

def generar_y_procesar_bat_dinamico(nombre_archivo, archivo_bat_dinamico, archivo_bat):
    archivo_xlsx = os.path.join(carpeta_destino, f"{nombre_archivo}.xlsx")
    if not os.path.exists(archivo_xlsx):
        print(f"No se encontró el archivo Excel para {nombre_archivo}")
        return

    df = pd.read_excel(archivo_xlsx)

    # Verifica si hay filas donde 'Heat Start Time' y 'Heat End Time' estén vacíos
    df_vacios = df[df['Heat Start Time'].isna() | df['Heat End Time'].isna()]
    if not df_vacios.empty:
        # Busca la última fila donde ambos campos no estén vacíos
        ultima_fecha = df.dropna(subset=['Heat Start Time', 'Heat End Time'])['Heat End Time'].max()
        if pd.isna(ultima_fecha):
            print(f"No se pudo determinar la última fecha válida para {nombre_archivo}")
            return

        fecha_inicio = ultima_fecha.date()
        fecha_fin = datetime.now().date()

        # Generar y guardar el comando .bat dinámico
        comando = construir_comando_bat(nombre_archivo, archivo_bat)
        with open(archivo_bat_dinamico, 'w') as f:
            f.write(comando)

        print(f"Archivo .bat generado para {nombre_archivo}: {archivo_bat_dinamico}")

        # Comentado: Ejecución del archivo .bat dinámico
        # subprocess.run([archivo_bat_dinamico], shell=True)

        # Opción para eliminar el archivo .bat dinámico después de la ejecución
        # os.remove(archivo_bat_dinamico)
    else:
        print(f"No se encontraron campos vacíos en {nombre_archivo}, no se generó el .bat")

# Ejecutar las funciones
combinar_archivos(carpeta_origen, carpeta_destino)
generar_y_procesar_bat_dinamico(nombre_archivo, archivo_bat_dinamico, archivo_bat)

