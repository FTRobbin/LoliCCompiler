int a[10];

int main() {
    int i;
    for (i = 0; i < 10; ++i) {
        a[i] = (i + 5) % 10;
    }
    return 0;
}