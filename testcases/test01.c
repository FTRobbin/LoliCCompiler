/*
Designed by Haobin Ni for loliccompiler
*/

// comments

// this is a single-line comment

/*
this is the first line of a multi-line comment
this is the second line of a multi-line comment
a good multi-line comment consists of three lines
*/

int main() {
    // identifiers

    int a, b, c,
        ab, xy, xz;

    char QQ641053434[50] = "This is the qq of the author.",
         BD20140222[50] = "Birthday of whom?",
         symbol_symbol$symbols;

    // constants

    123;
    456;
    789;

    0123;
    0456;
    0777;

    0x123;
    0x456;
    0x789;

    'g', 'h', 'j';
    '\n', '\t', '\b';
    '\x32', '\040';

    "string";
    "longerstring";
    "whatisyourname\n";
    "for science!!";
}

// keywords

struct Lesson {
    char name;
    int score;

    union {
       int a;
       char b;
    } comment;
};

void getMoreGPA(int compiler) {
    int i;
    if (compiler.score >= 95) {
        printf("target achieved\n");
    } else {
        printf("How can I become a CS scientist if I get this score on this course!\n");
    }
    while (true) {
        break;
    }
    for (i = 1; i < 10; ++i) {
        continue;
    }
    sizeof(char);
    return;
}

// single-character operators

void moreTests() {
    int a = (1 + 1), b = (2 + 2), c[20] = {1 * 2, 2 / 1, 3 % 2, 7 | 4, 8 & 1, ~8, !9};
    int t;
    t.comment.a = a;

    // multi-character operators
    a || b && c[0] == c[1];
    a != b;
    a <= b;
    a >= b;
    a >> b;
    a << b;
    ++a, --b;

    // ->

    a *= b;
    a /= b;
    a %= b;
    a += b;
    a -= b;
    a <<= b;
    a >>= b;
    a &= b;
    a ^= b;
    a |= b;

    /*稍微在注释里面加点中文感觉也很健康啊*/
}

/*日本語もいいね！*/

//The end
