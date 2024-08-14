#!/usr/bin/python3
import socket,sys

alvo = sys.argv[1]+"\r\n"
#alvo = b"businesscorp.com.br" + b"\r\n"

s= socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('whois.iana.org',43))

s.send(alvo)
resposta = s.recv(1024).split()
whois = resposta[19]

#print(resposta)

s.close()

s1 = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s1.connect((whois,43))
s1.send(alvo)
resp = s1.recv(1024)
print(resp)


