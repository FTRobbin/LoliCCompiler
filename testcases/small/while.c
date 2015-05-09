int main() {
    int x = 10, y = 12, z = x % y;
    while (z) {
        x = y;
        y = z;
        z = x % y;
    }
    printf("%d", y);
    return 0;
}