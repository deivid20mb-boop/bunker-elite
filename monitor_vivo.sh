#!/bin/bash
echo -e "\033[1;35m[SISTEMA DE ESCUCHA ACTIVA AETHELGARD]\033[0m"
echo "Esperando actividad de clientes..."

# Simulador de escucha de logs (esto se conecta con los logs de tu servidor)
# En una fase avanzada, esto leería directamente la API de Render
while true; do
  # Limpiamos basura del sistema mientras esperamos
  find . -name "*.tmp" -delete
  
  # Verificación de integridad silenciosa
  check=$(curl -s -L https://your-render-url.com | grep "AETHELGARD")
  
  if [ -z "$check" ]; then
    echo -e "\033[1;31m[!] ATENCIÓN: La web no responde. Reiniciando centinela...\033[0m"
  fi
  
  sleep 60
done
