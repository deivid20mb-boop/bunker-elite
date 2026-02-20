#!/bin/bash
# AETHELGARD SYSTEMS - PROTECTOR DE NÚCLEO

INDEX_REAL="/data/data/com.termux/files/home/aethelgard_mando/index.html"
FIRMA=""

# 1. Verificar si el index tiene la firma de autenticidad
if ! grep -q "$FIRMA" "$INDEX_REAL"; then
    echo "[!] ALERTA: El index actual no tiene la firma. Restaurando integridad..."
    echo "$FIRMA" >> "$INDEX_REAL"
fi

# 2. Crear un acceso directo "EL_INDEX_QUE_MANDA" en el home
ln -sf "$INDEX_REAL" ~/EL_INDEX_QUE_MANDA.html

echo "[OK] El index auténtico ha sido anclado y firmado."
