#!/bin/bash
# AETHELGARD SYSTEMS - INMUNIDAD DE DISCO

# Directorios permitidos (Zona Blanca)
ALLOWED_CORE="aethelgard_mando"

while true; do
    # Escanear el directorio home buscando carpetas no permitidas
    for dir in /data/data/com.termux/files/home/*/; do
        dir_name=$(basename "$dir")
        
        # Si el directorio no está en la zona blanca, se elimina
        if [ "$dir_name" != "$ALLOWED_CORE" ] && [ "$dir_name" != "storage" ]; then
            echo "[!] ANOMALÍA DETECTADA: $dir_name. Ejecutando purga..."
            rm -rf "$dir"
        fi
    done
    
    # Limpiar archivos sueltos fuera del búnker
    find /data/data/com.termux/files/home/ -maxdepth 1 -type f ! -name ".*" -delete
    
    sleep 10
done
