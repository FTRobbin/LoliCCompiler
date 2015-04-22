/** Target: Heapsort
 * Possible optimization: Dead code elimination, common expression, inline function
 * REMARKS: Pay attention to how the exchange of two number works. You can find how to speed up your program.
 *
**/

#include <stdio.h>

int n = 10000;
int a[10000];

void exchange(int x,int y)
{
    int t=*(a+x);
    *(a+x)=*(a+y);
    *(a+y)=t;
}

int makeHeap() {
    int i, t, j;
    i = (n - 1) / 2;
    t = j = 0;
    while (i >= 0) {
        j = i * 2;
        if (i*2+1<n && a[i*2+1]<a[i*2]) j = i*2+1;
        if (a[i] > a[j]) {
            /*t = a[i];
            a[i] = a[j];
            a[j] = t;*/
            exchange(i,j);
        }
        i = i - 1;
    }
    return 0;
}

int adjustHeap(int n) {
    int i, j, t;
    i = j = t = 0;
    while (i * 2 < n) {
        j = i*2;
        if (i*2+1<n && a[i*2+1] < a[i*2]) j = i*2+1;
        if (a[i] > a[j]) {
            /*t = a[i];
            a[i] = a[j];
            a[j] = t;*/
            //a[i]^=a[j]^=a[i]^=a[j];
            a[i]^=a[j];
            a[j]^=a[i];
            a[i]^=a[j];
            i = j;
        }
        else break;
    }
    return 0;
}

int heapSort() {
    int t, k;
    t = 0;
    for (k = 0; k < n; k = k + 1) {
        t = a[0];
        a[0] = a[n-k-1];
        a[n-k-1] = t;
        adjustHeap(n-k-1);
    }
    return 0;
}

int main() {
    int i;
    for (i = 0; i < n; i = i + 1) a[i] = i;
    makeHeap();
    heapSort();
    for (i = 0; i < n; i = i + 1)
        printf("%d ", a[i]);
    printf("\n");
    //system("pause");
    return 0;
}

/* result:
9999 9998 ... 0
*/

