#!/bin/bash
echo "ESKEL CONSULTING"
if [ "$1" == "" ]
then
	echo "Modo de uso : $0 10.10.11.1 8080"
else
	echo "Explorando: $1 na porta $2"
fi


