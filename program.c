//Meu primeiro programa em C
#include <stdio.h>

int main(void)
{
	int porta;
	char ip[16];

	printf("ESKEL Security\n");

	printf("Digite o IP \n");
	fgets(ip, sizeof(ip), stdin);

	printf("Digite a Porta \n");
	scanf("%i", &porta);

	printf("Varrendo Host: %s na porta: %i \n", ip, porta);

	return 0;
}
