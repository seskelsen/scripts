#include <stdio.h>
#include <netdb.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/socket.h>
#include <arpa/inet.h>

#define MAX_CONEXOES 100 // Numero de conexoes simultaneas

int main(int argc, char *argv[])
{
	int meusocket[MAX_CONEXOES];
	int porta = 21;
	char *destino = argv[1];
	struct sockaddr_in alvo;
	char buffer[1024];

	memset(&alvo, 0, sizeof(alvo));
	alvo.sin_family = AF_INET;
	alvo.sin_port = htons(porta);
	if(inet_pton(AF_INET, destino, &alvo.sin_addr) <=0)
	{
		perror("inet_pton error");
		exit(EXIT_FAILURE);
	}

	//Cria multiplas conexoes
	for(int i = 0; i < MAX_CONEXOES; i++)
	{
		if((meusocket[i] = socket(AF_INET, SOCK_STREAM, 0)) < 0)
		{
			perror("socket error");
			exit(EXIT_FAILURE);
		}

		if(connect(meusocket[i], (struct sockaddr *)&alvo, sizeof(alvo)) < 0)
		{
			perror("connect error");
			exit(EXIT_FAILURE);
		}

		printf("Conexao %d - status [ESTABELECIDA] \n", i + 1);
		//envia uma mensaagem inicial (opcional)
		snprintf(buffer, sizeof(buffer), "USER anonymous\r\n");
		send(meusocket[1], buffer, strlen(buffer), 0);

		snprintf(buffer, sizeof(buffer), "PASS anonymous\r\n");
		send(meusocket[1], buffer, strlen(buffer), 0);

	}
	printf("Conexoes mantidas abertas...\n");
	while(1)
	{
		sleep(1);
	}
	//fecha todas as conexopes (nunca atingido nessa implementacao)
	for(int i = 0; i < MAX_CONEXOES; i++)
	{
		close(meusocket[i]);
	}
	return 0;
}	
