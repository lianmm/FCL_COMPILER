
int color[100];
int ok(int k, int c[][100]) //判断顶点k的着色是否发生冲突
{
    int i, j;
    i = 1;
    while (i < k)
    {
        if (c[k][i] == 1 && color[i] == color[k])
            return 0;
        i = i + 1;
    }
    return 1;
}

void graphcolor(int n, int m, int c[][100])
{
    int i, k;
    i = 1;
    while (i <= n)
    {
        color[i] = 0;
        i = i + 1;
    }

    k = 1;
    while (k >= 1)
    {
        color[k] = color[k] + 1;
        while (color[k] <= m)
            if (ok(k, c))
                break;
            else
                color[k] = color[k] + 1; //搜索下一个颜色
        if (color[k] <= m && k == n)
        {
            i = 1;
            while (i <= n)
            {
                putint(color[i]);
                i = i + 1;
            }
            putch(10);
        }
        else if (color[k] <= m && k < n)
            k = k + 1; //处理下一个顶点
        else
        {
            color[k] = 0;
            k = k - 1; //回溯
        }
    }
}
void main()
{
    int i, j, n, m;
    int c[100][100]; //存储n个顶点的无向图的数组

    n = getint();
    m = getint();
    i = 1;
    while (i <= n)
    {
        j = 1;
        while (j <= n)
        {
            c[i][j] = getint();
            j = j + 1;
        }
        i = i + 1;
    }

    graphcolor(n, m, c);
}