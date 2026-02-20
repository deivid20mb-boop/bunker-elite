import sqlite3
from datetime import datetime
import time

def inicializar_db():
    conn = sqlite3.connect('aethelgard_crm.db')
    cursor = conn.cursor()
    cursor.execute('''CREATE TABLE IF NOT EXISTS clientes 
                     (id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, contacto TEXT, estado TEXT DEFAULT 'PENDIENTE', fecha TEXT)''')
    conn.commit()
    conn.close()

def registrar_automatico(nombre, contacto):
    conn = sqlite3.connect('aethelgard_crm.db')
    cursor = conn.cursor()
    # Evitar duplicados
    cursor.execute("SELECT id FROM clientes WHERE contacto=?", (contacto,))
    if cursor.fetchone() is None:
        fecha = datetime.now().strftime("%Y-%m-%d %H:%M")
        cursor.execute('INSERT INTO clientes (nombre, contacto, fecha) VALUES (?, ?, ?)', (nombre, contacto, fecha))
        conn.commit()
        print(f"[AUTO] Nuevo lead capturado: {nombre} ({contacto})")
    conn.close()

if __name__ == "__main__":
    inicializar_db()
    print("[*] Iniciando Radar Inteligente Aethelgard...")
    # Simulación de extracción que ahora GUARDA directamente
    leads_detectados = [
        ("ArtStation_User_99", "IG: @art_99"),
        ("Design_Creator_VLC", "TW: @design_vlc"),
        ("Ilustra_Madrid", "Mail: info@ilustramadrid.com")
    ]
    for n, c in leads_detectados:
        time.sleep(1)
        registrar_automatico(n, c)
    print("\n[!] RADAR COMPLETADO. Revisa 'python gestion_clientes.py' para ver tu lista.")
