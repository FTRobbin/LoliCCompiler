
struct flex {
	int a;
	int b[];
} *a, *b, c;

int main() {
	a = malloc(sizeof(int) * 11);
	b = malloc(sizeof(int) * 21);
	printf("%d %d %d\n", sizeof(a), sizeof(b), sizeof(c));
	(*a).b[0] = 1;
	printf("%d\n", (*a).b[0]);
	printf("%d\n", (*b).b[0]);
	(*b) = (*a);
	printf("%d\n", (*a).b[0]);
	printf("%d\n", (*b).b[0]);
	return 0;
}

