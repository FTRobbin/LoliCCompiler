//编译错误：只有相同类型的指针才能进行特定的指针运算

int main() {
	int *a;
	char *b;
	a - b;
	return 0;
}
