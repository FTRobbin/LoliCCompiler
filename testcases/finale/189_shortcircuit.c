/**
 * �����Ƿ���ȷʵ���˶�·��ֵ�Լ��Թ�ϵ�����֧�ķ����Ƿ������Ż� 
 * ��·��ֵ����c��˵��һ�����淶
 * ��ʵ��Ӧ����Ϊ�˷�ֹREҲ�ǳ���Ҫ
 *  
 * ���룺�����Ǹ����� a b c
 * �����Wow, congratulations!�� a + 1 ��ֵ 
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

int explode(int flag) {
	if (flag) {
		int i;
		for (i = 0; i < 1000; ++i) {
			printf("explode %d\n", i);
		}
	}
	return 1;
}

int main() {
	int t1 = getint() + 1, t2 = getint() + 2, t3 = getint() + 3, i = 100;
	while (i > 0) {
		if (t1 > 0 || explode(t1)) {
			if ((t2 > 1 && t3 > 2) || explode(t2)) {
				if (t2 <= 0 && explode(t3)) {
					explode(t3);
				} else {
					if ((t2 && t3 || explode(1000) || t1) && (1 + 1 != 2) && explode(1000)) {
						explode(1000);
					} else {
						if (explode(0) && i == 1) {
							printf("Wow, congratulations!\nt1 = %d\n", t1);
						}
					}
				}
			} else {
				explode(t2);
			}
		} else {
			explode(t1);
		}
		--i;
	}
	return 0;
}
