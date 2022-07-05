#include "symtable.h"

/*----------------------------------信息存储表结构定义-----------------------------------------*/

struct symboltable sT;
struct symbol_scope_begin symbol_scope_TX;
struct array_table aT;
struct ext_val_table evT;
struct func_table fT;
struct arr_val_table avT;

/*----------------------------------添加新符号用的暂存全局变量------------------------------------*/
char glo_name[33], glo_alias[10] = "", glo_flag;
struct opn glo_offset;
char glo_type[36];
int glo_int_val = 0;
float glo_float_val = 0;
int glo_level, glo_paramnum;
char *glo_tmp_type;
int glo_init_sym;
struct opn glo_arr_lim[10];
int glo_D = 0;
struct opn glo_size;

/*--------------------------------------符号表维护函数区----------------------------------------*/
//构造新的数组内情向量并插入aT。
int mkarr(struct opn arr_lim[], int D)
{
    aT.arrs[aT.top].D = D;
    int i = 0;
    for (i = 0; i < D; i++)
    {
        aT.arrs[aT.top].lim[i].type = arr_lim[i].type;
        aT.arrs[aT.top].lim[i].const_int = arr_lim[i].const_int;
        strcpy(aT.arrs[aT.top].lim[i].id, arr_lim[i].id);
    }
    aT.top++;

    return aT.top - 1;
}

void display_fT()
{
    int i;
    printf("\tfT:\t");
    for (i = 0; i < fT.top; i++)
    {
        printf("\t%d", fT.funcs[i]);
    }
    printf("\n");
}
//构造新的符号并插入sT。
void mksym(struct symboltable *sT, char *name, int level, char *type, int paramnum, char *alias, char flag, struct opn offset, int init_sym, int int_val, float float_val, struct opn size)
{

    sT->symbols[sT->index].address = 0;
    sT->symbols[sT->index].flagca = ' ';
    sT->symbols[sT->index].flage = ' ';
    sT->symbols[sT->index].init_sym = 0;
    sT->symbols[sT->index].level = 0;
    sT->symbols[sT->index].no_ris = 0;
    sT->symbols[sT->index].offset.const_int = 0;
    sT->symbols[sT->index].val_index = 0;
    strcpy(sT->symbols[sT->index].type, " ");
    sT->symbols[sT->index].status = 0;
    sT->symbols[sT->index].size.const_int = 0;
    sT->symbols[sT->index].paramnum = 0;
    sT->symbols[sT->index].paras[0] = 0;
    sT->symbols[sT->index].paras[1] = 0;
    strcpy(sT->symbols[sT->index].name, name);
    sT->symbols[sT->index].level = level;
    strcpy(sT->symbols[sT->index].type, type);
    sT->symbols[sT->index].paramnum = paramnum;
    strcpy(sT->symbols[sT->index].alias, alias);
    sT->symbols[sT->index].flag = flag;
    sT->symbols[sT->index].int_val = int_val;
    sT->symbols[sT->index].float_val = float_val;
    sT->symbols[sT->index].init_sym = init_sym;
    sT->symbols[sT->index].size.type = size.type;
    sT->symbols[sT->index].size.const_int = size.const_int;
    strcpy(sT->symbols[sT->index].size.id, size.id);
    sT->symbols[sT->index].offset.const_int = 0;
    sT->symbols[sT->index].offset.type = 'i';
    switch (flag)
    {
    case 'V':
    {
        int tmp_sym = sT->index - 1;
        while (sT->symbols[tmp_sym].flag == 'T')
            tmp_sym--;
        //全局变量地址偏移量维护；
        if (level == 0)
        {
            evT.vals[evT.top] = sT->index, evT.top++;
            if (evT.top == 1)
                offset.const_int = 0;
            else
                offset.const_int = sT->symbols[evT.vals[evT.top - 2]].offset.const_int + sT->symbols[evT.vals[evT.top - 2]].size.const_int;
        }
        //无参函数第一个局部变量的偏移值维护；
        else if (sT->symbols[tmp_sym].flag == 'F')
        {
            offset.const_int = 16;
        }
        //其他局部变量偏移值维护；
        else
        {
            int tmp_sym = sT->index - 1;
            while (sT->symbols[tmp_sym].offset.const_int < 0)
                tmp_sym--;
            offset.const_int = sT->symbols[tmp_sym].offset.const_int + sT->symbols[tmp_sym].size.const_int;
        }
        break;
    }
    case 'F':
    {
        fT.funcs[fT.top] = sT->index, fT.top++;
        if (fT.top == 16)
            offset.const_int = 0;
        else if (fT.top > 16)
            offset.const_int = sT->symbols[fT.funcs[fT.top - 2]].offset.const_int + sT->symbols[fT.funcs[fT.top - 2]].size.const_int;
        break;
    }
    case 'T':
    {
        // //全局变量地址偏移量维护；
        // if (level == 0)
        // {
        //     evT.vals[evT.top] = sT->index, evT.top++;
        //     if (evT.top == 1)
        //         offset.const_int = 0;
        //     else
        //         offset.const_int = sT->symbols[evT.vals[evT.top - 2]].offset.const_int + sT->symbols[evT.vals[evT.top - 2]].size.const_int;
        // }
        // //无参函数第一个局部变量的偏移值维护；
        // else if (sT->symbols[sT->index - 1].flag == 'F')
        // {
        //     offset.const_int = sT->symbols[sT->index - 1].offset.const_int + sT->symbols[sT->index - 1].size.const_int;
        // }
        // //其他局部变量偏移值维护；
        // else
        // {
        //     offset.const_int = sT->symbols[sT->index - 1].offset.const_int + sT->symbols[sT->index - 1].size.const_int;
        // }
        offset.const_int = sT->symbols[sT->index - 1].offset.const_int;
        sT->symbols[sT->index].size.const_int = sT->symbols[sT->index - 1].size.const_int;
        break;
    }
    case 'A':
    {
        int tmp_sym = sT->index - 1;
        while (sT->symbols[tmp_sym].flag == 'T')
            tmp_sym--;
        //外部数组偏移；
        if (level == 0)
        {
            evT.vals[evT.top] = sT->index, evT.top++;
            if (evT.top == 1)
                offset.const_int = 0;
            else
                offset.const_int = sT->symbols[evT.vals[evT.top - 2]].offset.const_int + sT->symbols[evT.vals[evT.top - 2]].size.const_int;
        }
        //无参函数第一个局部数组的偏移值维护；
        else if (sT->symbols[tmp_sym].flag == 'F')
        {
            offset.const_int = 16;
        }
        //其他局部数组；
        else
        {
            int tmp_sym = sT->index - 1;
            while (sT->symbols[tmp_sym].offset.const_int < 0)
                tmp_sym--;
            offset.const_int = sT->symbols[tmp_sym].offset.const_int + sT->symbols[tmp_sym].size.const_int;
        }
        break;
    }
    case 'P':
    {
        //首形参偏移维护；
        if ((sT->symbols[sT->index - 1].flag != 'P' && sT->symbols[sT->index - 1].flage != 'P') || sT->symbols[sT->index - 1].flag == 'F')
        {

            offset.const_int = 16;
        }
        //其他形参偏移维护；
        else
        {
            if (offset.const_int < 4)
                offset.const_int = sT->symbols[sT->index - 1].offset.const_int + sT->symbols[sT->index - 1].size.const_int;
            else
            {
                offset.const_int = -4 * (offset.const_int + 5);
            }
        }
        break;
    }
    case 'C':
    {
        int tmp_sym = sT->index - 1;
        while (sT->symbols[tmp_sym].flag == 'T')
            tmp_sym--;
        //全局变量地址偏移量维护；
        if (level == 0)
        {
            evT.vals[evT.top] = sT->index, evT.top++;
            if (evT.top == 1)
                offset.const_int = 0;
            else
                offset.const_int = sT->symbols[evT.vals[evT.top - 2]].offset.const_int + sT->symbols[evT.vals[evT.top - 2]].size.const_int;
        }
        //无参函数第一个局部变量的偏移值维护；
        else if (sT->symbols[tmp_sym].flag == 'F')
        {
            offset.const_int = 16;
        }
        //其他局部变量偏移值维护；
        else
        {
            offset.const_int = sT->symbols[sT->index - 1].offset.const_int + sT->symbols[sT->index - 1].size.const_int;
        }
        break;
    }
    }

    sT->symbols[sT->index].offset.const_int = offset.const_int;
    sT->index++;
    // printf("\t%d\n", sT->index);
}

//显示当前数组内情向量表中的内容。
void DisplayArrTable()
{
    int i = 0, j = 0;
    for (i = 0; i < aT.top; i++)
    {
        for (j = 0; j < aT.arrs[i].D; j++)
        {
            printf("\t%d", aT.arrs[i].lim[j].const_int);
        }
        printf("\n");
    }
}
//打印一个变量结点；
void printOpn(struct opn topn)
{
    switch (topn.type)
    {
    case 'v':
        printf("\t%s", topn.id);
        break;
    case 'i':
        printf("\t%d", topn.const_int);
        break;
    case 'f':
        printf("\t%f", topn.const_float);
        break;
    case 'c':
        printf("\t%c", topn.const_char);
        break;
    default:
        printf("\t空变量");
    }
}
//查询某个索引对应的内情向量的一维大小。
struct opn arr_size(int index)
{

    int i = 0, ans = 1;
    for (i = 0; i < aT.arrs[index].D; i++)
    {
        ans *= aT.arrs[index].lim[i].const_int;
    }
    struct opn topn;
    topn.type = 'i', topn.const_int = ans;
    return topn;
}

// 显示当前符号表中的内容。
void DisplaySymbolTable(struct symboltable sT)
{
    int i;
    printf("----------------symbol table-----------------------\n");
    printf("%s\t%s\t%s\t%s\t%s\t\n", "Index", "Name", "Level", "Type", "Flag");
    printf("---------------------------------------------------\n");
    for (i = 15; i < sT.index; i++)
    {

        switch (sT.symbols[i].flag)
        {
        case 'F':
        {
            printf("%d\t%s\t%d\t%s\t%c\t参数个数：%d", i, sT.symbols[i].name, sT.symbols[i].level, sT.symbols[i].type, sT.symbols[i].flag, sT.symbols[i].paramnum);
            printf("\t函数形参标识表： ");
            for (int j = 0; j < sT.symbols[i].paramnum; j++)
                printf("\t%d", sT.symbols[i].paras[j]);
            printf("\t函数空间大小size：%d", sT.symbols[i].size.const_int);
            printf("\t函数地址偏移：%d", sT.symbols[i].offset.const_int);
            printf("\t函数静态符号表索引：%d", sT.symbols[i].val_index);

            printf("\n");
            break;
        }
        case 'V':
        {
            printf("%d\t%s\t%d\t%s\t%c\t", i, sT.symbols[i].name, sT.symbols[i].level, sT.symbols[i].type, sT.symbols[i].flag);
            printf("\t变量空间大小size：%d", sT.symbols[i].size.const_int);
            printf("\t初始化状态：%d", sT.symbols[i].init_sym);
            printf("\tlevel： %d", sT.symbols[i].level);
            printf("\t变量地址偏移：%d", sT.symbols[i].offset.const_int);
            printf("\t变量分配状态： %d", sT.symbols[i].status);
            printf("\t对应临时变量： t%d", sT.symbols[i].no_ris);
            printf("\n");
            break;
        }
        case 'A':
        {
            printf("%d\t%s\t%d\t%s\t%c\t向量表索引:%d\t", i, sT.symbols[i].name, sT.symbols[i].level, sT.symbols[i].type, sT.symbols[i].flag, sT.symbols[i].paramnum);
            if (sT.symbols[i].flage == 'P')
                printf("\t外部标记flage：%c", sT.symbols[i].flage);
            printf("\t数组空间大小size：%d", sT.symbols[i].size.const_int);
            printf("\t数组地址偏移：%d", sT.symbols[i].offset.const_int);
            printf("\t维数：%d\t 各维度长度：", aT.arrs[sT.symbols[i].paramnum].D);
            for (int j = 0; j < aT.arrs[sT.symbols[i].paramnum].D; j++)
            {
                printOpn(aT.arrs[sT.symbols[i].paramnum].lim[j]);
            }

            printf("\n");
            // DisplayArrTable();
            break;
        }
        case 'P':
        {
            printf("%d\t%s\t%d\t%s\t%c\t", i, sT.symbols[i].name, sT.symbols[i].level, sT.symbols[i].type, sT.symbols[i].flag);

            printf("\t形参空间大小size：%d", sT.symbols[i].size.const_int);
            printf("\t初始化状态：%d", sT.symbols[i].init_sym);
            printf("\t形参地址偏移：%d", sT.symbols[i].offset.const_int);
            printf("\t变量地址偏移：%d", sT.symbols[i].offset.const_int);
            printf("\t变量分配状态： %d", sT.symbols[i].status);
            printf("\t对应临时变量： t%d", sT.symbols[i].no_ris);
            printf("\n");
            break;
            break;
        }
        case 'T':
        {
            printf("%d\t%s\tlevel:%d\t%s\t%c\t", i, sT.symbols[i].name, sT.symbols[i].level, sT.symbols[i].type, sT.symbols[i].flag);
            printf("\t变量空间大小size：%d", sT.symbols[i].size.const_int);
            printf("\t初始化状态：%d", sT.symbols[i].init_sym);
            printf("\t变量地址偏移：%d", sT.symbols[i].offset.const_int);
            printf("\t伪寄存器分配状态： %d", sT.symbols[i].status);
            printf("\t对应寄存器： r%d", sT.symbols[i].no_ris);
            printf("\t对应栈地址： 0x%d", sT.symbols[i].address);
            printf("\n");
            break;
        }
        case 'C':
        {
            printf("%d\t%s\t%d\t%s\t%c\t", i, sT.symbols[i].name, sT.symbols[i].level, sT.symbols[i].type, sT.symbols[i].flag);

            printf("\t初始化状态：%d", sT.symbols[i].init_sym);
            printf("\t常量地址偏移：%d", sT.symbols[i].offset.const_int);
            if (sT.symbols[i].flagca == 'A')
            {
                printf("\t常数组空间大小size：%d", sT.symbols[i].size.const_int);
                printf("\t维数：%d\t 各维度长度：", aT.arrs[sT.symbols[i].paramnum].D);
                for (int j = 0; j < aT.arrs[sT.symbols[i].paramnum].D; j++)
                {
                    printOpn(aT.arrs[sT.symbols[i].paramnum].lim[j]);
                }
                printf("\t常数组初始化值：");
                for (int k = 0; k < avT.arr[sT.symbols[i].val_index].lim; k++)
                {
                    printOpn(avT.arr[sT.symbols[i].val_index].val[k]);
                }
            }
            else
            {
                printf("\t常量空间大小size：%d", sT.symbols[i].size.const_int);
                printf("\t常变量初始化值：%d", sT.symbols[i].int_val);
            }
            printf("\n");
            break;
        }
        }
    }
    printf("---------------------------------------------------\n");
    printf("\n");
}

//查询符号表，返回表内索引，-1表示不存在。
int find(char *id)
{
    int i;
    int ans = -1;
    for (i = 0; i < sT.index; i++)
    {
        if (strcmp(sT.symbols[i].name, id) == 0)
            ans = i;
    }
    return ans;
}

//初始化全局暂存变量。
void init()
{
    strcpy(glo_name, "");
    glo_flag = ' ';
    glo_init_sym = 0;
    glo_int_val = 0;
    glo_float_val = 0;
    glo_paramnum = -1;
    glo_offset.const_int = 0;
    glo_offset.type = 'i';
    strcpy(glo_type, "");
    // memset(glo_arr_lim, 0, 10);

    glo_size.const_int = 0;
}

//将库函数直接导入符号表，避免语义检查不识别的问题；
void add_lib()
{
    struct opn topn;

    topn.type = 'i', topn.const_int = 0;
    mksym(&sT, (char *)"getint", 0, (char *)"int(void)", 0, (char *)"", 'F', topn, 0, 0, 0, topn);
    mksym(&sT, (char *)"getch", 0, (char *)"int(void)", 0, (char *)"", 'F', topn, 0, 0, 0, topn);
    mksym(&sT, (char *)"getarray", 0, (char *)"int(int[])", 1, (char *)"", 'F', topn, 0, 0, 0, topn);
    sT.symbols[sT.index - 1].paras[0] = 3;
    mksym(&sT, (char *)"getfloat", 0, (char *)"float(void)", 0, (char *)"", 'F', topn, 0, 0, 0, topn);
    mksym(&sT, (char *)"getfarray", 0, (char *)"int(float[])", 1, (char *)"", 'F', topn, 0, 0, 0, topn);
    sT.symbols[sT.index - 1].paras[0] = 4;
    mksym(&sT, (char *)"putint", 0, (char *)"void(int)", 1, (char *)"", 'F', topn, 0, 0, 0, topn);
    sT.symbols[sT.index - 1].paras[0] = 1;
    mksym(&sT, (char *)"putch", 0, (char *)"void(int)", 1, (char *)"", 'F', topn, 0, 0, 0, topn);
    sT.symbols[sT.index - 1].paras[0] = 1;
    mksym(&sT, (char *)"putarray", 0, (char *)"void(int,int[])", 2, (char *)"", 'F', topn, 0, 0, 0, topn);
    sT.symbols[sT.index - 1].paras[0] = 1, sT.symbols[sT.index - 1].paras[1] = 3;
    mksym(&sT, (char *)"putfloat", 0, (char *)"void(float)", 1, (char *)"", 'F', topn, 0, 0, 0, topn);
    sT.symbols[sT.index - 1].paras[0] = 2;
    mksym(&sT, (char *)"putfarray", 0, (char *)"void(int,float[])", 2, (char *)"", 'F', topn, 0, 0, 0, topn);
    sT.symbols[sT.index - 1].paras[0] = 1, sT.symbols[sT.index - 1].paras[1] = 4;
    mksym(&sT, (char *)"putf", 0, (char *)"void(char[],...)", -2, (char *)"", 'F', topn, 0, 0, 0, topn); //支持可变参数。
    mksym(&sT, (char *)"before_main", 0, (char *)"void(void)", 0, (char *)"", 'F', topn, 0, 0, 0, topn);
    mksym(&sT, (char *)"after_main", 0, (char *)"void(void)", 0, (char *)"", 'F', topn, 0, 0, 0, topn);
    mksym(&sT, (char *)"starttime", 0, (char *)"int(void)", 0, (char *)"", 'F', topn, 0, 0, 0, topn);
    mksym(&sT, (char *)"stoptime", 0, (char *)"int(void)", 0, (char *)"", 'F', topn, 0, 0, 0, topn);
    // DisplaySymbolTable(sT);
}
