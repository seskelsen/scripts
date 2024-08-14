#!/bin/bash
RED="\033[31m"
GREEN="\033[32m"
LTBLUE="\033[94m"
C_DODGERBLUE2="\033[38;5;27m"
ENDCOLOR="\033[0m"

clear
if [ "$1" == "" ]
then
        echo "======================================================="
	echo -e "${LTBLUE}ESKEL CONSULTING - PARSING.SH${ENDCOLOR}"
        echo -e "${GREEN}Modo de uso $0 DOMINIO${ENDCOLOR}"
        echo -e "${GREEN}Exemplo $0 businesscorp.com.br${ENDCOLOR}"
        echo "======================================================="
else
        echo "======================================================="
        echo -e "${RED}[+] Resolvendo URLs em  $1${ENDCOLOR}"
        echo "======================================================="
	rm index* > /dev/null 2>$1
        echo "======================================================="
        echo "Gravando index.html"
	wget $1 > /dev/null 2>$1
	rm $1.ip.txt > /dev/null 2>$1
	mv index.html $1.ip.txt
	rm lista.txt > /dev/null 2>$1
        echo "======================================================="
        echo "Criando a lista"
	grep href $1.ip.txt | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" >lista.txt
        echo "======================================================="
	for url in $(cat lista.txt); 
		do
		host $url | grep "has address"; 
		done
        echo "======================================================="
fi

#Vamos receber um dominio

#Vamos fazer wget no dominio
#wget $1

#Isso salva o index.html
#Vamos usar o cat para filtrar o conteudo do arquivo
#grep href index.html
#grep href index.html | cut -d "/" -f 3
#grep href index.html | cut -d "/" -f 3 | grep "\."
#grep href index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1
#grep href index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l"
#grep href index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" >lista.txt

#Vamos usar host para resolver os enderecos
#cat lista.txt
#for url in $(cat lista.txt); do host $url; done
#for url in $(cat lista.txt); do host $url | grep "has address"; done

#Estudar grep, cut, wget, host
#Adicionar cores
