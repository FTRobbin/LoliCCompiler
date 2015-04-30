
int a[] = {1, 2, 3, 4, 5}, aa[][5] = {{1, 2, 3, 4, 5}, {0}, {1}, {2}};
char b[] = "hello", c[] = "hello""world", d[][10] = {"hello", "this", "world"};

int main() {
	int i, j;
	char *s;

	printf("sizeof(a) = %d\n", sizeof(a));
	for (i = 0; i < sizeof(a) / sizeof(int); ++i) {
		printf("a[%d] = %d\n", i, a[i]);
	}

	printf("sizeof(aa) = %d\n", sizeof(aa));
	for (i = 0; i < sizeof(a) / sizeof(int) / 5; ++i) {
		for (j = 0; j < 5; ++j) {
			printf("aa[%d][%d] = %d\n", i, j, aa[i][j]);
		}
	}

	printf("sizeof(b) = %d\n", sizeof(b));
	for (i = 0; i < sizeof(b) / sizeof(char); ++i) {
		printf("b[%d] = %c\n", i, b[i]);
	}

	printf("sizeof(c) = %d\n", sizeof(c));
	for (i = 0; i < sizeof(c) / sizeof(char); ++i) {
		printf("c[%d] = %c\n", i, c[i]);
	}
	
	printf("sizeof(d) = %d\n", sizeof(d));
	for (i = 0; i < sizeof(d) / sizeof(char) / 10; ++i) {
		for (j = 0; j < 10; ++j) {
			printf("d[%d][%d] = %c\n", i, j, d[i][j]);
		}
	}
	return 0;
}
