import re

def cargar_inventario(archivo_inventario):
    inventario = []
    with open(archivo_inventario, 'r') as archivo:
        next(archivo)  # Saltar la cabecera
        for linea in archivo:
            datos = linea.strip().split(';')
            inventario.append({
                "codigo": datos[0],
                "producto": datos[1],
                "color": datos[2],
                "depto": datos[3],
                "precio": int(datos[4]),
                "existencias": int(datos[5])
            })
    return inventario

def cargar_vendedores(archivo_vendedores):
    vendedores = []
    with open(archivo_vendedores, 'r') as archivo:
        next(archivo)  # Saltar la cabecera
        for i, linea in enumerate(archivo):
            if i < 7:  # Leer la tabla de empleados en A1:E7
                datos = linea.strip().split(';')
                
                vendedores.append({  
                    "clave": datos[0],
                    "apellido_p": datos[1],
                    "apellido_m": datos[2],
                    "nombre": datos[3],
                    "sexo": datos[4]
                })
    return vendedores
def cargar_ventas(archivo):
    ventas = {}
    encabezados = []
    
    with open(archivo, 'r', encoding='utf-8') as f:
        lineas = f.readlines()
        
        # Encontrar la línea de encabezados (PRODUCTO;JH;FC;CD;MM;YM;BH)
        encabezados = lineas[0].strip().split(';')[1:]  # Obtén los empleados como encabezados desde la primera línea
        print(f"Encabezados (Empleados): {encabezados}")  # Mostrar encabezados

        # Procesar las líneas de productos y ventas
        for linea in lineas[1:]:
            partes = linea.strip().split(';')  # Divide la línea por el separador ;
            codigo_producto = partes[0].strip()  # El primer elemento es el código del producto
            
            # Verificar que la línea no esté vacía y que el código de producto sea válido
            if codigo_producto and re.match(r'^[A-Z]{4}\d{3}$', codigo_producto):  # Validar código de producto
                cantidades = [int(cantidad) if cantidad.isdigit() else 0 for cantidad in partes[1:]]  # Convertir a int o 0 si no es un número
                print(f"Cargando producto: {codigo_producto} con cantidades: {cantidades}")  # Mostrar código y cantidades
                
                # Asociar el producto con las ventas por empleado
                ventas[codigo_producto] = {encabezados[i]: cantidades[i] for i in range(len(encabezados))}
    
    return ventas, encabezados

def guardar_ventas(archivo, ventas, encabezados):
    with open(archivo, 'w', encoding='utf-8') as f:
        # Escribir los encabezados
        f.write('PRODUCTO;' + ';'.join(encabezados) + ';\n')
        
        # Escribir las ventas
        for codigo_producto, datos in ventas.items():
            f.write(codigo_producto + ';' + ';'.join(str(datos[empleado]) for empleado in encabezados) + ';\n')
            
def registrar_venta(vendedores, ventas, encabezados, archivo_ventas):
    clave_empleado = input("Ingrese su clave de empleado: ").strip()
    
    # Buscar al empleado en la lista de vendedores
    empleado = next((v for v in vendedores if v['clave'] == clave_empleado), None)
    
    if empleado:
        print(f"Bienvenido, {empleado['nombre']}.")
        
        # Mostrar los productos disponibles
        productos_disponibles = [p for p in ventas.keys()]  # Filtrar solo los productos válidos
        print("Productos disponibles:", productos_disponibles)  # Mostrar los códigos de productos
        
        # Solicitar el código del producto
        codigo_producto = input("Ingrese el código del producto que desea vender: ").strip()
        
        # Verificar si el producto existe en la tabla de ventas
        if codigo_producto in ventas:
            cantidad = int(input(f"Cantidad de {codigo_producto} a vender: "))
            
            # Inicializar la entrada para el empleado si no existe
            if clave_empleado not in ventas[codigo_producto]:
                ventas[codigo_producto][clave_empleado] = 0
            
            # Actualizar la cantidad vendida para ese producto en la tabla de ventas
            ventas[codigo_producto][clave_empleado] += cantidad
            print(f"Venta registrada: {cantidad} unidades del producto {codigo_producto}.")
            
            # Guardar las ventas actualizadas en el archivo CSV
            guardar_ventas(archivo_ventas, ventas, encabezados)
        else:
            print("El producto no se encuentra registrado en las ventas.")
    else:
        print("Clave de empleado incorrecta.")


def registrar_llegada(inventario):
    codigo_producto = input("Ingrese el código del producto que ha llegado al almacén: ")
    producto = next((i for i in inventario if i['codigo'] == codigo_producto), None)
    
    if producto:
        cantidad = int(input(f"Cantidad de {producto['producto']} recibida: "))
        producto['existencias'] += cantidad  # Actualizar existencias
        print(f"Llegada registrada: {cantidad} unidades de {producto['producto']} añadidas.")
    else:
        print("Producto no encontrado en el inventario.")

def consultar_inventario(inventario):
    print("\nInventario actual:")
    for producto in inventario:
        print(f"{producto['producto']} - Existencias: {producto['existencias']}")

def modelo_mas_vendido(inventario, ventas):
    mas_vendido = max(ventas, key=lambda v: sum([v['JH'], v['FC'], v['CD'], v['MM'], v['YM'], v['BH']]))
    print(f"El modelo más vendido es: {mas_vendido['producto']}")

def vendedor_mas_activo(vendedores, ventas):
    total_por_vendedor = {"JH": 0, "FC": 0, "CD": 0, "MM": 0, "YM": 0, "BH": 0}
    
    for venta in ventas:
        total_por_vendedor["JH"] += venta["JH"]
        total_por_vendedor["FC"] += venta["FC"]
        total_por_vendedor["CD"] += venta["CD"]
        total_por_vendedor["MM"] += venta["MM"]
        total_por_vendedor["YM"] += venta["YM"]
        total_por_vendedor["BH"] += venta["BH"]
    
    vendedor_clave = max(total_por_vendedor, key=total_por_vendedor.get)
    vendedor = next((v for v in vendedores if v['clave'] == vendedor_clave), None)
    
    if vendedor:
        print(f"El vendedor más activo es: {vendedor['nombre']} {vendedor['apellido_p']} {vendedor['apellido_m']}")
    else:
        print("No se pudo encontrar el vendedor.")

def reporte_ventas_vendedor(vendedores, inventario, ventas):
    clave_empleado = input("Ingrese la clave del vendedor: ")
    vendedor = next((v for v in vendedores if v['clave'] == clave_empleado), None)
    
    if vendedor:
        print(f"Reporte de ventas de {vendedor['nombre']}:")
        for venta in ventas:
            if venta[clave_empleado] > 0:
                print(f"Producto: {venta['producto']} - Cantidad vendida: {venta[clave_empleado]}")
    else:
        print("Clave de vendedor no encontrada.")

def promedio_ventas(vendedores, inventario, ventas):
    total_ventas = sum([sum([venta['JH'], venta['FC'], venta['CD'], venta['MM'], venta['YM'], venta['BH']]) for venta in ventas])
    promedio = total_ventas / len(ventas)
    print(f"El promedio de ventas es: {promedio:.2f}")

def menu_principal():
    InvFile = r'C:\Users\EJRuiz\Desktop\Mike-Work-Files\FINAL ALVARO\INVENTARIO.csv'
    VendFile = r'C:\Users\EJRuiz\Desktop\Mike-Work-Files\FINAL ALVARO\LISTA_EMPLEADOS Y VENTAS.csv'
        
    inventario = cargar_inventario(InvFile)
    vendedores = cargar_vendedores(VendFile)
    ventas, encabezados = cargar_ventas(VendFile)
    
    while True:
        print("\nMenú Principal")
        print("1. Registrar una venta")
        print("2. Registrar llegada de artículos al almacén")
        print("3. Consultar el inventario disponible")
        print("4. Consultar cuál es el modelo de artículo más vendido")
        print("5. Consultar cuál vendedor ha vendido una cantidad mayor de artículos")
        print("6. Reporte de ventas de un vendedor")
        print("7. Promedio de ventas")
        print("8. Salir del programa")
        
        opcion = input("Seleccione una opción: ")
        
        if opcion == '1':
            registrar_venta(vendedores, ventas, encabezados, VendFile)
        elif opcion == '2':
            registrar_llegada(inventario)
        elif opcion == '3':
            consultar_inventario(inventario)
        elif opcion == '4':
            modelo_mas_vendido(inventario, ventas)
        elif opcion == '5':
            vendedor_mas_activo(vendedores, ventas)
        elif opcion == '6':
            reporte_ventas_vendedor(vendedores, inventario, ventas)
        elif opcion == '7':
            promedio_ventas(vendedores, inventario, ventas)
        elif opcion == '8':
            print("Saliendo del programa.")
            break
        else:
            print("Opción no válida, intente de nuevo.")

# Ejecutar el menú principal
menu_principal()
