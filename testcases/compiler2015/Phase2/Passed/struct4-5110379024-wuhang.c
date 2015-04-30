#include "stdio.h"
struct a{int a;char b;int c;};
union b{int z;char x,y;} bb;
int main()
{
    struct a a;
    a.a=1,a.b='E',a.c='\n';
    printf("%c%c\t",a.b,a.c);
    printf("%d %d %d %d\n",sizeof(struct a),sizeof(a),sizeof(a.a),sizeof(a.c));
    bb.x=a.b,bb.y=a.c;
    printf("%c %c\n",bb.x,bb.y);
    bb.z=2;
    printf("%d\n",bb.y=='\002');
    return 0;
}
