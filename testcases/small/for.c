int main() {
    int i, sum = 0;
    for (i = 0; i < 10; ++i) {
        sum = sum + i;
        printf("%d : %d ", i, sum);
    }
    return 0;
}