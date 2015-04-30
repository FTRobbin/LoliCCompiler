/*
 * need to use x.x
 */
int f(int a, char b) {
    return a + b;
}
union { char x; } x;
int main() {
    f(2, x);
    return 0;
}
