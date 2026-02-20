#!/bin/bash
# AETHELGARD SYSTEMS - VIGILANTE DE UPTIME

URL="https://bunker-elite-1.onrender.com"

while true; do
    STATUS=$(curl -o /dev/null -s -w "%{http_code}" "$URL")
    
    if [ "$STATUS" -ne 200 ]; then
        echo -e "\e[31m[!!!] ALERTA CRÍTICA: La web ha caído (Status: $STATUS). Revisa Render.\e[0m"
    else
        echo -e "\e[32m[OK] Búnker Online - $(date)\e[0m"
    fi
    sleep 60
done
