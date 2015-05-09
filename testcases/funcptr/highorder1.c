
void call(void (*f)(), int n) {
	while(n--) {
		f();
	}
}

int f() {
	int a = 0;
	void g() {
		void h() {
			++a;
		}
		h();
	}
	call(g, 10);
	return a; 
}

int main() {
	printf("%d\n", f());
	return 0;
}

