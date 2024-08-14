#!/usr/bin/python
import socket,sys
from tabulate import tabulate

s= socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((b"whois.iana.org",43))
alvo = sys.argv[1]+"\r\n"
s.send(alvo.encode())
resposta = s.recv(1024).split()
whois = resposta[19]
s.close()

s1 = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s1.connect((whois,43))
s1.send(alvo.encode())
resp = s1.recv(1024)

# Convertendo o byte string para string
content_str = resp.decode('utf-8')

# Separando as linhas e filtrando as linhas relevantes
lines = content_str.split('\n')
filtered_lines = [line for line in lines if ':' in line]

# Criando uma lista de listas para a tabela
data = [line.split(':', 1) for line in filtered_lines]

# Criando a tabela
table = tabulate(data, headers=["Campo", "Valor"], tablefmt="grid")

# Exibindo a tabela
print(table)

