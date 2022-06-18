/* 符号管理程序 */
#include "semantic.h"
#include <vector>
#include <string>
using namespace std;
//作为遍历中暂存量辅助加入新符号。
char name[33], alias[10] = "", flag, offset = '0';
char type[36];
int int_val = 0x7f7f7f7f;
float float_val = 3.402823466e+38F;
int level, paramnum;
char *tmp_type;
int init_sym;
struct symboltable sT;

//静态语义检查标志。
bool loop_sym = 0;
//循环体位置检查：内为1，外为0；
int assign_sym = 0;
//运算变量检查：置0表示被初始化变量标识符，置1表示运算右值标识符，置-1表示运算左值标识符。
int func_state = 0, num_in_para = 0;
int void_func_sym = -1;
//函数状态检查：置0表示声明一个函数，置-1表示调用一个函数（检查实参），置int表示在某类型函数体内（检查返回类型）。
//实参个数标志；
//空函数标志。

int array_in_sym = 0;
//数组下标访问标志。

//构造新的symbol并插入。
void mksym(struct symboltable *sT, char *name, int level, char *type, int paramnum, char *alias, char flag, char offset, int init_sym, int int_val, float float_val)
{

    strcpy(sT->symbols[sT->index].name, name);
    sT->symbols[sT->index].level = level;
    strcpy(sT->symbols[sT->index].type, type);
    sT->symbols[sT->index].paramnum = paramnum;
    strcpy(sT->symbols[sT->index].alias, alias);
    sT->symbols[sT->index].flag = flag;
    sT->symbols[sT->index].offset = offset;
    sT->symbols[sT->index].int_val = int_val;
    sT->symbols[sT->index].float_val = float_val;
    sT->symbols[sT->index].init_sym = init_sym;
    sT->index++;
}

// 显示当前符号表中的内容。
void DisplaySymbolTable(struct symboltable sT)
{
    int i;
    printf("----------------symbol table-----------------------\n");
    printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\n", "Index", "Name", "Level", "Type", "Flag", "Param_num", "init_sym");
    printf("---------------------------------------------------\n");
    for (i = 0; i < sT.index; i++)
    {

        sT.symbols[i].flag == 'F' ? printf("%d\t%s\t%d\t%s\t%c\t%d\n", i, sT.symbols[i].name, sT.symbols[i].level, sT.symbols[i].type, sT.symbols[i].flag, sT.symbols[i].paramnum) : printf("%d\t%s\t%d\t%s\t%c\t%d\n", i, sT.symbols[i].name, sT.symbols[i].level, sT.symbols[i].type, sT.symbols[i].flag, sT.symbols[i].init_sym);
    }
    printf("---------------------------------------------------\n");
    printf("\n");
}

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
    } //当前不支持重载函数。
    case -1:
    {
        // printf("形参数：%d; 实参数:%d\n", sT.symbols[index].paramnum, paramnum);
        if (index == -1)
        {
            printf("%s:%d ", filename, pos);
            printf("‘%s’ is not declared.\n", id);
            ans = 0;
        }
        else if (sT.symbols[index].flag == 'V')
        {
            printf("%s:%d ", filename, pos);
            printf("‘%s’ is not a function.\n", id);
            ans = 0;
        }
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
        else if (0)
        {
            //类型不同时，强制类型转换而不报错。TODO
        }
        break;
    }
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
    }
    return ans;
}
//函数检查：
//函数定义检查：重复定义，定义为变量名；
//函数返回类型检查；
//函数调用检查：函数当成变量，变量当成函数，实参形参不匹配。

bool check_array_id(char *id, int level, int pos, char *type, int paramnum)
{
    bool ans = 1;
    int index = find(id);
    switch (assign_sym)
    {
    case 1:
    {
        if (array_in_sym == 1)
        {
            printf("%s:%d ", filename, pos);
            printf("array subscript is not an integer.\n");
            ans = 0;
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
            printf("%s:%d ", filename, pos);
            printf("array subscript is not an integer.\n");
            ans = 0;
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

//数组检查；TODO

extern "C" void semantic_check(struct node *T);

void init()
{
    strcpy(name, "");
    flag = ' ';
    init_sym = 0;
    int_val = 0x7f7f7f7f;
    float_val = 3.402823466e+38F;
    paramnum = -1;
    strcpy(type, "");
}
//遍历语法树流程控制。

void semantic_check(struct node *T)
{
    int i = 1;
    struct node *T0;
    if (T)
    {
        switch (T->kind)
        {
        case EXT_DEF_LIST:
            symbol_scope_TX.TX[symbol_scope_TX.top] = 0;
            symbol_scope_TX.top++;
            level = 0;
            semantic_check(T->ptr[0]); //显示该外部定义列表中的第一个
            semantic_check(T->ptr[1]); //显示该外部定义列表中的其它外部定义
            break;
        case EXT_VAR_DEF:
            // printf("外部变量定义:\n");
            init();
            level = 0, flag = 'V', paramnum = -1;
            //设定外部变量的深度，标识，参数。
            semantic_check(T->ptr[0]); //显示外部变量类型
            // printf("定义的变量:\n");
            assign_sym = 0;
            semantic_check(T->ptr[1]); //
            if (check_val_id(name, level, T->pos, type, int_val, float_val))
            {
                mksym(&sT, name, level, type, paramnum, alias, flag, offset, init_sym, int_val, float_val);
                // DisplaySymbolTable(sT); //展示符号表
            } //判断外部变量并加入符号表。
            //新变量加入符号表。
            break;
        case EXT_CONST_VAR_DEF:
            // printf("外部常量定义:\n");
            semantic_check(T->ptr[0]); //显示外部常量类型
            // printf("定义的常量:\n");
            semantic_check(T->ptr[1]); //显示常量列表
            break;
        case TERM:
        {

            if (T->ptr[0])
            {
                // printf("数组: ");
                // printf("%s\n", T->type_id);
                if (assign_sym == 0)
                {
                    strcpy(name, T->type_id);
                    if (strcmp(type, "int") == 0 || strcmp(type, "float") == 0)
                        tmp_type = strcat(type, "[]");
                }
                if (assign_sym == 1)
                {
                    check_array_id(T->type_id, level, T->pos, "int(", -1);
                }
                semantic_check(T->ptr[0]);
                array_in_sym = 0;
            }
            else
            {
                // printf("ID: ");
                // printf("%s\n", T->type_id);
                if (assign_sym != 0)
                    check_val_id(T->type_id, level, T->pos, type, int_val, float_val);
                //判断单个符号是否重复或存在未初始化问题。
                if (assign_sym == 0)
                {
                    tmp_type = strcat(type, "");
                    strcpy(name, T->type_id);
                }
                semantic_check(T->ptr[0]);
            }

            break;
        }
        case ARRAYS:
            T0 = T;
            i = 1;
            while (T0 != NULL)
            {
                // printf("第%d维: \n", i++);
                if (T0->ptr[0]->kind != INT)
                {
                    array_in_sym = 1;
                    check_array_id(T->type_id, level, T->pos, "int", 0);
                }
                semantic_check(T0->ptr[0]);
                T0 = T0->ptr[1];
            }
            break;
        case TYPE:
        case VOID:
            // printf("类型: %s\n", T->type_id);
            if (void_func_sym == 0 && strcmp(T->type_id, "void") == 0)
                void_func_sym = 1;
            strcpy(type, T->type_id);
            break;
        case EXT_DEC_LIST:
            semantic_check(T->ptr[0]); //依次显示外部变量名，
            if (check_val_id(name, level, T->pos, type, int_val, float_val))
                mksym(&sT, name, level, type, paramnum, alias, flag, offset, init_sym, int_val, float_val);
            //检查重复并插入新变量到符号表。

            semantic_check(T->ptr[1]); //后续还有相同的，仅显示语法树此处理代码可以和类似代码合并
            break;
        case VAR_DEC:
        {
            // printf("变量名: %s\n", T->type_id);
            strcpy(name, T->type_id);
            if (T->ptr[0])
            {
                // printf("它的初值:\n");
                init_sym = T->ptr[0]->kind == INT ? 1 : 2;
                T->ptr[0]->kind == INT ? int_val = T->ptr[0]->type_int : float_val = T->ptr[0]->type_float;
                assign_sym = 1;
                semantic_check(T->ptr[0]); //表达式初值
                assign_sym = 0;
            }
            break;
        }
        case FUNC_DEF:
        {
            // printf("函数定义：\n");
            init();
            level = 0, flag = 'F';
            void_func_sym = 0;
            func_state = 0;
            semantic_check(T->ptr[0]); //显示函数返回类型
            semantic_check(T->ptr[1]); //显示函数名和参数
            func_state = 1;
            semantic_check(T->ptr[2]); //显示函数体
            void_func_sym = -1;
            int old_index = sT.index;
            sT.index = symbol_scope_TX.TX[symbol_scope_TX.top - 1];
            symbol_scope_TX.top--;
            // if (old_index != sT.index)
            // DisplaySymbolTable(sT);
            break;
        }
        case FUNC_DEC:
            // printf("函数名：%s\n", T->type_id);
            strcpy(name, T->type_id);
            func_state = 0;
            if (T->ptr[0])
            {
                // printf("函数形参：\n");
                paramnum = 0;
                if (check_func_id(name, level, T->pos, type, paramnum))
                {
                    sT.index++;
                    tmp_type = strcat(type, "(");
                    semantic_check(T->ptr[0]); //显示函数参数列表
                    tmp_type = strcat(type, ")");
                    sT.index = sT.index - paramnum - 1;
                    mksym(&sT, name, level, tmp_type, paramnum, alias, flag, offset, 0, 0, 0);
                    sT.index = sT.index + paramnum;
                }
            }
            else
            {
                // printf("无参函数\n");
                paramnum = 0;
                tmp_type = strcat(type, "(void)");
                if (check_func_id(name, level, T->pos, tmp_type, paramnum))
                    mksym(&sT, name, level, tmp_type, paramnum, alias, flag, offset, 0, 0, 0);
            }
            symbol_scope_TX.TX[symbol_scope_TX.top] = sT.index - paramnum;
            symbol_scope_TX.top++;

            /*调整输出*/
            // if (T->ptr[0])
            //     for (sT.index = symbol_scope_TX.TX[symbol_scope_TX.top - 1]; sT.index < symbol_scope_TX.TX[symbol_scope_TX.top - 1] + paramnum + 1; sT.index++)
            //     {

            //         DisplaySymbolTable(sT);
            //     }
            // else
            // {
            //     DisplaySymbolTable(sT);
            // }
            // //该if-else块只用于调整输出符号表格式，无实际作用。

            break;
        case PARAM_LIST:
            semantic_check(T->ptr[0]); //依次显示全部参数类型和名称，
            semantic_check(T->ptr[1]);
            break;
        case PARAM_DEC:
        {
            // printf("类型：%s, 参数名：%s\n", T->ptr[0]->type == INT ? "int" : "float", T->ptr[1]->type_id);
            char tmp_type1[36];
            strcpy(tmp_type1, T->ptr[0]->type == INT ? "int" : "float");
            mksym(&sT, T->ptr[1]->type_id, level + 1, tmp_type1, -1, alias, 'P', offset, 0, 0, 0);
            //添加形参入符号表，当前假定无默认值。
            tmp_type = paramnum == 0 ? strcat(tmp_type, T->ptr[0]->type == INT ? "int" : "float") : strcat(tmp_type, T->ptr[0]->type == INT ? ",int" : ",float");
            paramnum++;
            break;
        }
        case EXP_STMT:
            // printf("表达式语句：\n");
            semantic_check(T->ptr[0]);
            break;
        case RETURN:
            if (T->ptr[0])
            {
                // printf("返回语句：\n");
                assign_sym = 1;
                if (void_func_sym == 1)
                    check_func_id("", level, T->pos, "int(", -2);
                semantic_check(T->ptr[0]);
            }
            else
            {
                if (void_func_sym == 0)
                    check_func_id("", level, T->pos, "int(", -1);
                // printf("空返回语句\n");
            }
            break;
        case CONTINUE_STMT:
            // printf("继续语句\n");
            if (loop_sym == 0)
            {
                printf("%s:%d ", filename, T->pos);
                printf("continue statement not within a loop\n");
            }
            break;
        case BREAK_STMT:
            // printf("打断语句\n");
            if (loop_sym == 0)
            {
                printf("%s:%d ", filename, T->pos);
                printf("break statement not within a loop\n");
            }
            break;
        case COMP_STM:
        {
            if (T->ptr[0])
            {
                // printf("复合语句: \n");
                level++;

                symbol_scope_TX.TX[symbol_scope_TX.top] = sT.index;
                symbol_scope_TX.top++;
                semantic_check(T->ptr[0]);
                int old_index = sT.index;
                level--;
                sT.index = symbol_scope_TX.TX[symbol_scope_TX.top - 1];
                symbol_scope_TX.top--;
                // if (sT.index != old_index)
                // {

                //     DisplaySymbolTable(sT);
                // }
            }
            else
            {
                // printf("空复合语句\n");
            }
            break;
        }
        case STM_DEF_LIST:
            semantic_check(T->ptr[0]); //显示第一条语句
            semantic_check(T->ptr[1]); //显示剩下语句
            break;
        case WHILE:
            // printf("循环语句：\n");
            // printf("循环条件：\n");
            semantic_check(T->ptr[0]); //显示循环条件
            // printf("循环体：\n");
            loop_sym = 1;
            semantic_check(T->ptr[1]); //显示循环体
            loop_sym = 0;
            break;
        case FOR_STMT:
            // printf("for 循环语句: \n");
            semantic_check(T->ptr[0]);
            // printf("循环体: \n");
            loop_sym = 1;
            semantic_check(T->ptr[1]);
            loop_sym = 0;
            break;
        case FOR_ARGS:
            // printf("for 循环起始表达式: \n");
            if (T->ptr[0])
            {
                semantic_check(T->ptr[0]);
            }
            else
            {
                // printf("无\n");
            }
            // printf("for 循环条件表达式: \n");
            if (T->ptr[1])
            {
                semantic_check(T->ptr[1]);
            }
            else
            {
                // printf("无\n");
            }
            // printf("for 循环第三表达式: \n");
            if (T->ptr[2])
            {
                semantic_check(T->ptr[2]);
            }
            else
            {
                // printf("无\n");
            }
            break;
        case IF_THEN:
            // printf("条件语句(IF_THEN)：\n");
            // printf("条件：\n");
            semantic_check(T->ptr[0]); //显示条件
            // printf("IF子句：\n");
            semantic_check(T->ptr[1]); //显示if子句
            break;
        case IF_THEN_ELSE:
            // printf("条件语句(IF_THEN_ELSE)：\n");
            // printf("条件：\n");
            semantic_check(T->ptr[0]); //显示条件
            // printf("IF子句：\n");
            semantic_check(T->ptr[1]); //显示if子句
            // printf("ELSE子句：\n");
            semantic_check(T->ptr[2]); //显示else子句
            break;
        case VAR_DEF:
            // printf("局部变量定义: \n");
            init();
            flag = 'V', paramnum = -1;
            semantic_check(T->ptr[0]); //显示变量类型
            // printf("定义的变量:\n");
            assign_sym = 0;
            semantic_check(T->ptr[1]); //显示该定义的全部变量名
            // DisplaySymbolTable(sT);
            break;
        case DEC_LIST:
            semantic_check(T->ptr[0]);
            if (check_val_id(name, level, T->pos, type, int_val, float_val))
                mksym(&sT, name, level, type, paramnum, alias, flag, offset, init_sym, int_val, float_val);
            //插入新局部变量入符号表。

            semantic_check(T->ptr[1]);

            break;
        case NODE_ID:
            // printf("ID： %s\n", T->type_id);
            check_val_id(T->type_id, level, T->pos, type, int_val, float_val);
            //检查表达式是否存在未初始化问题。
            strcpy(name, T->type_id);

            break;
        case INT:
            // printf("INT：%d\n", T->type_int);
            break;
        case FLOAT:
            // printf("FLAOT：%f\n", T->type_float);
            break;
        case ASSIGN:
        case AND:
        case OR:
        case RELOP:
        case ADD:
        case MINUS:
        case MUL:
        case DIV:
        case MOD:
            // printf("%s\n", T->type_id);
            if (T->kind == ASSIGN)
            {
                assign_sym = -1;
                if (T->ptr[0]->kind == INT || T->ptr[0]->kind == FLOAT)
                {
                    printf("%s:%d ", filename, T->pos);
                    printf("lvalue required as left operand of assignment\n");
                }
            }
            semantic_check(T->ptr[0]); //赋值（运算）号的左值表达式；
            assign_sym = 1;
            semantic_check(T->ptr[1]); //赋值（运算）号的右值表达式；
            sT.symbols[find(T->ptr[0]->type_id)].init_sym = 1;
            //不考虑执行失败的情况，只要作为左值运算过，即认为已初始化TODO。
            break;
        case NOT:
        case UMINUS:
            // printf("%s\n", T->type_id);
            semantic_check(T->ptr[0]);
            break;
        case FUNC_CALL:
            // printf("函数调用：\n");

            // printf("函数名：%s\n", T->type_id);
            func_state = -1, num_in_para = 0;
            semantic_check(T->ptr[0]);
            check_func_id(T->type_id, level, T->pos, "int(", num_in_para);
            break;
        case ARGS:
            i = 1;
            while (T)
            { // ARGS表示实际参数表达式序列结点，其第一棵子树为其一个实际参数表达式，第二棵子树为剩下的。
                assign_sym = 1;
                struct node *T0 = T->ptr[0];
                // printf("第%d个实际参数表达式：\n", i++);
                num_in_para++;
                semantic_check(T0);
                T = T->ptr[1];
            }
            break;
        case SELF_ADD_EXP:
            // printf("后置自增: \n");
            // printf("变量: %s\n", T->type_id);
            break;
        case SELF_MINUS_EXP:
            // printf("后置自减: \n");
            // printf("变量: %s\n", T->type_id);
            break;
        }
    }
}
