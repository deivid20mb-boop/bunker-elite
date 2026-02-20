#!/bin/bash
# AETHELGARD - GENERADOR AUTOMÁTICO DE ACTIVOS BLINDADOS (PRIVATE VERSION)

echo -e "\033[1;34m[!] INICIANDO PROTOCOLO DE BLINDAJE PRIVADO...\033[0m"

read -p "Nombre del Cliente: " CLIENTE
read -p "Nombre del archivo de la obra: " ARCHIVO

if [ ! -f "$ARCHIVO" ]; then
    echo -e "\033[1;31m[ERROR] El archivo $ARCHIVO no existe.\033[0m"
    exit 1
fi

ID_ACTIVO="AG-$(date +%s | tail -c 4)"
HUELLA=$(sha256sum "$ARCHIVO" | awk '{print $1}')
CARPETA="ENTREGA_${ID_ACTIVO}_${CLIENTE// /_}"
mkdir -p "$CARPETA"

# 1. INYECTAR HUELLA EN EL ARCHIVO
exiftool -overwrite_original -Comment="AETHELGARD_PROTECTION_ID:${ID_ACTIVO}_SHA256:${HUELLA}" -Copyright="Certified by Aethelgard Systems - Auditor David Buisan" "$ARCHIVO"

# 2. GENERAR CERTIFICADO
cat << EOC > "$CARPETA/CERTIFICADO_${ID_ACTIVO}.txt"
=====================================================
          CERTIFICADO TÉCNICO AETHELGARD
=====================================================
ID: $ID_ACTIVO | TITULAR: $CLIENTE
HUELLA (SHA-256): $HUELLA
ESTATUS: PROTEGIDO CON MARCA DIGITAL INTERNA
=====================================================
EOC

# 3. MOVER Y COMPRIMIR
cp "$ARCHIVO" "$CARPETA/OBRA_PROTEGIDA_$ARCHIVO"
zip -r "${CARPETA}.zip" "$CARPETA" > /dev/null

# 4. LIMPIEZA DE CARPETA TEMPORAL (Solo dejamos el ZIP para enviar)
rm -rf "$CARPETA"

echo -e "\n\033[1;32m[OK] ACTIVO BLINDADO Y EMPAQUETADO.\033[0m"
echo "------------------------------------------------"
echo "ARCHIVO PARA ENVIAR: ${CARPETA}.zip"
echo "------------------------------------------------"
