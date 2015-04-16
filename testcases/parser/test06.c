struct {
    int a;
    char b;
} ab, cd, ef;

struct name {
    int aa;
    char bb;
} ba, dc, fe;

struct ret {int a; int b;} func (int a, int b) {
    struct ret result;
    result.a = a;
    result.b = b;
    return result;
}

struct name_name {
    struct name name1, name2;
    struct name_in {
        char a;
    } name2;
} name12;

int main() {
    struct name_name myname;
    return 0;
}