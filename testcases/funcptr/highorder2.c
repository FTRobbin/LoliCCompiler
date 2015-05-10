#include<stdio.h>

int data[10] = {0, 7, 1, 3, 2, 5, 4, 9, 8, 6}, a[10];

void selesort(int n, void (*swap)(int*, int*)) {
	int i, j;
	for (i = 0; i < n; ++i) {
		for (j = i + 1; j < n; ++j) {
			if (a[i] > a[j]) {
				swap(a + i, a + j);
			}
		}
	}
}

void sort(void (*swap)(int*, int*)) {
	int i;
	for (i = 0; i < 10; ++i) {
		a[i] = data[i];
	}
	selesort(10, swap);
	for (i = 0; i < 10; ++i) {
		printf("%d ", a[i]);
	}
	printf("\n");
}

void swap(int *a, int *b) {
	int tmp = *a;
	*a = *b;
	*b = tmp;
}

int main() {
	int cnt = 0;
	void cnt_swap(int *a, int *b) {
		++cnt;
		swap(a, b);
	}
	sort(swap);
	sort(cnt_swap);
	printf("#swap : %d\n", cnt);
	return 0;
}

