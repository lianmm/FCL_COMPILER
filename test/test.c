int a;
int main()
{
    int a[5][2] = {1, 2, 3, 4, 5, 1, 2, 3, 4, 5}, b = getint(); // b=4,如果直接赋值会常量传播
    int c = 1;
    int ans = a[b - 1 + c][1] + a[b - 1 + c][0];
    putint(ans);

    return 0;
}