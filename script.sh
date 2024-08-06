#!/bin/bash
#Meu primeiro script
echo "DESEC SECURITY" #echo exibe texto na tela
echo "Digite o servico a ser iniciado:"
read var1
service $var1 restart
echo "Servicos ativos:"
ps aux | grep $var1
echo "Portas abertas" 
netstat -nlpt

