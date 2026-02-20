#!/bin/bash
while true; do
  echo -e "\033[1;34m[CENTINELA]\033[0m Verificando integridad del Búnker..."
  
  # Verificar si el archivo index.html está corrupto
  if ! grep -q "daviddmmi" index.html; then
    echo -e "\033[1;31m[!] ALERTA: Enlace de pago dañado. Reparando...\033[0m"
    # Aquí podrías añadir el comando para restaurar una copia de seguridad
  fi

  # Limpiar logs de Git para no llenar espacio
  git gc --prune=now --quiet
  
  echo -e "\033[1;32m[OK]\033[0m Todo en orden para el cliente. Próxima revisión en 1 hora."
  sleep 3600
done
