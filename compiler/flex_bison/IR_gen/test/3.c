int fibo(int a)
{
    if ((a == 1) || (a == 2))
        return 1;
    return fibo(a - 1) + fibo(a - 2);
}
int main()
{
    int a;
    a = getint();
    if (a > 0)
    {
        putint(fibo(a));
    }
    return 3;
}