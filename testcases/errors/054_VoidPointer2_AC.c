//编译成功：void类型指针可以转换为任何其他指针
//          malloc函数应正确实现接口
//          数组下标可以是负数

int main() {
	void *mem1;
	mem1 = malloc(sizeof(int) * 55);
	int *mem2 = malloc(sizeof(int) * 50);
	mem2 = malloc(sizeof(char) * 45);
	char *mem3 = mem1;
	mem1 = mem2;
	int ***mem4[10][10][10] = {malloc(sizeof(int) * 10)};
	mem4[-1][0][0] = malloc(sizeof(int) * 100);
	return 0;
}
 
