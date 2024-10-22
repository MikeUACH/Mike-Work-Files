# -*- coding: utf-8 -*-
"""
Created on Thu Sep 12 11:25:07 2024

@author: TDominguez
"""
import pyodbc
from conectDB import conn

cursor = conn.cursor()


cursor.execute(""" exec sp_Forzar_Prioritario """)
    
conn.commit()

# Cerrar la conexión a la base de datos
cursor.close()
conn.close()