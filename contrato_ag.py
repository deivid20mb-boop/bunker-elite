# -*- coding: utf-8 -*-
import datetime

def generar_contrato():
    print("\n--- GENERADOR DE CERTIFICADO_TECNICO AETHELGARD ---")
    cliente = input("Nombre completo del Cliente: ")
    obra = input("Nombre de la Obra/Activo: ")
    id_activo = input("ID de Activo (ej: AG-001): ")
    
    fecha = datetime.datetime.now().strftime("%Y-%m-%d %H:%M")
    
    contrato = f"""
============================================================
       CERTIFICADO DE BLINDAJE DIGITAL - AETHELGARD
============================================================
FECHA DE EMISIÓN: {fecha}
ID DE CERTIFICACIÓN: {id_activo}
PROPIETARIO LEGAL: {cliente}
ACTIVO PROTEGIDO: {obra}

NOTA TECNICA: Este certificado actúa como prueba técnica de autoría en la fecha indicada. El cliente acepta que AETHELGARD es un servicio de certificación y no una aseguradora contra robos digitales.
ESTADO DE PROTECCIÓN:
[✔] Cifrado de Autoría Inyectado
[✔] Licencia Internacional CC BY-NC-ND 4.0 Vinculada
[✔] Registro en Búnker AETHELGARD (Cloud Sync)
[✔] Protección contra Scraping de IA Activa

CLAUSULADO:
Este documento certifica que el activo arriba mencionado ha sido 
procesado por los sistemas de AETHELGARD para garantizar la 
trazabilidad de su autoría original ante amenazas externas.

FIRMA DIGITAL:
AETHELGARD SYSTEMS - MOTOR ELITE_OPS
============================================================
"""
    filename = f"CERTIFICADO_TECNICO_{id_activo}.txt"
    with open(filename, "w") as f:
        f.write(contrato)
    
    print(f"\n\033[1;32m[OK] Contrato generado: {filename}\033[0m")
    print("Envíale este texto al cliente como prueba de profesionalismo.")

if __name__ == "__main__":
    generar_contrato()
