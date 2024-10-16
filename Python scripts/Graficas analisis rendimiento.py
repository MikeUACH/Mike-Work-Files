import numpy as np
import matplotlib.pyplot as plt

# Parámetros
n_values = np.arange(1, 100001, 1000)  # Registros en el archivo (de 1 a 100,000)
k = 112  # Número de archivos
C1 = 1e-6  # Constante para el merge clásico
C2 = 1e-7  # Constante para el merge optimizado

# Funciones de tiempo
T_clasico = C1 * n_values * k
T_pandas = C2 * k * n_values * np.log(n_values)

# Graficar
plt.figure(figsize=(10, 6))
plt.plot(n_values, T_clasico, label='Merge Clásico', color='blue')
plt.plot(n_values, T_pandas, label='Merge con Pandas', color='orange')
plt.title('Comparación de Tiempo de Ejecución entre Merge Clásico y Merge con Pandas')
plt.xlabel('Número de Registros en Archivos (n)')
plt.ylabel('Tiempo de Ejecución (s)')
plt.legend()
plt.grid()
plt.yscale('log')  # Usar escala logarítmica para mejor visualización
plt.show()
