
int gcd(int a, int b) {
    printf("gcd(%d,%d) called!\n", a, b);
    if (a % b == 0) {
        return b;
    } else {
        return gcd(b, a % b);
    }
}

int main() {
    while (1) {
        int a, b;
        scanf("%d%d", &a, &b);
        if (a == -1) {
            break;
        }
        printf("gcd(%d, %d) = %d\n", a, b, gcd(a, b));
    }
    return 0;
}