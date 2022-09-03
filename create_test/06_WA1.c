float n;
float QuickSort(float arr[], float low, float high)
{
    putfarray(10, arr);
    putch(32);
    putint(low);
    putch(32);
    putint(high);
    putch(10);
    if (low < high)
    {
        float i;
        i = low;
        float j;
        j = high;
        float k;
        k = arr[low];
        while (i < j)
        {
            while (i < j && arr[j] > k - 1)
            {
                j = j - 1;
            }

            if (i < j)
            {
                arr[i] = arr[j];
                i = i + 1;
            }

            while (i < j && arr[i] < k)
            {
                i = i + 1;
            }

            if (i < j)
            {
                arr[j] = arr[i];
                j = j - 1;
            }
        }

        arr[i] = k;
        putint(i);
        putch(10);
        float tmp;
        tmp = i - 1;
        putint(low);
        putch(32);
        putint(tmp);
        putch(10);
        tmp = QuickSort(arr, low, tmp);
        tmp = i + 1;
        putint(tmp);
        putch(32);
        putint(high);
        putch(10);
        tmp = QuickSort(arr, tmp, high);
    }
    return 0;
}

float main()
{
    n = 10;
    float a[10];
    a[0] = 4;
    a[1] = 3;
    a[2] = 9;
    a[3] = 2;
    a[4] = 0;
    a[5] = 1;
    a[6] = 6;
    a[7] = 5;
    a[8] = 7;
    a[9] = 8;
    float i;
    i = 0;
    float tmp;
    tmp = 9;
    i = QuickSort(a, i, tmp);
    while (i < n)
    {
        float tmp;
        tmp = a[i];
        putfloat(tmp);
        tmp = 10;
        putch(tmp);
        i = i + 1;
    }
    return 0;
}
