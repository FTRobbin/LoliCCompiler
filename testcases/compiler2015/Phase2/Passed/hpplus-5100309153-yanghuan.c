#include <stdio.h>
int SIZE = 15;
int a[15];
int b[15];
int c[30];
int L, i;

int plus(int SIZE){
    int add, j;
    add = 0;
    j = 0;
    while (j < SIZE){
        c[j] = a[j] + b[j] + add;
        add = 0;
        if (c[j] > 9)  {
            c[j] = c[j] - 10;
            add = 1;
        }
        j ++;
    }
    if (add > 0) {
        c[j] = 1;
        return j;
    }
    else return j - 1;
}

int printIntA(int L) {
    while (L >= 0) {
        printf("%d", a[L]);
        L --;
    }
    printf("\n");
}

int printIntB(int L) {
    while (L >= 0) {
        printf("%d", b[L]);
        L --;
    }
    printf("\n");
}

int printBigInt(int L) {
    while (L >= 0) {
        printf("%d", c[L]);
        L --;
    }
    printf("\n");
}

int main() {
    for (i = 0; i < SIZE; i ++) {
        if (i < 9) a[i]=i+1;
        else a[i] = i-9;
    }
    printIntA(SIZE-1);
    for (i = 0; i < SIZE; i ++) {
        if (i < SIZE / 2) b[i] = 7;
        else b[i] = 3;
    }
    printIntB(SIZE-1);
    L = plus(SIZE);
    printBigInt(L);
    return 0;
}
