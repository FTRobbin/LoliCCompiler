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
 * ����Ĺ����ǰ���������к������ ÿ�а������з����ܳ���504���ַ� 
 */

#include<stdio.h>
#include<stdlib.h>

void getline1(char *s) {
	int tmp;
	tmp = getchar();
	while (tmp != 1 && tmp != '\n') {
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

int main() {
	int tmp, line = 0;
	char *buf;
	while ((tmp = getchar()) != 1) {
		buf = malloc(sizeof(char) * 505);
		*buf = tmp;
		if (tmp == '\n') {
			*(buf + 1) = '\0';
		} else {
			getline1(buf + 1);
		}
		printf("%.3d : %s", ++line, buf);
	}
	return 0;
}
 
