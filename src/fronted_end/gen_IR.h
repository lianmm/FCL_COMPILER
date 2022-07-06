//头文件中的内容
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "stdarg.h"
#include "sysy.tab.h"
#include <stdbool.h>
#include "semantic.h"

/*----------------------------中间代码生成结构定义区-------------------------*/

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
  ARM_MOVEQ

};

struct codenode
{                                //三地址TAC代码结点,采用双向循环链表存放中间语言代码
  enum IR_op op;                 // TAC代码的运算符种类
  struct opn opn1, opn2, result; // 2个操作数和运算结果
  struct codenode *next, *prior;
};

//数组访问索引表，实现数组访问的支持。
struct index_table
{
  int top;
  struct opn indexs[350];
};

//目标代码生成时使用的静态函数临时变量（伪寄存器）表项，表结构，和函数对应表结构；
struct T_symbol
{
  int status;
  int address;
  int no_ris;
  char name[MAXNAME];
  char type;
};
struct T_symtable
{
  int top;
  struct T_symbol Tsyms[MAXLENGTH];
};

struct func_symtable
{
  int top;
  struct T_symtable st[100];
};

//在if或while内的赋值时记录赋值的变量的索引，出语句块时清空临时变量分配；
struct if_while_sym
{
  int sym_indexs[MAXLENGTH];
  int top;
};
struct if_whi_top
{
  int sym_top[500];
  int top;
};
extern struct func_symtable fsT;
extern struct index_table iT;
extern struct if_while_sym iwT;
extern struct if_whi_top iwtT;
//暂存变量结点信息。
extern struct opn glo_opn1, glo_opn2, glo_res;

//打印标志。
extern int displayIR_sym;
//存放op字段的字符串数组，便于输出IR。
extern char IR_op_strs[50][32];
extern struct codenode null_ir;
//左右类型标识。

// label标识。函数头尾，用于调用和返回；未用。
extern int func_head_LabIn, func_tail_LabIn;
//数组初始化暂存地址计算辅助；
extern int glo_des[500];
extern int des_top;
//输出文件名；
extern char out_file[36];
extern char tmp_name[36];
//输出文件指针；
extern FILE *fp;
extern struct codenode *out_IR;

extern int no_tmp;
extern int no_lab;

void DisplayIR(struct codenode *C);

void display_fsT(int index);

void copyOpn(struct opn *dopn, struct opn sopn);

struct codenode *mkIR(enum IR_op op);

struct codenode *merge(int num, ...);
void printIR(struct codenode *h);
void initOpn(struct opn *tmp_opn);

void display_iwT();
char *newLabel();
int a2i(char *in);