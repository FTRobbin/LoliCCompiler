/*
  @author yixi
*/
#include <stdio.h>

int N = 15000;
char b[15001];
int resultCount = 0;

int main()
{
  int i;

  for (i = 1; i <= N; i++) b[i] = 1;

  for (i = 2; i <= N; i++) if (b[i])
  {  
    int count = 2;
    
    if (i>3 && b[i-2])
    {
      resultCount++;
      printf("%d %d\n", i-2, i);
    }
    
    while (i*count <= N)
    {
      b[i*count] = 0;
      count++;
    }
  }

  printf("Total: %d\n", resultCount);
  return 0;
}
