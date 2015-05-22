#include<stdio.h>

struct a {
	int arr[10];
} global[2];

struct a get() {
	return global[0];
}

int main() {
	struct a tmp;
	global[0].arr[0] = 1;
	tmp = get();
	printf("%d\n", tmp.arr[0]);
	return 0;
}
