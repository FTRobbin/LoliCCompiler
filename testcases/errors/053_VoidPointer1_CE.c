//编译错误：不能取void指针对象的值 

int main() {
	void *mem;
	*mem; 
	return 0;
}
