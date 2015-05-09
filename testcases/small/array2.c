int a[10][15];

int main() {
    int i, j;
    for (i = 0; i < 10; ++i) {
        for (j = 0; j < 15; ++j) {
            a[i][j] = i + j;
        }
    }
    return 0;
}