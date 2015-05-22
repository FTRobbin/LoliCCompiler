#include<stdio.h>

int f(int n) {
	printf("f(%d) Called!\n", n);
	if (n < 1) {
		return 1;
	} else {
		return f(n - 1) + f(n - 2);
	}
}

int main() {
	printf("%d\n", f(5));
	return 0;
}
