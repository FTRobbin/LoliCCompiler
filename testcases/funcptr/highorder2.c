
int a[10] = {0, 7, 1, 3, 2, 5, 4, 9, 8, 6};

void sort(int n, void (*swap)(int*, int*)) {
	int i, j;
	for (i = 0; i < n; ++i) {
		for (j = i + 1; j < n; ++j) {
			if (a[i] > a[j]) {
				swap(a + i, a + j);
			}
		}
	}
}

void swap(int *a, int *b) {
	int tmp = *a;
	*a = *b;
	*b = tmp;
}

int main() {
	int i, cnt = 0;
	void cnt_swap(int *a, int *b) {
		++cnt;
		swap(a, b);
	}
	sort(10, cnt_swap);
	for (i = 0; i < 10; ++i) {
		printf("%d ", a[i]);
	}
	printf("\n");
	printf("%d\n", cnt);
	return 0;
}

