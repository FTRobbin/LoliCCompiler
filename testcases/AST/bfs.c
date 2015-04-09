int n;

int g[105][105];

int q[105], qhead, qtail;

int dis[105];

int main() {
    int m, i;
    scanf("%d%d", &n, &m);
    for (i = 0; i < n; ++i) {
        dis[i] = -1;
    }
    for (i = 0; i < m; ++i) {
        int u, v;
        scanf("%d%d", &u, &v);
        g[u][v] = g[v][u] = 1;
    }
    qhead = 0, qtail = 1, q[0] = 0, dis[0] = 0;
    while (qhead < qtail) {
        int u = q[qhead++], v;
        for (v = 0; v < n; ++v) {
            if (g[u][v] == 1 && dis[v] == -1) {
                q[qtail++] = v;
            }
        }
    }
    for (i = 0; i < n; ++i) {
        printf("%d : %d\n", i, dis[i]);
    }
    return 0;
}