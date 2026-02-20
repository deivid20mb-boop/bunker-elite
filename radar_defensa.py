import requests
import os

# Usamos el motor ELITE_OPS inyectado en el sistema
TOKEN = os.getenv('AETHELGARD_ELITE_OPS')
REPO = "deivid20mb-boop/bunker-elite"

def auditar_amenazas():
    url = f"https://api.github.com/repos/{REPO}/traffic/clones"
    headers = {'Authorization': f'token {TOKEN}'}
    r = requests.get(url, headers=headers)
    
    if r.status_code == 200:
        datos = r.json()
        clones = datos.get('count', 0)
        unicos = datos.get('uniques', 0)
        print(f"\n[RADAR AETHELGARD] Alerta de Tráfico:")
        print(f"-> Intentos de clonación: {clones}")
        print(f"-> Usuarios únicos sospechosos: {unicos}")
        if unicos > 0:
            print("\033[1;31m[!] ADVERTENCIA: Alguien está analizando tu código.\033[0m")
        else:
            print("\033[1;32m[OK] Perímetro limpio. No hay copias detectadas.\033[0m")
    else:
        print("[!] Error de conexión con el motor de defensa.")

if __name__ == "__main__":
    auditar_amenazas()
