#include <stdio.h>
int N = 100;
int head, startx, starty;
int targetx, targety;
int x, y;
int xlist[10000], ylist[10000], tail, ok, now, dx[8], dy[9];
int step[100][100];
int i, j;

int check(int a) {
    return ((a < N) && (a >= 0));
}

int addList(int x, int y) {
    if (check(x) == 1 && check(y) == 1 && step[x][y] == -1) {
        tail ++;
        xlist[tail] = x;
        ylist[tail] = y;
        step[x][y] = now + 1;
        if ((x == targetx) && (y == targety)) ok = 1;
    }
}
int main() {
    targetx = targety  = N - 1;
    for (i = 0; i < N; i ++)
        for (j = 0; j < N; j ++)
        step[i][j] = -1;
    dx[0] = -2; dy[0] = -1;
    dx[1] = -2; dy[1] = 1;
    dx[2] = 2; dy[2] = -1;
    dx[3] = 2; dy[3] = 1;
    dx[4] = -1; dy[4] = -2;
    dx[5] = -1; dy[5] = 2;
    dx[6] = 1; dy[6] = -2;
    dx[7] = 1; dy[7] = 2;
    while (head <= tail) {
        x = xlist[head];
        y = ylist[head];
        now = step[x][y];
        for (j = 0;j < 8;j ++)
            addList(x + dx[j], y + dy[j]);
        if (ok == 1) break;
        head ++;
    }
    if (ok == 1) printf("%d\n", step[targetx][targety]);
    else printf("no solution!\n");
    return 0;
}
