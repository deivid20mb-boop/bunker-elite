import sqlite3
from datetime import datetime

def inicializar_db():
    conn = sqlite3.connect('aethelgard_crm.db')
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS clientes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nombre TEXT NOT NULL,
            contacto TEXT NOT NULL,
            estado TEXT DEFAULT 'PENDIENTE',
            fecha_registro TEXT
        )
    ''')
    conn.commit()
    conn.close()

def registrar_lead(nombre, contacto):
    conn = sqlite3.connect('aethelgard_crm.db')
    cursor = conn.cursor()
    fecha = datetime.now().strftime("%Y-%m-%d %H:%M")
    cursor.execute('INSERT INTO clientes (nombre, contacto, fecha_registro) VALUES (?, ?, ?)', 
                   (nombre, contacto, fecha))
    conn.commit()
    conn.close()
    print(f"[+] {nombre} registrado con éxito.")

def listar_pendientes():
    conn = sqlite3.connect('aethelgard_crm.db')
    cursor = conn.cursor()
    cursor.execute("SELECT id, nombre, contacto FROM clientes WHERE estado='PENDIENTE'")
    leads = cursor.fetchall()
    print("\n--- LEADS PENDIENTES DE CONTACTO ---")
    for l in leads:
        print(f"ID: {l[0]} | {l[1]} ({l[2]})")
    conn.close()

if __name__ == "__main__":
    inicializar_db()
    # Menú rápido para David
    print("1. Registrar nuevo Lead\n2. Ver Pendientes")
    op = input("> ")
    if op == "1":
        n = input("Nombre: "); c = input("Contacto (IG/Mail): ")
        registrar_lead(n, c)
    elif op == "2":
        listar_pendientes()
