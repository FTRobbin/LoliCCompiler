
int f(int n) {
    printf("Fac : n = %d Called!\n", n);
    if (n == 1) {
        return 1;
    } else {
        return n * f(n - 1);
    }
}


int main() {
    printf("%d\n", f(5));
    return 0;
}