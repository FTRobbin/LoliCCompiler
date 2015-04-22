#include "stdio.h"
struct DDD {
	int id;
};
int main()
{
    int a=0x033,b=0X44Fa,d='\013',e=010, f = 10;
	char g = 40;
	g = g + (char)f;
    printf("%d %d %d %d\n",a,b,d,e);
    printf("%c %d %d %c\n", (char) a, (int **)e, sizeof((struct DDD *)b), g);
    return 0;
}
