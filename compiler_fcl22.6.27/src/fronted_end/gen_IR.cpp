/* 符号管理程序 */
#include "gen_IR.h"
#include <stdio.h>
#include <cmath>
using namespace std;
extern "C" void gen_IR(struct node *T);

/*-------------------------------中间代码生成标志和公共变量------------------------------------*/

//暂存变量结点信息。
struct opn glo_opn1, glo_opn2, glo_res;

//打印标志。
int displayIR_sym = 0;
//存放op字段的字符串数组，便于输出IR。
char IR_op_strs[40][12] = {
    "ASSIGN", "EXP_POINT", "POINT_EXP",

    "add", "sub", "mul", "div", "mod", "jlt", "jle", "jgt", "jge", "eq", "neq", "and", "or", "goto_glt", "goto_gle", "goto_gjt", "goto_gje", "goto_eq", "goto_neq", "goto_and", "goto_or", "exp_arroff", "arroff_exp",

    "goto_neq ", "CALL", "not", "load", "alloca",

    "function: ", "func_end:", "param", "label:", "goto",

    "arg", "return", "call_void"};
struct codenode null_ir;
//左右类型标识。

// label标识。函数头尾，用于调用和返回；未用。
int func_head_LabIn, func_tail_LabIn;
//数组初始化暂存地址计算辅助；
int glo_des[500];
int des_top;
//输出文件名；
char out_file[36];
char tmp_name[36];
//输出文件指针；
FILE *fp = NULL;
struct codenode *out_IR;

struct func_symtable fsT;
struct index_table iT;

int no_tmp = 0;
int no_lab = 1;
int no_par = 0;
int comp_stm_type = 0;
/*--------------------------------------中间代码构造所需函数实现区-------------------------------------*/

/*--------------------------------------基础支持函数实现区--------------------------------------*/
//初始化变量结点；
void initOpn(struct opn *tmp_opn)
{
    tmp_opn->type = ' ';
    tmp_opn->offset = 0;
    tmp_opn->level = 0;
    tmp_opn->const_char = ' ', tmp_opn->const_float = 0, tmp_opn->const_int = 0, strcpy(tmp_opn->id, "");
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
    return strcat0((char *)"v", (char *)s);
}

//生成新的标签。
char *newLabel()
{

    char s[10];
    snprintf(s, 10, "%d", no_lab++);
    return strcat0((char *)".L", (char *)s);
}

//生成形参标签。
char *newPara()
{
    char s[10];
    snprintf(s, 10, "%d", no_par);
    no_par++;
    return strcat0((char *)"p", (char *)s);
}

//形成新的临时变量。
char *newTemp()
{
    char s[10];
    snprintf(s, 10, "%d", no_tmp);
    no_tmp++;
    return strcat0((char *)"t", (char *)s);
}

//形成新变量标识。
char *newVal()
{
    static int no = 1;
    char s[10];
    snprintf(s, 10, "%d", no++);
    return strcat0((char *)"v", (char *)s);
}

//复制opn结构信息。
void copyOpn(struct opn *dopn, struct opn sopn)
{
    dopn->type = sopn.type, dopn->offset = sopn.offset, dopn->level = sopn.level, dopn->kind = sopn.kind;
    dopn->const_char = sopn.const_char, dopn->const_float = sopn.const_float, dopn->const_int = sopn.const_int;
    strcpy(dopn->id, sopn.id);
    dopn->address = sopn.address;
    dopn->kind = sopn.kind;
    dopn->status = sopn.status;
    dopn->no_ris = sopn.no_ris;
}

//构成新的变量结点。
struct opn *gen_opn(struct opn pre_opn)
{
    struct opn *tmp_opn = (struct opn *)malloc(sizeof(struct opn));
    tmp_opn->kind = pre_opn.kind;
    tmp_opn->type = pre_opn.type;
    tmp_opn->level = pre_opn.level;
    tmp_opn->offset = pre_opn.offset;
    tmp_opn->address = pre_opn.address;
    tmp_opn->kind = pre_opn.kind;
    tmp_opn->status = pre_opn.status;
    tmp_opn->no_ris = pre_opn.no_ris;
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

//构造新的临时符号并插入sT。
void mksymt()
{
    init();
    strcpy(glo_tmp_type, "int");
    strcpy(glo_name, newTemp()), glo_paramnum = -1, glo_flag = 'T', glo_init_sym = 0, glo_size.const_int = 4;
    mksym(&sT, glo_name, glo_level, glo_tmp_type, glo_paramnum, glo_alias, glo_flag, glo_offset, glo_init_sym, glo_int_val, glo_float_val, glo_size);
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

/*----------------------------------打印最终代码相关函数实现区----------------------------*/
void printOpn1(struct opn topn)
{

    switch (topn.type)
    {
    case 'v':
        fprintf(fp, "\t%s", topn.id);
        break;
    case 'i':
        fprintf(fp, "\t#%d", topn.const_int);
        break;
    case 'f':
        fprintf(fp, "\t#%f", topn.const_float);
        break;
    case 'c':
        fprintf(fp, "\t%c", topn.const_char);
        break;
    default:
        fprintf(fp, "\t空变量");
    }
}
void printOpn2(struct opn topn)
{

    switch (topn.type)
    {
    case 'v':
        fprintf(fp, "%s", topn.id);
        break;
    case 'i':
        fprintf(fp, "#%d", topn.const_int);
        break;
    case 'f':
        fprintf(fp, "#%f", topn.const_float);
        break;
    case 'c':
        fprintf(fp, "%c", topn.const_char);
        break;
    default:
        fprintf(fp, "空变量");
    }
}
//打印一条IR；
void printIR(codenode *h)
{

    if (h->op == IR_LABEL || h->op == IR_FUNCTION)
    {
        fprintf(fp, "\n"), printOpn2(h->opn1), fprintf(fp, ":"); //遇到标签或函数定义先加空行，增强可读性；
    }

    else
    {
        fprintf(fp, "\t%s", IR_op_strs[h->op]);
        if (h->op == IR_EXP_ARROFF)
        {
            printOpn1(h->result), fprintf(fp, ",\t["), printOpn2(h->opn1), fprintf(fp, ", "), printOpn2(h->opn2), fprintf(fp, "]");
        }
        else if (h->op == IR_ARROFF_EXP)
        {
            printOpn1(h->result), fprintf(fp, ",\t["), printOpn2(h->opn1), fprintf(fp, ", "), printOpn2(h->opn2), fprintf(fp, "]");
        }
        else if (h->op < IR_ADD)
        {
            printOpn1(h->opn1), printOpn1(h->opn2);
        }
        else if (h->op < IR_GOTO_NOT)
        {
            printOpn1(h->opn1), printOpn1(h->opn2), printOpn1(h->result);
        }
        else if (h->op < IR_FUNCTION)
        {
            printOpn1(h->opn1), printOpn1(h->result);
        }
        else if (h->op < IR_ARG)
        {

            printOpn1(h->opn1);
        }
        else
        {
            printOpn1(h->result);
        }
    }
    fprintf(fp, "\n");

} //特判全部的跳转语句打印出label的标识。TODO
//打印某结点的中间代码。

void DisplayIR(struct codenode *C)
{

    strcpy(tmp_name, strtok(filename, "."));
    char tmp_name2[] = "../test/fcl_out/";
    char tmp_name3[36];
    strcpy(tmp_name3, strcat(tmp_name, ".fcl"));
    strcpy(out_file, strcat(tmp_name2, tmp_name3));
    fp = fopen(out_file, "w");
    int i = 0;
    codenode *ir = C, *head = ir;

    if (ir != &null_ir)
        for (i = 0; 1; i++)
        {
            printIR(ir);
            if (ir->next == head)
                break;
            ir = ir->next;
        }

    fclose(fp);
}

/*--------------------------------模块化各类代码生成的函数实现区-------------------------------*/
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

//语法树结点上添加一条新标签代码；
void add_label_IR(char *a, struct node *T)
{
    initOpn(&glo_opn1);
    glo_opn1.type = 'v', glo_opn1.offset = sT.index, glo_opn1.level = glo_level, strcpy(glo_opn1.id, a);
    glo_opn1.kind = 'L';
    // glo_opn1.address = sT.symbols[glo_opn1.offset].offset.const_int;
    T->code = merge(2, T->code, mkIR(IR_LABEL));
}

//语法树结点上添加一条新转移代码；
void add_goto_IR(char *a, struct node *T, struct opn *O, int type)
{
    switch (type)
    {
    case 1:
    {
        initOpn(&glo_opn1), copyOpn(&glo_opn1, *O); //设置第一个变量。
        initOpn(&glo_opn2);
        glo_opn2.type = 'i', glo_opn2.offset = -1, glo_opn2.level = glo_level, glo_opn2.const_int = 1;
        initOpn(&glo_res); //设置第二个变量。
        glo_res.type = 'v', glo_res.offset = sT.index, glo_res.level = glo_level, strcpy(glo_res.id, a);
        //设置第三个变量。
        glo_res.address = 0;
        glo_res.kind = 'L';

        T->code = merge(2, T->code, mkIR(IR_GOTO_EQ)); //生成代码；
        break;
    }
    case 0:
    {
        initOpn(&glo_opn1);
        glo_opn1.type = 'v', glo_opn1.offset = sT.index, glo_opn1.level = glo_level, strcpy(glo_opn1.id, a);
        glo_opn1.kind = 'L';

        T->code = merge(2, T->code, mkIR(IR_GOTO));
        break;
    }
    case 3:
    {

        mksymt();
        initOpn(&glo_res);
        strcpy(glo_res.id, glo_name), glo_res.type = 'v', glo_res.level = glo_level, glo_res.offset = sT.index - 1;
        //构造结果变量代码结点。
        glo_res.address = sT.symbols[glo_res.offset].offset.const_int;
        glo_res.kind = sT.symbols[glo_res.offset].flag;

        copyOpn(&glo_opn1, *O);
        T->code = merge(2, T->code, mkIR(IR_NOT));

        initOpn(&glo_opn1), copyOpn(&glo_opn1, glo_res); //设置第一个变量。
        initOpn(&glo_opn2);
        glo_opn2.type = 'i', glo_opn2.offset = -1, glo_opn2.level = glo_level, glo_opn2.const_int = 1;
        initOpn(&glo_res); //设置第二个变量。
        glo_res.type = 'v', glo_res.offset = sT.index, glo_res.level = glo_level, strcpy(glo_res.id, a);
        //设置第三个变量。
        glo_res.address = sT.symbols[glo_res.offset].offset.const_int;
        glo_res.kind = sT.symbols[glo_res.offset].flag;

        T->code = merge(2, T->code, mkIR(IR_GOTO_EQ)); //生成代码；
        break;
    }
    }
}

//语法树结点上添加一条计算代码；（辅助数组调用和定义时计算一维偏移）
void add_cal_IR(int type, struct node *T, struct opn *O1, struct opn *O2, int tmp_size)
{

    if (type == 1 || type == 3 || type == 4)
        copyOpn(&glo_opn2, *O2);

    mksymt();

    if (type > 2)
    {
        initOpn(&glo_res);
        strcpy(glo_res.id, glo_name), glo_res.type = 'v', glo_res.level = glo_level, glo_res.offset = sT.index - 1;
        //构造结果变量代码结点。
        glo_res.address = sT.symbols[glo_res.offset].offset.const_int;
        glo_res.kind = sT.symbols[glo_res.offset].flag;
    }
    else
    {
        initOpn(&glo_opn1);
        strcpy(glo_opn1.id, glo_name), glo_opn1.type = 'v', glo_opn1.level = glo_level, glo_opn1.offset = sT.index - 1;
        glo_opn1.address = sT.symbols[glo_opn1.offset].offset.const_int;
        glo_opn1.kind = glo_flag;

        //构造opn1变量代码结点。
    }

    if (type > 3)
        copyOpn(&glo_opn1, *O1);
    if (type == 2 || type == 5)
        glo_opn2.type = 'i', glo_opn2.offset = -1, glo_opn2.level = glo_level, glo_opn2.const_int = type == 2 ? tmp_size : 1;
    IR_op x[6] = {IR_ASSIGN, IR_ASSIGN, IR_ASSIGN, IR_MUL, IR_ADD, IR_JGE};
    T->code = merge(2, T->code, mkIR(x[type]));
}

//语法树结点上添加一条load代码；
void add_load_IR(struct opn *O, struct node *T)
{

    mksymt();
    // sT.symbols[fT.funcs[fT.top - 1]].size.const_int += glo_size.const_int;
    // DisplaySymbolTable(sT);
    initOpn(&glo_res);
    strcpy(glo_res.id, glo_name), glo_res.type = 'v', glo_res.level = glo_level, glo_res.offset = sT.index - 1;
    glo_res.address = sT.symbols[glo_res.offset].offset.const_int;
    glo_res.kind = sT.symbols[glo_res.offset].flag;

    //构造结果变量代码结点。
    copyOpn(&glo_opn1, *O);
    T->code = merge(2, T->code, mkIR(IR_LOAD));
    copyOpn(O, glo_res);
}

//语法树结点检查并添加一条load代码；
void check_load(struct node *T, struct opn *O)
{
    if ((O->type == 'v') && (sT.symbols[find(O->id)].flag == 'V' || sT.symbols[find(O->id)].flag == 'P'))
    {

        if (sT.symbols[find(O->id)].status == 0)
        {
            sT.symbols[find(O->id)].status = 1, sT.symbols[find(O->id)].no_ris = no_tmp;

            add_load_IR(O, T);
        }
        else
        {
            char tmp[5];
            sprintf(tmp, "t%d", sT.symbols[find(O->id)].no_ris);
            O->type = 'v', strcpy(O->id, tmp);
            O->kind = 'T';
        }
    }
    else if (O->type == 'i' || O->type == 'f')
    {
        add_cal_IR(1, T, NULL, O, 0);
        copyOpn(O, glo_opn1);
    }

    // load
}

//语法树结点上添加一条alloca代码；
void add_alloca_IR(int type, struct node *T, char *a, struct opn *O)
{
    initOpn(&glo_res);
    glo_res.type = 'v', strcpy(glo_res.id, a), glo_res.offset = sT.index - 1, glo_res.level = glo_level;
    glo_res.address = sT.symbols[glo_res.offset].offset.const_int;
    glo_res.kind = sT.symbols[glo_res.offset].flag;

    if (type == 0)
        glo_opn1.type = 'i', glo_opn1.const_int = 4, glo_opn1.offset = -1, glo_opn1.level = glo_level;
    else
        copyOpn(&glo_opn1, *O);
    T->code = merge(2, T->code, mkIR(IR_ALLOCA));
}

//语法树结点上生成数组初始化相关代码（只能ExpDes型结点可调用生成，其他不能调用）；
void add_initarr_IR(struct node *out_T, struct node *in_T)
{
    if (in_T)
    {
        switch (in_T->kind)
        {
        case EXP_DES:
        {
            add_initarr_IR(out_T, in_T->ptr[0]);
            break;
        }
        case EXP_LIST:
        {
            add_initarr_IR(out_T, in_T->ptr[0]);
            add_initarr_IR(out_T, in_T->ptr[1]);
            break;
        }
        default:
        {
            check_load(out_T, &in_T->out);
            copyOpn(&glo_res, in_T->out);

            strcpy(glo_opn1.id, out_T->ptr[0]->ptr[1]->type_id), glo_opn1.type = 'v', glo_opn1.level = glo_level, glo_opn1.offset = sT.index;
            glo_opn1.address = sT.symbols[glo_opn1.offset].offset.const_int;
            glo_opn1.kind = 'A';

            copyOpn(&glo_opn2, in_T->length);

            out_T->code = merge(2, out_T->code, mkIR(IR_ARROFF_EXP));
            copyOpn(&avT.arr[avT.top].val[in_T->length.const_int], in_T->out);
            avT.arr[avT.top].lim = in_T->length.const_int + 1;
            // printIR(mkIR(IR_ARROFF_EXP));
            break;
        }
            //逐个生成数组初始化变量赋值语句；
        }
    }
}

/*---------------------------------语义计算优化-------------------------------------*/
//常量运算直接计算出最终结果；
void int_cal(struct opn *O1, struct opn *O2, struct node *T)
{

    T->out.type = 'i';
    switch ((int)T->kind)
    {

    case AND:

        T->out.const_int = O1->const_int && O2->const_int;
        break;
    case OR:
        T->out.const_int = O1->const_int || O2->const_int;
        break;
    case RELOP:
    {
        if (strcmp(T->type_id, "<") == 0)
            T->out.const_int = O1->const_int < O2->const_int;
        if (strcmp(T->type_id, "<=") == 0)
            T->out.const_int = O1->const_int <= O2->const_int;
        if (strcmp(T->type_id, ">") == 0)
            T->out.const_int = O1->const_int > O2->const_int;
        if (strcmp(T->type_id, ">=") == 0)
            T->out.const_int = O1->const_int >= O2->const_int;
        if (strcmp(T->type_id, "==") == 0)
            T->out.const_int = O1->const_int == O2->const_int;
        if (strcmp(T->type_id, "!=") == 0)
            T->out.const_int = O1->const_int != O2->const_int;
        break;
    }
    case ADD:

        T->out.const_int = O1->const_int + O2->const_int;

        break;
    case MINUS:
        T->out.const_int = O1->const_int - O2->const_int;
        break;
    case MUL:
        T->out.const_int = O1->const_int * O2->const_int;
        break;
    case DIV:
        T->out.const_int = O1->const_int / O2->const_int;
        break;
    case MOD:
        T->out.const_int = O1->const_int % O2->const_int;
        break;
    }
}

void float_cal(struct opn *O1, struct opn *O2, struct node *T)
{

    T->out.type = 'f';
    switch ((int)T->kind)
    {

    case AND:
        T->out.const_float = O1->const_float && O2->const_float;
        break;
    case OR:
        T->out.const_float = O1->const_float || O2->const_float;
        break;
    case RELOP:
    {
        if (strcmp(T->type_id, "<") == 0)
            T->out.const_float = O1->const_float < O2->const_float;
        if (strcmp(T->type_id, "<=") == 0)
            T->out.const_float = O1->const_float <= O2->const_float;
        if (strcmp(T->type_id, ">") == 0)
            T->out.const_float = O1->const_float > O2->const_float;
        if (strcmp(T->type_id, ">=") == 0)
            T->out.const_float = O1->const_float >= O2->const_float;
        if (strcmp(T->type_id, "==") == 0)
            T->out.const_float = O1->const_float == O2->const_float;
        if (strcmp(T->type_id, "!=") == 0)
            T->out.const_float = O1->const_float != O2->const_float;
        break;
    }
    case ADD:
        T->out.const_float = O1->const_float + O2->const_float;
        break;
    case MINUS:
        T->out.const_float = O1->const_float - O2->const_float;
        break;
    case MUL:
        T->out.const_float = O1->const_float * O2->const_float;
        break;
    case DIV:
        T->out.const_float = O1->const_float / O2->const_float;
        break;
    case MOD:
        T->out.const_float = int(O1->const_float) % int(O2->const_float);
        break;
    }
}

/*----------------------------------给目标代码生成的支持函数--------------------------*/
void copyTsym(int f_index)
{
    int i;
    for (i = f_index; i < sT.index; i++)
    {
        if (sT.symbols[i].flag == 'T')
        {
            fsT.st[fsT.top].Tsyms[fsT.st[fsT.top].top].type = strcmp(sT.symbols[i].type, "int") == 0 ? 'i' : 'f';
            fsT.st[fsT.top].Tsyms[fsT.st[fsT.top].top].status = 0;
            strcpy(fsT.st[fsT.top].Tsyms[fsT.st[fsT.top].top].name, sT.symbols[i].name);
            fsT.st[fsT.top].top++;
        }
    }
    fsT.top++;
}

void mkfsT()
{
    // printf("aaaaaaaaaaaaaaaa %d ~ %d\n", fT.funcs[fT.top - 1], sT.index);
    copyTsym(fT.funcs[fT.top - 1]);
    sT.symbols[fT.funcs[fT.top - 1]].val_index = fsT.top - 1;
}

void display_fsT()
{
    int i, j;
    for (i = 0; i < fsT.top; i++)
    {
        printf("%d:\n------------------------------------------------------\n", i);
        for (j = 0; j < fsT.st[i].top; j++)
        {
            printf("\t%d", j);
            printf("\t%s", fsT.st[i].Tsyms[j].name);
            printf("\t%c", fsT.st[i].Tsyms[j].type);
            printf("\t伪寄存器分配状态： %d", fsT.st[i].Tsyms[j].status);
            printf("\t对应寄存器： r%d", fsT.st[i].Tsyms[j].no_ris);
            printf("\t对应栈地址： 0x%d", fsT.st[i].Tsyms[j].address);
            printf("\n");
        }
        printf("\n------------------------------------------------------\n");
    }
}

/*--------------------------------------功能主体-----------------------------------------*/
//遍历语法树流程控制符号表维护，生成IR。
void gen_IR(struct node *T)
{
    int i = 1;
    struct node *T0;
    if (T)
    {
        T->code = &null_ir;
        switch ((int)T->kind)
        {

        //框架区；·
        case EXT_DEF_LIST:
        {
            displayIR_sym++;
            if (displayIR_sym == 1)
                add_lib();
            symbol_scope_TX.TX[symbol_scope_TX.top] = 0;
            symbol_scope_TX.top++;
            glo_level = 0;
            gen_IR(T->ptr[0]); //显示该外部定义列表中的第一个
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            gen_IR(T->ptr[1]); //显示该外部定义列表中的其它外部定义
            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);
            glo_err = 1;
            if (displayIR_sym == 1 && glo_err == 1)
            {
                out_IR = T->code;
                display_fsT();
            }
            displayIR_sym--;
            break;
        }
        case EXP_STMT:
        {
            // printf("表达式语句：\n");
            assign_sym = 1;
            gen_IR(T->ptr[0]);

            if (T->ptr[0])
            {
                T->code = merge(2, T->code, T->ptr[0]->code);
                // check_load(T, &T->ptr[0]->out);
            }

            assign_sym = 0;
            break;
        }
        case COMP_STM:
        {
            if (T->ptr[0])
            {
                // printf("复合语句: \n");
                glo_level++;
                if (strstr(T->fun_end, ".L") != 0)
                    strcpy(T->ptr[0]->fun_end, T->fun_end);
                symbol_scope_TX.TX[symbol_scope_TX.top] = sT.index;
                symbol_scope_TX.top++;
                if (T->ptr[0] && check_process(2, T, *T))
                {
                    strcpy(T->ptr[0]->while_head, T->while_head), strcpy(T->ptr[0]->while_true, T->while_true), strcpy(T->ptr[0]->while_tail, T->while_tail);
                }
                gen_IR(T->ptr[0]);
                if (T->ptr[0])
                    T->code = merge(2, T->code, T->ptr[0]->code);
                // printf("comp_stm_type: %d\n", comp_stm_type);
                if (comp_stm_type > 0)
                    mkfsT();
                //  display_fsT();
                glo_level--;
                symbol_scope_TX.top--;
                // int old_index = sT.index;
                // // sT.index = symbol_scope_TX.TX[symbol_scope_TX.top - 1];
                // if (sT.index != old_index)
                // {
                // }
            }
            else
            {
                if (comp_stm_type > 0)
                    mkfsT();
                // printf("空复合语句\n");
            }
            break;
        }
        case STM_DEF_LIST:
        {
            int old_comp_stm_type = comp_stm_type;
            if (T->ptr[0] && check_process(2, T, *T))
            {
                strcpy(T->ptr[0]->while_head, T->while_head), strcpy(T->ptr[0]->while_true, T->while_true), strcpy(T->ptr[0]->while_tail, T->while_tail);
            }
            if (T->ptr[0] && strstr(T->fun_end, ".L") != 0)
                strcpy(T->ptr[0]->fun_end, T->fun_end);
            if (T->ptr[0]->kind == COMP_STM)
                comp_stm_type = 0;
            gen_IR(T->ptr[0]); //显示第一条语句
            comp_stm_type = old_comp_stm_type;
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            if (T->ptr[1] && check_process(2, T, *T))
            {
                strcpy(T->ptr[1]->while_head, T->while_head), strcpy(T->ptr[1]->while_true, T->while_true), strcpy(T->ptr[1]->while_tail, T->while_tail);
            }
            if (T->ptr[1] && strstr(T->fun_end, ".L") != 0)
                strcpy(T->ptr[1]->fun_end, T->fun_end);
            gen_IR(T->ptr[1]); //显示剩下语句
            if (T->ptr[1] != NULL)
            {
                T->code = merge(2, T->code, T->ptr[1]->code);
            }
            break;
        }

        //基本类型与基本运算区；
        case TYPE:
        case VOID:
        {
            // printf("类型: %s\n", T->type_id);
            if (void_func_sym == 0 && strcmp(T->type_id, "void") == 0)
                void_func_sym = 1;
            strcpy(glo_type, T->type_id);
            glo_tmp_type = strcat(glo_type, "");
            break;
        }
        case NODE_ID:
        {
            // printf("ID： %s\n", T->type_id);
            check_val_id(T->type_id, glo_level, T->pos, glo_type, glo_int_val, glo_float_val);
            //检查表达式是否存在未初始化问题。
            strcpy(glo_name, T->type_id);
            T->out = *gen_opn(glo_res);

            break;
        }
        case INT:
        {
            // printf("INT：%d\n", T->type_int);
            initOpn(&T->out);
            T->out.type = 'i', T->out.level = glo_level, T->out.offset = -1, T->out.const_int = T->type_int;

            break;
        }
        case FLOAT:
        {
            // printf("FLAOT：%f\n", T->type_float);
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
            int lint = 0, rint = 0;
            char tmp_label[36];
            strcpy(tmp_label, newLabel());

            // printf("%s\n", T->type_id);
            if ((int)T->kind == (int)ASSIGN)
            {
                assign_sym = -1;
                check_process(1, T->ptr[0], *T);
            }

            if ((int)T->kind != (int)ASSIGN)
            {
                assign_sym = 1;
            }
            gen_IR(T->ptr[0]); //赋值（运算）号的左值表达式；
            lint = check_int(T->ptr[0]->out);

            assign_sym = 1;
            gen_IR(T->ptr[1]); //赋值（运算）号的右值表达式；
            rint = check_int(T->ptr[1]->out);
            //常量计算；
            if ((int)T->kind != (int)ASSIGN && (T->ptr[0]->out.type != 'v' || (sT.symbols[find(T->ptr[0]->out.id)].flag == 'C' && sT.symbols[find(T->ptr[0]->out.id)].flag1 != 'A')) && (T->ptr[1]->out.type != 'v' || (sT.symbols[find(T->ptr[1]->out.id)].flag == 'C' && sT.symbols[find(T->ptr[1]->out.id)].flag1 != 'A')))
            {

                if (check_int(T->ptr[0]->out) && check_int(T->ptr[1]->out))
                {

                    int_cal(&T->ptr[0]->out, &T->ptr[1]->out, T);
                }
                else
                {

                    float_cal(&T->ptr[0]->out, &T->ptr[1]->out, T);
                }

                break;
            }

            if ((int)T->kind != (int)ASSIGN)
            {
                check_load(T, &T->ptr[0]->out);
                copyOpn(&glo_opn1, glo_res);
            }

            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);

            if ((int)T->kind == (int)AND)
            {
                add_goto_IR(tmp_label, T, &T->ptr[0]->out, 3);
                T->out = T->ptr[0]->out;
            }
            else if ((int)T->kind == (int)OR)
            {
                add_goto_IR(tmp_label, T, &T->ptr[0]->out, 1);
                T->out = T->ptr[0]->out;
            }

            check_load(T, &T->ptr[1]->out);
            copyOpn(&glo_opn2, glo_res);

            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);
            initOpn(&glo_opn2);
            copyOpn(&glo_opn2, T->ptr[1]->out);

            check_cal_type(*T);
            sT.symbols[find(T->ptr[0]->type_id)].init_sym = 1;
            //不考虑执行失败的情况，只要作为左值运算过，即认为已初始化TODO。

            if ((int)T->kind == (int)ASSIGN)
            {
                if (check_cal_type(*T) == 2 || check_cal_type(*T) == 4)
                {
                    copyOpn(&glo_opn2, T->ptr[0]->out);
                    copyOpn(&glo_opn1, T->ptr[1]->out);
                    glo_res.type = 'v', glo_res.offset = find(T->ptr[0]->type_id), glo_res.level = glo_level, strcpy(glo_res.id, T->ptr[0]->type_id);
                    glo_res.address = sT.symbols[glo_res.offset].offset.const_int;
                    glo_res.kind = sT.symbols[glo_res.offset].flag;

                    //构造结果变量代码结点。
                    T->code = merge(2, T->code, mkIR(IR_ARROFF_EXP));
                }
                else
                {
                    if ((T->ptr[1]->out.type == 'i' || T->ptr[1]->out.type == 'f') && (T->ptr[0]->out.kind == 'P' || T->ptr[0]->out.kind == 'V'))
                    {
                        add_cal_IR(1, T, NULL, &T->ptr[1]->out, 0);
                        copyOpn(&glo_opn2, glo_opn1);
                    }
                    initOpn(&glo_opn1);
                    copyOpn(&glo_opn1, T->ptr[0]->out);
                    copyOpn(&T->out, T->ptr[0]->out);

                    T->code = merge(2, T->code, mkIR(IR_ASSIGN));
                }
            }
            else
            {

                initOpn(&glo_opn1);
                copyOpn(&glo_opn1, T->ptr[0]->out);
                lint = check_int(glo_opn1);

                mksymt();
                //插入临时变量。

                initOpn(&glo_res);
                strcpy(glo_res.id, glo_name), glo_res.type = 'v', glo_res.level = glo_level, glo_res.offset = sT.index - 1;
                glo_res.address = sT.symbols[glo_res.offset].offset.const_int;
                glo_res.kind = sT.symbols[glo_res.offset].flag;

                copyOpn(&T->out, glo_res);

                //构造结点变量代码结点。
                T->code = merge(2, T->code, mkIR(get_OpType(*T)));
            }

            if ((int)T->kind == (int)OR || (int)T->kind == (int)AND)
            {

                add_label_IR(tmp_label, T);
            }
            break;
        }
        case NOT:
        case UMINUS:
        {
            // printf("%s\n", T->type_id);
            gen_IR(T->ptr[0]);
            check_load(T, &T->ptr[0]->out);

            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            //插入临时变量。
            mksymt();
            initOpn(&glo_res);
            strcpy(glo_res.id, glo_name), glo_res.type = 'v', glo_res.level = glo_level, glo_res.offset = sT.index - 1;
            glo_res.address = sT.symbols[glo_res.offset].offset.const_int;
            glo_res.kind = sT.symbols[glo_res.offset].flag;

            //构造结果变量代码结点。
            copyOpn(&glo_opn1, T->ptr[0]->out);
            copyOpn(&T->out, glo_res);
            T->code = merge(2, T->code, mkIR(IR_NOT));
            break;
        }
        case SELF_ADD_EXP:
        {
            // printf("后置自增: \n");
            // printf("变量: %s\n", T->type_id);
            break;
        }
        case SELF_MINUS_EXP:
        {
            // printf("后置自减: \n");
            // printf("变量: %s\n", T->type_id);
            break;
        }

        //变量定义区；
        case VAR_DEC:
        {
            //有初始化的值的变量；
            if (!T->ptr[1])
            {

                // printf("变量名: %s\n", T->type_id);

                if (T->ptr[0])
                {
                    // printf("它的初值:\n");
                    glo_init_sym = (int)T->ptr[0]->kind == (int)INT ? 1 : 2;
                    (int)T->ptr[0]->kind == (int)INT ? glo_int_val = T->ptr[0]->type_int : glo_float_val = T->ptr[0]->type_float;
                    assign_sym = 1;
                    gen_IR(T->ptr[0]); //表达式初值
                    if (T->ptr[0])
                        T->code = merge(2, T->code, T->ptr[0]->code);
                    T->out = T->ptr[0]->out;
                    glo_flag = 'V';
                    glo_tmp_type = strcat(glo_type, "");
                    strcpy(glo_name, T->type_id);
                    assign_sym = 0;
                }
            }
            //有初始化值的数组；
            else
            {
                int tmp_num = 0;

                int tmp_para = glo_paramnum;
                int tmp_size = glo_size.const_int;
                gen_IR(T->ptr[1]); //进入term

                if (T->ptr[0])
                {
                    T->ptr[0]->depth.type = T->ptr[0]->length.type = 'i';
                    T->ptr[0]->length.const_int = 0;
                    T->ptr[0]->depth.const_int = 1;

                    glo_des[glo_D - 1] = 1;
                    for (int k = glo_D - 2; k > -1; k--)
                    {
                        glo_des[k] = glo_des[k + 1] * glo_arr_lim[k + 1].const_int;
                    }
                    des_top = glo_D;
                    // printf("它的初值:\n");
                    glo_init_sym = (int)T->ptr[0]->kind == (int)INT ? 1 : 2;
                    (int)T->ptr[0]->kind == (int)INT ? glo_int_val = T->ptr[0]->type_int : glo_float_val = T->ptr[0]->type_float;
                    assign_sym = 1;
                    gen_IR(T->ptr[0]); //表达式初值
                    if (T->ptr[0])
                        T->code = merge(2, T->code, T->ptr[0]->code);
                    glo_flag = 'A';
                    strcpy(glo_name, T->ptr[1]->type_id);
                    assign_sym = 0;
                }
                gen_IR(T->ptr[1]); //进入term
                if (T->ptr[1])
                {
                    T->code = merge(2, T->code, T->ptr[1]->code);
                    copyOpn(&T->out, T->ptr[1]->out);
                } // ing
                glo_paramnum = tmp_para;
                glo_size.const_int = tmp_size;
                glo_size.type = 'i';
            }

            break;
        }
        case VAR_DEF:
        {
            // printf("局部变量定义: \n");
            init();
            glo_flag = 'V', glo_paramnum = -1;
            gen_IR(T->ptr[0]); //显示变量类型
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            // printf("定义的变量:\n");
            assign_sym = 0;
            gen_IR(T->ptr[1]); //显示该定义的全部变量名
            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);
            break;
        }
        case DEC_LIST:
        {
            gen_IR(T->ptr[0]);
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            if (check_val_id(glo_name, glo_level, T->pos, glo_type, glo_int_val, glo_float_val))
            {

                glo_size.const_int = 4;
                //
                glo_size.type = 'i';
                if (glo_flag == 'A')
                {
                    glo_paramnum = mkarr(glo_arr_lim, glo_D);
                    glo_size.const_int = arr_size(glo_paramnum).const_int * 4;
                    glo_size.type = 'i';
                    mksym(&sT, glo_name, glo_level, glo_type, glo_paramnum, glo_alias, glo_flag, glo_offset, glo_init_sym, glo_int_val, glo_float_val, glo_size); //局部变量入表
                    sT.symbols[sT.index - 1].status = 0, sT.symbols[sT.index - 1].no_ris = 0;
                    add_alloca_IR(1, T, glo_name, &glo_size);

                    int tmp_num = 0;
                    struct node *T0;
                    if ((int)T->ptr[0]->kind == VAR_DEC && T->ptr[0]->ptr[1])
                    {
                        T0 = T->ptr[0]->ptr[0]->ptr[0];
                        add_initarr_IR(T, T0);
                    } //初始化赋值语句；
                    avT.top++;
                }
                else
                {
                    mksym(&sT, glo_name, glo_level, glo_type, glo_paramnum, glo_alias, glo_flag, glo_offset, glo_init_sym, glo_int_val, glo_float_val, glo_size); //局部变量入表
                    sT.symbols[sT.index - 1].status = 0, sT.symbols[sT.index - 1].no_ris = 0;
                    if (glo_flag == 'A')
                    {

                        add_alloca_IR(0, T, glo_name, NULL);
                    }
                    else if (glo_flag != 'F' && glo_flag != 'T')
                    {
                        add_alloca_IR(0, T, glo_name, NULL);
                    }
                }

                sT.symbols[fT.funcs[fT.top - 1]].size.const_int += glo_size.const_int;
                if ((int)T->ptr[0]->kind == VAR_DEC && !(T->ptr[0]->ptr[1]))
                {
                    check_load(T, &T->ptr[0]->ptr[0]->out);
                    glo_opn1.type = 'v', strcpy(glo_opn1.id, T->ptr[0]->type_id), glo_opn1.offset = sT.index - 1, glo_opn1.level = glo_level;
                    glo_opn1.address = sT.symbols[glo_opn1.offset].offset.const_int;
                    glo_opn1.kind = 'V';

                    copyOpn(&glo_opn2, T->ptr[0]->ptr[0]->out);
                    T->code = merge(2, T->code, mkIR(IR_ASSIGN));
                }
            }
            //插入新局部变量入符号表。

            gen_IR(T->ptr[1]);
            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);

            break;
        }
        case TERM:
        {
            int tmp_D = glo_D;
            int tmp_assign_sym = assign_sym;
            int i, aTindex;
            struct opn tmp_out, tmp_size;
            node *T0 = T->ptr[0];
            if (T->ptr[0])
            {
                // printf("数组: "); printf("%s\n", T->type_id);

                //数组作为右值时进行初始化检查。
                if (tmp_assign_sym == 1)
                {
                    // check_array_id(T->type_id, glo_level, T->pos, "int(", "");
                    //数组初始化检查TODO；
                }

                gen_IR(T->ptr[0]);
                if (T->ptr[0])
                    T->code = merge(2, T->code, T->ptr[0]->code);

                //数组调用时生成代码；
                if (tmp_assign_sym != 0)
                {
                    check_process(4, NULL, *T); //使用流程检查检查数组下标超限问题；
                    aTindex = sT.symbols[find(T->type_id)].paramnum;

                    initOpn(&glo_opn1), initOpn(&glo_opn2);
                    if (iT.indexs[iT.top - 1].type != 'v')
                        add_cal_IR(1, T, NULL, &(iT.indexs[iT.top - 1]), 0);
                    else
                    {
                        check_load(T, &iT.indexs[iT.top - 1]);
                        copyOpn(&glo_opn1, iT.indexs[iT.top - 1]);
                    }

                    copyOpn(&tmp_out, glo_opn1);
                    copyOpn(&tmp_size, aT.arrs[aTindex].lim[glo_D - 1]);
                    if (glo_D == 1)
                        copyOpn(&glo_res, glo_opn1);
                    else
                        for (i = glo_D - 2; i > -1; i--)
                        {
                            add_cal_IR(1, T, NULL, &tmp_size, -1);

                            add_cal_IR(3, T, NULL, &(iT.indexs[i]), 0);

                            add_cal_IR(4, T, &tmp_out, &glo_res, 0);
                            copyOpn(&tmp_out, glo_res);
                            if (i > 0)
                                glo_res.const_int = tmp_size.const_int * aT.arrs[aTindex].lim[i].const_int, glo_res.type = 'i';
                            copyOpn(&tmp_size, glo_res);
                        }

                    iT.top = 0;
                }

                //数组定义时生成代码；
                if (tmp_assign_sym == 0)
                {
                    char tmp_name[36];
                    char tmp_flag = glo_flag;

                    strcpy(tmp_name, glo_name);

                    initOpn(&glo_opn1), initOpn(&glo_opn2);

                    copyOpn(&glo_opn1, iT.indexs[iT.top - 1]);

                    copyOpn(&tmp_out, glo_opn1);
                    copyOpn(&glo_arr_lim[iT.top - 1], tmp_out);

                    for (i = glo_D - 2; i > -1; i--)
                    {
                        copyOpn(&glo_arr_lim[i], iT.indexs[i]);
                        if (i < glo_D - 2)
                            copyOpn(&glo_opn1, glo_res);
                        tmp_out.const_int = iT.indexs[i].const_int * glo_res.const_int;
                    }
                    iT.top = 0;
                    copyOpn(&T->out, tmp_out);
                    strcpy(glo_name, tmp_name);
                    glo_flag = tmp_flag;
                    strcpy(glo_name, T->type_id);

                    if (strcmp(glo_type, "int") == 0 || strcmp(glo_type, "float") == 0)
                    {
                        glo_tmp_type = strcat(glo_type, "");
                        glo_flag = 'A';
                    }
                }
                array_in_sym = 0;
                if (tmp_assign_sym == -1)
                {
                    copyOpn(&T->out, glo_res);
                    //左值表达式返回索引值。
                }
                else if (tmp_assign_sym == 1)
                {
                    copyOpn(&glo_opn2, glo_res);

                    glo_opn1.type = 'v', glo_opn1.offset = find(T->type_id), glo_opn1.level = glo_level, strcpy(glo_opn1.id, T->type_id);
                    glo_opn1.address = sT.symbols[glo_opn1.offset].offset.const_int;
                    glo_opn1.kind = sT.symbols[glo_opn1.offset].flag;

                    //插入临时变量。
                    mksymt();
                    initOpn(&glo_res);
                    strcpy(glo_res.id, glo_name), glo_res.type = 'v', glo_res.level = glo_level, glo_res.offset = sT.index - 1;
                    glo_res.address = sT.symbols[glo_res.offset].offset.const_int;
                    glo_res.kind = sT.symbols[glo_res.offset].flag;

                    //构造结果变量代码结点。

                    T->code = merge(2, T->code, mkIR(IR_EXP_ARROFF));
                    copyOpn(&T->out, glo_res);
                    glo_flag = 'A';
                }
            }
            else
            {
                gen_IR(T->ptr[0]);
                // printf("ID: "), printf("%s\n", T->type_id);
                if (tmp_assign_sym != 0)
                {

                    check_val_id(T->type_id, glo_level, T->pos, glo_type, glo_int_val, glo_float_val);
                }

                //判断单个符号是否重复或存在未初始化问题。
                if (tmp_assign_sym == 0)
                {
                    glo_flag = 'V';
                    glo_tmp_type = strcat(glo_type, "");
                    strcpy(glo_name, T->type_id);
                }

                if (T->ptr[0])
                    T->code = merge(2, T->code, T->ptr[0]->code);
                initOpn(&glo_res);
                glo_res.type = 'v', strcpy(glo_res.id, T->type_id), glo_res.level = glo_level, glo_res.offset = find(T->type_id);
                glo_res.address = sT.symbols[glo_res.offset].offset.const_int;
                glo_res.kind = sT.symbols[glo_res.offset].flag;

                copyOpn(&T->out, glo_res);
                if (sT.symbols[find(T->type_id)].flag == 'C')
                {
                    T->out.type = 'i';
                    T->out.const_int = sT.symbols[find(T->type_id)].int_val;
                }
            }
            assign_sym = tmp_assign_sym;
            // glo_D = tmp_D;
            break;
        }
        case ARRAYS:
        {
            T0 = T;
            i = 1;
            char index_type[36] = "";
            while (T0 != NULL)
            {
                i++;
                // printf("第%d维: \n", i);

                array_in_sym = 1;

                gen_IR(T0->ptr[0]);

                if (T0->ptr[0])
                {
                    T->code = merge(2, T->code, T0->ptr[0]->code);
                    check_load(T, &T0->ptr[0]->out);
                }

                if (T0->ptr[0]->kind == (int)INT || T0->ptr[0]->kind == (int)FLOAT)
                {
                    copyOpn(&glo_arr_lim[i - 2], T->ptr[0]->out);
                    strcpy(index_type, T0->ptr[0]->kind == (int)INT ? "int" : "float");
                }
                else
                {
                    copyOpn(&glo_arr_lim[i - 2], T->ptr[0]->out);
                    if (find(T0->ptr[0]->out.id) > -1)
                    {
                        strcpy(index_type, sT.symbols[find(T0->ptr[0]->out.id)].type);
                    }
                }
                check_array_id(T->type_id, glo_level, T->pos, (char *)"int", index_type);
                //检查数组下标为整数。
                copyOpn(&iT.indexs[iT.top], T0->ptr[0]->out), iT.top++;
                T0 = T0->ptr[1];
            }
            glo_D = i - 1;

            break;
        }
        //初始化相关；
        case EXP_LIST:
        {

            copyOpn(&T->ptr[0]->length, T->length);
            copyOpn(&T->ptr[0]->depth, T->depth);

            int tmp_para = glo_paramnum, tmp_size = glo_size.const_int;
            int ass_num = 0;
            struct node *hT = T;
            i = 1;

            gen_IR(T->ptr[0]);
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            if ((int)T->ptr[0]->kind != EXP_DES)
                copyOpn(&T->out, T->ptr[0]->out);

            if (T->ptr[1])
            {

                if ((int)T->ptr[0]->kind != EXP_DES)
                {
                    copyOpn(&T->ptr[1]->length, T->length);
                    T->ptr[1]->length.const_int++;
                }

                else if ((int)T->ptr[0]->kind == EXP_DES)
                {

                    int i;
                    int tmp_d = -1;
                    for (i = des_top - 1; i > -1; i--)
                    // {
                    {
                        tmp_d = T->length.const_int % glo_des[i] == 0 ? glo_des[i] : tmp_d;
                    }

                    copyOpn(&T->ptr[1]->length, T->length);
                    T->ptr[1]->length.const_int += tmp_d;
                }
            }
            gen_IR(T->ptr[1]);
            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);
            glo_paramnum = tmp_para;
            glo_size.const_int = tmp_size;
            glo_size.type = 'i';
            break;
        }
        case EXP_DES:
        {

            if (T->ptr[0])
            {

                copyOpn(&T->ptr[0]->depth, T->depth);
                T->ptr[0]->depth.const_int++;
                copyOpn(&T->ptr[0]->length, T->length);
            }

            gen_IR(T->ptr[0]);
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);

            break;
        }
        //常变量定义相关；
        case CONST_VAR_DEC:
        {

            if (!T->ptr[1])
            {

                // printf("变量名: %s\n", T->type_id);

                if (T->ptr[0])
                {

                    // printf("它的初值:\n");
                    glo_init_sym = (int)T->ptr[0]->kind == (int)INT ? 1 : 2;
                    (int)T->ptr[0]->kind == (int)INT ? glo_int_val = T->ptr[0]->type_int : glo_float_val = T->ptr[0]->type_float;
                    assign_sym = 1;
                    gen_IR(T->ptr[0]); //表达式初值
                    if (T->ptr[0])
                        T->code = merge(2, T->code, T->ptr[0]->code);
                    T->out = T->ptr[0]->out;
                    glo_flag = 'C';
                    ;
                    glo_tmp_type = strcat(glo_type, "");
                    strcpy(glo_name, T->type_id);
                    assign_sym = 0;
                }
            }
            else
            {
                int tmp_num = 0;
                int tmp_para = glo_paramnum;
                int tmp_size = glo_size.const_int;
                gen_IR(T->ptr[1]); //进入term
                if (T->ptr[0])
                {

                    T->ptr[0]->depth.type = T->ptr[0]->length.type = 'i';
                    T->ptr[0]->length.const_int = 0;
                    T->ptr[0]->depth.const_int = 1;

                    glo_des[glo_D - 1] = 1;
                    for (int k = glo_D - 2; k > -1; k--)
                    {
                        glo_des[k] = glo_des[k + 1] * glo_arr_lim[k + 1].const_int;
                    }
                    des_top = glo_D;

                    // printf("它的初值:\n");
                    glo_init_sym = (int)T->ptr[0]->kind == (int)INT ? 1 : 2;
                    (int)T->ptr[0]->kind == (int)INT ? glo_int_val = T->ptr[0]->type_int : glo_float_val = T->ptr[0]->type_float;
                    assign_sym = 1;
                    gen_IR(T->ptr[0]); //表达式初值
                    if (T->ptr[0])
                        T->code = merge(2, T->code, T->ptr[0]->code);
                    glo_flag = 'A';
                    strcpy(glo_name, T->ptr[1]->type_id);
                    assign_sym = 0;
                }
                gen_IR(T->ptr[1]); //进入term
                if (T->ptr[1])
                {
                    T->code = merge(2, T->code, T->ptr[1]->code);
                    copyOpn(&T->out, T->ptr[1]->out);
                } // ing
                glo_paramnum = tmp_para;
                glo_size.const_int = tmp_size;
                glo_size.type = 'i';
            }

            break;
        }
        case CONST_VAR_DEF:
        {
            init();
            glo_flag = 'V', glo_paramnum = -1;
            gen_IR(T->ptr[0]); //显示变量类型
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            // printf("定义的变量:\n");
            assign_sym = 0;
            gen_IR(T->ptr[1]); //显示该定义的全部变量名
            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);

            break;
        }
        case CONST_DEC_LIST:
        {
            gen_IR(T->ptr[0]);
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            if (check_val_id(glo_name, glo_level, T->pos, glo_type, glo_int_val, glo_float_val))
            {

                glo_size.const_int = 4;
                //
                glo_size.type = 'i';
                if (glo_flag == 'A')
                {

                    glo_paramnum = mkarr(glo_arr_lim, glo_D);
                    glo_size.const_int = arr_size(glo_paramnum).const_int * 4;
                    glo_size.type = 'i';
                    mksym(&sT, glo_name, glo_level, glo_type, glo_paramnum, glo_alias, glo_flag, glo_offset, glo_init_sym, glo_int_val, glo_float_val, glo_size);
                    sT.symbols[sT.index - 1].flag = 'C', sT.symbols[sT.index - 1].flag1 = 'A';

                    add_alloca_IR(1, T, glo_name, &glo_size);

                    struct node *T0;
                    if ((int)T->ptr[0]->kind == CONST_VAR_DEC && T->ptr[0]->ptr[1])
                    {
                        T0 = T->ptr[0]->ptr[0]->ptr[0];
                        add_initarr_IR(T, T0);
                    } //初始化赋值语句；
                    for (int i = 0; i < avT.arr[avT.top].lim; i++)
                    {
                        avT.arr[avT.top].val[i].type = 'i';
                    }
                    avT.top++;
                    // DisplaySymbolTable(sT);
                }
                else
                {
                    mksym(&sT, glo_name, glo_level, glo_type, glo_paramnum, glo_alias, glo_flag, glo_offset, glo_init_sym, glo_int_val, glo_float_val, glo_size); //局部变量入表
                    sT.symbols[sT.index - 1].flag = 'C', sT.symbols[sT.index - 1].flag1 = 'T';

                    if (glo_flag == 'A')
                    {

                        add_alloca_IR(0, T, glo_name, NULL);
                    }
                    else if (glo_flag != 'F' && glo_flag != 'T')
                    {
                        add_alloca_IR(0, T, glo_name, NULL);
                    }
                }

                sT.symbols[fT.funcs[fT.top - 1]].size.const_int += glo_size.const_int;
                if ((int)T->ptr[0]->kind == CONST_VAR_DEC && !(T->ptr[0]->ptr[1]))
                {
                    check_load(T, &T->ptr[0]->ptr[0]->out);
                    glo_opn1.type = 'v', strcpy(glo_opn1.id, T->ptr[0]->type_id), glo_opn1.offset = sT.index - 1, glo_opn1.level = glo_level;
                    glo_opn1.address = sT.symbols[glo_opn1.offset].offset.const_int;
                    glo_opn1.kind = glo_flag;
                    copyOpn(&glo_opn2, T->ptr[0]->ptr[0]->out);
                    T->code = merge(2, T->code, mkIR(IR_ASSIGN));
                }
            }
            //插入新局部变量入符号表。

            gen_IR(T->ptr[1]);
            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);

            break;
        }
        case CONST_TERM:
        {
            int tmp_D = glo_D;
            int tmp_assign_sym = assign_sym;
            int i, aTindex;
            struct opn tmp_out, tmp_size;
            node *T0 = T->ptr[0];
            if (T->ptr[0])
            {
                // printf("数组: "); printf("%s\n", T->type_id);

                //数组作为右值时进行初始化检查。
                if (tmp_assign_sym == 1)
                {
                    // check_array_id(T->type_id, glo_level, T->pos, "int(", "");
                    //数组初始化检查TODO；
                }

                gen_IR(T->ptr[0]);
                if (T->ptr[0])
                    T->code = merge(2, T->code, T->ptr[0]->code);

                //数组调用时生成代码；
                if (tmp_assign_sym != 0)
                {

                    check_process(4, NULL, *T); //使用流程检查检查数组下标超限问题；
                    aTindex = sT.symbols[find(T->type_id)].paramnum;

                    initOpn(&glo_opn1), initOpn(&glo_opn2);
                    if (iT.indexs[iT.top - 1].type != 'v')
                        add_cal_IR(1, T, NULL, &(iT.indexs[iT.top - 1]), 0);
                    else
                    {
                        // if (sT.symbols[find(T->type_id)].flag != 'C' || sT.symbols[find(T->type_id)].flag1 == 'A')
                        //     add_load_IR(&iT.indexs[iT.top - 1], T);
                        copyOpn(&glo_opn1, iT.indexs[iT.top - 1]);
                    }

                    copyOpn(&tmp_out, glo_opn1);
                    copyOpn(&tmp_size, aT.arrs[aTindex].lim[glo_D - 1]);

                    for (i = glo_D - 2; i > -1; i--)
                    {
                        add_cal_IR(1, T, NULL, &tmp_size, -1);

                        add_cal_IR(3, T, NULL, &(iT.indexs[i]), 0);

                        add_cal_IR(4, T, &tmp_out, &glo_res, 0);
                        copyOpn(&tmp_out, glo_res);
                        if (i > 0)
                            glo_res.const_int = tmp_size.const_int * aT.arrs[aTindex].lim[i].const_int, glo_res.type = 'i';
                        copyOpn(&tmp_size, glo_res);
                    }
                    iT.top = 0;
                }
                //数组定义时生成代码；
                if (tmp_assign_sym == 0)
                {
                    char tmp_name[36];
                    char tmp_flag = glo_flag;

                    strcpy(tmp_name, glo_name);

                    initOpn(&glo_opn1), initOpn(&glo_opn2);

                    copyOpn(&glo_opn1, iT.indexs[iT.top - 1]);

                    copyOpn(&tmp_out, glo_opn1);
                    copyOpn(&glo_arr_lim[iT.top - 1], tmp_out);

                    for (i = glo_D - 2; i > -1; i--)
                    {
                        copyOpn(&glo_arr_lim[i], iT.indexs[i]);
                        if (i < glo_D - 2)
                            copyOpn(&glo_opn1, glo_res);
                        tmp_out.const_int = iT.indexs[i].const_int * glo_res.const_int;
                    }
                    iT.top = 0;
                    copyOpn(&T->out, tmp_out);
                    strcpy(glo_name, tmp_name);
                    glo_flag = tmp_flag;
                    strcpy(glo_name, T->type_id);

                    if (strcmp(glo_type, "int") == 0 || strcmp(glo_type, "float") == 0)
                    {
                        glo_tmp_type = strcat(glo_type, "");
                        glo_flag = 'A';
                    }
                }
                array_in_sym = 0;
                if (tmp_assign_sym == -1)
                {
                    copyOpn(&T->out, glo_res);
                    //左值表达式返回索引值。
                }
                else if (tmp_assign_sym == 1)
                {
                    copyOpn(&glo_opn2, glo_res);

                    glo_opn1.type = 'v', glo_opn1.offset = find(T->type_id), glo_opn1.level = glo_level, strcpy(glo_opn1.id, T->type_id);
                    glo_opn1.address = sT.symbols[glo_opn1.offset].offset.const_int;
                    glo_opn1.kind = sT.symbols[glo_opn1.offset].flag;

                    //插入临时变量。
                    mksymt();
                    initOpn(&glo_res);
                    strcpy(glo_res.id, glo_name), glo_res.type = 'v', glo_res.level = glo_level, glo_res.offset = sT.index - 1;
                    glo_res.address = sT.symbols[glo_res.offset].offset.const_int;
                    glo_res.kind = sT.symbols[glo_res.offset].flag;

                    //构造结果变量代码结点。

                    T->code = merge(2, T->code, mkIR(IR_EXP_ARROFF));
                    copyOpn(&T->out, glo_res);
                    glo_flag = 'A';
                }
            }
            else
            {
                gen_IR(T->ptr[0]);
                // printf("ID: "), printf("%s\n", T->type_id);
                if (tmp_assign_sym != 0)
                {

                    check_val_id(T->type_id, glo_level, T->pos, glo_type, glo_int_val, glo_float_val);
                }

                //判断单个符号是否重复或存在未初始化问题。
                if (tmp_assign_sym == 0)
                {
                    glo_flag = 'V';
                    glo_tmp_type = strcat(glo_type, "");
                    strcpy(glo_name, T->type_id);
                }

                if (T->ptr[0])
                    T->code = merge(2, T->code, T->ptr[0]->code);
                initOpn(&glo_res);
                glo_res.type = 'v', strcpy(glo_res.id, T->type_id), glo_res.level = glo_level, glo_res.offset = find(T->type_id);
                glo_res.address = sT.symbols[glo_res.offset].offset.const_int;
                glo_res.kind = sT.symbols[glo_res.offset].flag;

                copyOpn(&T->out, glo_res);
            }
            assign_sym = tmp_assign_sym;
            // glo_D = tmp_D;
            break;
        }

        //流程控制区；
        case WHILE:
        {
            int old_comp_stm_type = comp_stm_type;

            // printf("循环语句：\n");
            strcpy(T->while_head, newLabel()), strcpy(T->while_true, newLabel()), strcpy(T->while_tail, newLabel());

            // printf("循环条件：\n");

            //打循环判断前标签。
            add_label_IR(T->while_head, &(*T));

            assign_sym = 1;
            gen_IR(T->ptr[0]); //显示循环条件

            check_load(T, &T->ptr[0]->out);
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);

            //判断跳转;

            add_goto_IR(T->while_true, T, &(T->ptr[0]->out), 1);
            add_goto_IR(T->while_tail, T, NULL, 0);

            // printf("循环体：\n");

            //打循环进入标签。
            add_label_IR(T->while_true, &(*T));

            if (T->ptr[1])
            {
                strcpy(T->ptr[1]->while_head, T->while_head), strcpy(T->ptr[1]->while_true, T->while_true), strcpy(T->ptr[1]->while_tail, T->while_tail);
            }
            if (T->ptr[1] && strstr(T->fun_end, ".L") != 0)
                strcpy(T->ptr[1]->fun_end, T->fun_end);
            if (T->ptr[1]->kind == COMP_STM)
                comp_stm_type = 0;
            gen_IR(T->ptr[1]); //显示循环体
            comp_stm_type = old_comp_stm_type;

            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);
            loop_sym = 0;

            add_goto_IR(T->while_head, T, NULL, 0);

            //打循环结束标签
            add_label_IR(T->while_tail, &(*T));

            break;
        }
        case FOR_STMT:
        {
            int old_comp_stm_type = comp_stm_type;

            // printf("for 循环语句: \n");
            strcpy(T->while_head, newLabel()), strcpy(T->while_true, newLabel()), strcpy(T->while_tail, newLabel());

            gen_IR(T->ptr[0]);
            if (T->ptr[0]->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->ptr[0]->code);
            //前置句。

            //打循环判断前标签。
            add_label_IR(T->while_head, &(*T));

            if (T->ptr[0]->ptr[1])
                T->code = merge(2, T->code, T->ptr[0]->ptr[1]->code);
            //判断句。

            add_goto_IR(T->while_true, T, &(T->ptr[0]->ptr[1]->out), 1);

            add_goto_IR(T->while_tail, T, NULL, 0);
            //跳转句。

            // printf("循环体: \n");

            //打循环进入标签。
            add_label_IR(T->while_true, &(*T));

            loop_sym = 1;

            if (T->ptr[1])
            {
                strcpy(T->ptr[1]->while_head, T->while_head), strcpy(T->ptr[1]->while_true, T->while_true), strcpy(T->ptr[1]->while_tail, T->while_tail);
            }
            if (T->ptr[1] && strstr(T->fun_end, ".L") != 0)
                strcpy(T->ptr[1]->fun_end, T->fun_end);
            if (T->ptr[1]->kind == COMP_STM)
                comp_stm_type = 0;
            gen_IR(T->ptr[1]);
            comp_stm_type = old_comp_stm_type;

            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);

            if (T->ptr[0]->ptr[2])
                T->code = merge(2, T->code, T->ptr[0]->ptr[2]->code);

            //循环跳转语句
            add_goto_IR(T->while_head, T, NULL, 0);

            //打循环结束标签
            add_label_IR(T->while_tail, &(*T));

            loop_sym = 0;

            break;
        }
        case FOR_ARGS:
        {
            // printf("for 循环起始表达式: \n");
            if (T->ptr[0])
            {
                gen_IR(T->ptr[0]);
            }
            else
            {
                // printf("无\n");
            }
            // printf("for 循环条件表达式: \n");
            if (T->ptr[1])
            {
                assign_sym = 1;
                gen_IR(T->ptr[1]);
            }
            else
            {
                // printf("无\n");
            }
            // printf("for 循环第三表达式: \n");
            if (T->ptr[2])
            {
                gen_IR(T->ptr[2]);
            }
            else
            {
                // printf("无\n");
            }
            break;
        }
        case IF_THEN:
        {
            int old_comp_stm_type = comp_stm_type;

            // printf("条件语句(IF_THEN)：\n");
            // printf("条件：\n");
            strcpy(T->Etrue, newLabel()), strcpy(T->Snext, newLabel());

            gen_IR(T->ptr[0]); //显示条件
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);

            check_load(T, &T->ptr[0]->out);

            add_goto_IR(T->Etrue, T, &(T->ptr[0]->out), 1);

            add_goto_IR(T->Snext, T, NULL, 0);

            //打then进入标签。
            add_label_IR(T->Etrue, &(*T));

            // printf("IF子句：\n");
            if (T->ptr[1] && check_process(2, T, *T))
            {
                strcpy(T->ptr[1]->while_head, T->while_head), strcpy(T->ptr[1]->while_true, T->while_true), strcpy(T->ptr[1]->while_tail, T->while_tail);
            } //递归加循环标签。
            if (T->ptr[1] && strstr(T->fun_end, ".L") != 0)
                strcpy(T->ptr[1]->fun_end, T->fun_end);
            if (T->ptr[1]->kind == COMP_STM)
                comp_stm_type = 0;
            gen_IR(T->ptr[1]); //显示if子句
            comp_stm_type = old_comp_stm_type;

            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);

            //打跳过进入标签。
            add_label_IR(T->Snext, &(*T));

            break;
        }
        case IF_THEN_ELSE:
        {
            int old_comp_stm_type = comp_stm_type;

            // printf("条件语句(IF_THEN_ELSE)：\n");
            // printf("条件：\n");
            strcpy(T->Etrue, newLabel()), strcpy(T->Efalse, newLabel()), strcpy(T->Snext, newLabel());

            gen_IR(T->ptr[0]); //显示条件

            check_load(T, &T->ptr[0]->out);

            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);

            //判断跳转语句
            add_goto_IR(T->Etrue, T, &(T->ptr[0]->out), 1);
            add_goto_IR(T->Efalse, T, NULL, 0);

            // printf("IF子句：\n");
            if (T->ptr[1] && check_process(2, T, *T))
            {
                strcpy(T->ptr[1]->while_head, T->while_head), strcpy(T->ptr[1]->while_true, T->while_true), strcpy(T->ptr[1]->while_tail, T->while_tail);
            }

            //打then进入标签。
            add_label_IR(T->Etrue, &(*T));
            if (T->ptr[1] && strstr(T->fun_end, ".L") != 0)
                strcpy(T->ptr[1]->fun_end, T->fun_end);
            if (T->ptr[1]->kind == COMP_STM)
                comp_stm_type = 0;
            gen_IR(T->ptr[1]); //显示if子句
            comp_stm_type = old_comp_stm_type;

            if (T->ptr[1])
                T->code = merge(2, T->code, T->ptr[1]->code);
            add_goto_IR(T->Snext, T, NULL, 0);
            // printf("ELSE子句：\n");
            if (T->ptr[2] && check_process(2, T, *T))
            {
                strcpy(T->ptr[2]->while_head, T->while_head), strcpy(T->ptr[2]->while_true, T->while_true), strcpy(T->ptr[2]->while_tail, T->while_tail);
            }

            //打else进入标签。
            add_label_IR(T->Efalse, &(*T));
            if (T->ptr[2] && strstr(T->fun_end, ".L") != 0)
                strcpy(T->ptr[2]->fun_end, T->fun_end);
            if (T->ptr[2]->kind == COMP_STM)
                comp_stm_type = 0;

            gen_IR(T->ptr[2]); //显示else子句
            comp_stm_type = old_comp_stm_type;

            if (T->ptr[2])
                T->code = merge(2, T->code, T->ptr[2]->code);

            //打Snext进入标签。
            add_label_IR(T->Snext, &(*T));

            break;
        }
        case CONTINUE_STMT:
        {
            // printf("继续语句\n");
            if (!check_process(2, T, *T))
            {
                printf("%s:%d ", filename, T->pos);
                printf("continue statement not within a loop\n");
                glo_err = 0;
            }
            else
            {
                add_goto_IR(T->while_head, T, NULL, 0);
            }
            break;
        }
        case BREAK_STMT:
        {
            // printf("打断语句\n");
            if (!check_process(3, T, *T))
            {
                printf("%s:%d ", filename, T->pos);
                printf("break statement not within a loop\n");
                glo_err = 0;
            }
            else
            {

                add_goto_IR(T->while_tail, T, NULL, 0);
            }
            break;
        }

        //函数区；
        case FUNC_DEF:
        {

            strcpy(T->fun_end, newLabel());

            // printf("函数定义：\n");
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
            strcpy(T->ptr[2]->fun_end, T->fun_end);
            no_tmp = 0, no_par = 0;
            comp_stm_type = 1;
            gen_IR(T->ptr[2]); //显示函数体
            func_state = -1;
            if (T->ptr[2])
                T->code = merge(2, T->code, T->ptr[2]->code);

            void_func_sym = -1;
            int old_index = sT.index;
            sT.index = symbol_scope_TX.TX[symbol_scope_TX.top - 1];
            symbol_scope_TX.top--;

            initOpn(&glo_opn1);
            glo_opn1.type = 'v', strcpy(glo_opn1.id, T->ptr[1]->type_id), glo_opn1.level = glo_level, glo_opn1.offset = sT.index - 1;
            glo_opn1.address = sT.symbols[glo_opn1.offset].offset.const_int;
            glo_opn1.kind = sT.symbols[glo_opn1.offset].flag;

            copyOpn(&T->out, glo_opn1);
            T->code = merge(2, mkIR(IR_FUNCTION), T->code);
            add_label_IR(T->fun_end, T);
            glo_opn1.type = 'v', strcpy(glo_opn1.id, T->ptr[1]->type_id), glo_opn1.offset = sT.index - 1, glo_opn1.level = glo_level;
            glo_opn1.address = sT.symbols[glo_opn1.offset].offset.const_int;
            glo_opn1.kind = sT.symbols[glo_opn1.offset].flag;

            T->code = merge(2, T->code, mkIR(IR_FUNC_END));
            break;
        }
        case FUNC_DEC:
        {
            // printf("函数名：%s\n", T->type_id);
            strcpy(glo_name, T->type_id);
            func_state = 0;
            if (T->ptr[0])
            {
                // printf("函数形参：\n");
                glo_paramnum = 0;

                if (check_func_id(glo_name, glo_level, T->pos, glo_type, glo_paramnum))
                {
                    sT.index++;
                    glo_tmp_type = strcat(glo_type, "(");
                    gen_IR(T->ptr[0]); //显示函数参数列表
                    if (T->ptr[0])
                        T->code = merge(2, T->code, T->ptr[0]->code);
                    glo_tmp_type = strcat(glo_type, ")");
                    glo_size.const_int = DX;
                    glo_size.type = 'i';
                    glo_flag = 'F';
                    sT.index = sT.index - glo_paramnum - 1;
                    mksym(&sT, glo_name, glo_level, glo_tmp_type, glo_paramnum, glo_alias, glo_flag, glo_offset, 0, 0, 0, glo_size);

                    if (ceil(glo_paramnum / (float)2) == 0)
                        sT.symbols[sT.index - 1].size.const_int = 12;
                    else if (ceil(glo_paramnum / (float)2) == 1)
                        sT.symbols[sT.index - 1].size.const_int = 28;
                    else if (ceil(glo_paramnum / (float)2) == 2)
                        sT.symbols[sT.index - 1].size.const_int = 44;
                    else
                    {
                        sT.symbols[sT.index - 1].size.const_int = ceil(glo_paramnum / (float)2) * 8 + 28;
                    }

                    sT.index = sT.index + glo_paramnum; //函数入符号表；
                }
            }
            else
            {
                // printf("无参函数\n");
                glo_paramnum = 0;
                glo_flag = 'F';
                glo_tmp_type = strcat(glo_type, "(void)");
                if (check_func_id(glo_name, glo_level, T->pos, glo_tmp_type, glo_paramnum))
                {
                    glo_size.const_int = DX;
                    glo_size.type = 'i';
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

                        // sT.symbols[fT.funcs[fT.top - 1]].size.const_int += 4;
                        //动态维护函数活动空间大小。
                        initOpn(&glo_opn1);
                        glo_opn1.type = 'v', strcpy(glo_opn1.id, sT.symbols[sT.index - 1].name), glo_opn1.level = glo_level, glo_opn1.offset = sT.index - 1;
                        glo_opn1.address = sT.symbols[glo_opn1.offset].offset.const_int;
                        glo_opn1.kind = sT.symbols[glo_opn1.offset].flag;

                        T->code = merge(2, T->code, mkIR(IR_PARAM));
                        //构造形参代码。
                        if (sT.symbols[fT.funcs[fT.top - 1]].flag == 'A')
                            add_alloca_IR(1, T, sT.symbols[sT.index - 1].name, &sT.symbols[sT.index - 1].size);
                        else
                            add_alloca_IR(0, T, sT.symbols[sT.index - 1].name, NULL);
                    }
                    // DisplaySymbolTable(sT);
                }
                sT.index--;
            }
            else
            {
                // DisplaySymbolTable(sT);
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
            int tmp_paramnum;
            char index_type[36];
            // printf("类型：%s, 参数名：%s\n", T->ptr[0]->type == (int)INT ? "int" : "float", T->ptr[1]->type_id);
            char tmp_type1[36];
            strcpy(tmp_type1, T->ptr[0]->type == (int)INT ? "int" : "float");
            glo_size.const_int = 4;
            glo_size.type = 'i';
            if (glo_paramnum == 0)
            {
                sT.symbols[sT.index - 1].flag = 'F', strcpy(sT.symbols[sT.index - 1].name, "");
                glo_offset.const_int = 12, glo_offset.type = 'i';
            } //首参清除预留函数位置的过时数据。
            glo_flag = 'P';
            if (T->ptr[1]->ptr[0])
            {
                glo_flag = 'A';
                node *T0 = T->ptr[1]->ptr[0]->ptr[1]; // T0是ARRAYS结点

                while (T0 != NULL)
                {
                    i++;
                    // printf("第%d维: \n", i);
                    array_in_sym = 1;
                    gen_IR(T0->ptr[0]);

                    if (T0->ptr[0])
                    {
                        check_load(T, &T->ptr[0]->out);
                        T->code = merge(2, T->code, T0->ptr[0]->code);
                    }

                    if (T0->ptr[0]->kind == (int)INT || T0->ptr[0]->kind == (int)FLOAT)
                    {
                        copyOpn(&glo_arr_lim[i - 1], T->ptr[0]->out);

                        strcpy(index_type, T0->ptr[0]->kind == (int)INT ? "int" : "float");
                    }
                    else
                    {

                        if (find(T0->ptr[0]->out.id) > -1)
                        {
                            strcpy(index_type, sT.symbols[find(T0->ptr[0]->out.id)].type);
                        }
                    }

                    check_array_id(T->type_id, glo_level, T->pos, (char *)"int", index_type);
                    T0 = T0->ptr[1];
                }
                glo_D = i;

                tmp_paramnum = mkarr(glo_arr_lim, glo_D);
                glo_size.const_int = arr_size(tmp_paramnum).const_int * 4;
            }

            glo_offset.const_int = glo_paramnum;
            mksym(&sT, T->ptr[1]->type_id, glo_level + 1, tmp_type1, tmp_paramnum, glo_alias, glo_flag, glo_offset, T->ptr[0]->type == (int)INT ? 1 : 2, glo_int_val, glo_float_val, glo_size);
            sT.symbols[sT.index - 1].status = 0, sT.symbols[sT.index - 1].no_ris = 0;
            //添加形参入符号表，当前假定无默认值。

            glo_tmp_type = glo_paramnum == 0 ? strcat(glo_tmp_type, T->ptr[0]->type == (int)INT ? "int" : "float") : strcat(glo_tmp_type, T->ptr[0]->type == (int)INT ? ",int" : ",float");
            glo_paramnum++;
            break;
        }
        case RETURN:
        {
            if (T->ptr[0])
            {
                // printf("返回语句：\n");
                assign_sym = 1;
                if (void_func_sym == 1)
                    check_func_id((char *)"", glo_level, T->pos, (char *)"int(", -2);
                gen_IR(T->ptr[0]);

                if (T->ptr[0])
                    T->code = merge(2, T->code, T->ptr[0]->code);
                check_load(T, &T->ptr[0]->out);

                // initOpn(&glo_res);
                // copyOpn(&glo_res, T->ptr[0]->out);
                // T->code = merge(2, T->code, mkIR(IR_RETURN));
                copyOpn(&glo_opn2, T->ptr[0]->out);
                glo_opn1.type = 'v', strcpy(glo_opn1.id, "r0");
                glo_opn1.kind = 'R';

                T->code = merge(2, T->code, mkIR(IR_ASSIGN));
            }
            else
            {
                if (void_func_sym == 0)
                    check_func_id((char *)"", glo_level, T->pos, (char *)"int(", -1);
                // printf("空返回语句\n");
                // initOpn(&glo_res);
                // glo_res.type = 'c';
                // glo_res.const_char = '\0';
                // //返回字符常量空表示空返回语句。
                // T->code = merge(2, T->code, mkIR(IR_RETURN));
            }

            add_goto_IR(T->fun_end, T, NULL, 0);
            break;
        }
        case FUNC_CALL:
        {
            // printf("函数调用：\n");

            // printf("函数名：%s\n", T->type_id);
            func_state = -1, num_in_para = 0;
            gen_IR(T->ptr[0]);
            if (T->ptr[0])
                T->code = merge(2, T->code, T->ptr[0]->code);
            check_func_id(T->type_id, glo_level, T->pos, (char *)"int(", num_in_para);

            char tmp_type[36], *re_type;
            strcpy(tmp_type, sT.symbols[find(T->type_id)].type);
            re_type = strtok(tmp_type, "(");
            if (strcmp(re_type, "void") == 0)
            {
                T->out.type = 'c', T->out.const_char = '\0';
                initOpn(&glo_res);
                glo_res.type = 'v', glo_res.offset = find(T->type_id), glo_res.level = glo_level, strcpy(glo_res.id, T->type_id);
                glo_res.address = sT.symbols[glo_res.offset].offset.const_int;
                glo_res.kind = sT.symbols[glo_res.offset].flag;

                T->code = merge(2, T->code, mkIR(IR_CALL_VOID));
            }
            else
            {

                initOpn(&glo_opn1);
                glo_opn1.type = 'v', glo_opn1.offset = find(T->type_id), glo_opn1.level = glo_level, strcpy(glo_opn1.id, T->type_id);
                glo_opn1.address = sT.symbols[glo_opn1.offset].offset.const_int;
                glo_opn1.kind = sT.symbols[glo_opn1.offset].flag;

                glo_size.const_int = 4;
                mksym(&sT, newTemp(), glo_level, re_type, glo_paramnum, glo_alias, 'T', glo_offset, 1, glo_int_val, glo_float_val, glo_size);
                // sT.symbols[fT.funcs[fT.top - 1]].size.const_int += glo_size.const_int;

                initOpn(&glo_res);
                glo_res.type = 'v', glo_res.offset = sT.index - 1, glo_res.level = glo_level, strcpy(glo_res.id, sT.symbols[sT.index - 1].name);

                glo_res.address = sT.symbols[glo_res.offset].offset.const_int;
                glo_res.kind = sT.symbols[glo_res.offset].flag;

                copyOpn(&T->out, glo_res);
                T->code = merge(2, T->code, mkIR(IR_CALL));
            }
            func_state = 1;
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
                // printf("第%d个实际参数表达式：\n", i++);
                num_in_para++;

                gen_IR(T0);

                if (T0)
                {

                    hT->code = merge(2, hT->code, T0->code);
                    check_load(hT, &T0->out);

                    // printf("aaaaaaaaaaaaaaaa :%d\n", num_in_para);
                }

                T = T->ptr[1];
            }
            T = hT;
            while (T)
            {
                T0 = T->ptr[0];
                if (T0)
                {
                    initOpn(&glo_res);
                    copyOpn(&glo_res, T0->out);
                    hT->code = merge(2, hT->code, mkIR(IR_ARG));
                }
                T = T->ptr[1];
            }
            break;
        }
        }
    }
}
