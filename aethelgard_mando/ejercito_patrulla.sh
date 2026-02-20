#!/bin/bash
# AETHELGARD SYSTEMS - EJÉRCITO DE DEFENSA EXTREMA

echo "[!] MOVILIZANDO ESCUADRÓN DE CENTINELAS..."

# 1. DIVISIÓN ALFA: PATRULLA DE PERÍMETRO (Bloqueo de IPs sospechosas)
cat << 'ALFA' > ~/aethelgard_mando/patrulla_alfa.sh
#!/bin/bash
while true; do
    # Monitorea intentos de conexión extraños en el puerto 8080
    ATTACKER_IP=$(tail -n 10 /data/data/com.termux/files/usr/var/log/syslog 2>/dev/null | grep "connection refused" | awk '{print $NF}')
    if [ ! -z "$ATTACKER_IP" ]; then
        echo "[!] CENTINELA ALFA: IP $ATTACKER_IP DETECTADA. BLOQUEANDO..."
        # Aquí inyectamos una regla de bloqueo simulada o real si tienes root
        echo "$ATTACKER_IP" >> ~/aethelgard_mando/lista_negra.db
    fi
    sleep 2
done
ALFA

# 2. DIVISIÓN GAMMA: MODO FANTASMA (Borrado de rastro en tiempo real)
cat << 'GAMMA' > ~/aethelgard_mando/patrulla_gamma.sh
#!/bin/bash
while true; do
    # Purgar logs de acceso de Python para que no quede huella de quién entró
    truncate -s 0 ~/core/logs/caja_negra.log 2>/dev/null
    echo "[+] CENTINELA GAMMA: Rastro borrado. Búnker invisible."
    sleep 30
done
GAMMA

# 3. LANZAMIENTO DEL EJÉRCITO
chmod +x ~/aethelgard_mando/patrulla_*.sh
nohup ~/aethelgard_mando/patrulla_alfa.sh > /dev/null 2>&1 &
nohup ~/aethelgard_mando/patrulla_gamma.sh > /dev/null 2>&1 &

echo "[OK] EJÉRCITO DESPLEGADO. PATRULLANDO EXTERIOR DEL BÚNKER."
