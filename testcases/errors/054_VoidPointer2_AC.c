//����ɹ���void����ָ�����ת��Ϊ�κ�����ָ��
//          malloc����Ӧ��ȷʵ�ֽӿ�
//          �����±�����Ǹ���

int main() {
	void *mem1;
	mem1 = malloc(sizeof(int) * 55);
	int *mem2 = malloc(sizeof(int) * 50);
	mem2 = malloc(sizeof(char) * 45);
	char *mem3 = mem1;
	mem1 = mem2;
	int ***mem4[10][10][10] = {malloc(sizeof(int) * 10)};
	mem4[-1][0][0] = malloc(sizeof(int) * 100);
	return 0;
}
 
