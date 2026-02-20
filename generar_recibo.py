def generar(nombre, link):
    print("\n" + "="*40)
    print("      CERTIFICADO DE SERVICIO AETHELGARD")
    print("="*40)
    print(f"CLIENTE: {nombre}")
    print(f"ACTIVO:  {link}")
    print(f"FECHA:   2026-02-20")
    print("-" * 40)
    print("ESTADO:  PROTECCIÓN ACTIVA (CC BY-NC-ND 4.0)")
    print("AUDITOR: DAVID MARTÍNEZ BUISÁN")
    print("="*40)
    print("Aviso: Documento de validez técnica privada.")

if __name__ == "__main__":
    n = input("Nombre del cliente: ")
    l = input("URL del búnker: ")
    generar(n, l)
