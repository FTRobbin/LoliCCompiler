#include<stdio.h>

int main() {
	int x = 12, y = 10, z;
	z = x % y;
	printf("%d %d %d\n", x, y, z);
	while (z) {
		x = y;
		y = z;
		z = x % y;
		printf("%d %d %d\n", x, y, z);
	}
	printf("gcd = %d\n", y);
	return 0;
}
