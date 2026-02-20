import datetime
import os

LOG_FILE = ".contabilidad_ag.log"

def registrar_venta(id_activo, monto=50):
    fecha = datetime.datetime.now().strftime("%Y-%m-%d %H:%M")
    with open(LOG_FILE, "a") as f:
        f.write(f"{fecha} | ID: {id_activo} | INGRESO: {monto} EUR\n")
    print(f"\033[1;32m[✔] VENTA REGISTRADA: {monto}€ (Activo {id_activo})\033[0m")

def mostrar_total():
    if not os.path.exists(LOG_FILE):
        print("No hay registros todavía.")
        return
    total = 0
    with open(LOG_FILE, "r") as f:
        for linea in f:
            if "INGRESO:" in linea:
                total += int(linea.split("INGRESO:")[1].split("EUR")[0])
    print("\033[1;34m" + "="*30)
    print(f" TOTAL ACUMULADO AETHELGARD: {total}€")
    print("="*30 + "\033[0m")

if __name__ == "__main__":
    import sys
    if len(sys.argv) > 1:
        registrar_venta(sys.argv[1])
    else:
        mostrar_total()
