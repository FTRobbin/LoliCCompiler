/**
 * �����Ƿ���ȷʵ�ֵ�ַ����
 * struct4�ļ�ǿ�� 
 * û����ȷʵ�ֵ�ַ���뽫������Ӱ������ʵ��ִ��Ч��
 * ������ĳЩ�ܹ����޷���ȷ����
 * ѧ�������ϵͳ1��ͬѧӦ���ܹ���ȷ����ַ�������Ҫ��
 * 
 * ���ϣ�http://en.wikipedia.org/wiki/Data_structure_alignment 
 */ 

#include<stdio.h>

struct padding1 {
	int a;
	char b;
};

struct padding2 {
	char a;
	int b;
};

struct padding3 {
	char a, b, c;
};

struct padding4 {
	char a;
	struct padding3 b;
	char c;
};

struct padding5 {
	char a;
	struct padding2 b;
	struct padding3 c;
	struct padding1 d;
};

struct padding6 {
	struct padding3 a[2];
	int b;
	struct padding4 c;
};

union allin {
	struct padding1 a;
	struct padding2 b;
	struct padding3 c;
	struct padding4 d;
	struct padding5 e;
	struct padding6 f;
};

int main() {
	printf("%d %d %d %d %d %d %d\n", sizeof(struct padding1), sizeof(struct padding2), sizeof(struct padding3),
	                                 sizeof(struct padding4), sizeof(struct padding5), sizeof(struct padding6),
									 sizeof(union allin));
	return 0;
}
