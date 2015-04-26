int main() {
    int i, sum = 0;;
    printf("%d %d\n", ++i, ++i);
    printf("%d %d\n", ++i, ++i);
    printf("%d %d\n", ++i, ++i);
    for (i = 0; i < 10; ++i) {
        sum = sum + i;
        printf("%d : %d\n", i, sum);
    }
    for (i = 0; i < 10; ++i) {
        printf("%d : %d\n", i, sum += i);
    }
    return 0;
}