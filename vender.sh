#!/bin/bash
clear
echo -e "\033[1;34m==========================================="
echo "      AETHELGARD - FAST SALES TERMINAL"
echo -e "===========================================\033[0m"

read -p "Nombre del Artista: " CLIENTE
read -p "Obra a proteger: " OBRA
PRECIO=25

echo -e "\n\033[1;32m--- COPIA EL MENSAJE DE CIERRE ---\033[0m\n"
echo "Hola $CLIENTE, tengo el slot listo para proteger tu obra '$OBRA'."
echo "El proceso incluye:"
echo "1. Cifrado de autoría en el Búnker Aethelgard."
echo "2. Implementación de Licencia Internacional CC 4.0."
echo "3. Enlace público de verificación de activo."
echo ""
echo "Total: $PRECIO€. Puedes enviarlo por Bizum/Revolut."
echo "En cuanto recibas el OK, mándame el archivo y lo subo al motor."
echo -e "\n\033[1;34m-------------------------------------------\033[0m"

# Registro de la operación para control de ingresos
echo "$(date '+%Y-%m-%d %H:%M') - VENTA INICIADA: $CLIENTE | OBRA: $OBRA | PVP: $PRECIO€" >> ventas_log.txt

# Sincronización de seguridad con el motor ELITE_OPS
git add ventas_log.txt
git commit -m "LOG_VENTA_REGISTRADA_$CLIENTE"
git push -f origin main
