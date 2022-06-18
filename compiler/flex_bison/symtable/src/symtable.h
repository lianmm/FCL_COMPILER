#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "stdarg.h"
#include "sysy.tab.h"
#include "def.h"

#define MAXLENGTH 1000 //定义符号表的大小

struct symbol
{                   //这里只列出了一个符号表项的部分属性，没考虑属性间的互斥
    char name[33];  //变量或函数名
    int level;      //层号，外部变量名或函数名层号为0，形参名为1，每到1个复合语句层号加1，退出减1
    char type[36];  //变量类型或函数返回值类型
    int paramnum;   //形式参数个数
    char alias[10]; //别名，为解决嵌套层次使用，使得每一个数据名称唯一
    char flag;      //符号标记，函数：'F'  变量：'V'   参数：'P'  临时变量：'T'
    char offset;    //外部变量和局部变量在其静态数据区或活动记录中的偏移量
                    //或函数活动记录大小，目标代码生成时使用
                    //其它...
};

//符号表，是一个顺序栈，index初值为0
struct symboltable
{
    struct symbol symbols[MAXLENGTH];
    //模拟数组的栈；
    int index;
    //栈顶索引；
} symbolTable;

struct symbol_scope_begin
{ /*当前作用域的符号在符号表的起始位置序号,这是一个栈结构，每到达一个复合语句，将符号表的index值进栈，离开复合语句时，取其退栈值修改符号表的index值，完成删除该复合语句中的所有变量和临时变量*/
    int TX[30];
    //数组栈结构；
    int top;
    //栈顶索引；
} symbol_scope_TX;
//定义作用域的栈结构；

void mksym(struct symboltable *sT, char *name, int level, char *type, int paramnum, char *alias, char flag, char offset);

void DisplaySymbolTable(struct symboltable sT);

void insert_symbol();

void new_scope();

void quit_scope();
