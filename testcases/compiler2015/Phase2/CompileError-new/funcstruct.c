
struct A{ 			//结构体和函数可以重名
	int a;
}A;					//但结构体的实例不能与函数重名

struct A *A(struct A A) {
}

int main()
{
	return 0;
}
