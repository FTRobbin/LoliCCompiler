
// 由于作用域的问题, struct Y 重定义
struct X {
	struct Y {
		int a, b;
	} c;
	int d;
} sx;

struct Y {
	int a, b;
};

int main() {
	return 0;
}

