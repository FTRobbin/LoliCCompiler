int n, m;

int top, to[10005], next[10005], head[105];

void addedge(int u, int v) {
    to[top] = v, next[top] = head[u], head[u] = top++;
}

int dgr[105];

int main() {
    int i, j;
    scanf("%d%d", &n, &m);
    for (i = 0; i < n; ++i) {
        dgr[i] = 0;
        head[i] = -1;
    }
    for (i = 0; i < m; ++i) {
        int u, v;
        scanf("%d%d", &u, &v);
        addedge(u, v);
        ++dgr[v];
    }
    for (i = 0; i < n; ++i) {
        int f = -1;
        for (j = 0; j < n; ++j) {
            if (dgr[j] == 0) {
                f = j;
                break;
            }
        }
        if (f == -1) {
            printf("Warning!@!\n");
            break;
        }
        printf("%d ", f);
        dgr[f] = -1;
        for (j = head[f]; ~j; j = next[j]) {
            --dgr[to[j]];
        }
    }
    return 0;
}