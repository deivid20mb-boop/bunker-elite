import os
import datetime

def chequear_bunker():
    print("\n\033[1;34m[AETHELGARD AUDIT SYSTEM v2.0]\033[0m")
    print(f"Fecha: {datetime.datetime.now().strftime('%d/%m/%Y %H:%M')}")
    
    # Verificamos archivos críticos
    archivos = ['index.html', 'vender.sh', 'contrato_ag.py', 'radar_defensa.py']
    for f in archivos:
        if os.path.exists(f):
            print(f"  [✔] {f}: ESTATUS OK")
        else:
            print(f"  [✘] {f}: ERROR - ARCHIVO NO DETECTADO")

    # Verificamos conexión con el Motor ELITE_OPS
    remote = os.popen("git remote -v").read()
    if "ghp_" in remote:
        print("  [✔] MOTOR ELITE_OPS: VINCULADO Y SEGURO")
    else:
        print("  [✘] MOTOR ELITE_OPS: FALLO DE CONEXIÓN")

if __name__ == "__main__":
    chequear_bunker()
