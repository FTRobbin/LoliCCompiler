typedef int *a[10];
typedef int myint;

myint lev0;

int main() {
    typedef myint myint2;
    myint2 lev1;
    myint2 myint;
    lev0 = 1;
    {
        typedef myint2 myint3;
        myint2 myint;
        myint3 lev2;
        lev1 = 2;
        {
            typedef myint3 myint4;
            myint3 myint2;
            myint4 lev2;
            lev2 = 3;
            {
                typedef myint4 myint5;
                myint4 myint3;
                myint5 lev3;
                lev3 = lev2 + 1;
                {
                    myint5 myint4;
                    typedef myint5 myint6;
                    myint6 lev4;
                    lev4 = lev3 | 1;
                    {
                        typedef myint6 myint7;
                        myint6 lev5;
                        myint7 lev6, lev7, myint6;
                        typedef myint7 myintfinal;
                        myintfinal levfinal;
                        myintfinal lev0 = 0, myint, myint2, myint5;
                        {
							int myintfinal = 9;
                    	}
						lev5 = 6, lev6 = 7, lev7 = 8;
                        myint = myint2 = myint6 = 32767;
                        printf("%d %d %d %d %d %d %d %d", lev0, lev1, myint2, lev3, lev4, myint5, lev6, levfinal = 10);
                    }
                }
            }
        }
    }
    return 0;
}
