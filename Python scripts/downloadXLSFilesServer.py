import os
import shutil
import psutil
import subprocess

def check_vpn_connection(interface_name):
    # Obtener las interfaces de red y sus direcciones IP
    net_if_addrs = psutil.net_if_addrs()
    for interface, addrs in net_if_addrs.items():
        if interface_name in interface:
            return True
    return False

def eliminar_archivos_en_carpeta(carpeta):
    # Eliminar todos los archivos de la carpeta especificada
    for archivo in os.listdir(carpeta):
        ruta_archivo = os.path.join(carpeta, archivo)
        if os.path.isfile(ruta_archivo) or os.path.islink(ruta_archivo):
            os.unlink(ruta_archivo)
            print(f"Archivo {archivo} borrado en {ruta_archivo}.")
        elif os.path.isdir(ruta_archivo):
            shutil.rmtree(ruta_archivo)
            print(f"Archivo {archivo} borrado en {ruta_archivo}.")

def mover_archivos(origen, destino):
    # Mover archivos de una carpeta a otra
    for archivo in os.listdir(origen):
        ruta_archivo_origen = os.path.join(origen, archivo)
        ruta_archivo_destino = os.path.join(destino, archivo)
        if os.path.isfile(ruta_archivo_origen):
            shutil.move(ruta_archivo_origen, ruta_archivo_destino)
            print(f"Archivo {archivo} movido a {ruta_archivo_destino}.")

def ejecutar_script(script_path):
    # Ejecutar un script de Python
    subprocess.run(['python', script_path], check=True)

def main():
    # Nombre de la VPN
    vpn_name = 'txcare-vpn-vnet2'
    
    # Verificar la conexión VPN
    if not check_vpn_connection(vpn_name):
        print(f"No está conectado a la VPN {vpn_name}. Conéctese y vuelva a intentarlo.")
        return

    # Rutas de carpetas archivos XLS GOL
    carpeta_origen_xls = r'O:\VM2\extraerCCR\GasInOilExporter\ArchivosXLS'
    carpeta_origen_acum = r'O:\VM2\extraerCCR\GasInOilExporter\ArchivosXLS less than a year'
    carpeta_destino_xls = r'C:\Users\EJRuiz\Desktop\Proyecto Merge\Xls\ArchivosXLS'
    carpeta_destino_acum = r'C:\Users\EJRuiz\Desktop\Proyecto Merge\Xls\ArchivosXLS Acum'
    
    # Rutas de carpetas archivos CCR's
    carpeta_origen_ccr = r'O:\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\SISTEMAS'
    carpeta_destino_ccr = r'C:\Users\EJRuiz\Desktop\Proyecto Merge\CCR\ArchivosCCR Merged'
    carpeta_origen_dinamicDatesCCR = r'O:\VM2\extraerCCR\VM2 Exporter\ExtraccionesVarias\SISTEMAS (dinamic date CCR)'
    carpeta_destino_dinamicDatesCCR = r'C:\Users\EJRuiz\Desktop\Proyecto Merge\CCR\ArchivoCCR (Dinamic dates files)'
    
    carpeta_script = r'C:\Users\EJRuiz\Desktop\Mike-Work-Files\Python scripts'
    ruta_scriptMergeXLS = os.path.join(carpeta_script, 'mergeArchivosXLS.py')
    ruta_scriptMergeCCR = os.path.join(carpeta_script, 'mergeArchivosCCR.py')
    ruta_CrearBatDinamico = os.path.join(carpeta_script, 'CrearBatDinamico.py')
    
    # Eliminar archivos en las carpetas de destino para XLS files
    eliminar_archivos_en_carpeta(carpeta_destino_xls)
    eliminar_archivos_en_carpeta(carpeta_destino_acum)

    # Mover archivos de origen a destino (archivos xls)
    mover_archivos(carpeta_origen_xls, carpeta_destino_xls)
    mover_archivos(carpeta_origen_acum, carpeta_destino_acum)

    # Ejecutar el script de merge (XLS)
    ejecutar_script(ruta_scriptMergeXLS)
    
    # Mover archivos resultantes a la carpeta original
    mover_archivos(carpeta_destino_xls, carpeta_origen_xls)
    mover_archivos(carpeta_destino_acum, carpeta_origen_acum)
    
#--------------------Para CCR------------------------------------
    # Eliminar archivos en las carpetas de destino para CCR's
    #eliminar_archivos_en_carpeta(carpeta_destino_dinamicDatesCCR)
    #eliminar_archivos_en_carpeta(carpeta_destino_ccr)
    
    # Mover archivos de origen a destino (archivos ccr)
    #mover_archivos(carpeta_origen_ccr, carpeta_destino_ccr)
    #mover_archivos(carpeta_origen_dinamicDatesCCR, carpeta_destino_dinamicDatesCCR)
    
    # Ejecutar el script que descomprime y comprime los archivos y el merge de archivos CCR
    #ejecutar_script(ruta_scriptMergeCCR)
    
    # Mover archivos resultantes a la carpeta original
    #mover_archivos(carpeta_destino_ccr, carpeta_origen_ccr)
    #mover_archivos(carpeta_destino_dinamicDatesCCR, carpeta_origen_dinamicDatesCCR)
    
    print("Proceso completado con éxito.")

if __name__ == "__main__":
    main()