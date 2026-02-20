import requests
from bs4 import BeautifulSoup
import time

def buscar_clientes(keyword):
    print(f"[*] Escaneando red en busca de: {keyword}...")
    # Aquí simulamos una búsqueda en directorios de artistas o redes sociales
    # En un entorno real, usaríamos APIs de Instagram o Twitter
    time.sleep(2)
    print(f"[+] Cliente potencial detectado: @Artista_Ejemplo - Sin protección IP.")
    print(f"[+] Cliente potencial detectado: @Disenador_Freelance - Web no segura.")
    print(f"\n[!] Tarea: Envía el speech de Aethelgard a estos perfiles.")

if __name__ == "__main__":
    buscar_clientes("ilustrador")
