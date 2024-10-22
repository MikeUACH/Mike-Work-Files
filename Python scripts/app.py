import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from flask import Flask, request
import pyodbc
from datetime import datetime
from conectDB import conn
app = Flask(__name__)

cursor = conn.cursor()

# Configuración del correo
smtp_server = 'smtp-mail.outlook.com'
smtp_port = 587
smtp_user = "MHernandez@amiautomation.com"
smtp_password = "$ami.2k24*"
from_email = 'MHernandez@amiautomation.com'

def check_alerts():
    cursor.execute("""
        SELECT 
            ga.id, ga.mes, ga.tipoAlerta, ga.valorActual, ga.idGas, ug.correoUser, ug.cuerpoCorreo
        FROM 
            ml_Gas_Alerta ga
        INNER JOIN 
            Usuarios_gas ug ON ga.id = ug.idAlerta
        WHERE 
            ug.correoUser IS NOT NULL AND ug.correoUser != ''
    """)
    rows = cursor.fetchall()
    #print(f'rows: {rows}')
    for row in rows: 
        idAlerta, correoUser, CuerpoCorreo = row
        subject = f"Alerta de Gas Excedido - Alerta ID: {idAlerta}"
        dismiss_link = f"http://localhost:5000/dismiss_alert?alert_id={idAlerta}"
        body = CuerpoCorreo + f"<p><a href='{dismiss_link}'>Descartar esta alerta</a></p>"
        to_emails = [correoUser]
        send_email(subject, body, to_emails)

        # Guardar el cuerpo del correo en la base de datos
        cursor.execute("""
            UPDATE Usuarios_gas 
            SET CuerpoCorreo = ?, fechaEnvio = ? 
            WHERE idAlerta = ? AND correoUser = ?
        """, body, datetime.now(), idAlerta, correoUser)
        conn.commit()

        # Enviar el correo
        send_email(subject, body, to_emails)

def send_email(subject, body, to_emails):
    msg = MIMEMultipart()
    msg['From'] = from_email
    msg['To'] = ', '.join(to_emails)
    msg['Subject'] = subject

    msg.attach(MIMEText(body, 'html'))

    with smtplib.SMTP(smtp_server, smtp_port) as server:
        server.starttls()
        server.login(smtp_user, smtp_password)
        server.sendmail(from_email, to_emails, msg.as_string())

@app.route('/dismiss_alert', methods=['GET'])
def dismiss_alert():
    alert_id = request.args.get('alert_id')
    if alert_id:
        cursor.execute("UPDATE dbo.ml_Gas_Alerta SET idLlave = NULL WHERE id = ?", alert_id)
        conn.commit()
        return f"Alerta con ID {alert_id} descartada exitosamente.", 200
    return "No se proporcionó un ID de alerta válido.", 400

if __name__ == "__main__":
    check_alerts()  # Solo se ejecuta una vez al inicio
    app.run(debug=True, host='0.0.0.0', port=5000)
    cursor.close()
    conn.close()
