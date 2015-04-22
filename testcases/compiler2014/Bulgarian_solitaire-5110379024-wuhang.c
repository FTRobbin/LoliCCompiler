/** Target: Simulate a Bulgarian-solitaire game.
 * Possible opitimization: Dead code elimination, common expression, inline function, loop unrolling, etc.
 * REMARKS: A funny game. If you like, you can try to prove that when n=1+2+..+i(i>0), the game will always stop
 *          and converge to the only solution: {1,2,...i}.   :)
**/

#include "stdio.h"

int n=210,h,now;
int a[1000];
int A=48271,M=2147483647,Q,R;
int seed=1;
int random()
{
    int tempseed=A*(seed%Q)-R*(seed/Q);
    if (tempseed>=0) seed=tempseed;
    else seed=tempseed+M;
    return seed;
}
void initialize(int val)
{
    seed=val;
}
void swap(int x,int y)
{
    int temp=a[x];
    a[x]=a[y];
    a[y]=temp;
}
int pd(int x)
{
    for (;h<=x;++h)
        if (x==h*(h+1)/2) return 1;
    return 0;
}
void show()
{
    int i;
    for (i=0;i<now;++i)
        printf("%d ",a[i]);
    printf("%c",'\n');
}
int win()
{
    int i,j=0,b[1000],temp;
    if (now!=h) return 0;
    for (j;j<now;++j)
        b[j]=a[j];
    for (i=0;i<now-1;++i)
        for (j=i+1;j<now;++j)
            if (b[i]>b[j])
            {
                temp=b[i];
                b[i]=b[j];
                b[j]=temp;
            }
    for (i=0;i<now;++i)
        if (b[i]!=i+1) return 0;
    return 1;
}
void merge()
{
    int i=0;
    for (i;i<now;++i)
        if (!a[i])
        {
            int j;
            for (j=i+1;j<now;++j)
                if (a[j]!=0)
                {
                    swap(i,j);
                    break;
                }
        }
    for (i=0;i<now;++i)
        if (!a[i])
        {
            now=i;
            break;
        }
}
void move()
{
    int i=0;
    for (;i<now;--a[i],i=i+1);
    a[now]=now;
    now++;
}
int main()
{
    int i=0,temp=0,count=0;
    Q=M/A,R=M%A;
    if (!pd(n))
    {
        printf("Sorry, the number n must be a number s.t. there exists i satisfying n=1+2+...+i\n");
        return 1;
    }
    printf("Let's start!\n");
    initialize(3654898);
    now=random()%10+1;
    printf("%d\n",now);
    for (;i<now-1;++i)
    {
        a[i]=random()%10+1;
        while (a[i]+temp>n)
            a[i]=random()%10+1;
        temp+=a[i];
    }
    a[now-1]=n-temp;
    show();
    merge();
    while (!win())
    {
        printf("step %d:\n",++count);
        move();
        merge();
        show();
    }
    printf("Total: %d step(s)\n",count);
    return 0;
}
