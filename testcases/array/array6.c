int a[] = {1, 2, 3, 4, 5};

int sum(int a[], int size) {
    int i, sum;
    for (i = 0; i < size; ++i) {
        sum += a[i];
    }
    return sum;
}

int main() {
    printf("%d\n", sum(a, 5));
    return 0;
}