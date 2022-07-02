#include "ast.h"

/*----------------------------------信息存储结构定义-----------------------------------------*/

struct symbol
{                   //这里只列出了一个符号表项的部分属性，没考虑属性间的互斥
    char name[33];  //变量或函数名
    int level;      //层号，外部变量名或函数名层号为0，形参名为1，每到1个复合语句层号加1，退出减1
    char type[36];  //变量类型或函数返回值类型
    int paramnum;   //形式参数个数;数组的向量内情表索引;
    char alias[10]; //别名，为解决嵌套层次使用，使得每一个数据名称唯一
    char flag;      //符号标记，函数：'F'  变量：'V'   参数：'P'  临时变量：'T'
    char flagca;
    char flage;
    int val_index;     //数组初始化表索引；函数的单独符号表索引；
    struct opn offset; //外部变量和局部变量在其静态数据区或活动记录中的偏移量
    int int_val;
    float float_val;
    //初始化值。
    int init_sym;
    // 初始化标志：0表示未初始化，1表示初始化为int，2表示初始化为float。
    struct opn size;
    //函数活动记录大小，目标代码生成时使用
    int status;
    //分配状态；有栈上已分配，寄存器上已分配几种；
    int address; //栈上地址；栈上已分配才有效；
    int no_ris;  //对应寄存器编号，寄存器已分配才有效；
};

//符号表，是一个顺序栈，index初值为0
struct symboltable
{
    struct symbol symbols[MAXLENGTH];
    //模拟数组的栈；
    int index;
    //栈顶索引；
};
struct symbol_scope_begin
{ /*当前作用域的符号在符号表的起始位置序号,这是一个栈结构，每到达一个复合语句，将符号表的index值进栈，离开复合语句时，取其退栈值修改符号表的index值，完成删除该复合语句中的所有变量和临时变量*/
    int TX[30];
    //数组栈结构；
    int top;
    //栈顶索引；
};
//定义作用域的栈结构；

//数组内情向量表结点结构；
struct array_node
{
    struct opn lim[10];
    int D;
};

//数组内情向量表结构；
struct array_table
{
    struct array_node arrs[500];
    int top;
};

//全局变量索引表，用于维护全局变量在堆空间的偏移量；
struct ext_val_table
{
    int vals[500];
    int top;
};

//函数体索引表，用于维护函数体在栈空间的偏移量；
struct func_table
{
    int funcs[500];
    int top;
};

struct arrcon_node
{
    struct opn val[500];
    int lim;
};

struct arr_val_table
{
    struct arrcon_node arr[500];
    int top;
};

/*----------------------------------信息存储表结构定义-----------------------------------------*/
extern struct symboltable sT;
extern struct ext_val_table evT;
extern struct arr_val_table avT;
extern struct func_table fT;
extern struct array_table aT;
extern struct symbol_scope_begin symbol_scope_TX;

/*----------------------------------添加新符号用的暂存全局变量------------------------------------*/
extern char glo_name[33], glo_alias[10], glo_flag;
extern struct opn glo_offset;
extern char glo_type[36];
extern int glo_int_val;
extern float glo_float_val;
extern int glo_level, glo_paramnum;
extern char *glo_tmp_type;
extern int glo_init_sym;
extern struct opn glo_arr_lim[10];
extern int glo_D;
extern struct opn glo_size;

/*--------------------------------------符号表维护函数区-------------------------------------------*/
//构造新的数组内情向量并插入aT。
int mkarr(struct opn arr_lim[], int D);

//构造新的符号并插入sT。
void mksym(struct symboltable *sT, char *name, int level, char *type, int paramnum, char *alias, char flag, struct opn offset, int init_sym, int int_val, float float_val, struct opn size);

//显示当前数组内情向量表中的内容。
void DisplayArrTable();

//查询某个索引对应的内情向量的一维大小。
struct opn arr_size(int index);

// 显示当前符号表中的内容。
void DisplaySymbolTable(struct symboltable sT);

//查询符号表，返回表内索引，-1表示不存在。
int find(char *id);

//查询库函数表，返回表内索引(TODO)，-1表示不存在。
int lib_func_find(char *id);


//初始化全局暂存变量。
void init();

void add_lib();

void printOpn(struct opn topn);
