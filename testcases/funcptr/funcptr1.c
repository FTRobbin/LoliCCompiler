//testcases for funcptr

int cnt = 0;

int hello() {
    printf("hello ");
    return ++cnt;
}

int fibo(int n) {
    if (n == 0 || n == 1) {
        return 1;
    } else {
        return fibo(n - 1) + fibo(n - 2);
    }
}

int gcd(int a, int b) {
    if (b == 0) {
        return a;
    } else {
        return gcd(b, a % b);
    }
}

int plus(int a, int b) {
    return a + b;
}

int mul(int a, int b) {
    return a * b;
}

void arithtable(int (*f)(int, int)) {
    int i, j;
    for (i = 1; i < 10; ++i) {
        for (j = 1; j < 10; ++j) {
            printf("%.4d", f(i, j));
        }
        printf("\n");
    }
}

//definition

int (*f)();
int (*g)(int);

int main() {
    int i;
    int (*h)(int, int);

    //assignment
    f = hello;
    g = &fibo;
    h = &gcd;

    //usage
    printf("%d\n", f());
    printf("%d\n", (*f)());
    for (i = 0; i < 10; ++i) {
        printf("%d %d\n", fibo(i), g(i));
    }
    printf("%d %d gcd %d\n", 35, 325, (*h)(35, 325));
    arithtable(h);
    h = plus;
    printf("%d %d plus %d\n", 35, 325, h(35, 325));
    arithtable(h);
    h = mul;
    printf("%d %d mul %d\n", 35, 325, h(35, 325));
    arithtable(h);
    return 0;
}
