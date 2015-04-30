int main()
{
    char **p,*city[5] = {"aaa", "bbb", "ccc", "ddd", "eee"};
    for(p = city; p < city+5; ++p)
    {
        printf("%s\n",*p);
    }
    return 0;
}