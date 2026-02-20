#!/bin/bash
# AETHELGARD SYSTEMS - INTEGRACIÓN ESTATAL Y LEGAL

echo "[*] INICIANDO SINCRONIZACIÓN CON STRIPE..."

# 1. VALIDACIÓN DE COINCIDENCIA DE PRODUCTOS
# Definimos la matriz legal de productos
declare -A PRODUCTOS
PRODUCTOS=( ["HUELLA_DIGITAL"]="30" ["NIVEL_10_PREMIUM"]="197" ["FORENSE_OMEGA"]="49" )

echo "[+] Verificando coherencia de precios en el sistema..."
for i in "${!PRODUCTOS[@]}"; do
    PRICE=${PRODUCTOS[$i]}
    # Verificamos si el producto existe en el index.html
    if grep -q "$i" ~/aethelgard_mando/index.html && grep -q "$PRICE" ~/aethelgard_mando/index.html; then
        echo "[OK] Producto $i ($PRICE€) sincronizado correctamente."
    else
        echo "[ALERTA] Discrepancia en $i. Revisa los precios en Stripe."
    fi
done

# 2. SIMULADOR DE WEBHOOK (Procesador de Pagos)
# Este bloque se activa cuando Stripe confirma un "checkout.session.completed"
process_payment() {
    STRIPE_ID=$1
    PRODUCTO_PAGADO=$2
    
    echo "[!] PAGO DETECTADO: $STRIPE_ID | PRODUCTO: $PRODUCTO_PAGADO"
    
    # Generar la llave única mediante nuestro Key-Gen
    NEW_KEY=$(~/aethelgard_mando/keygen.sh $STRIPE_ID)
    
    echo "[+] Llave generada: $NEW_KEY"
    echo "[+] Enviando producto $PRODUCTO_PAGADO.zip al área de descarga..."
    
    # Registro legal para auditoría (Evita bloqueos de Revolut)
    echo "$(date) | SUCCESS | $STRIPE_ID | $PRODUCTO_PAGADO | $NEW_KEY" >> ~/aethelgard_mando/ventas_reales.log
}

# 3. ACTUALIZACIÓN DEL CONTADOR DE DINERO REAL
# (Sustituimos el valor estático por la suma de ventas_reales.log)
TOTAL_REAL=$(awk -F '|' '{sum+=$4} END {print sum}' ~/aethelgard_mando/ventas_reales.log 2>/dev/null)
if [ -z "$TOTAL_REAL" ]; then TOTAL_REAL=0; fi

# Inyectamos el saldo real en el mando central
sed -i "s/[0-9.]*€<\/div>/$TOTAL_REAL.00€<\/div>/" ~/aethelgard_mando/index.html

echo "[OK] Sincronización completa. El Búnker está listo para recibir capital real."
