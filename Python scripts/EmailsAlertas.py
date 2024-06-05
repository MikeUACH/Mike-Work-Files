import pyodbc
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

# Configuración de la conexión a la base de datos
conn_str = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=tcp:txcare.database.windows.net,1433;"
    "DATABASE=Txcare;"
    "UID=fmariscal;"
    "PWD=Pancho49193@2"
)
conn = pyodbc.connect(conn_str)
cursor = conn.cursor()

# Configuración del correo
smtp_server = 'smtp.gmail.com'
smtp_port = 587
smtp_user = 'a343441@uach.com'
smtp_password = 'sf23scf3'
from_email = 'a343441@uach.com'
to_emails = ['a343441@uach.com', 'otro_correo@ejemplo.com', 'otro_mas@ejemplo.com']  # Lista de destinatarios

def send_email(subject, body, to_emails):
    msg = MIMEMultipart()
    msg['From'] = from_email
    msg['To'] = ", ".join(to_emails)
    msg['Subject'] = subject

    msg.attach(MIMEText(body, 'plain'))

    server = smtplib.SMTP(smtp_server, smtp_port)
    server.starttls()
    server.login(smtp_user, smtp_password)
    text = msg.as_string()
    server.sendmail(from_email, to_emails, text)
    server.quit()

def check_alerts():
    cursor.execute("SELECT idAlerta, mes, tipoAlerta, valorActual, idGas FROM dbo.ml_Gas_Alerta WHERE alertaActiva = 1")
    rows = cursor.fetchall()

    for row in rows:
        idAlerta, mes, tipoAlerta, valorActual, idGas = row
        subject = f"Alerta de Gas Excedido - Alerta ID: {idAlerta}"
        body = (f"Se ha generado una alerta para el gas con ID: {idGas}\n"
                f"Tipo de Alerta: {tipoAlerta}\n"
                f"Valor Actual: {valorActual}\n"
                f"Mes: {mes}\n"
                f"Por favor, revise esta alerta lo antes posible.")
        
        send_email(subject, body, to_emails)
        # Marcar la alerta como enviada para no enviar múltiples correos por la misma alerta
        cursor.execute("UPDATE dbo.ml_Gas_Alerta SET alertaActiva = 0 WHERE idAlerta = ?", idAlerta)
        conn.commit()

if __name__ == "__main__":
    check_alerts()
    cursor.close()
    conn.close()