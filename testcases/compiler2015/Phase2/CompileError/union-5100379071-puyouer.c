/*
 * union can't be used as scalar
 */
union X { int a; };

int main() {
    union X a;
    while (a)
        break;
    return 0;
}
