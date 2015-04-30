/**
 calling a non-existing func
 */

struct A {
    int x, y, z;
};

struct A f() {
    int a;
    a = 1;
}

int main() {
    struct A a;
    a();
    return 0;
}
