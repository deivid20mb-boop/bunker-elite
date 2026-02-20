#!/bin/bash
while true; do
    clear
    echo "=== DASHBOARD DE EMERGENCIA AETHELGARD ==="
    echo "FECHA: $(date)"
    echo "-------------------------------------------"
    # Verificar Render (Simulado por HTTP Status)
    STATUS=$(curl -o /dev/null -s -w "%{http_code}" https://bunker-elite-1.onrender.com)
    if [ "$STATUS" -eq 200 ]; then 
        echo "WEB RENDER: [ ONLINE ]"
    else 
        echo "WEB RENDER: [ ERROR $STATUS - NOT FOUND ]"
    fi
    
    # Verificar Existencia de Productos
    if [ -d "productos" ]; then
        COUNT=$(ls productos/*.zip 2>/dev/null | wc -l)
        echo "PRODUCTOS EN STOCK: $COUNT"
    else
        echo "PRODUCTOS: [ ERROR - CARPETA NO ENCONTRADA ]"
    fi
    
    echo "PASARELA ACTIVA: maqdjkgv"
    echo "-------------------------------------------"
    sleep 10
done
