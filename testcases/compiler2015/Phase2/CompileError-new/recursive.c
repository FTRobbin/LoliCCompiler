struct T{
	struct T* t;
	int tt;
};

struct T hahaha(int x){
	if (x>0) {
		struct T t;
		return hahaha(x-1);
	} else {
		struct T* t;
		t.tt = 23333;
		return t;
	};
}
int main(){
	struct T t = hahaha(30);
	return t.tt;
}
