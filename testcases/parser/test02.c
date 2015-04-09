int main()
{
  int a;
  int b;
  int c;
  int max;

  a = 10;
  b = 10 * 3;
  c = 10 + 10;

  max = a;
  if (b > max) { max = b; }
  if (c > max) { max = c; }
  return max;
}