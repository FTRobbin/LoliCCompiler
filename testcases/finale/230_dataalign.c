/**
 * 测试是否正确实现地址补齐
 * struct4的加强版 
 * 没有正确实现地址补齐将会严重影响程序的实际执行效率
 * 甚至在某些架构上无法正确运行
 * 学过计算机系统1的同学应该能够正确理解地址补齐的重要性
 * 
 * 资料：http://en.wikipedia.org/wiki/Data_structure_alignment 
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
