int main()
{
    int i, s;
    i = 1;
    s = 1;
    // l6
    while (i <= 20)
    { // l5
        i = i + 1;
        //自变量和结果重合时使用临时变量。
        if (i % 2 == 0) //连续运算使用临时变量。
            // l9
            continue; // goto l6
        // l8
        if (i == 9)
            // l11
            break; // goto l4
        // l10
        s = s + i;
    } // goto l6
    // l4
    putint(s);
    //实参，调用
    return 1;
} // l1
