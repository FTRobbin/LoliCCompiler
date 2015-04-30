/*
 * Test1: whether you handle pointer to variable well. 
 */
#include <stdio.h>
int sumBig = 0;
void addSmall(int *ptr) {
	*ptr = *ptr + 1;
}
void addMiddle(int *ptr) {
	int sumSmall = 0;
	int i;
	for (i = 1;i <= 10;i++) {
		addSmall(&sumSmall);
		sumSmall = sumSmall + 1;
	}
	*ptr = *ptr + sumSmall;
}
int main() {
	int i;
	int *ptr = &sumBig;
	for (i = 1;i <= 10;i++) {
		int sumMiddle = 0;
		addMiddle(&sumMiddle);
		*ptr = *ptr + sumMiddle;
		sumBig = sumBig + 1;
		printf("%d %d\n", i, sumBig);
	}	
}
