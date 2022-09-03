int func(int p1, int p2, int p3, int p4)
{
    if (p3 > 0)
        return func(1, 2, p3 - 1, 4);
    else
        return 0;
}
int main()
{
    starttime();
    int i = 0;
    int ans = 0;
    i = 100000;

    ans = ans + func(1, 2, i, 4);

    putint(ans);
    stoptime();
    return 0;
}