//����ɹ������кϷ���ָ��������� 
//          ָ����мӼ����������õ���ֵ��Ȼ��ָ��

int main() {
	int *a[10], *b;
	
	char ***aa, ****bb;
	
	int c = *(a[3] + 4), d = ****(bb - 6);
	
	int delta = (*a - b) + (**bb - *aa);
	
	*a[0] = b[-1];
	aa = *bb;
	
	
	a[0] = 0, b = 0;
	aa = 0, **bb = 0;
	
	if (b == 0 || a != 0) {
		printf("hello!\n");
	}	
	
	return 0;
}
