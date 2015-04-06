int main()
{
  int a;
  int b;

  a = 0;
  b = 10;

  {
    int b;
    b = 20;
    a = a + b;
  }

  return a;
}