//嵌套函数可能有副作用；
int a = -1, b = 1;

int inc_a()
{
    int b = a;
    b = b + 1;
    a = b;
    return a;
}
int func(int a, int b, int c, int d)
{
    b = b + 1;
    a = a - 1;
    putint(a + b + c);
    return a + b + c + d;
}
int main()
{
    int k = 5;
    while (k > 0)
    {
        if (!inc_a() && inc_a() || inc_a())
        {
            putint(func(!inc_a() + 3, inc_a() - inc_a() % inc_a(), inc_a(), inc_a()));
            putch(32);
            putint(b);
            putch(10);
        }
        if (!inc_a() < 14 || !inc_a() && !inc_a() - -inc_a() + 1)
        {
            putint(a);
            putch(10);
            b = b * 2;
        }
        else
        {
            inc_a();
        }
        k = k - 1;
    }
    putint(a);
    putch(32);
    putint(b);
    putch(10);
    return a;
}
