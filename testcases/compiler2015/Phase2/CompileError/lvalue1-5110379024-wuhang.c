/** REMARK: Function return value has no address.
 *
**/

int gg()
{
    int c=0;
    return c;
}
int main()
{
    int *p=&gg();
}
