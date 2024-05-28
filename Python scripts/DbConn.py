import pyodbc
import pandas as pd

try:
    # Establece la conexión con la base de datos
    conn = pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};Server=tcp:txcare.database.windows.net,1433;Database=Txcare;Uid=fmariscal;Pwd=Pancho49193@2')
    print("Conexión exitosa")

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
