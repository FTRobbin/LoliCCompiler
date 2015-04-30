/** REMARK: Two different types of struct cannot be cast into mutually.
 *
**/

struct A {
    int x, y, z;
};
struct B{int x, y, z;};

int main() {
    struct A *a,*b;
    (struct B)(*b);
    return 0;
}
