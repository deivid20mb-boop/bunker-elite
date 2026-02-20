import http.server
import socketserver
import os

port = int(os.environ.get("PORT", 8080))
handler = http.server.SimpleHTTPRequestHandler

with socketserver.TCPServer(("", port), handler) as httpd:
    print(f"Bunker online en puerto {port}")
    httpd.serve_forever()
