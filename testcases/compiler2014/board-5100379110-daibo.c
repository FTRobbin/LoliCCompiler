/**
 *  Target: Put plenty of 'L's into the board so that they can fill the board as much as possible. The size of the board is 2N*2N (can be modified).
 *  Possible optimization: Dead code elimination, common expression
 *  REMARKS: Pay attention to the way of identifying the address of an element of an array!
 *
**/

#include <stdio.h>
#include <stdlib.h>
int N=3, i;         // initial value, can be changed.
int** board;

int printBoard(int sz, int** board) {
    int i, j;
    for (i = 0; i < sz; i++) {
        for (j = 0; j < sz; j++)
            printf("%d ", board[i][j]);
        printf("\n");
    }
    return 0;
}

int inRect(int x, int y, int x1, int y1, int x2, int y2) {
    return (x >= x1) && (x < x2) && (y >= y1) && (y < y2);
}

int fill(int** bd, int n, int x0, int y0, int sx, int sy, int scolor, int* p2, int color) {
    if (n == 0) bd[sx][sy] = scolor;
    else {
        int subsz, curcolor, lx, ly, rx, ry;
        int i, j;
        subsz = p2[n - 1];
        curcolor = color;
        lx = ly = rx = ry = 0;
        color++;
        for (i = 0; i <= 1; ++i) {
            for (j = 0; j <= 1; j++) {
                lx = x0 + i * subsz;
                ly = y0 + j * subsz;
                rx = x0 + (i + 1) * subsz;
                ry = y0 + (j + 1) * subsz;
                if (inRect(sx, sy, lx, ly, rx, ry))
                    color = fill(bd, n - 1, lx, ly, sx, sy, scolor, p2, color);
                else
                    color = fill(bd, n - 1, lx, ly, x0+subsz-1+i, y0+subsz-1+j, curcolor, p2, color);
            }
        }
    }
    return color;
}

int main() {
    int* p2=malloc((N+1) * sizeof(int));
    p2[0] = 1;
    for (i = 1; i <= N; i++) p2[i] = p2[i - 1] * 2;
    board = malloc(p2[N] * sizeof(int*));
    for (i = 0; i < p2[N]; i++)
        board[i] = malloc(p2[N] * sizeof(int));
    fill(board, N, 0, 0, p2[N]-1, p2[N]-1, 0, p2, 1);
    printBoard(p2[N], board);
    //system("pause");
    return 0;
}

