/**
 * �����Ƿ���ȷʵ����+=�ȸ�ֵ�������
 * a+=b��ʵ�����Ǻ��п��ܲ��ȼ���a=a+b��
 * �����ǿ��ǵ�get����ĳһ���Ե����
 * 
 * ���룺һ���Ǹ�����t
 * ���������t�ּ����n��ֵ��getn�ĵ��ô��� 
 */ 

#include<stdio.h>

int cnt = 0, n;

int* getn() {
	++cnt;
	return &n;
}

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

int main() {
	int i, t;
	t = getint();
	*getn() = 0;
	for (i = 0; i < t; ++i) {
		*getn() += i + 1;
		*getn() -= i - 1;
		*getn() *= i + 2;
		*getn() /= i + 1;
		*getn() %= *getn() + 1;
		*getn() >>= 1;
		*getn() <<= 1;
		*getn() &= *getn();
		*getn() |= *getn();
		*getn() ^= 1;
	}
	printf("%d %d\n", *getn(), cnt);
	return 0;
}
