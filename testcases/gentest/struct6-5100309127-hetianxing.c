/*
author : Tianxing He
struct-copy would copy all of the contents
*/
#include <stdio.h>
struct dd {
    int *c;
    int a[20];
};
int main()
{
    int d = 3;
    struct dd a;
    struct dd b,c;

    a.c = &d;
    a.a[0] = 2;
    c = b = a;
    c.a[0] = 3;
    printf("%d %d\n",c.a[0],*(c.c));
    printf("%d\n",a.a[0]);
}