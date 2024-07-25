import re
from datetime import datetime

def filter_lines(file_path, output_path):
    # Define el rango de fechas
    start_date = datetime.strptime('2023-05-29', '%Y-%m-%d')
    end_date = datetime.strptime('2024-12-31', '%Y-%m-%d')
    
    # Define el patrón para las fechas
    date_pattern = re.compile(r'(\d{4}-\d{2}-\d{2})')
    
    # Almacena líneas y grupos de líneas
    lines = []
    current_group = []
    all_groups = []
    
    with open(file_path, 'r') as file:
        for line in file:
            if line.startswith('D:') or line.strip() == '':
                # Finaliza el grupo actual si es que existe
                if current_group:
                    all_groups.append(current_group)
                    current_group = []
            current_group.append(line)
        
        # Asegúrate de agregar el último grupo si hay uno
        if current_group:
            all_groups.append(current_group)
    
    # Filtrar los grupos
    filtered_groups = []
    seen_groups = set()
    
    for group in all_groups:
        # Buscar la fecha en las líneas del grupo
        dates = [date_pattern.search(line) for line in group]
        dates = [d.group(1) for d in dates if d]
        
        if dates:
            dates = [datetime.strptime(d, '%Y-%m-%d') for d in dates]
            # Verificar si alguna fecha está dentro del rango
            if any(start_date <= date <= end_date for date in dates):
                # Convertir el grupo a una cadena única para la comparación
                group_key = ''.join(group)
                
                # Si el grupo no se ha visto antes, agrégalo a la lista filtrada
                if group_key not in seen_groups:
                    seen_groups.add(group_key)
                    filtered_groups.extend(group)
    
    # Guardar las líneas filtradas en el archivo de salida
    with open(output_path, 'w') as file:
        file.writelines(filtered_groups)

# Rutas a los archivos de entrada y salida
input_file = 'ProcesaExtraccionesGOLAutoPRUEBA.bat'
output_file = 'filtered_ProcesaExtraccionesGOLAutoPRUEBA.bat'

filter_lines(input_file, output_file)
