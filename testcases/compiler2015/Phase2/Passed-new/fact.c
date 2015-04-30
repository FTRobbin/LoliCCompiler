#include <stdio.h>
#include <stdlib.h>

struct a
 {
  int a,b;
 }a;

int factor(int n)
 {
  int res = 1; n = 10;
  while (n>1){res*=n;n--;}
  return res;
 }

int main(int argc, char **argv) {
  int a=factor(a);
  printf("%d\n%d\n",a,10);
  return 0;
}

/*
可以编译通过。
数据意义：计算10！
主要考察点：
1.struct，struct的成员变量，不同层的变量名可以重名。
2.变量的初始化可以带变量本身。
*/
