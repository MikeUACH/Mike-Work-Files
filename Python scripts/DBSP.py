import pyodbc
from conectDB import conn
try:
    cursor = conn.cursor()
    cursor.execute("SELECT @@version;")
    row=cursor.fetchone()
    print(row)
    archivo = 'gas-in-oil_Gerdau LN Cartersville_3_20240523_135349.xls'
    gas= 'C2H2_Acetylene'
    limite= 100
    v30 = 80
    v60 = 90
    v90 = 120
    cursor.execute(f"Exec sp_ML_AgregarTendencias '{archivo}','{gas}',{limite},{v30},{v60},{v90}")
except Exception as ex:
        print(ex)