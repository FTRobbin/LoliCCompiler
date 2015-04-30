/** REMARK: After an &-operation, the result does not have an address.
 *
**/

struct a{int q;};
int main()
{
    struct a a;
    (&a)=0;
}
