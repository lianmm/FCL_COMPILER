#include "symtable.h"
using namespace std;

//构造新的symbol并插入。
struct symbol *mksym(char *name, int level, char *type, int paramnum, char *alias, char flag, char offset)
{
    struct symbol *S = (struct symbol *)malloc(sizeof(struct symbol));
    strcpy(S->name, name);
    S->level = level;
    strcpy(S->type, type);
    S->paramnum = paramnum;
    strcpy(S->alias, alias);
    S->flag = flag;
    S->offset = offset;
    return S;
}

// 显示当前符号表中的内容。
void DisplaySymbolTable(symboltable sT)
{
    int i;
    printf("\t\t***Symbol Table***\n");
    printf("---------------------------------------------------\n");
    printf("%s\t%s\t%s\t%s\t%s\t%s\n", "Index", "Name", "Level", "Type", "Flag", "Param_num");
    printf("---------------------------------------------------\n");
    for (i = 0; i < sT.index; i++)
    {
        printf("%d\t%s\t%d\t%d\t%c\t%d\n", i, sT.symbols[i].name, sT.symbols[i].level, sT.symbols[i].type, sT.symbols[i].flag, sT.symbols[i].paramnum);
    }
    printf("---------------------------------------------------\n");
    printf("\n");
}

//插入变量或函数符号入表。
void insert_symbol() {}

//作为遍历中暂存量辅助加入新符号。
char name[33], alias[10] = "", flag, offset = '0';
string type = "";
int level, paramnum;
symboltable sT;
//遍历语法树流程控制。
void output_symtable(struct node *T)
{
    int i = 1;
    struct node *T0;
    if (T)
    {
        switch (T->kind)
        {
        case EXT_DEF_LIST:
            output_symtable(T->ptr[0]); //显示该外部定义列表中的第一个
            output_symtable(T->ptr[1]); //显示该外部定义列表中的其它外部定义
            break;
        case EXT_VAR_DEF:
            printf("外部变量定义:\n");
            level = 0, flag = 'V', paramnum = 0;
            output_symtable(T->ptr[0]); //显示外部变量类型
            printf("定义的变量:\n");

            output_symtable(T->ptr[1]); //显示变量列表
            DisplaySymbolTable(sT);//展示符号表
            break;
        case EXT_CONST_VAR_DEF:
            printf("外部常量定义:\n");
            output_symtable(T->ptr[0]); //显示外部常量类型
            printf("定义的常量:\n");
            output_symtable(T->ptr[1]); //显示常量列表
            break;
        case TERM:
            if (T->ptr[0])
            {
                printf("数组: ");
            }
            else
            {
                printf("ID: ");
            }
            printf("%s\n", T->type_id);
            output_symtable(T->ptr[0]);
            break;
        case ARRAYS:
            T0 = T;
            i = 1;
            while (T0 != NULL)
            {
                printf("第%d维: \n", i++);
                output_symtable(T0->ptr[0]);
                T0 = T0->ptr[1];
            }
            break;
        case TYPE:
        case VOID:
            printf("类型: %s\n", T->type_id);
            type += T->type_id;
            break;
        case EXT_DEC_LIST:
            output_symtable(T->ptr[0]); //依次显示外部变量名，
            output_symtable(T->ptr[1]); //后续还有相同的，仅显示语法树此处理代码可以和类似代码合并
            break;
        case VAR_DEC:
            printf("变量名: %s\n", T->type_id);
            strcpy(name, T->type_id);
            symbol *tmp_s = mksym(name, level, type, paramnum, alias, flag, offset);
            sT.symbols[sT.index] = *tmp_s;
            sT.index++;
            // 插入新外部变量类型符号todo;

            if (T->ptr[0])
            {
                printf("它的初值:\n");
                output_symtable(T->ptr[0]); //表达式初值
            }
            break;
        case FUNC_DEF:
            printf("函数定义：\n");
            output_symtable(T->ptr[0]); //显示函数返回类型
            output_symtable(T->ptr[1]); //显示函数名和参数
            output_symtable(T->ptr[2]); //显示函数体
            break;
        case FUNC_DEC:
            printf("函数名：%s\n", T->type_id);
            if (T->ptr[0])
            {
                printf("函数形参：\n");
                output_symtable(T->ptr[0]); //显示函数参数列表
            }
            else
                printf("无参函数\n");
            break;
        case PARAM_LIST:
            output_symtable(T->ptr[0]); //依次显示全部参数类型和名称，
            output_symtable(T->ptr[1]);
            break;
        case PARAM_DEC:
            printf("类型：%s, 参数名：%s\n", T->ptr[0]->type == INT ? "int" : "float", T->ptr[1]->type_id);
            break;
        case EXP_STMT:
            printf("表达式语句：\n");
            output_symtable(T->ptr[0]);
            break;
        case RETURN:
            if (T->ptr[0])
            {
                printf("返回语句：\n");
                output_symtable(T->ptr[0]);
            }
            else
            {
                printf("空返回语句\n");
            }
            break;
        case CONTINUE_STMT:
            printf("继续语句\n");
            break;
        case BREAK_STMT:
            printf("打断语句\n");
            break;
        case COMP_STM:
            if (T->ptr[0])
            {
                printf("复合语句: \n");
                output_symtable(T->ptr[0]);
            }
            else
            {
                printf("空复合语句\n");
            }
            break;
        case STM_DEF_LIST:
            output_symtable(T->ptr[0]); //显示第一条语句
            output_symtable(T->ptr[1]); //显示剩下语句
            break;
        case WHILE:
            printf("循环语句：\n");
            printf("循环条件：\n");
            output_symtable(T->ptr[0]); //显示循环条件
            printf("循环体：\n");
            output_symtable(T->ptr[1]); //显示循环体
            break;
        case FOR_STMT:
            printf("for 循环语句: \n");
            output_symtable(T->ptr[0]);
            printf("循环体: \n");
            output_symtable(T->ptr[1]);
            break;
        case FOR_ARGS:
            printf("for 循环起始表达式: \n");
            if (T->ptr[0])
            {
                output_symtable(T->ptr[0]);
            }
            else
            {
                printf("无\n");
            }
            printf("for 循环条件表达式: \n");
            if (T->ptr[1])
            {
                output_symtable(T->ptr[1]);
            }
            else
            {
                printf("无\n");
            }
            printf("for 循环第三表达式: \n");
            if (T->ptr[2])
            {
                output_symtable(T->ptr[2]);
            }
            else
            {
                printf("无\n");
            }
            break;
        case IF_THEN:
            printf("条件语句(IF_THEN)：\n");
            printf("条件：\n");
            output_symtable(T->ptr[0]); //显示条件
            printf("IF子句：\n");
            output_symtable(T->ptr[1]); //显示if子句
            break;
        case IF_THEN_ELSE:
            printf("条件语句(IF_THEN_ELSE)：\n");
            printf("条件：\n");
            output_symtable(T->ptr[0]); //显示条件
            printf("IF子句：\n");
            output_symtable(T->ptr[1]); //显示if子句
            printf("ELSE子句：\n");
            output_symtable(T->ptr[2]); //显示else子句
            break;
        case VAR_DEF:
            printf("局部变量定义: \n");
            output_symtable(T->ptr[0]); //显示变量类型
            printf("定义的变量:\n");
            output_symtable(T->ptr[1]); //显示该定义的全部变量名
            break;
        case DEC_LIST:
            output_symtable(T->ptr[0]);
            output_symtable(T->ptr[1]);
            break;
        case NODE_ID:
            printf("ID： %s\n", T->type_id);
            break;
        case INT:
            printf("INT：%d\n", T->type_int);
            break;
        case FLOAT:
            printf("FLAOT：%f\n", T->type_float);
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
            printf("%s\n", T->type_id);
            output_symtable(T->ptr[0]);
            output_symtable(T->ptr[1]);
            break;
        case NOT:
        case UMINUS:
            printf("%s\n", T->type_id);
            output_symtable(T->ptr[0]);
            break;
        case FUNC_CALL:
            printf("函数调用：\n");
            printf("函数名：%s\n");
            output_symtable(T->ptr[0]);
            break;
        case ARGS:
            i = 1;
            while (T)
            { // ARGS表示实际参数表达式序列结点，其第一棵子树为其一个实际参数表达式，第二棵子树为剩下的。
                struct node *T0 = T->ptr[0];
                printf("第%d个实际参数表达式：\n", i++);
                output_symtable(T0);
                T = T->ptr[1];
            }
            break;
        case SELF_ADD_EXP:
            printf("后置自增: \n");
            printf("变量: %s\n");
            break;
        case SELF_MINUS_EXP:
            printf("后置自减: \n");
            printf("变量: %s\n");
            break;
        }
    }
}
