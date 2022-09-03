int func(int a[], int b[])
{
    a[0] = 1; //修改a的值b会自动改变。
    putint(b[0]);
}
int main()
{
    int a[4] = {0};
    func(a, a);
    return 0;
}
//由于数组传参本质在传地址，导致向同一个函数的两个形参中传同一个实参则在被调函数中两个形参保持自动同步/完全干扰。