#include<vector>
#include<cstdio>
#include<cstring>
#include<iostream>
#include<algorithm>
using namespace std;

int main() {
    int n;
    scanf("%d", &n);
    freopen("sort.in", "w", stdout);
    vector<int> v(n);
    for (int i = 0; i < n; ++i) {
        v[i] = rand() * (rand() % 2 ? -1 : 1);
    }
    random_shuffle(v.begin(), v.end());
    printf("%d\n", n);
    for (int i = 0; i < n; ++i) {
        printf("%d%c", v[i], i == n - 1 ? '\n' : ' ');
    }
    return 0;
}
