int one() {
    return 1;
}

int main() {
    int v1, v2, v3, v4, v5, v6, v7, v8, v9,
        a1[5], a2[5][10], a3[5][10][15],
        *p1, *p2, *p3, *p4, *p5;

    struct twoInt {
        int a, b;
    } s1, s2, *sp;

    v1 = 1;
    v2 = v1 + v1;
    p1 = &v1;
    p2 = a1;
    p3 = a3[1][2];
    v3 = v1 > v2;
    v3 = v1 < v2;
    v3 = v1 <= v2;
    v3 = v1 >= v2;
    v3 = v1 == v2;
    v3 = v1 != v2;
    v3 = v1 + v2;
    v3 = v1 - v2;
    v3 = v1 * v2;
    v3 = v1 / v2;
    v3 = v1 % v2;
    v3 = v1 ^ v2;
    v3 = v1 | v2;
    v3 = v1 & v2;
    v3 = v1 << v2;
    v3 = v1 >> v2;
    v3 = v1 || v2;
    v3 = v1 && v2;
    v4 += v3;
    v4 -= v3;
    v4 *= v3;
    v4 /= v3;
    v4 %= v3;
    v4 ^= v3;
    v4 |= v3;
    v4 &= v3;
    v4 <<= v3;
    v4 >>= v3;
    v5 = 1;
    p2 = p2 + 1;
    p2 = p2 - 1;
    p2 = 1 + p2;
    p2 = -1 + p2;
    ++p2;
    --p2;
    p2++;
    p2--;
    p3 = p2 + 1;
    v5 = p3 - p2;
    v5 = v1, v2, v3;
    sp = &s1;
    sp->a = 0;
    sp->b = 1;
    v5++;
    v5--;
    s1.a = s1.b = 1;
    s2 = *sp;
    v6 = *p2;
    v7 = v1 || v2 || v3;
    v7 = v1 && v2 && v3;
    v7 = v1 || v2 && v3;
    p2 -= 1;
    v7 = p3 - p2;
    v7 = ~v7;
    v7 = -v7;
    v7 = +v7;
    v7 = !v7;
    return 0;
}