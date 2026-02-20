#!/bin/bash
# AETHELGARD SYSTEMS - AUDITORÍA DE PRODUCTOS

echo "--- COMPARATIVA DE PRODUCTOS DE ÉLITE ---"
echo "VERIFICANDO WEB DE VENTAS (index.html)..."
echo "----------------------------------------"

# Buscar los precios y nombres en tu código
grep -E "HUELLA DIGITAL|NIVEL 10|FORENSE OMEGA" ~/aethelgard_mando/index.html
grep -E "30€|197€|49€" ~/aethelgard_mando/index.html

echo "----------------------------------------"
echo "TAREA PARA EL JEFE:"
echo "1. Abre tu panel de Stripe -> Product Catalogue."
echo "2. Verifica que el 'Price ID' coincida con los botones de tu web."
echo "3. Asegúrate de que el producto de 30€ sea RECURRENTE (Weekly)."
echo "4. Asegúrate de que el producto de 197€ sea RECURRENTE (Monthly)."
echo "----------------------------------------"
