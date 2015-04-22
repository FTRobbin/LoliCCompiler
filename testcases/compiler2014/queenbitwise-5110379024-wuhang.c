/** Target: 8-queens bitwise program.
 * Possible optimization: Strength reduction, function expansion
 * REMARKS: nothing.
 *
**/

#include <stdio.h>

int n=8;
int sum = 0, upperlim = 1;

void test(int row, int ld, int rd)
{
    if (row != upperlim)
    {
        int pos = upperlim & ~(row | ld | rd);
        while (pos)
        {
            int p = pos & -pos;
            pos -= p;
            test(row + p, (ld + p) << 1, (rd + p) >> 1);
        }
    }
    else sum++;
}

int main(int argc, char *argv[1])
{
    printf("%d queens:\n", n);
    upperlim = (upperlim << n) - 1;
    test(0, 0, 0);
    printf("%d\n",sum);
    //system("pause");
    return 0;
}
