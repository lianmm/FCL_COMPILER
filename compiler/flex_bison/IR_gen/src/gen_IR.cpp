/* 符号管理程序 */
#include "gen_IR.h"
#include <vector>
#include <string>
using namespace std;
extern "C" void gen_IR(struct node *T);

/*-------------------------------中间代码生成标志和公共变量------------------------------------*/

//暂存变量结点信息。
struct opn glo_opn1, glo_opn2, glo_res;
IR_op glo_IR_op;
//打印标志。
int displayIR_sym = 0;
//存放op字段的字符串数组，便于输出IR。
char IR_op_strs[37][12] = {
    "ASSIGN", "EXP_POINT", "POINT_EXP",

    "ADD", "MINUS", "MUL", "DIV", "MOD", "JLT", "JLE", "JGT", "JGE", "EQ", "NEQ", "AND", "OR", "GOTO_JLT", "GOTO_JLE", "GOTO_JGT", "GOTO_JGE", "GOTO_EQ", "GOTO_NEQ", "GOTO_AND", "GOTO_OR",

    "GOTO_NOT ", "CALL", "EXP_ARROFF", "ARROFF_EXP", "NOT",

    "FUNCTION ", "PARAM", "LABEL", "GOTO",

    "ARG", "RETURN", "CALL_VOID"};
struct codenode null_ir;
//左右类型标识。
int lint = 0, rint = 0;
// label标识。函数头尾，用于调用和返回；循环头尾，用于打断和继续；判断跳转true位置，else位置，尾位置，用于条件跳转。
int func_head_LabIn, func_tail_LabIn, while_head_LabIn, while_tail_LabIn, if_then_LabIn, if_tail_LabIn, if_else_LabIn;
// TODO

/*--------------------------------------符号表维护区----------------------------------------*/
//构造新的数组内情向量并插入aT。
int mkarr(int arr_lim[], int D)
{
    aT.arrs[aT.top].D = D;
    int i = 0;
    for (i = 0; i < D; i++)
    {
        aT.arrs[aT.top].lim[i] = glo_arr_lim[i];
    }
    aT.top++;
    return aT.top - 1;
}

//构造新的符号并插入sT。
void mksym(struct symboltable *sT, char *name, int level, char *type, int paramnum, char *alias, char flag, int offset, int init_sym, int int_val, float float_val, int size)
{
    strcpy(sT->symbols[sT->index].name, name);
    sT->symbols[sT->index].level = level;
    strcpy(sT->symbols[sT->index].type, type);
    sT->symbols[sT->index].paramnum = paramnum;
    strcpy(sT->symbols[sT->index].alias, alias);
    sT->symbols[sT->index].flag = flag;
    sT->symbols[sT->index].int_val = int_val;
    sT->symbols[sT->index].float_val = float_val;
    sT->symbols[sT->index].init_sym = init_sym;
    sT->symbols[sT->index].size = size;
    switch (flag)
    {
    case 'V':
    {
        //全局变量地址偏移量维护；
        if (level == 0)
        {
            evT.vals[evT.top] = sT->index, evT.top++;
            if (evT.top == 1)
                offset = 0;
            else
                offset = sT->symbols[evT.vals[evT.top - 2]].offset + sT->symbols[evT.vals[evT.top - 2]].size;
        }
        //无参函数第一个局部变量的偏移值维护；
        else if (sT->symbols[sT->index - 1].flag == 'F')
        {
            offset = sT->symbols[sT->index - 1].offset + sT->symbols[sT->index - 1].size;
        }
        //其他局部变量偏移值维护；
        else
        {
            offset = sT->symbols[sT->index - 1].offset + sT->symbols[sT->index - 1].size;
        }
        break;
    }
    case 'F':
    {
        fT.funcs[fT.top] = sT->index, fT.top++;
        if (fT.top == 1)
            offset = 0;
        else
            offset = sT->symbols[fT.funcs[fT.top - 2]].offset + sT->symbols[fT.funcs[fT.top - 2]].size;
        break;
    }
    case 'T':
    {
        //全局变量地址偏移量维护；
        if (level == 0)
        {
            evT.vals[evT.top] = sT->index, evT.top++;
            if (evT.top == 1)
                offset = 0;
            else
                offset = sT->symbols[evT.vals[evT.top - 2]].offset + sT->symbols[evT.vals[evT.top - 2]].size;
        }
        //无参函数第一个局部变量的偏移值维护；
        else if (sT->symbols[sT->index - 1].flag == 'F')
        {
            offset = sT->symbols[sT->index - 1].offset + sT->symbols[sT->index - 1].size;
        }
        //其他局部变量偏移值维护；
        else
        {
            offset = sT->symbols[sT->index - 1].offset + sT->symbols[sT->index - 1].size;
        }
        break;
    }
    case 'A':
    {
        //外部数组偏移；
        if (level == 0)
        {
            evT.vals[evT.top] = sT->index, evT.top++;
            if (evT.top == 1)
                offset = 0;
            else
                offset = sT->symbols[evT.vals[evT.top - 2]].offset + sT->symbols[evT.vals[evT.top - 2]].size;
        }

        //无参函数第一个局部数组的偏移值维护；
        else if (sT->symbols[sT->index - 1].flag == 'F')
        {
            offset = sT->symbols[sT->index - 1].offset + sT->symbols[sT->index - 1].size;
        }
        //其他局部数组；
        else
        {
            offset = sT->symbols[sT->index - 1].offset + sT->symbols[sT->index - 1].size;
        }
        break;
    }
    case 'P':
    {
        //首形参偏移维护；
        if (sT->symbols[sT->index - 1].flag != 'P')
        {
            if (fT.top == 0)
            {
                offset = 12;
            }
            else
            {

                offset = sT->symbols[fT.funcs[fT.top - 1]].offset + sT->symbols[fT.funcs[fT.top - 1]].size + 12;
            }
        }

        //其他形参偏移维护；
        else
        {
            offset = sT->symbols[sT->index - 1].offset + sT->symbols[sT->index - 1].size;
        }

        break;
    }
    }

    sT->symbols[sT->index].offset = offset;
    sT->index++;
}

//显示当前数组内情向量表中的内容。
void DisplayArrTable()
{
    int i = 0, j = 0;
    for (i = 0; i < aT.top; i++)
    {
        for (j = 0; j < aT.arrs[i].D; j++)
        {
            printf("\t%d", aT.arrs[i].lim[j]);
        }
        printf("\n");
    }
}

//查询某个索引对应的内情向量的一维大小。
int arr_size(int index)
{
    int i = 0, ans = 1;
    for (i = 0; i < aT.arrs[index].D; i++)
    {
        ans *= aT.arrs[index].lim[i];
    }
    printf("向量索引：%d数组规格：%d\n", index, ans);
    return ans;
}

// 显示当前符号表中的内容。
void DisplaySymbolTable(struct symboltable sT)
{
    int i;
    printf("----------------symbol table-----------------------\n");
    printf("%s\t%s\t%s\t%s\t%s\t\n", "Index", "Name", "Level", "Type", "Flag");
    printf("---------------------------------------------------\n");
    for (i = 0; i < sT.index; i++)
    {

        switch (sT.symbols[i].flag)
        {
        case 'F':
        {
            printf("%d\t%s\t%d\t%s\t%c\t参数个数：%d", i, sT.symbols[i].name, sT.symbols[i].level, sT.symbols[i].type, sT.symbols[i].flag, sT.symbols[i].paramnum);
            printf("\t函数空间大小size：%d", sT.symbols[i].size);
            printf("\t函数地址偏移：%d", sT.symbols[i].offset);
            printf("\n");
            break;
        }
        case 'V':
        {
            printf("%d\t%s\t%d\t%s\t%c\t", i, sT.symbols[i].name, sT.symbols[i].level, sT.symbols[i].type, sT.symbols[i].flag);
            printf("\t变量空间大小size：%d", sT.symbols[i].size);
            printf("\t初始化状态：%d", sT.symbols[i].init_sym);
            printf("\t变量地址偏移：%d", sT.symbols[i].offset);

            printf("\n");
            break;
        }
        case 'A':
        {
            printf("%d\t%s\t%d\t%s\t%c\t向量表索引:%d\t", i, sT.symbols[i].name, sT.symbols[i].level, sT.symbols[i].type, sT.symbols[i].flag, sT.symbols[i].paramnum);
            printf("\t数组空间大小size：%d", sT.symbols[i].size);
            printf("\t数组地址偏移：%d", sT.symbols[i].offset);
            printf("\t维数：%d\t 各维度长度：", aT.arrs[sT.symbols[i].paramnum].D);
            for (int j = 0; j < aT.arrs[sT.symbols[i].paramnum].D; j++)
            {
                printf("%d\t", aT.arrs[sT.symbols[i].paramnum].lim[j]);
            }

            printf("\n");
            // DisplayArrTable();
            break;
        }
        case 'P':
        {
            printf("%d\t%s\t%d\t%s\t%c\t", i, sT.symbols[i].name, sT.symbols[i].level, sT.symbols[i].type, sT.symbols[i].flag);
            printf("\t形参空间大小size：%d", sT.symbols[i].size);
            printf("\t初始化状态：%d", sT.symbols[i].init_sym);
            printf("\t形参地址偏移：%d", sT.symbols[i].offset);
            printf("\n");
            break;
            break;
        }
        case 'T':
        {
            printf("%d\t%s\t%d\t%s\t%c\t", i, sT.symbols[i].name, sT.symbols[i].level, sT.symbols[i].type, sT.symbols[i].flag);
            printf("\t变量空间大小size：%d", sT.symbols[i].size);
            printf("\t初始化状态：%d", sT.symbols[i].init_sym);
            printf("\t变量地址偏移：%d", sT.symbols[i].offset);

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

//查询库函数表，返回表内索引(TODO)，-1表示不存在。
int lib_func_find(char *id)
{
    int ans = -1;
    if (strcmp(id, "putint") == 0)
    {
        ans = 1;
    }
    else if (strcmp(id, "getint") == 0)
    {
        ans = 1;
    }
}

//初始化全局暂存变量。
void init()
{
    strcpy(glo_name, "");
    glo_flag = ' ';
    glo_init_sym = 0;
    glo_int_val = 0x7f7f7f7f;
    glo_float_val = 3.402823466e+38F;
    glo_paramnum = -1;
    glo_offset = 0;
    strcpy(glo_type, "");
    memset(glo_arr_lim, 0, 10);
    glo_D = 0;
    glo_size = 0;
}

/*--------------------------------------静态语义检查区-------------------------------------*/
//‘V’变量检查；
bool check_val_id(char *id, int level, int pos, char *type, int int_val, float float_val)
{
    bool ans = 1;
    int index;
    switch (assign_sym)
    {
    case -1:
    {
        index = find(id);
        if (index == -1)
        {
            printf("%s:%d ", filename, pos);
            printf("'%s' undeclared\n", id);
            ans = 0;
        } //判断作为左值的变量有无定义。
        else if (sT.symbols[index].flag == 'F')
        {
            printf("%s:%d ", filename, pos);
            printf("lvalue required as left operand of assignment,'%s' is a func\n", id);
            ans = 0;
        } //判断变量的标识符是否是函数类型，是则报错（错误输出有点小差别）。
        else if (strcmp(sT.symbols[index].type, "int") != 0 && strcmp(sT.symbols[index].type, "float") != 0)
        {
            printf("%s:%d ", filename, pos);
            printf("assignment to expression with array type.\n");
            ans = 0;
        } //判断变量标识符是个数组。
        break;
    }
    case 0:
    {
        index = find(id);
        if (index != -1 && sT.symbols[index].level == level)
        //判断是否存在已有变量和新变量同标识符，且是否在同一级作用域，不在则无需处理，不同级则自动代替。
        {

            if (strcmp(sT.symbols[index].type, type) != 0)
            {
                printf("%s:%d ", filename, pos);
                printf("conflicting types for ‘%s’\n", id);
                ans = 0;
            }
            //判断重复变量是否同类型,不同类型则必冲突。
            else if (sT.symbols[index].init_sym != 0)
            {
                bool equal = sT.symbols[index].init_sym == 1 ? sT.symbols[index].int_val == int_val : sT.symbols[index].float_val == float_val;
                if (!equal)
                {
                    printf("%s:%d ", filename, pos);
                    printf("redefinition of ‘%s’\n", id);
                    ans = 0;
                }
            }
            //判断同类型重复变量是否初始化过,若未初始化则不冲突，若初始化过则判断是否初始化了相同值，若初始化了不同值则冲突。
        }
        break;
    }
    case 1:
    {
        index = find(id);
        if (index == -1)
        {
            printf("%s:%d ", filename, pos);
            printf("'%s' undeclared\n", id);
            ans = 0;
        }
        else if (sT.symbols[index].flag == 'F')
        {
            printf("%s:%d ", filename, pos);
            printf("'%s'is a id of func, invalid operands to binary operator *\n", id);
            ans = 0;
        } //判断变量的标识符是否是函数类型，是则报错（错误输出有点小差别）。
        else if (strcmp(sT.symbols[index].type, "int") != 0 && strcmp(sT.symbols[index].type, "float") != 0)
        {
            printf("%s:%d ", filename, pos);
            printf("assignment to expression with array type.\n");
            ans = 0;
        } //判断变量标识符是个数组。
        else if (sT.symbols[index].init_sym == 0)
        {
            printf("%s:%d ", filename, pos);
            printf("'%s' 使用了未初始化的变量\n", id);
            ans = 0;
        } //判断作为右值的变量是否有定义，是否初始化过。
        break;
    }
    }
    return ans;
}

//‘F’函数检查：
bool check_func_id(char *id, int level, int pos, char *type, int paramnum)
{
    bool ans = 1;
    int i = 0;
    int index = find(id);
    char ore_type[36] = "", nre_type[36] = "", tmp_type[36], *tmp2_type;
    char oin_type[15][6], nin_type[15][6]; //尚未使用，留用做实参强制转换TODO。
    strcpy(tmp_type, type);
    tmp2_type = strtok(tmp_type, "(");
    strcpy(nre_type, tmp2_type);
    // for (i = 0;; i++)
    // {
    //     tmp2_type = strtok(NULL, ",");
    //     if (tmp2_type == NULL)
    //         break;
    //     strcpy(nin_type[i], tmp2_type);
    //     printf("%s\n", nin_type[i]);
    // }//做格式匹配用
    switch (func_state)
    {
    case 0:
    {
        if (index > -1)
        {
            strcpy(tmp_type, sT.symbols[index].type);
            tmp2_type = strtok(tmp_type, "(");
            strcpy(ore_type, tmp2_type);
        }
        if (index != -1 && sT.symbols[index].level == level)
        {
            if (sT.symbols[index].flag == 'V')
            {
                printf("%s:%d ", filename, pos);
                printf("‘%s’ redeclared as different kind of symbol.\n", id);
                ans = 0;
            } //函数标识符是否与变量重合。
            else if (strcmp(ore_type, nre_type) != 0)
            {
                printf("%s:%d ", filename, pos);
                printf("conflicting types for ‘%s’.\n", id);
                ans = 0;
            } //判断是否存在和新函数同名不同返回类型的原有函数。
            else if (1)
            {
                printf("%s:%d ", filename, pos);
                printf("redefinition of  ‘%s’.\n", id);
                ans = 0;
            } //判断是否存在和新函数同返回值类型的原有函数。
        }
        break;
    }
    //函数定义检查。
    case -1:
    {
        // printf("形参数：%d; 实参数:%d\n", sT.symbols[index].paramnum, paramnum);
        if (lib_func_find(id) != -1)
        {
            break;
        }
        //库函数调用检查。
        else if (index == -1)
        {
            printf("%s:%d ", filename, pos);
            printf("‘%s’ is not declared.\n", id);
            ans = 0;
        }
        //函数未声明检查。
        else if (sT.symbols[index].flag == 'V')
        {
            printf("%s:%d ", filename, pos);
            printf("‘%s’ is not a function.\n", id);
            ans = 0;
        }
        //变量调用为函数检查。
        else if (sT.symbols[index].paramnum < paramnum)
        {
            printf("%s:%d ", filename, pos);
            printf("too many arguments to function ‘%s’.\n", id);
            ans = 0;
        }
        else if (sT.symbols[index].paramnum > paramnum)
        {
            printf("%s:%d ", filename, pos);
            printf("too few arguments to function ‘%s’.\n", id);
            ans = 0;
        }
        //实参数量检查。
        else if (0)
        {
            //类型不同时，强制类型转换而不报错。TODO
        }
        break;
    }
    //函数调用检查。
    case 1:
    { //检查空返回函数存在返回值错误。
        if (paramnum == -2)
        {
            printf("%s:%d ", filename, pos);
            printf("‘return’ with a value, in function returning void.\n");
            ans = 0;
        } //空函数返回了非空表达式。
        else if (paramnum == -1)
        {
            printf("%s:%d ", filename, pos);
            printf("‘return’ with a void, in function returning value.\n");
            ans = 0;
        } //非空函数返回了空表达式。
        // paramnum为标志位，无原来含义。
        break;
    }
        //函数返回检查。
    }
    return ans;
}

//‘A’数组检查；
bool check_array_id(char *id, int level, int pos, char *type, char *index_type)
{
    bool ans = 1;
    int index = find(id);
    switch (assign_sym)
    {
    case 1:
    {
        if (array_in_sym == 1)
        {
            if (strcmp(index_type, "int") != 0)
            {
                printf("%s:%d ", filename, pos);
                printf("array subscript is not an integer.\n");
                ans = 0;
            }
        }
        else if (index == -1)
        {
            printf("%s:%d ", filename, pos);
            printf("'%s' is not declared.\n", id);
            ans = 0;
        }
        else if (strcmp(sT.symbols[index].type, "int") == 0 || strcmp(sT.symbols[index].type, "float") == 0)
        {
            printf("%s:%d ", filename, pos);
            printf("subscripted value is not an array.\n");
            ans = 0;
        }

        break;
    }
    case -1:
    {
        if (array_in_sym == 1)
        {
            if (strcmp(index_type, "int") != 0)
            {
                printf("%s:%d ", filename, pos);
                printf("array subscript is not an integer.\n");
                ans = 0;
            }
        }
        else if (index == -1)
        {
            printf("%s:%d ", filename, pos);
            printf("'%s' is not declared.\n", id);
            ans = 0;
        }
        else if (strcmp(sT.symbols[index].type, "int") == 0 || strcmp(sT.symbols[index].type, "float") == 0)
        {
            printf("%s:%d ", filename, pos);
            printf("subscripted value is not an array.\n");
            ans = 0;
        }

        break;
    }
    }

    return ans;
}

//流程检查；含左值表达式检查，打断语句，继续语句检查。
bool check_process(int pro_err_type, int lval_type, int pos)
{
    bool ans = 1;
    switch (pro_err_type)
    {
    case 1:
    {
        if (lval_type != TERM)
        {
            printf("%s:%d ", filename, pos);
            printf("lvalue required as left operand of assignment\n");
            ans = 0;
        }
        break;
    }

    case 2:
    {
        if (loop_sym == 0)
        {
            printf("%s:%d ", filename, pos);
            printf("continue statement not within a loop\n");
            ans = 0;
        }
        break;
    }
    case 3:
    {
        if (loop_sym == 0)
        {
            printf("%s:%d ", filename, pos);
            printf("break statement not within a loop\n");
            ans = 0;
        }
        break;
    }
    }
    return ans;
}

//运算类型检查；判断变量结点的输入变量是否非空。
bool check_cal_type(struct node T)
{
    bool ans = 1;
    if (T.ptr[0]->out.type == 'c' || T.ptr[1]->out.type == 'c')
    {
        printf("%s:%d ", filename, T.pos);
        printf("调用了空返回值的函数。\n");
        ans = 0;
    }
    return ans;
}

//运算类型检查；判断变量结点类型是否是int。
bool check_int(struct opn tmp_opn)
{
    bool ans = 0;
    if (tmp_opn.type == 'i')
        ans = 1;
    else if (tmp_opn.type == 'v' && strcmp(sT.symbols[tmp_opn.offset].type, "int") == 0)
        ans = 1;
    return ans;
}

/*--------------------------------------中间代码构造区-------------------------------------*/
//初始化变量结点；
void initOpn(struct opn *tmp_opn)
{
    tmp_opn->kind = 0;
    tmp_opn->type = ' ';
    tmp_opn->offset = 0;
    tmp_opn->level = 0;
    tmp_opn->const_char = ' ', tmp_opn->const_float = 0, tmp_opn->const_int = 0, strcpy(tmp_opn->id, "");
}

//将语法树上运算结点类型转化成IR结点类型。
enum IR_op get_OpType(struct node T)
{
    enum IR_op ans = IR_ADD;

    switch (T.kind)
    {
    case AND:
        ans = IR_AND;
        break;
    case OR:
        ans = IR_OR;
        break;
    case RELOP:
    {
        if (strcmp(T.type_id, "<") == 0)
            ans = IR_JLT;
        if (strcmp(T.type_id, "<=") == 0)
            ans = IR_JLE;
        if (strcmp(T.type_id, ">") == 0)
            ans = IR_JGT;
        if (strcmp(T.type_id, ">=") == 0)
            ans = IR_JGE;
        if (strcmp(T.type_id, "==") == 0)
            ans = IR_EQ;
        if (strcmp(T.type_id, "!=") == 0)
            ans = IR_NEQ;
        break;
    }
    case ADD:
        ans = IR_ADD;
        break;
    case MINUS:
        ans = IR_MINUS;
        break;
    case MUL:
        ans = IR_MUL;
        break;
    case DIV:
        ans = IR_DIV;
        break;
    case MOD:
        ans = IR_MOD;
        break;
    }
    return ans;
}

//字符串处理函数，封装的strcat字符串拼接。
char *strcat0(char *s1, char *s2)
{
    static char result[10];
    strcpy(result, s1);
    strcat(result, s2);
    return result;
}

//给被覆盖的全局变量生成新的别名。
char *newAlias()
{
    static int no = 1;
    char s[10];
    snprintf(s, 10, "%d", no++);
    return strcat0("v", s);
}

//生成新的标签。
char *newLabel()
{
    static int no = 1;
    char s[10];
    snprintf(s, 10, "%d", no++);
    return strcat0("label", s);
}

//形成新的临时变量。
char *newTemp()
{
    static int no = 1;
    char s[10];
    snprintf(s, 10, "%d", no++);
    return strcat0("temp", s);
}

//形成新变量标识。
char *newVal()
{
    static int no = 1;
    char s[10];
    snprintf(s, 10, "%d", no++);
    return strcat0("v", s);
}

//复制opn结构信息。
void copyOpn(struct opn *dopn, struct opn sopn)
{
    dopn->type = sopn.type, dopn->offset = sopn.offset, dopn->level = sopn.level, dopn->kind = sopn.kind;
    dopn->const_char = sopn.const_char, dopn->const_float = sopn.const_float, dopn->const_int = sopn.const_int;
    strcpy(dopn->id, sopn.id);
}

//构成新的变量结点。
struct opn *gen_opn(struct opn pre_opn)
{
    struct opn *tmp_opn = (struct opn *)malloc(sizeof(struct opn));
    tmp_opn->kind = pre_opn.kind;
    tmp_opn->type = pre_opn.type;
    tmp_opn->level = tmp_opn->level;
    tmp_opn->offset = pre_opn.offset;
    switch (tmp_opn->type)
    {
    case 'v':
        strcpy(tmp_opn->id, pre_opn.id);
        break;
    case 'i':
        tmp_opn->const_int = pre_opn.const_int;
        break;
    case 'f':
        tmp_opn->const_float = pre_opn.const_float;
        break;
    case 'c':
        tmp_opn->const_char = pre_opn.const_char;
        break;
    }
    return tmp_opn;
}

//生成一条TAC代码的结点组成的双向循环链表，返回头指针
struct codenode *mkIR(IR_op op)
{
    struct codenode *h = (struct codenode *)malloc(sizeof(struct codenode));
    struct opn opn1 = *gen_opn(glo_opn1), opn2 = *gen_opn(glo_opn2), result = *gen_opn(glo_res);
    h->op = op;
    if (h->op < IR_ADD)
    {
        h->opn1 = opn1;
        h->opn2 = opn2;
    }
    else if (h->op < IR_GOTO_NOT)
    {
        h->opn1 = opn1;
        h->opn2 = opn2;
        h->result = result;
    }
    else if (h->op < IR_FUNCTION)
    {
        h->opn1 = opn1;
        h->result = result;
    }
    else if (h->op < IR_ARG)
    {
        h->opn1 = opn1;
    }
    else
    {
        h->result = result;
    }
    h->next = h->prior = h;
    return h;
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
    }
}
//打印一条IR；
void printIR(codenode *h)
{
    printf("\t%s", IR_op_strs[h->op]);

    if (h->op < IR_ADD)
    {
        printOpn(h->opn1), printOpn(h->opn2);
    }
    else if (h->op < IR_GOTO_NOT)
    {
        printOpn(h->opn1), printOpn(h->opn2), printOpn(h->result);
    }
    else if (h->op < IR_FUNCTION)
    {
        printOpn(h->opn1), printOpn(h->result);
    }
    else if (h->op < IR_ARG)
    {

        printOpn(h->opn1);
    }
    else
    {
        printOpn(h->result);
    }
    printf("\n");
} //特判全部的跳转语句打印出label的标识。TODO
//打印某结点的中间代码。
void DisplayIR(struct node *T)
{
    int i = 0;
    codenode *ir = T->code, *head = ir;
    printf("----------------------当前结点IR段----------------------\n");
    if (ir != &null_ir)
        for (i = 0; 1; i++)
        {
            printIR(ir);
            if (ir->next == head)
                break;
            ir = ir->next;
        }
    printf("-------------------------------------------------------\n");
}

//合并多个中间代码的双向循环链表，首尾相连
struct codenode *merge(int num, ...)
{

    struct codenode *h1, *h2, *p, *t1, *t2;
    va_list ap;
    va_start(ap, num);
    h1 = va_arg(ap, struct codenode *);

    while (--num > 0)
    {
        h2 = va_arg(ap, struct codenode *);

        if (h1 == &null_ir)
            h1 = h2;
        else if (h2 != &null_ir)
        {
            t1 = h1->prior;
            t2 = h2->prior;
            t1->next = h2;
            t2->next = h1;
            h1->prior = t2;
            h2->prior = t1;
        }
    }
    va_end(ap);

    return h1;
}

/*--------------------------------------功能主体-----------------------------------------*/
//遍历语法树流程控制生成IR。
void gen_IR(struct node *T)
{
    int i = 1;
    struct node *T0;
    if (T)
    {
        T->code = &null_ir;
        switch (T->kind)
        {
        case EXT_DEF_LIST:
        {
            // initOpn(&glo_opn1);
            // glo_IR_op = IR_LABEL;
            // glo_opn1.type = 'v', strcpy(glo_opn1.id, newLabel()), glo_opn1.level = glo_level;
            // T->code = mkIR(glo_IR_op);

            displayIR_sym++;
            symbol_scope_TX.TX[symbol_scope_TX.top] = 0;
            symbol_scope_TX.top++;
            glo_level = 0;
            gen_IR(T->ptr[0]); //显示该外部定义列表中的第一个
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            gen_IR(T->ptr[1]); //显示该外部定义列表中的其它外部定义
            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);
            if (displayIR_sym == 1)
                DisplayIR(T);
            displayIR_sym--;
            break;
        }
        case EXT_VAR_DEF:
        {
            printf("外部变量定义:\n");
            init();
            glo_level = 0, glo_flag = 'V', glo_paramnum = -1;
            //设定外部变量的深度，标识，参数。
            gen_IR(T->ptr[0]); //显示外部变量类型
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            printf("定义的变量:\n");
            assign_sym = 0;
            gen_IR(T->ptr[1]);
            //
            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);
            if (check_val_id(glo_name, glo_level, T->pos, glo_type, glo_int_val, glo_float_val))
            {
                // printf("name:%s;%d;%s;%d;%s;%c;%d;%d;%d;\n", glo_name, glo_level, glo_tmp_type, glo_paramnum, glo_alias, glo_flag, glo_offset, glo_init_sym, glo_int_val);
                glo_size = 4;
                if (glo_flag == 'A')
                {
                    glo_paramnum = mkarr(glo_arr_lim, glo_D);
                    glo_size = arr_size(glo_paramnum) * 4;
                }

                mksym(&sT, glo_name, glo_level, glo_tmp_type, glo_paramnum, glo_alias, glo_flag, glo_offset, glo_init_sym, glo_int_val, glo_float_val, glo_size);
                //外部变量入表；
                glo_paramnum = -1;
                DisplaySymbolTable(sT); //展示符号表
            }                           //判断外部变量并加入符号表。
            //新变量加入符号表。
            break;
        }
        case EXT_CONST_VAR_DEF:
        {
            printf("外部常量定义:\n");
            gen_IR(T->ptr[0]); //显示外部常量类型
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            printf("定义的常量:\n");
            gen_IR(T->ptr[1]); //显示常量列表
            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);
            break;
        }
        case TERM:
        {

            if (T->ptr[0])
            {
                printf("数组: ");
                printf("%s\n", T->type_id);
                if (assign_sym == 0)
                {
                    strcpy(glo_name, T->type_id);
                    if (strcmp(glo_type, "int") == 0 || strcmp(glo_type, "float") == 0)
                    {
                        // glo_tmp_type = strcat(glo_type, "[]");
                        strcpy(glo_tmp_type, glo_type);
                        glo_flag = 'A';
                    }
                }
                if (assign_sym == 1)
                {
                    check_array_id(T->type_id, glo_level, T->pos, "int(", "");
                }
                gen_IR(T->ptr[0]);
                if (T->ptr[0])
                    T->code = merge(2, T->code, T->ptr[0]->code);
                array_in_sym = 0;
            }
            else
            {
                printf("ID: ");
                printf("%s\n", T->type_id);
                if (assign_sym != 0)
                {
                    check_val_id(T->type_id, glo_level, T->pos, glo_type, glo_int_val, glo_float_val);
                    initOpn(&glo_res);
                    glo_res.type = 'v', strcpy(glo_res.id, T->type_id), glo_res.level = glo_level, glo_res.offset = find(T->type_id);
                    T->out = *gen_opn(glo_res);
                }

                //判断单个符号是否重复或存在未初始化问题。
                if (assign_sym == 0)
                {
                    glo_flag = 'V';
                    glo_tmp_type = strcat(glo_type, "");
                    strcpy(glo_name, T->type_id);
                }
                gen_IR(T->ptr[0]);
                if (T->ptr[0])
                    T->code = merge(2, T->code, T->ptr[0]->code);
            }

            break;
        }
        case ARRAYS:
        {
            T0 = T;
            i = 1;
            char index_type[36] = "";
            while (T0 != NULL)
            {
                printf("第%d维: \n", i++);

                if (T0->ptr[0]->kind == TERM && find(T0->ptr[0]->type_id) > -1)
                    strcpy(index_type, sT.symbols[find(T0->ptr[0]->type_id)].type);
                else
                {
                    glo_arr_lim[i - 2] = T0->ptr[0]->type_int;

                    strcpy(index_type, T0->ptr[0]->kind == INT ? "int" : "float");
                }
                array_in_sym = 1;
                check_array_id(T->type_id, glo_level, T->pos, "int", index_type);
                //检查数组下标为整数。

                gen_IR(T0->ptr[0]);
                if (T->ptr[0])
                    T->code = merge(2, T->code, T->ptr[0]->code);
                T0 = T0->ptr[1];
            }
            glo_D = i - 1;

            break;
        }
        case TYPE:
        case VOID:
        {
            printf("类型: %s\n", T->type_id);
            if (void_func_sym == 0 && strcmp(T->type_id, "void") == 0)
                void_func_sym = 1;
            strcpy(glo_type, T->type_id);
            break;
        }
        case EXT_DEC_LIST:
        {
            gen_IR(T->ptr[0]); //依次显示外部变量名，
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            if (check_val_id(glo_name, glo_level, T->pos, glo_type, glo_int_val, glo_float_val))
            {
                glo_size = 4;
                if (glo_flag == 'A')
                {
                    glo_paramnum = mkarr(glo_arr_lim, glo_D);
                    glo_size = arr_size(glo_paramnum) * sizeof(int);
                }

                mksym(&sT, glo_name, glo_level, glo_type, glo_paramnum, glo_alias, glo_flag, glo_offset, glo_init_sym, glo_int_val, glo_float_val, glo_size);
                //外部变量入表；
            }
            //检查重复并插入新变量到符号表。

            gen_IR(T->ptr[1]); //后续还有相同的，仅显示语法树此处理代码可以和类似代码合并
            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);
            break;
        }
        case VAR_DEC:
        {
            if (!T->ptr[1])
            {
                printf("变量名: %s\n", T->type_id);
                strcpy(glo_name, T->type_id);
                if (T->ptr[0])
                {
                    printf("它的初值:\n");
                    glo_init_sym = T->ptr[0]->kind == INT ? 1 : 2;
                    T->ptr[0]->kind == INT ? glo_int_val = T->ptr[0]->type_int : glo_float_val = T->ptr[0]->type_float;
                    assign_sym = 1;
                    gen_IR(T->ptr[0]); //表达式初值
                    if (T->ptr[0])
                        T->code = merge(2, T->code, T->ptr[0]->code);
                    assign_sym = 0;
                }
            }
            else
            {
                glo_flag = 'A';
                gen_IR(T->ptr[1]); //进入term
                if (T->ptr[1])
                    T->code = merge(2, T->code, T->ptr[1]->code);

                if (T->ptr[0])
                {
                    printf("它的初值:\n");
                    glo_init_sym = T->ptr[0]->kind == INT ? 1 : 2;
                    T->ptr[0]->kind == INT ? glo_int_val = T->ptr[0]->type_int : glo_float_val = T->ptr[0]->type_float;
                    assign_sym = 1;
                    gen_IR(T->ptr[0]); //表达式初值
                    if (T->ptr[0])
                        T->code = merge(2, T->code, T->ptr[0]->code);
                    assign_sym = 0;
                }
            }
            break;
        }
        case FUNC_DEF:
        {
            printf("函数定义：\n");
            init();
            glo_level = 0, glo_flag = 'F';
            void_func_sym = 0;
            func_state = 0;
            gen_IR(T->ptr[0]); //显示函数返回类型
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            gen_IR(T->ptr[1]); //显示函数名和参数
            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);
            func_state = 1;

            gen_IR(T->ptr[2]); //显示函数体

            if (T->ptr[2])
                T->code = merge(2, T->code, T->ptr[2]->code);
            void_func_sym = -1;
            int old_index = sT.index;
            sT.index = symbol_scope_TX.TX[symbol_scope_TX.top - 1];
            symbol_scope_TX.top--;
            if (old_index != sT.index)
                DisplaySymbolTable(sT);
            initOpn(&glo_opn1);
            glo_opn1.type = 'v', strcpy(glo_opn1.id, T->ptr[1]->type_id), glo_opn1.level = glo_level, glo_opn1.offset = sT.index - 1;
            copyOpn(&T->out, glo_opn1);
            T->code = merge(2, mkIR(IR_FUNCTION), T->code);
            break;
        }
        case FUNC_DEC:
        {
            printf("函数名：%s\n", T->type_id);
            strcpy(glo_name, T->type_id);
            func_state = 0;
            if (T->ptr[0])
            {
                printf("函数形参：\n");
                glo_paramnum = 0;
                if (check_func_id(glo_name, glo_level, T->pos, glo_type, glo_paramnum))
                {
                    sT.index++;
                    glo_tmp_type = strcat(glo_type, "(");
                    gen_IR(T->ptr[0]); //显示函数参数列表
                    if (T->ptr[0])
                        T->code = merge(2, T->code, T->ptr[0]->code);
                    glo_tmp_type = strcat(glo_type, ")");
                    glo_size = DX;
                    sT.index = sT.index - glo_paramnum - 1;
                    mksym(&sT, glo_name, glo_level, glo_tmp_type, glo_paramnum, glo_alias, glo_flag, glo_offset, 0, 0, 0, glo_size);
                    sT.index = sT.index + glo_paramnum; //函数入符号表；
                }
            }
            else
            {
                printf("无参函数\n");
                glo_paramnum = 0;
                glo_tmp_type = strcat(glo_type, "(void)");
                if (check_func_id(glo_name, glo_level, T->pos, glo_tmp_type, glo_paramnum))
                {
                    glo_size = DX;
                    mksym(&sT, glo_name, glo_level, glo_tmp_type, glo_paramnum, glo_alias, glo_flag, glo_offset, 0, 0, 0, glo_size);
                    //函数入符号表；
                }
            }
            symbol_scope_TX.TX[symbol_scope_TX.top] = sT.index - glo_paramnum;
            symbol_scope_TX.top++;

            /*调整输出*/
            if (T->ptr[0])
            {
                for (sT.index = symbol_scope_TX.TX[symbol_scope_TX.top - 1]; sT.index < symbol_scope_TX.TX[symbol_scope_TX.top - 1] + glo_paramnum + 1; sT.index++)
                {
                    if (sT.index != symbol_scope_TX.TX[symbol_scope_TX.top - 1])
                    {
                        sT.symbols[fT.funcs[fT.top - 1]].size += 4;
                        //动态维护函数活动空间大小。
                        initOpn(&glo_opn1);
                        glo_opn1.type = 'v', strcpy(glo_opn1.id, sT.symbols[sT.index - 1].name), glo_opn1.level = glo_level, glo_opn1.offset = sT.index - 1;
                        T->code = merge(2, T->code, mkIR(IR_PARAM));
                        //构造形参代码。
                    }
                    DisplaySymbolTable(sT);
                }
                sT.index--;
            }
            else
            {
                DisplaySymbolTable(sT);
            }
            //该if-else块用于调整输出符号表格式，同时调整函数活动空间大小（添加形参空间）。

            break;
        }
        case PARAM_LIST:
        {
            gen_IR(T->ptr[0]); //依次显示全部参数类型和名称，
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            gen_IR(T->ptr[1]);
            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);
            break;
        }
        case PARAM_DEC:
        {
            printf("类型：%s, 参数名：%s\n", T->ptr[0]->type == INT ? "int" : "float", T->ptr[1]->type_id);
            char tmp_type1[36];
            strcpy(tmp_type1, T->ptr[0]->type == INT ? "int" : "float");
            glo_size = 4;
            if (glo_paramnum == 0)
            {
                sT.symbols[sT.index - 1].flag = 'F', strcpy(sT.symbols[sT.index - 1].name, "");
            } //首参清除预留函数位置的过时数据。
            mksym(&sT, T->ptr[1]->type_id, glo_level + 1, tmp_type1, -1, glo_alias, 'P', glo_offset, T->ptr[0]->type == INT ? 1 : 2, glo_int_val, glo_float_val, glo_size);
            //添加形参入符号表，当前假定无默认值。

            glo_tmp_type = glo_paramnum == 0 ? strcat(glo_tmp_type, T->ptr[0]->type == INT ? "int" : "float") : strcat(glo_tmp_type, T->ptr[0]->type == INT ? ",int" : ",float");
            glo_paramnum++;
            break;
        }
        case EXP_STMT:
        {
            printf("表达式语句：\n");
            assign_sym = 1;
            gen_IR(T->ptr[0]);
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            assign_sym = 0;
            break;
        }
        case RETURN:
        {
            if (T->ptr[0])
            {
                printf("返回语句：\n");
                assign_sym = 1;
                if (void_func_sym == 1)
                    check_func_id("", glo_level, T->pos, "int(", -2);
                gen_IR(T->ptr[0]);
                if (T->ptr[0])
                    T->code = merge(2, T->code, T->ptr[0]->code);
                initOpn(&glo_res);
                copyOpn(&glo_res, T->ptr[0]->out);
                T->code = merge(2, T->code, mkIR(IR_RETURN));
            }
            else
            {
                if (void_func_sym == 0)
                    check_func_id("", glo_level, T->pos, "int(", -1);
                printf("空返回语句\n");
                initOpn(&glo_res);
                glo_res.type = 'c';
                glo_res.const_char = '\0';
                //返回字符常量空表示空返回语句。
                T->code = merge(2, T->code, mkIR(IR_RETURN));
            }

            break;
        }
        case CONTINUE_STMT:
        {
            printf("继续语句\n");
            check_process(2, 0, T->pos);
            break;
        }
        case BREAK_STMT:
        {
            printf("打断语句\n");
            check_process(3, 0, T->pos);
            break;
        }
        case COMP_STM:
        {
            if (T->ptr[0])
            {
                printf("复合语句: \n");
                glo_level++;
                initOpn(&glo_opn1);
                glo_opn1.type = 'v', glo_opn1.offset = sT.index, glo_opn1.level = glo_level, strcpy(glo_opn1.id, newLabel());
                T->code = merge(2, T->code, mkIR(IR_LABEL));
                //新建标签在进入复合语句之后。

                symbol_scope_TX.TX[symbol_scope_TX.top] = sT.index;
                symbol_scope_TX.top++;
                gen_IR(T->ptr[0]);
                if (T->ptr[0])
                    T->code = merge(2, T->code, T->ptr[0]->code);
                int old_index = sT.index;
                glo_level--;
                sT.index = symbol_scope_TX.TX[symbol_scope_TX.top - 1];
                symbol_scope_TX.top--;
                if (sT.index != old_index)
                {
                    DisplaySymbolTable(sT);
                }

                initOpn(&glo_opn1);
                glo_opn1.type = 'v', glo_opn1.offset = sT.index, glo_opn1.level = glo_level, strcpy(glo_opn1.id, newLabel());
                T->code = merge(2, T->code, mkIR(IR_LABEL));
                //新建标签在退出复合语句之前。 //todoaaaaa
            }
            else
            {
                printf("空复合语句\n");
            }
            break;
        }
        case STM_DEF_LIST:
        {
            gen_IR(T->ptr[0]); //显示第一条语句
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            gen_IR(T->ptr[1]); //显示剩下语句
            if (T->ptr[1] != NULL)
            {
                T->code = merge(2, T->code, T->ptr[1]->code);
            }
            break;
        }
        case WHILE:
        {
            printf("循环语句：\n");
            printf("循环条件：\n");
            gen_IR(T->ptr[0]); //显示循环条件
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            printf("循环体：\n");
            loop_sym = 1;
            gen_IR(T->ptr[1]); //显示循环体
            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);
            loop_sym = 0;
            break;
        }
        case FOR_STMT:
        {
            printf("for 循环语句: \n");
            gen_IR(T->ptr[0]);
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            printf("循环体: \n");
            loop_sym = 1;
            gen_IR(T->ptr[1]);
            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);
            loop_sym = 0;
            break;
        }
        case FOR_ARGS:
        {
            printf("for 循环起始表达式: \n");
            if (T->ptr[0])
            {
                gen_IR(T->ptr[0]);
                if (T->ptr[0])
                    T->code = merge(2, T->code, T->ptr[0]->code);
            }
            else
            {
                printf("无\n");
            }
            printf("for 循环条件表达式: \n");
            if (T->ptr[1])
            {
                gen_IR(T->ptr[1]);
                if (T->ptr[1])
                    T->code = merge(2, T->code, T->ptr[1]->code);
            }
            else
            {
                printf("无\n");
            }
            printf("for 循环第三表达式: \n");
            if (T->ptr[2])
            {
                gen_IR(T->ptr[2]);
                if (T->ptr[2])
                    T->code = merge(2, T->code, T->ptr[2]->code);
            }
            else
            {
                printf("无\n");
            }
            break;
        }
        case IF_THEN:
        {
            printf("条件语句(IF_THEN)：\n");
            printf("条件：\n");
            gen_IR(T->ptr[0]); //显示条件
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            printf("IF子句：\n");
            gen_IR(T->ptr[1]); //显示if子句
            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);
            break;
        }
        case IF_THEN_ELSE:
        {
            printf("条件语句(IF_THEN_ELSE)：\n");
            printf("条件：\n");
            gen_IR(T->ptr[0]); //显示条件
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            printf("IF子句：\n");
            gen_IR(T->ptr[1]); //显示if子句
            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);
            printf("ELSE子句：\n");
            gen_IR(T->ptr[2]); //显示else子句
            if (T->ptr[2])
                T->code = merge(2, T->code, T->ptr[2]->code);
            break;
        }
        case VAR_DEF:
        {
            printf("局部变量定义: \n");
            init();
            glo_flag = 'V', glo_paramnum = -1;
            gen_IR(T->ptr[0]); //显示变量类型
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            printf("定义的变量:\n");
            assign_sym = 0;
            gen_IR(T->ptr[1]); //显示该定义的全部变量名
            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);
            DisplaySymbolTable(sT);
            break;
        }
        case DEC_LIST:
        {
            gen_IR(T->ptr[0]);
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            if (check_val_id(glo_name, glo_level, T->pos, glo_type, glo_int_val, glo_float_val))
            {
                glo_size = 4;
                if (glo_flag == 'A')
                {
                    glo_paramnum = mkarr(glo_arr_lim, glo_D);
                    glo_size = arr_size(glo_paramnum) * 4;
                    mksym(&sT, glo_name, glo_level, glo_type, glo_paramnum, glo_alias, glo_flag, glo_offset, glo_init_sym, glo_int_val, glo_float_val, glo_size); //局部变量入表
                }
                else
                {
                    mksym(&sT, glo_name, glo_level, glo_type, glo_paramnum, glo_alias, glo_flag, glo_offset, glo_init_sym, glo_int_val, glo_float_val, glo_size); //局部变量入表
                }
                sT.symbols[fT.funcs[fT.top - 1]].size += glo_size;
            }
            //插入新局部变量入符号表。

            gen_IR(T->ptr[1]);
            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);

            break;
        }
        case NODE_ID:
        {
            printf("ID： %s\n", T->type_id);
            check_val_id(T->type_id, glo_level, T->pos, glo_type, glo_int_val, glo_float_val);
            //检查表达式是否存在未初始化问题。
            strcpy(glo_name, T->type_id);

            break;
        }
        case INT:
        {
            printf("INT：%d\n", T->type_int);
            initOpn(&glo_res);
            glo_res.type = 'i', glo_res.level = glo_level, glo_res.offset = -1, glo_res.const_int = T->type_int;
            T->out = *gen_opn(glo_res);
            break;
        }
        case FLOAT:
        {
            printf("FLAOT：%f\n", T->type_float);
            initOpn(&glo_res);
            glo_res.type = 'f', glo_res.level = glo_level, glo_res.offset = -1, glo_res.const_int = T->type_float;
            T->out = *gen_opn(glo_res);
            break;
        }
        case ASSIGN:
        case AND:
        case OR:
        case RELOP:
        case ADD:
        case MINUS:
        case MUL:
        case DIV:
        case MOD:
        {
            printf("%s\n", T->type_id);
            if (T->kind == ASSIGN)
            {
                assign_sym = -1;
                check_process(1, T->ptr[0]->kind, T->pos);
            }
            else
            {
                assign_sym = 1;
            }
            gen_IR(T->ptr[0]); //赋值（运算）号的左值表达式；
            lint = check_int(T->ptr[0]->out);
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);

            assign_sym = 1;
            gen_IR(T->ptr[1]); //赋值（运算）号的右值表达式；
            rint = check_int(T->ptr[1]->out);
            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);
            initOpn(&glo_opn2);
            copyOpn(&glo_opn2, T->ptr[1]->out);

            check_cal_type(*T);
            sT.symbols[find(T->ptr[0]->type_id)].init_sym = 1;
            //不考虑执行失败的情况，只要作为左值运算过，即认为已初始化TODO。
            if (T->kind == ASSIGN)
            {
                initOpn(&glo_opn1);
                copyOpn(&glo_opn1, T->ptr[0]->out);
                T->code = merge(2, T->code, mkIR(IR_ASSIGN));
            }
            else
            {
                initOpn(&glo_opn1);
                copyOpn(&glo_opn1, T->ptr[0]->out);
                lint = check_int(glo_opn1);
                init();
                strcpy(glo_tmp_type, (lint && rint) || get_OpType(*T) > IR_MOD ? "int" : "float");
                strcpy(glo_name, newTemp()), glo_paramnum = -1, glo_flag = 'T', glo_init_sym = 0, glo_size = 4;
                mksym(&sT, glo_name, glo_level, glo_tmp_type, glo_paramnum, glo_alias, glo_flag, glo_offset, glo_init_sym, glo_int_val, glo_float_val, glo_size);
                sT.symbols[fT.funcs[fT.top - 1]].size += glo_size;
                DisplaySymbolTable(sT);
                //插入临时变量。
                initOpn(&glo_res);
                strcpy(glo_res.id, glo_name), glo_res.type = 'v', glo_res.level = glo_level, glo_res.offset = sT.index - 1;
                copyOpn(&T->out, glo_res);
                //构造结点变量代码结点。
                T->code = merge(2, T->code, mkIR(get_OpType(*T)));
            }

            break;
        }
        case NOT:
        case UMINUS:
        {
            printf("%s\n", T->type_id);
            gen_IR(T->ptr[0]);
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            break;
        }
        case FUNC_CALL:
        {
            printf("函数调用：\n");

            printf("函数名：%s\n", T->type_id);
            func_state = -1, num_in_para = 0;
            gen_IR(T->ptr[0]);
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            check_func_id(T->type_id, glo_level, T->pos, "int(", num_in_para);

            char tmp_type[36], *re_type;
            strcpy(tmp_type, sT.symbols[find(T->type_id)].type);
            re_type = strtok(tmp_type, "(");
            if (strcmp(re_type, "void") == 0)
            {
                T->out.type = 'c', T->out.const_char = '\0';
                initOpn(&glo_res);
                glo_res.type = 'v', glo_res.offset = find(T->type_id), glo_res.level = glo_level, strcpy(glo_res.id, T->type_id);
                T->code = merge(2, T->code, mkIR(IR_CALL_VOID));
            }
            else
            {

                initOpn(&glo_opn1);
                glo_opn1.type = 'v', glo_opn1.offset = find(T->type_id), glo_opn1.level = glo_level, strcpy(glo_opn1.id, T->type_id);
                mksym(&sT, newTemp(), glo_level, re_type, glo_paramnum, glo_alias, 'T', glo_offset, 1, glo_int_val, glo_float_val, 4);
                sT.symbols[fT.funcs[fT.top - 1]].size += glo_size;

                initOpn(&glo_res);
                glo_res.type = 'v', glo_res.offset = sT.index - 1, glo_res.level = glo_level, strcpy(glo_res.id, sT.symbols[sT.index - 1].name);
                copyOpn(&T->out, glo_res);
                T->code = merge(2, T->code, mkIR(IR_CALL));
            }
            break;
        }
        case ARGS:
        {
            struct node *hT = T;
            i = 1;
            while (T)
            { // ARGS表示实际参数表达式序列结点，其第一棵子树为其一个实际参数表达式，第二棵子树为剩下的。
                assign_sym = 1;
                struct node *T0 = T->ptr[0];
                printf("第%d个实际参数表达式：\n", i++);
                num_in_para++;
                gen_IR(T0);
                if (T0)
                {
                    hT->code = merge(2, hT->code, T0->code);
                }
                initOpn(&glo_res);
                copyOpn(&glo_res, T0->out);
                hT->code = merge(2, hT->code, mkIR(IR_ARG));
                T = T->ptr[1];
            }
            break;
        }
        case SELF_ADD_EXP:
        {
            printf("后置自增: \n");
            printf("变量: %s\n", T->type_id);
            break;
        }
        case SELF_MINUS_EXP:
        {
            printf("后置自减: \n");
            printf("变量: %s\n", T->type_id);
            break;
        }
        }
    }
}
