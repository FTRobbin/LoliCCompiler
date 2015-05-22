int add(int a) {
	return a + 1;
}

int main() {
	int a = 0;
	a = add(a);
	a = add(add(a));
	return 0;
}
