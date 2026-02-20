#!/bin/bash
# AETHELGARD SYSTEMS - CONSTRUCTOR DE DEFENSA ACTIVA

echo "[+] INICIANDO CONSTRUCTOR: Escaneando agujeros de seguridad..."

# 1. TAPA AGUJEROS EN PERMISOS (Archivos que no deberían ser editables)
echo "[*] Sellando permisos de configuración..."
chmod 600 ~/aethelgard_mando/index.html
chmod 700 ~/core/scripts_sistema/*.sh

# 2. TAPA AGUJEROS DE RED (Cierra procesos sospechosos que no sean el búnker)
echo "[*] Limpiando procesos de red no autorizados..."
lsof -i :8080 | grep -v "python3" | awk '{print $2}' | xargs kill -9 2>/dev/null

# 3. INSTALA SISTEMA DE DEFENSA (Vigilante de Integridad)
# Crea un sensor que detecta si alguien intenta modificar el Mando Central
cat << 'DEFENSA' > ~/aethelgard_mando/defensa_activa.sh
#!/bin/bash
while true; do
    inotifywait -e modify ~/aethelgard_mando/index.html
    echo "[!] ALERTA: Intento de intrusión detectado. Restaurando blindaje..."
    # Acción de defensa: restaurar desde copia de seguridad
    cp ~/aethelgard_mando/backup_index.html ~/aethelgard_mando/index.html
done
DEFENSA
chmod +x ~/aethelgard_mando/defensa_activa.sh
nohup ~/aethelgard_mando/defensa_activa.sh > /dev/null 2>&1 &

echo "[OK] Agujeros sellados. Sistemas de defensa AETHELGARD desplegados."
