/**
 * 测试是否正确实现了+=等赋值运算操作
 * a+=b在实用中是很有可能不等价于a=a+b的
 * 尤其是考虑到get对象某一属性的情况
 * 
 * 输入：一个非负整数t
 * 输出：经过t轮计算后n的值和getn的调用次数 
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
