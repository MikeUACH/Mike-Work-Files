import pyodbc
import pandas as pd
from conectDB import conn
try:
    # Consulta a la base de datos
    query = "SELECT * FROM PlantasGOL"

    # Utiliza pandas para ejecutar la consulta y obtener un DataFrame
    df = pd.read_sql_query(query, conn)
    
    # Muestra las primeras filas del DataFrame
    

except Exception as ex:
    print(ex)

finally:
    # Cierra la conexión
    conn.close()
