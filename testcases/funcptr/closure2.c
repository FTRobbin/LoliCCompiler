typedef int (*function)(int);

function add(int x) {
	int f(int y) {
		return x + y;
	};
	return f;
}

int main() {
	function add1 = add(1);
	printf("%d\n", add1(2));
	return 0;
}
