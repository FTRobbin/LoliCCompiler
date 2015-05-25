/**
 * 测试是否正确实现课程要求的STL函数(getchar/printf/malloc) 
 *
 * int getchar ( );
 * //成功读取则返回读到的字符，遭遇文件末尾时则返回EOF(-1) 
 * //修正：由于spim系统不支持返回EOF 特使用'\x01'(Ctrl+A)来判断文件结束 
 *
 * int printf ( const char * format, ... );
 * //除format中的字符依据本课程要求须实现：
 * //%d 带符号十进制整数 
 * //%s 字符串 
 * //%c 字符 
 * //%.nd (1<=n<=9) 若整数不足n位，则以前导零补齐 
 * //%% 输出一个百分号
 * //返回成功输出了多少个字符（出于减轻大家负担的考虑，未测试）
 * //请特别注意由format列表而需要对类型进行处理的地方！（在别的数据中已有，未测试） 
 *
 * void* malloc ( size_t size );
 * //在堆栈上分配size个byte的空间，并返回首地址指针
 *
 * 程序的功能是把输入标上行号再输出 每行包括换行符不能超过504个字符 
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
 
