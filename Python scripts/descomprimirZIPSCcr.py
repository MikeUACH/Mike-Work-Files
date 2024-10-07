from pathlib import Path
import zipfile
import os

def descomprimir_y_eliminar_zips(directorio_zips):
    # Verifica todos los archivos en el directorio
    todos_los_archivos = list(directorio_zips.iterdir())
    print("Archivos en el directorio:")
    for archivo in todos_los_archivos:
        print(archivo)

    # Filtrar solo los archivos .zip y ordenarlos
    archivo_zip = sorted(list(directorio_zips.glob("*.zip")))
    print("Archivos .zip encontrados:")
    print(archivo_zip)

    # Si encuentras archivos, puedes proceder a descomprimirlos
    for ruta in archivo_zip:
        print(f"Descomprimiendo: {ruta}")
        with zipfile.ZipFile(ruta, 'r') as zip_object:
            zip_object.extractall(directorio_zips)
        os.remove(ruta)  # Elimina el archivo ZIP después de descomprimir
        print(f"Archivo ZIP eliminado: {ruta}")

def recomprimir_archivo(directorio, nombre_zip):
    # Crear un archivo ZIP con el nombre proporcionado
    zip_path = directorio / f"{nombre_zip}.zip"
    with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(directorio):
            for file in files:
                if file != zip_path.name:  # Evita añadir el archivo ZIP dentro de sí mismo
                    zipf.write(os.path.join(root, file), arcname=file)
    print(f"Archivos comprimidos en: {zip_path}")

if __name__ == "__main__":
    directorio_zips = Path(r"C:\Users\EJRuiz\Desktop\ArchivosCCR Merged")
    descomprimir_y_eliminar_zips(directorio_zips)
