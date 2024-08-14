#!/bin/bash
<<<<<<< HEAD
#Meu primeiro script
echo "DESEC SECURITY" #echo exibe texto na tela
echo "Digite o servico a ser iniciado:"
read var1
service $var1 restart
echo "Servicos ativos:"
ps aux | grep $var1
echo "Portas abertas" 
netstat -nlpt
=======
echo "ESKEL CONSULTING"
if [ "$1" == "" ]
then
	echo "Modo de uso : $0 10.10.11.1 8080"
else
	echo "Explorando: $1 na porta $2"
fi

>>>>>>> 864876b17b8e15cea4e70d3bc22d838caf78585e

