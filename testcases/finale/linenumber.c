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
 * 程序先读入总行数，再把剩下来的每行作为文本读入并标上行号输出 每行包括换行符不能超过504个字符 
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
 
