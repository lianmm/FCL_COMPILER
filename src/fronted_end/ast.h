#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "stdarg.h"
#include "../sysy.tab.h"
#include <stdbool.h>

/*-------------------------------全局宏变量声明区--------------------------------------*/
#define DX 3 * sizeof(int) //活动记录控制信息需要的单元数
#define MAXLENGTH 2000     //定义符号表的大小
extern char filename[50];  //输入文件名；
extern int lev;            //???

/*-----------------------中间代码结点和语法树结点区------------------------------------*/
//中间代码变量结点；

struct opn
{
    char kind;         //标识变量的类型；V->0,P->1，T->2，A->3，F->4,C->5,L->6;
    char type;         //标识操作数的类型
                       //只使用四种类型：变量（临时变量）v，常整数 i，常浮点 f,常字符 c;
    int const_int;     //整常数值，立即数
    float const_float; //浮点常数值，立即数
    char const_char;   //字符常数值，立即数
    char id[33];       //变量或临时变量的别名或标号字符串
    int level;         //变量的层号，0表示是全局变量，数据保存在静态数据区
    int offset;        //变量单元偏移量，或函数在符号表的定义位置序号，目标代码生成时用
    int next_use;      //下次调用的语句索引号，为0表示最后一次调用；
    int address;       //栈地址
    int no_ris;
    int status;
    char flage;
    char flaga;
};

//抽象语法树结点枚举类型；
enum node_kind
{
    EXT_DEF_LIST,
    EXT_VAR_DEF,
    CONST_VAR_DEF,
    FUNC_DEF,
    FUNC_DEC,
    EXT_DEC_LIST,
    PARAM_LIST,
    PARAM_DEC,
    VAR_DEF,
    VAR_DEC,
    DEC_LIST,
    COMP_STM,
    STM_DEF_LIST,
    EXP_STMT,
    IF_THEN,
    IF_THEN_ELSE,
    FUNC_CALL,
    ARGS,
    CONTINUE_STMT,
    BREAK_STMT,
    FOR_STMT,
    FOR_ARGS,
    FUNCTION,
    PARAM,
    ARG,
    CALL,
    LABEL,
    GOTO,
    JLT,
    JLE,
    JGT,
    JGE,
    EQ,
    NEQ,
    NODE_ID,
    SELF_ADD_EXP,
    SELF_MINUS_EXP,
    TERM,
    ARRAYS,
    EXP_LIST,
    EXP_DES,
    CONST_VAR_DEC,
    CONST_DEC_LIST,
    CONST_TERM,
    VOID_STMT
};

//抽象语法树结点；
struct node
{                        //以下对结点属性定义没有考虑存储效率，只是简单地列出要用到的一些属性
    enum node_kind kind; //结点类型
    union
    {
        char type_id[33]; //由标识符生成的叶结点
        int type_int;     //由整常数生成的叶结点
        float type_float; //由浮点常数生成的叶结点
    };
    struct node *ptr[3];                                 //子树指针，由kind确定有多少棵子树
    int level;                                           //层号
    int place;                                           //表示结点对应的变量或运算结果临时变量在符号表的位置序号
    char Etrue[15], Efalse[15];                          //对布尔表达式的翻译时，真假转移目标的标号
    char Snext[15];                                      //该结点对应语句执行后的下一条语句位置标号
    char while_head[15], while_tail[15], while_true[15]; //控制while内部的跳转位置。
    struct codenode *code;                               //该结点中间代码链表头指针
    char op[10];
    int type;   //结点对应值的类型
    int pos;    //语法单位所在位置行号
    int offset; //偏移量
    int width;  //各种数据占用的字节数
    struct opn out;
    struct opn depth, length;
    char fun_end[36];
};
