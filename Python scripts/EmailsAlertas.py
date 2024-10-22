import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from flask import Flask, request
import pyodbc
from conectDB import conn
app = Flask(__name__)

cursor = conn.cursor()

#Configuración del correo
smtp_server = 'smtp-mail.outlook.com'
smtp_port = 587
smtp_user = "MHernandez@amiautomation.com"
smtp_password = "$ami.2k24*" # Contraseña de aplicación generada
from_email = 'MHernandez@amiautomation.com'
to_emails = ['MHernandez@amiautomation.com'] # Lista de destinatarios

def check_alerts():
    cursor.execute("SELECT idAlerta, mes, tipoAlerta, valorActual, idGas FROM ml_Gas_Alerta WHERE alertaActiva = 1")
    rows = cursor.fetchall()
    print(f'rows: {rows}')
    for row in rows:
        idAlerta, mes, tipoAlerta, valorActual, idGas = row
        subject = f"Alerta de Gas Excedido - Alerta ID: {idAlerta}"
        dismiss_link = f"http://localhost:5000/dismiss_alert?alert_id={idAlerta}" # Asegúrate de usar la URL correcta
        body = (f"<div style='font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px;'>"
        f"<h2 style='color: #007bff;'>Alerta de Gas Excedido - Alerta ID: {idAlerta}</h2>"
        f"<p>Se ha generado una alerta para el gas con ID: {idGas}</p>"
        f"<p>Tipo de Alerta: {tipoAlerta}</p>"
        f"<p>Valor Actual: {valorActual}</p>"
        f"<p>Mes: {mes}</p>"
        f"<p><a style='color: #007bff; text-decoration: none;' href='{dismiss_link}'>"
        f"<button style='background-color: #007bff; color: #ffffff; padding: 10px 20px; border: none; "
                    f"border-radius: 5px; cursor: pointer;'>Descartar esta alerta</button>"
        f"</a></p>"
        f"<p>Por favor, revise esta alerta lo antes posible.</p>"
        f"</div>")
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
        cursor.execute("UPDATE dbo.ml_Gas_Alerta SET alertaActiva = 0 WHERE idAlerta = ?", alert_id)
        conn.commit()
        return f"Alerta con ID {alert_id} descartada exitosamente.", 200
    else:
        return "No se proporcionó un ID de alerta válido.", 400

if __name__ == "main":
    check_alerts() # Solo se ejecuta una vez al inicio
    app.run(debug=True, host='0.0.0.0', port=5000)
    cursor.close()
    conn.close()