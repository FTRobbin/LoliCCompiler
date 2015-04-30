/**
 * compare different struct type
 */

struct A {
    struct A *x, *y, *z;
};

struct B {
    struct B *x, *y, *z;
};

int main() {
    struct A a;
    struct B b;
    if (a == b) {};
    return 0;
}
