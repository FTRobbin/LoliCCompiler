/**
 * �����Ƿ���ȷʵ�ֿγ�Ҫ���STL����(getchar/printf/malloc) 
 *
 * int getchar ( );
 * //�ɹ���ȡ�򷵻ض������ַ��������ļ�ĩβʱ�򷵻�EOF(-1) 
 * //����������spimϵͳ��֧�ַ���EOF ��ʹ��'\x01'(Ctrl+A)���ж��ļ����� 
 *
 * int printf ( const char * format, ... );
 * //��format�е��ַ����ݱ��γ�Ҫ����ʵ�֣�
 * //%d ������ʮ�������� 
 * //%s �ַ��� 
 * //%c �ַ� 
 * //%.nd (1<=n<=9) ����������nλ������ǰ���㲹�� 
 * //%% ���һ���ٷֺ�
 * //���سɹ�����˶��ٸ��ַ������ڼ����Ҹ����Ŀ��ǣ�δ���ԣ�
 * //���ر�ע����format�б����Ҫ�����ͽ��д���ĵط������ڱ�����������У�δ���ԣ� 
 *
 * void* malloc ( size_t size );
 * //�ڶ�ջ�Ϸ���size��byte�Ŀռ䣬�������׵�ַָ��
 *
 * �����ȶ������������ٰ�ʣ������ÿ����Ϊ�ı����벢�����к���� ÿ�а������з����ܳ���504���ַ� 
 */

#include<stdio.h>
#include<stdlib.h>

void getline1(char *s) {
	int tmp;
	tmp = getchar();
	while (tmp != '\n') {
		*s = tmp;
		++s;
		tmp = getchar();
	}
	if (tmp == '\n') {
		*s = '\n';
		++s;
	}
	*s = '\0';
}

int isdecdigit(char ch) {
	return ch >= '0' && ch <= '9';
}

int getint() {
	char ch;
	int tmp;
	while (!isdecdigit(ch = getchar())) {
		continue;
	}
	tmp = ch - '0';
	while (isdecdigit(ch = getchar())) {
		tmp = tmp * 10 + ch - '0';
	}
	return tmp;
}

int main() {
	int n, line = 0;
	n = getint();
	while (line < n) {
		char *buf = malloc(sizeof(char) * 505);
		getline1(buf);
		printf("%.3d : %s", ++line, buf);
	}
	return 0;
}
 
