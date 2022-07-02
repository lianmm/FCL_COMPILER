int main()
{
    int a[9][9];
    int i, j;
    int n, m;
    i = 0;
    while (i < 9)
    {
        j = 0;
        while (j < 9)
        {
            a[i][j] = (i + 1) * (j + i);
            putint(a[i][j]);
            j = j + 1;
        }
        i = i + 1;
    }
    return 2;
}