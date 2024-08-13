import pandas as pd

archivo = r"C:\Users\EJRuiz\Desktop\ArchivosXLS\gas-in-oil_AltaSteel LMF_0_20240812_100056.xls"

# Intentar leer el archivo como un archivo de texto plano delimitado por tabulaciones
df = pd.read_csv(archivo, delimiter='\t')

print(df)
