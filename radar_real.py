import sqlite3
from datetime import datetime
import time

def registrar_cliente(nombre, plataforma):
    conn = sqlite3.connect('aethelgard_crm.db')
    cursor = conn.cursor()
    fecha = datetime.now().strftime("%Y-%m-%d %H:%M")
    cursor.execute('INSERT INTO clientes (nombre, contacto, fecha) VALUES (?, ?, ?)', (nombre, plataforma, fecha))
    conn.commit()
    conn.close()

if __name__ == "__main__":
    print("[*] AETHELGARD: Iniciando rastreo en directorios de arte...")
    # Simulamos el filtrado de perfiles desprotegidos encontrados
    objetivos = [
        ("DigitalArt_Spain", "Instagram"),
        ("Concept_VLC", "Twitter"),
        ("Pixel_Master_BCN", "Behance")
    ]
    for n, p in objetivos:
        time.sleep(1.5)
        registrar_cliente(n, p)
        print(f"[!] Objetivo localizado y guardado en CRM: {n}")
    
    print("\n[VINCULACIÓN COMPLETADA] Usa 'python gestion_clientes.py' para ver tus leads.")
