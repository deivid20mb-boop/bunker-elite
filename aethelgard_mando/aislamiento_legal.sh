#!/bin/bash
# AETHELGARD SYSTEMS - AISLAMIENTO LEGAL
while true; do
    OFFENDER=$(sort ~/aethelgard_mando/lista_negra.db | uniq -c | awk '$1 >= 5 {print $2}' | tail -n 1)
    if [ ! -z "$OFFENDER" ]; then
        echo "[!] SEGURIDAD LEGAL: IP $OFFENDER aislada permanentemente."
        # Bloqueo total de entrada (no devuelve el fuego, cierra la puerta)
        echo "ALL: $OFFENDER" >> /etc/hosts.deny 2>/dev/null
        sed -i "/$OFFENDER/d" ~/aethelgard_mando/lista_negra.db
    fi
    sleep 10
done
