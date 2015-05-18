/**
 * �����Ƿ���ȷʵ���˱����滻�Ż�����ĳ�������±��ַ����Ĵ���
 * �ڱ������У�����mc[i][j]���б����滻Ч�����ԣ�����������ѭ���Ż���Ч���������� 
 * ����Ĺ����Ǿ���˷������������������
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

