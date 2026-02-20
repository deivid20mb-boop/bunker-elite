#!/bin/bash
clear
echo -e "\033[1;34m--- PANEL DE CONTROL AETHELGARD ---\033[0m"
# Consulta de visitas simplificada
VISITAS=$(curl -s https://api.countapi.xyz/get/aethelgard-bunker/visits | grep -oP '"value":\K[0-9]+')
echo -e "Visitas en el Búnker: \033[1;32m$VISITAS\033[0m"
echo "------------------------------------"
echo "1. Ejecutar Radar de Clientes"
echo "2. Ver Clientes en CRM"
echo "3. Generar Justificante"
echo "4. Salir"
read -p "Selecciona una opción: " OPCION

case $OPCION in
    1) python radar_real.py ;;
    2) python gestion_clientes.py ;;
    3) python generar_recibo.py ;;
    *) exit ;;
esac
