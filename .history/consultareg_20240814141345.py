#!/usr/bin/python
import socket
import sys

sys.argv[1] = "businesscorp.com.br"

if len(sys.argv) != 2:
    print("Usage: python3 consultareg.py <domain>")
    sys.exit(1)

domain = sys.argv[1]

s = socket.socket(socket.AF_INET6, socket.SOCK_STREAM)
try:
    s.connect(("whois.iana.org",43))
    s.send(domain.encode('utf-8') + b"\r\n")
    resposta = s.recv(1024).decode('utf-8').split()
    whois = resposta[19]
except socket.error as e:
    print(f"Error connecting to whois server: {e}")
    sys.exit(1)
finally:
    s.close()

s1 = socket.socket(socket.AF_INET6, socket.SOCK_STREAM)
try:
    s1.connect((whois,43))
    s1.send(domain.encode('utf-8') + b"/r/n")
    resp = s1.recv(1024).decode('utf-8')
    print(resp)
except socket.error as e:
    print(f"Error connecting to domain's whois server: {e}")
    sys.exit(1)
finally:
    s1.close()

