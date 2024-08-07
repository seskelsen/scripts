#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	printf("Portas TCP Abertas: \n");
	system("netstat -nltp");

	return 0;
}
