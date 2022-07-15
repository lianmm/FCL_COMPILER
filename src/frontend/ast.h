#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "stdarg.h"
#include "sysy.tab.h"
#include <stdbool.h>
#include <string>
using namespace std;
/*-------------------------------全局宏变量声明区--------------------------------------*/
#define DX 3 * sizeof(int) //活动记录控制信息需要的单元数
#define MAXLENGTH 30000    //定义符号表的大小
#define MAXNAME 1000
#define MAXTYPE 25
extern char filename[50]; //输入文件名；
extern char out_file[50]; //输出文件名；
extern int lev;           //???
//存放op字段的字符串数组，便于输出IR。
extern char IR_op_strs[50][32];
extern struct node *out_ast;

/*-----------------------中间代码结点和语法树结点区------------------------------------*/
//中间代码变量结点；
struct opn
{
    char kind;         //标识变量的类型；V->0,P->1，T->2，A->3，F->4,C->5,L->6;
    char type;         //标识操作数的类型                       //只使用四种类型：变量（临时变量）v，常整数 i，常浮点 f,常字符 c;
    int const_int;     //整常数值，立即数
    float const_float; //浮点常数值，立即数
    char const_char;   //字符常数值，立即数
    string id;         //变量或临时变量的别名或标号字符串
    int level;         //变量的层号，0表示是全局变量，数据保存在静态数据区
    int offset;        //变量单元偏移量，或函数在符号表的定义位置序号，目标代码生成时用
    int next_use;      //下次调用的语句索引号，为0表示最后一次调用；
    int address;       //栈地址
    int no_ris;
    int status;
    char flage;
    char flaga;
    opn()
    {
        this->kind = '0';
        this->type = '0';
        this->const_int = 0;
        this->const_float = 0.0;
        this->id = " ";
        this->level = 0;
        this->offset = 0;
        this->next_use = 0;
        this->address = 0;
        this->no_ris = 0;
        this->status = 0;
        this->flage = '0';
        this->flaga = '0';
    }

    opn &operator=(const opn &o1)
    {
        this->kind = o1.kind;
        this->type = o1.type;
        this->const_int = o1.const_int;
        this->const_float = o1.const_float;
        this->id = o1.id;
        this->level = o1.level;
        this->offset = o1.offset;
        this->next_use = o1.next_use;
        this->address = o1.address;
        this->no_ris = o1.no_ris;
        this->status = o1.status;
        this->flage = o1.flage;
        this->flaga = o1.flaga;

        return *this;
    }
};
// IR的op枚举类型。
enum IR_op
{
    IR_ASSIGN,
    IR_EXT_ALLOCA,
    IR_VOID,

    IR_ADD,
    IR_MINUS,
    IR_MUL,
    IR_DIV,
    IR_MOD,
    IR_JLT,
    IR_JLE,
    IR_JGT,
    IR_JGE,
    IR_EQ,
    IR_NEQ,
    IR_AND,
    IR_OR,
    IR_GOTO_JLT,
    IR_GOTO_JLE,
    IR_GOTO_JGT,
    IR_GOTO_JGE,
    IR_GOTO_EQ,
    IR_GOTO_NEQ,
    IR_GOTO_AND,
    IR_GOTO_OR,
    IR_EXP_ARROFF,
    IR_ARROFF_EXP,
    IR_ARROFF_EXPi,
    IR_ARROFF_EXPie,
    IR_EXP_ARROFFa,
    IR_ARROFF_EXPi0,

    IR_GOTO_NOT,
    IR_CALL,
    IR_NOT,
    IR_UMINUS,
    IR_LOAD,
    IR_ALLOCA,

    IR_FUNCTION,
    IR_FUNC_END,
    IR_PARAM,
    IR_LABEL,
    IR_GOTO,

    IR_ARG,
    IR_RETURN,
    IR_CALL_VOID,

    ARM_MOVNE,
    ARM_MOVEQ,
    ARM_ITORG

};
struct codenode
{                                  //三地址TAC代码结点,采用双向循环链表存放中间语言代码
    enum IR_op op;                 // TAC代码的运算符种类
    struct opn opn1, opn2, result; // 2个操作数和运算结果
    struct codenode *next, *prior;
    codenode()
    {
        this->op = IR_VOID;
        this->next = nullptr;
        this->prior = nullptr;
    }
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
        char type_id[MAXNAME]; //由标识符生成的叶结点
        int type_int;          //由整常数生成的叶结点
        float type_float;      //由浮点常数生成的叶结点
    };
    struct node *ptr[3];                                 //子树指针，由kind确定有多少棵子树
    int level;                                           //层号
    int place;                                           //表示结点对应的变量或运算结果临时变量在符号表的位置序号；place用于存放函数调用中函数在符号表中的位置；回传ED结点表示的范围；是否是关系型表达式；
    char Etrue[15], Efalse[15];                          //对布尔表达式的翻译时，真假转移目标的标号
    char Snext[15];                                      //该结点对应语句执行后的下一条语句位置标号
    char while_head[15], while_tail[15], while_true[15]; //控制while内部的跳转位置。
    struct codenode *code;                               //该结点中间代码链表头指针
    char op[10];
    int type;   //结点对应值的类型
    int pos;    //语法单位所在位置行号
    int offset; //偏移量
    struct opn out;
    struct opn depth, length;
    char fun_end[36];
    string call_name;
    node()
    {
        this->Etrue[0] = '\0', this->Efalse[0] = '\0'; //对布尔表达式的翻译时，真假转移目标的标号
        this->Snext[0] = '\0';                         //该结点对应语句执行后的下一条语句位置标号
        this->while_head[0] = '\0', this->while_tail[0] = '\0', this->while_true[0] = '\0';
        this->type_id[0] = '\0', this->op[0] = '\0', this->fun_end[0] = '\0';
        this->ptr[0] = this->ptr[1] = this->ptr[2] = NULL;
        this->code = NULL;
        call_name = " ";
    }
};

struct node *mknode(int kind, struct node *first, struct node *second, struct node *third, int pos);
