
float func(int a, float b)
{
    return b;
}
void func1() {}

int main()
{
    float a, b = 3;
    int c, d;
    a = (b + func(a+1, b)) * 3;
    func1();
    return a;
}