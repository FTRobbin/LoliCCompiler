//����ɹ���void����ָ�����ת��Ϊ�κ�����ָ��
//          malloc����Ӧ��ȷʵ�ֽӿ�
//          �����±�����Ǹ���

int main() {
	void *mem1;
	int *mem2 = malloc(sizeof(int) * 50);
	char *mem3 = mem1;
	int ***mem4[10][10][10] = {malloc(sizeof(int) * 10)};
	mem1 = malloc(sizeof(int) * 55);
	mem2 = malloc(sizeof(char) * 45);
	mem1 = mem2;
	mem4[-1][0][0] = malloc(sizeof(int) * 100);
	return 0;
}
 
