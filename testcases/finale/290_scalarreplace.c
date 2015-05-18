/**
 * 考察是否正确实现了标量替换优化，给某个数组下标地址分配寄存器
 * 在本程序中，若对mc[i][j]进行标量替换效果明显，若还有其他循环优化则效果更加明显 
 * 程序的功能是矩阵乘法。输入是随机数种子
 */

#include<stdio.h>

int isdecdigit(char ch) {
	return ch >= '0' && ch <= '9';
}

int getint() {
	char ch;
	int tmp;
	while (!isdecdigit(ch = getchar())) {
		continue;
	}
	tmp = ch - '0';
	while (isdecdigit(ch = getchar())) {
		tmp = tmp * 10 + ch - '0';
	}
	return tmp;
}

int seed, magic1 = 2333, magic2 = 13, magic3 = 10007;

int rand() {
	seed = (seed * magic1 + magic2) % magic3;
	return seed;
}

int n = 200, ma[205][205], mb[205][205], mc[205][205];

int main() {
	int i, j, k;
	int xorsum = 0;
	seed = getint();
	for (i = 0; i < n; ++i) {
		for (j = 0; j < n; ++j) {
			ma[i][j] = rand() & 1023;
			mb[i][j] = rand() & 1023;
		}
	}
	for (i = 0; i < n; ++i) {
		for (j = 0; j < n; ++j) {
			for (k = 0; k < n; ++k) {
				mc[i][j] = mc[i][j] + ma[i][k] * mb[j][k];
			}
		}
	}
	for (i = 0; i < n; ++i) {
		for (j = 0; j < n; ++j) {
			xorsum = xorsum ^ mc[i][j];
		}
	}
	printf("%d\n", xorsum);
	return 0;
}

