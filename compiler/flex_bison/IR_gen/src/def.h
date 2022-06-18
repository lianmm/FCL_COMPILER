
//头文件中的内容
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "stdarg.h"
#include "sysy.tab.h"

//抽象语法树结点枚举类型。
enum node_kind
{
  EXT_DEF_LIST,
  EXT_VAR_DEF,
  EXT_CONST_VAR_DEF,
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
  ARRAYS
};

// IR的op枚举类型。
enum IR_op
{
  IR_ASSIGN,
  IR_EXP_POINT,
  IR_POINT_EXP,

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

  IR_GOTO_NOT,
  IR_CALL,
  IR_EXP_ARROFF,
  IR_ARROFF_EXP,
  IR_NOT,

  IR_FUNCTION,
  IR_PARAM,
  IR_LABEL,
  IR_GOTO,

  IR_ARG,
  IR_RETURN,
  IR_CALL_VOID
};

#define DX 3 * sizeof(int) //活动记录控制信息需要的单元数

char filename[50];
int lev;

//以下语法树结点类型、三地址结点类型等定义仅供参考，实验时一定要根据自己的理解来定义
struct opn
{
  int kind;  //标识操作的类型
  char type; //标识操作数的类型
  //只使用四种类型：变量（临时变量）v，常整数 i，常浮点 f,常字符 c;
  union
  {
    int const_int;     //整常数值，立即数
    float const_float; //浮点常数值，立即数
    char const_char;   //字符常数值，立即数
    char id[33];       //变量或临时变量的别名或标号字符串
  };
  int level;  //变量的层号，0表示是全局变量，数据保存在静态数据区
  int offset; //变量单元偏移量，或函数在符号表的定义位置序号，目标代码生成时用
};

struct codenode
{                                //三地址TAC代码结点,采用双向循环链表存放中间语言代码
  enum IR_op op;                 // TAC代码的运算符种类
  struct opn opn1, opn2, result; // 2个操作数和运算结果
  struct codenode *next, *prior;
};

struct node
{                      //以下对结点属性定义没有考虑存储效率，只是简单地列出要用到的一些属性
  enum node_kind kind; //结点类型
  union
  {
    char type_id[33]; //由标识符生成的叶结点
    int type_int;     //由整常数生成的叶结点
    float type_float; //由浮点常数生成的叶结点
  };
  struct node *ptr[3];        //子树指针，由kind确定有多少棵子树
  int level;                  //层号
  int place;                  //表示结点对应的变量或运算结果临时变量在符号表的位置序号
  char Etrue[15], Efalse[15]; //对布尔表达式的翻译时，真假转移目标的标号
  char Snext[15];             //该结点对应语句执行后的下一条语句位置标号
  struct codenode *code;      //该结点中间代码链表头指针
  char op[10];
  int type;   //结点对应值的类型
  int pos;    //语法单位所在位置行号
  int offset; //偏移量
  int width;  //各种数据占用的字节数
  struct opn out;
};

#define MAXLENGTH 1000 //定义符号表的大小

struct symbol
{                 //这里只列出了一个符号表项的部分属性，没考虑属性间的互斥
  char name[33];  //变量或函数名
  int level;      //层号，外部变量名或函数名层号为0，形参名为1，每到1个复合语句层号加1，退出减1
  char type[36];  //变量类型或函数返回值类型
  int paramnum;   //形式参数个数
  char alias[10]; //别名，为解决嵌套层次使用，使得每一个数据名称唯一
  char flag;      //符号标记，函数：'F'  变量：'V'   参数：'P'  临时变量：'T'
  int offset;     //外部变量和局部变量在其静态数据区或活动记录中的偏移量
  int int_val;
  float float_val;
  //初始化值。
  int init_sym;
  // 初始化标志：0表示未初始化，1表示初始化为int，2表示初始化为float。
  int size;
  //函数活动记录大小，目标代码生成时使用
  //其它...
};

//符号表，是一个顺序栈，index初值为0
struct symboltable
{
  struct symbol symbols[MAXLENGTH];
  //模拟数组的栈；
  int index;
  //栈顶索引；
} sT;

struct symbol_scope_begin
{ /*当前作用域的符号在符号表的起始位置序号,这是一个栈结构，每到达一个复合语句，将符号表的index值进栈，离开复合语句时，取其退栈值修改符号表的index值，完成删除该复合语句中的所有变量和临时变量*/
  int TX[30];
  //数组栈结构；
  int top;
  //栈顶索引；
} symbol_scope_TX;
//定义作用域的栈结构；

//数组内情向量表结点结构；
struct array_node
{
  int lim[10];
  int D;
};

//数组内情向量表结构；
struct array_table
{
  struct array_node arrs[500];
  int top;

} aT;

//全局变量索引表，用于维护全局变量在堆空间的偏移量；
struct ext_val_table
{
  int vals[500];
  int top;
} evT;

//函数体索引表，用于维护函数体在栈空间的偏移量；
struct func_table
{
  int funcs[500];
  int top;
} fT;

typedef int label_off;
struct label_table
{
  label_off label[350];
  int top;
} lT;
// 为语义分析和代码生成预留
struct node *
mknode(int kind, struct node *first, struct node *second, struct node *third, int pos);
void display(struct node *T, int indent);
void boolExp(struct node *T);
void Exp(struct node *T);
void objectCode(struct codenode *head);
