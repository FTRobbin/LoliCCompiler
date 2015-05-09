//an example for function closure
//gcc / C standard does not support this
//the output should be -21 and 45

int (*multiply(int a)) (int result) {
    int sign;
    int add(int b) {
        if (a == 0) {
            return 0;
        } else {
            --a;
            return sign * b + add(b);
        }
    }
    if (a < 0) {
        sign = -1;
        a = -a;
    } else {
        sign = 1;
    }
    return add;
}

int a = 1, sign = 1;

int main() {
    int (*f)(int b) = multiply(5);
    int (*g)(int b) = multiply(-3);
    printf("%d\n", g(7));
    printf("%d\n", f(9));
    return 0;
}
