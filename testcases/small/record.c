struct twoInt {
    int a, b;
} a, b;

int main() {
    a.a = 0;
    a.b = 1;
    b.a = 1;
    b.b = 0;
    a = b;
    a.a = b.b;
    return 0;
}