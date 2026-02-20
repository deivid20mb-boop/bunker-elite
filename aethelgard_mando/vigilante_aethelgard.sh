#!/bin/bash
# AETHELGARD - SISTEMA DE AUTO-ACTUALIZACIÓN DE CAPITAL

while true; do
  # Escucha el log del motor de Stripe buscando un pago exitoso (charge.succeeded)
  if tail -n 1 stripe_history.log | grep -q "charge.succeeded"; then
    echo "[!] VENTA DETECTADA: +197€"
    
    # Lógica de actualización del Mando de Guerra (Sed quirúrgico)
    # Buscamos '1.650,00€' y lo actualizamos a '1.847,00€' (Cifra simulada para este ejemplo)
    sed -i 's/1.650,00€/1.847,00€/g' mando_guerra_privado.html
    
    # Sincronizar inmediatamente con Render para que tú lo veas en el móvil
    git add mando_guerra_privado.html
    git commit -m "FINANZAS: Capital actualizado post-venta"
    git push origin main --force
    
    # Limpiar el log para no procesar la misma venta dos veces
    > stripe_history.log
  fi
  sleep 5
done
