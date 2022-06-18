/* 符号管理程序 */
#include "symtable.h"
extern "C" void output_symtable(struct node *T);

//构造新的symbol并插入。
void mksym(struct symboltable *sT, char *name, int level, char *type, int paramnum, char *alias, char flag, char offset)
{

    strcpy(sT->symbols[sT->index].name, name);
    sT->symbols[sT->index].level = level;
    strcpy(sT->symbols[sT->index].type, type);
    sT->symbols[sT->index].paramnum = paramnum;
    strcpy(sT->symbols[sT->index].alias, alias);
    sT->symbols[sT->index].flag = flag;
    sT->symbols[sT->index].offset = offset;
    sT->index++;
}

// 显示当前符号表中的内容。
void DisplaySymbolTable(struct symboltable sT)
{
    int i;
    // printf("\t\t***Symbol Table***\n");
    printf("----------------symbol table-----------------------\n");
    printf("%s\t%s\t%s\t%s\t%s\t%s\n", "Index", "Name", "Level", "Type", "Flag", "Param_num");
    printf("---------------------------------------------------\n");
    for (i = 0; i < sT.index; i++)
    {

        sT.symbols[i].flag == 'F' ? printf("%d\t%s\t%d\t%s\t%c\t%d\n", i, sT.symbols[i].name, sT.symbols[i].level, sT.symbols[i].type, sT.symbols[i].flag, sT.symbols[i].paramnum) : printf("%d\t%s\t%d\t%s\t%c\n", i, sT.symbols[i].name, sT.symbols[i].level, sT.symbols[i].type, sT.symbols[i].flag);
    }
    printf("---------------------------------------------------");
    printf("\n");
}

//作为遍历中暂存量辅助加入新符号。
char name[33], alias[10] = "", flag, offset = '0';
char type[36];
int level, paramnum;
char *tmp_type;
struct symboltable sT;
void init()
{
    strcpy(name, "");
    flag = ' ';

    paramnum = -1;
    strcpy(type, "");
}
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
            symbol_scope_TX.TX[symbol_scope_TX.top] = 0;
            symbol_scope_TX.top++;
            level = 0;
            output_symtable(T->ptr[0]); //显示该外部定义列表中的第一个
            output_symtable(T->ptr[1]); //显示该外部定义列表中的其它外部定义
            break;
        case EXT_VAR_DEF:
            // printf("外部变量定义:\n");
            init();
            level = 0, flag = 'V', paramnum = -1;
            //设定外部变量的深度，标识，参数。
            output_symtable(T->ptr[0]); //显示外部变量类型
            // printf("定义的变量:\n");

            output_symtable(T->ptr[1]); //显示变量列表
            mksym(&sT, name, level, type, paramnum, alias, flag, offset);
            // //printf("当前值：%s\t%d\t%s\t%c\t%d\n", name, level, type, flag, paramnum);
            DisplaySymbolTable(sT); //展示符号表
            break;
        case EXT_CONST_VAR_DEF:
            // printf("外部常量定义:\n");
            output_symtable(T->ptr[0]); //显示外部常量类型
            // printf("定义的常量:\n");
            output_symtable(T->ptr[1]); //显示常量列表
            break;
        case TERM:
        {

            if (T->ptr[0])
            {
                // printf("数组: ");
                tmp_type = strcat(type, "[]");
                // printf("%s\n", T->type_id);
                strcpy(name, T->type_id);
                output_symtable(T->ptr[0]);
            }
            else
            {
                // printf("ID: ");
                // printf("%s\n", T->type_id);
                tmp_type = strcat(type, "");
                strcpy(name, T->type_id);
                output_symtable(T->ptr[0]);
            }

            break;
        }
        case ARRAYS:
            T0 = T;
            i = 1;
            while (T0 != NULL)
            {
                // printf("第%d维: \n", i++);
                output_symtable(T0->ptr[0]);
                T0 = T0->ptr[1];
            }
            break;
        case TYPE:
        case VOID:
            // printf("类型: %s\n", T->type_id);
            strcpy(type, T->type_id);
            break;
        case EXT_DEC_LIST:
            output_symtable(T->ptr[0]); //依次显示外部变量名，
            mksym(&sT, name, level, type, paramnum, alias, flag, offset);
            output_symtable(T->ptr[1]); //后续还有相同的，仅显示语法树此处理代码可以和类似代码合并
            break;
        case VAR_DEC:
        {
            // printf("变量名: %s\n", T->type_id);
            strcpy(name, T->type_id);
            if (T->ptr[0])
            {
                // printf("它的初值:\n");
                output_symtable(T->ptr[0]); //表达式初值
            }
            break;
        }
        case FUNC_DEF:
        { // printf("函数定义：\n");
            init();
            level = 0, flag = 'F';
            output_symtable(T->ptr[0]); //显示函数返回类型
            output_symtable(T->ptr[1]); //显示函数名和参数
            output_symtable(T->ptr[2]); //显示函数体
            int old_index = sT.index;
            sT.index = symbol_scope_TX.TX[symbol_scope_TX.top - 1];
            symbol_scope_TX.top--;
            if (old_index != sT.index)
                DisplaySymbolTable(sT);
            break;
        }
        case FUNC_DEC:
            // printf("函数名：%s\n", T->type_id);
            strcpy(name, T->type_id);
            if (T->ptr[0])
            {
                // printf("函数形参：\n");
                paramnum = 0;
                sT.index++;
                tmp_type = strcat(type, "(");
                output_symtable(T->ptr[0]); //显示函数参数列表
                tmp_type = strcat(type, ")");
                sT.index = sT.index - paramnum - 1;
                mksym(&sT, name, level, tmp_type, paramnum, alias, flag, offset);
                sT.index = sT.index + paramnum;
            }
            else
            {
                // printf("无参函数\n");
                paramnum = 0;
                tmp_type = strcat(type, "(void)");
                mksym(&sT, name, level, tmp_type, paramnum, alias, flag, offset);
            }
            symbol_scope_TX.TX[symbol_scope_TX.top] = sT.index - paramnum;
            symbol_scope_TX.top++;

            /*调整输出*/
            if (T->ptr[0])
                for (sT.index = symbol_scope_TX.TX[symbol_scope_TX.top - 1]; sT.index < symbol_scope_TX.TX[symbol_scope_TX.top - 1] + paramnum + 1; sT.index++)
                {

                    DisplaySymbolTable(sT);
                }
            else
            {
                DisplaySymbolTable(sT);
            }
            //该if-else块只用于调整输出符号表格式，无实际作用。

            break;
        case PARAM_LIST:
            output_symtable(T->ptr[0]); //依次显示全部参数类型和名称，
            output_symtable(T->ptr[1]);
            break;
        case PARAM_DEC:
        {
            // printf("类型：%s, 参数名：%s\n", T->ptr[0]->type == INT ? "int" : "float", T->ptr[1]->type_id);
            char tmp_type1[36];
            strcpy(tmp_type1, T->ptr[0]->type == INT ? "int" : "float");
            mksym(&sT, T->ptr[1]->type_id, level + 1, tmp_type1, -1, alias, 'P', offset);
            tmp_type = paramnum == 0 ? strcat(tmp_type, T->ptr[0]->type == INT ? "int" : "float") : strcat(tmp_type, T->ptr[0]->type == INT ? ",int" : ",float");
            paramnum++;
            break;
        }
        case EXP_STMT:
            // printf("表达式语句：\n");
            output_symtable(T->ptr[0]);
            break;
        case RETURN:
            if (T->ptr[0])
            {
                // printf("返回语句：\n");
                output_symtable(T->ptr[0]);
            }
            else
            {
                // printf("空返回语句\n");
            }
            break;
        case CONTINUE_STMT:
            // printf("继续语句\n");
            break;
        case BREAK_STMT:
            // printf("打断语句\n");
            break;
        case COMP_STM:
        {
            if (T->ptr[0])
            {
                // printf("复合语句: \n");
                level++;

                symbol_scope_TX.TX[symbol_scope_TX.top] = sT.index;
                symbol_scope_TX.top++;
                output_symtable(T->ptr[0]);
                int old_index = sT.index;
                level--;
                sT.index = symbol_scope_TX.TX[symbol_scope_TX.top - 1];
                symbol_scope_TX.top--;
                if (sT.index != old_index)
                {
                    // printf("内部：%d外部：%d\n", old_index, sT.index);
                    DisplaySymbolTable(sT);
                }
            }
            else
            {
                // printf("空复合语句\n");
            }
            break;
        }
        case STM_DEF_LIST:
            output_symtable(T->ptr[0]); //显示第一条语句
            output_symtable(T->ptr[1]); //显示剩下语句
            break;
        case WHILE:
            // printf("循环语句：\n");
            // printf("循环条件：\n");
            output_symtable(T->ptr[0]); //显示循环条件
            // printf("循环体：\n");
            output_symtable(T->ptr[1]); //显示循环体
            break;
        case FOR_STMT:
            // printf("for 循环语句: \n");
            output_symtable(T->ptr[0]);
            // printf("循环体: \n");
            output_symtable(T->ptr[1]);
            break;
        case FOR_ARGS:
            // printf("for 循环起始表达式: \n");
            if (T->ptr[0])
            {
                output_symtable(T->ptr[0]);
            }
            else
            {
                // printf("无\n");
            }
            // printf("for 循环条件表达式: \n");
            if (T->ptr[1])
            {
                output_symtable(T->ptr[1]);
            }
            else
            {
                // printf("无\n");
            }
            // printf("for 循环第三表达式: \n");
            if (T->ptr[2])
            {
                output_symtable(T->ptr[2]);
            }
            else
            {
                // printf("无\n");
            }
            break;
        case IF_THEN:
            // printf("条件语句(IF_THEN)：\n");
            // printf("条件：\n");
            output_symtable(T->ptr[0]); //显示条件
            // printf("IF子句：\n");
            output_symtable(T->ptr[1]); //显示if子句
            break;
        case IF_THEN_ELSE:
            // printf("条件语句(IF_THEN_ELSE)：\n");
            // printf("条件：\n");
            output_symtable(T->ptr[0]); //显示条件
            // printf("IF子句：\n");
            output_symtable(T->ptr[1]); //显示if子句
            // printf("ELSE子句：\n");
            output_symtable(T->ptr[2]); //显示else子句
            break;
        case VAR_DEF:
            // printf("局部变量定义: \n");
            init();
            flag = 'V', paramnum = -1;
            output_symtable(T->ptr[0]); //显示变量类型
            // printf("定义的变量:\n");
            output_symtable(T->ptr[1]); //显示该定义的全部变量名
            DisplaySymbolTable(sT);
            break;
        case DEC_LIST:
            output_symtable(T->ptr[0]);
            mksym(&sT, name, level, type, paramnum, alias, flag, offset);
            output_symtable(T->ptr[1]);
            // mksym(&sT, name, level, type, paramnum, alias, flag, offset);
            break;
        case NODE_ID:
            // printf("ID： %s\n", T->type_id);
            strcpy(name, T->type_id);
            // mksym(&sT, name, level, type, paramnum, alias, flag, offset);
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
            output_symtable(T->ptr[0]);
            output_symtable(T->ptr[1]);
            break;
        case NOT:
        case UMINUS:
            // printf("%s\n", T->type_id);
            output_symtable(T->ptr[0]);
            break;
        case FUNC_CALL:
            // printf("函数调用：\n");
            // printf("函数名：%s\n", T->type_id);
            output_symtable(T->ptr[0]);
            break;
        case ARGS:
            i = 1;
            while (T)
            { // ARGS表示实际参数表达式序列结点，其第一棵子树为其一个实际参数表达式，第二棵子树为剩下的。
                struct node *T0 = T->ptr[0];
                // printf("第%d个实际参数表达式：\n", i++);
                output_symtable(T0);
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
