//编译错误：数组名不能是左值 

int main() {
	int a[10], b[10];
	a = b;
	return 0;
}
