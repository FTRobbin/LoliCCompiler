/*
 * function arg Type mismatch
 */
#include <stdio.h>
struct AI {
    int a;
} sa;
int f(int a, int b)
{

}
int main() {
    int b;
    f(b, sa);
}