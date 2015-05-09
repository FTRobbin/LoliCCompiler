int *ptr;

int main() {
    int a, i;
    int b[10];
    ptr = &a;
    ptr = b;
    for (i = 0; i < 10; ++i) {
        *ptr = i;
        ++ptr;
    }
    return 0;
}