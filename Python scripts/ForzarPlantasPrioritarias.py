# -*- coding: utf-8 -*-
"""
Created on Thu Sep 12 11:25:07 2024

@author: TDominguez
"""
import pyodbc

conn_str = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=tcp:txcare.database.windows.net,1433;"
    "DATABASE=Txcare;"
    "UID=fmariscal;"
    "PWD=Pancho49193@2"
)
# Conectar a la base de datos
conn = pyodbc.connect(conn_str)
cursor = conn.cursor()


cursor.execute(""" exec sp_Forzar_Prioritario """)
    
conn.commit()

# Cerrar la conexión a la base de datos
cursor.close()
conn.close()