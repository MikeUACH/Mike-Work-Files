from icalendar import Calendar, Event
from datetime import datetime, timedelta

# Crear un nuevo calendario
cal = Calendar()
cal.add('prodid', '-//Mi Rutina Semanal//mxm.dk//')
cal.add('version', '2.0')

# Crear la estructura de la rutina semanal
weekly_schedule = {
    "Monday": {
        "6:00 am": "Despierta y toma agua",
        "6:10 am": "Paseo corto con perrita",
        "6:30 am": "Desayuno rápido",
        "6:40 am": "Salida para tomar el camión",
        "8:30 am": "Trabajo",
        "13:00 pm": "Hora de comida y paseo",
        "15:00 pm": "Regreso al trabajo",
        "19:40 pm": "Cena y hobby (jugar Sparking Zero)",
        "21:10 pm": "Aprender JavaScript (30 min)",
        "22:00 pm": "Organización y relajación",
    },
    # Puedes repetir este formato para los demás días
}

# Fecha inicial
start_date = datetime(2024, 10, 7)

# Crear eventos en el calendario
for day_offset in range(7):  # Para los 7 días de la semana
    current_day = start_date + timedelta(days=day_offset)
    day_name = current_day.strftime("%A")

    if day_name in weekly_schedule:
        for time, activity in weekly_schedule[day_name].items():
            event = Event()
            event.add('summary', activity)
            event.add('dtstart', datetime.combine(current_day, datetime.strptime(time, '%I:%M %p').time()))
            event.add('dtend', datetime.combine(current_day, datetime.strptime(time, '%I:%M %p').time()) + timedelta(minutes=30))  # Duración de 30 minutos
            event.add('description', f'Actividad de {day_name}')
            cal.add_component(event)

# Guardar el archivo .ics
with open('rutina_semanal.ics', 'wb') as f:
    f.write(cal.to_ical())

print("Archivo ICS generado exitosamente!")
