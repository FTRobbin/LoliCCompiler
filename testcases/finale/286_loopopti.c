/**
 * 考察是否正确实现了循环优化，包括但不仅限于： 
 * 1.归纳变量识别
 * 2.强度削弱
 * 3.线性函数测试替换
 * 4.不变量外提 
 */

#include <stdio.h>

int main() {
	int i, j, k, it, sum1 = 0, sum2 = 0, sum3 = 0, a[10000], b[10000];
	for (i = 0; i < 10000; ++i) {
		a[i] = 20000 - i * 2;
		b[i] = 10000 + i;
	}
	printf("%d %d\n", a[5050], b[1840]);
	it = 5;
	for (j = 0; j < 10000; ++j) {
		sum1 += 10 * j + 5;
		sum2 += 10 * j + 4;
		sum3 += 10 * j + 3;
		it += 10;
	}
	printf("%d %d\n", sum1 + sum2 + sum3, it);
	it = 0;
	for (j = 0; j < 100; ++j) {
		int constant, *cstp;
		for (k = 0; k < 100; ++k) {
			constant = 5, cstp = &constant;
			a[j * 100 + k] = j * 100 * *cstp + k * *cstp;
			it = it + 4;
		}
	}
	printf("%d %d\n", a[2014], a[2015]);
	return 0;
}
