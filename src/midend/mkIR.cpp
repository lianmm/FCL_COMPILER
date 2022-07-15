#include "mkIR.h"
using namespace std;

/*-------------------------------中间代码生成标志和公共变量------------------------------------*/

//暂存变量结点信息。
struct opn glo_opn1, glo_opn2, glo_res;

//打印标志。
int displayIR_sym = 0;
struct codenode null_ir;
//左右类型标识。

// label标识。函数头尾，用于调用和返回；未用。
int func_head_LabIn, func_tail_LabIn;
//数组初始化暂存地址计算辅助；
int glo_des[500];
int des_top;
char tmp_name[36];
//输出文件指针；
FILE *fp = NULL;
struct codenode *out_IR;

struct index_table iT;
class if_while_sym iwT;
struct if_whi_top iwtT;

int no_tmp = 0;
int no_lab = 1;
int no_par = 0;
int comp_stm_type = 0;

// void copyTsym(int index);
/*--------------------------------------中间代码构造所需函数实现区-------------------------------------*/

//字符串转化成数字；
int a2i(char *in)
{
    if (in == NULL || in[0] != 't')
        return -1;
    int x = 0, f = 1;
    int i = 0;
    char ch = in[i];
    i++;
    while (ch < '0' || ch > '9')
    {
        if (ch == '-')
            f = -1;
        ch = in[i], i++;
    }
    while (ch >= '0' && ch <= '9')
    {
        x = x * 10 + ch - 48;
        ch = in[i], i++;
    }
    return x * f;
}

int a2i(string in)
{
    if (in == "" || in[0] != 't')
        return -1;
    int x = 0, f = 1;
    int i = 0;
    char ch = in[i];
    i++;
    while (ch < '0' || ch > '9')
    {
        if (ch == '-')
            f = -1;
        ch = in[i], i++;
    }
    while (ch >= '0' && ch <= '9')
    {
        x = x * 10 + ch - 48;
        ch = in[i], i++;
    }
    return x * f;
}

string i2s(int in)
{
    string res = "t";
    res += to_string(in);
    return res;
}

//预处理结点id防止超出字符串静态分配范围；
void split_id(struct node *T)
{
    char tmp_id[36];
    if (sizeof(T->type_id) > 500)
        for (int i = 0; i < 10; i++)
            tmp_id[i] = T->type_id[i];
    tmp_id[10] = '\0', strcpy(T->type_id, tmp_id);
}

/*--------------------------------------基础支持函数实现区--------------------------------------*/
//初始化变量结点；
void initOpn(struct opn *tmp_opn)
{
    tmp_opn->type = ' ';
    tmp_opn->offset = 0;
    tmp_opn->level = 0;
    tmp_opn->const_char = ' ', tmp_opn->const_float = 0, tmp_opn->const_int = 0;
    tmp_opn->id = "0";
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

//构造新的临时符号并插入sT。
void mksymt()
{
    init();
    strcpy(glo_tmp_type, "int");
    strcpy(glo_name, newTemp()), glo_paramnum = -1, glo_flag = 'T', glo_init_sym = 0, glo_size.const_int = 4;
    mksym(&sT, glo_name, glo_level, glo_tmp_type, glo_paramnum, glo_alias, glo_flag, glo_offset, glo_init_sym, glo_int_val, glo_float_val, glo_size);
    if (glo_level > 0)
        (*g_sL.glo_ymT[g_sL.now_func].func_t)[g_sL.last_sym].flage = '0';
    else
        g_sL.glo_ymT[g_sL.last_sym].flage = 'E';
}

//生成一条TAC代码的结点组成的双向循环链表，返回头指针
struct codenode *mkIR(IR_op op)
{

    struct codenode *h = new codenode();
    h->op = op;
    if (h->op == ARM_ITORG)
        ;
    else if (h->op == IR_ARROFF_EXPie)
    {
        h->opn1 = glo_opn1;
        h->result = glo_res;
    }
    else if (h->op == ARM_MOVEQ || h->op == ARM_MOVNE)
    {
        h->opn1 = glo_opn1;
        h->opn2 = glo_opn2;
    }
    else if (h->op < IR_ADD)
    {
        h->opn1 = glo_opn1;
        h->opn2 = glo_opn2;
    }
    else if (h->op < IR_GOTO_NOT)
    {
        h->opn1 = glo_opn1;
        h->opn2 = glo_opn2;
        h->result = glo_res;
    }
    else if (h->op < IR_FUNCTION)
    {
        h->opn1 = glo_opn1;
        h->result = glo_res;
    }
    else if (h->op < IR_ARG)
    {
        h->opn1 = glo_opn1;
    }
    else
    {
        h->result = glo_res;
    }

    h->next = h->prior = h;

    return h;
}

void display_iwT()
{
    int i;
    printf("\tiwiT索引表：\n-----------------------------------------------------------------------\n");
    for (i = 0; i < iwtT.top; i++)
    {
        printf("\t%d\t\n", iwtT.sym_top[i]);
    }
    printf("------------------------------------------------------------\n\t\t变量表:\n");
    printf("------------------------------------------------------------\n");
    for (i = 0; i < iwT.top; i++)
    {
        printf("\t%d\t%s\n", iwT.sym_indexs[i], iwT.sym_name[i].c_str());
    }
    printf("------------------------------------------------------------\n");
}
void displayiT()
{
    int i;
    printf("\tiT数组维度偏移表：\n-----------------------------------------------------------------------\n");
    for (i = 0; i < iT.top; i++)
        printOpn(iT.indexs[i]);
    printf("\n------------------------------------------------------------\n");
}

/*--------------------------------模块化各类代码生成的函数实现区-------------------------------*/
//将语法树上运算结点类型转化成IR结点类型。
enum IR_op get_OpType(struct node T)
{
    enum IR_op ans = IR_ADD;

    switch ((int)T.kind)
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

        break;
    }
    case EQOP:
    {
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
//双向链表的分割；
void split(struct codenode *head1, struct codenode *head2)
{
    struct codenode *tail2 = head1->prior, *tail1 = head2->prior;
    head1->prior = tail1, tail1->next = head1;
    head2->prior = tail2, tail2->next = head2;
}

//语法树结点上添加一条新标签代码；
void add_label_IR(char *a, struct node *T)
{
    initOpn(&glo_opn1);
    glo_opn1.type = 'v', glo_opn1.offset = sT.index, glo_opn1.level = glo_level, glo_opn1.id = a;
    glo_opn1.kind = 'L';

    T->code = merge(2, T->code, mkIR(IR_LABEL));
}

//语法树结点上添加一条新转移代码；
void add_goto_IR(char *a, struct node *T, struct opn *O, int type)
{
    switch (type)
    {
    case 1:
    {
        initOpn(&glo_opn1), glo_opn1 = *O; //设置第一个变量。
        initOpn(&glo_opn2);
        glo_opn2.type = 'i', glo_opn2.offset = -1, glo_opn2.level = glo_level, glo_opn2.const_int = 1;
        initOpn(&glo_res); //设置第二个变量。
        glo_opn2.flage = '0';

        glo_res.type = 'v', glo_res.offset = sT.index, glo_res.level = glo_level, glo_res.id = a;
        //设置第三个变量。

        glo_res.address = 0;
        glo_res.kind = 'L';

        T->code = merge(2, T->code, mkIR(IR_GOTO_EQ)); //生成代码；
        break;
    }
    case 0:
    {
        initOpn(&glo_opn1);
        glo_opn1.type = 'v', glo_opn1.offset = sT.index, glo_opn1.level = glo_level, glo_opn1.id = a;
        glo_opn1.kind = 'L';

        T->code = merge(2, T->code, mkIR(IR_GOTO));
        break;
    }
    case 3:
    {

        initOpn(&glo_opn1), glo_opn1 = glo_res; //设置第一个变量。
        initOpn(&glo_opn2);
        glo_opn2.type = 'i', glo_opn2.offset = -1, glo_opn2.level = glo_level, glo_opn2.const_int = 1;
        initOpn(&glo_res); //设置第二个变量。
        glo_opn2.flage = '0';

        glo_res.type = 'v', glo_res.offset = sT.index, glo_res.level = glo_level, glo_res.id = a;
        //设置第三个变量。

        T->code = merge(2, T->code, mkIR(IR_GOTO_NEQ)); //生成代码；
        break;
    }
    }
}

//语法树结点上添加一条计算代码；（辅助数组调用和定义时计算一维偏移）
void add_cal_IR(int type, struct node *T, struct opn *O1, struct opn O2, int tmp_size)
{

    if (type == 1 || type == 3 || type == 4)
    {
        glo_opn2 = O2;
    }

    mksymt();

    if (type > 2)
    {
        initOpn(&glo_res);
        glo_res.id = glo_name, glo_res.type = 'v', glo_res.level = glo_level, glo_res.offset = sT.index - 1;
        //构造结果变量代码结点。
        glo_res.address = g_sL.find(glo_res.id)->address;
        glo_res.kind = g_sL.find(glo_res.id)->flag;
        glo_res.flage = g_sL.find(glo_res.id)->flage;
    }
    else
    {
        initOpn(&glo_opn1);
        glo_opn1.id = glo_name, glo_opn1.type = 'v', glo_opn1.level = glo_level, glo_opn1.offset = sT.index - 1;
        glo_opn1.kind = glo_flag;
        glo_opn1.address = g_sL.find(glo_name)->offset.const_int;
        glo_opn1.flage = g_sL.find(glo_name)->flage;

        //构造opn1变量代码结点。
    }

    if (type > 3)
        glo_opn1 = *O1;
    if (type == 2 || type == 5)
    {
        glo_opn2.type = 'i', glo_opn2.offset = -1, glo_opn2.level = glo_level, glo_opn2.const_int = type == 2 ? tmp_size : 1;
    }
    glo_opn2.flage = '0';

    IR_op x[6] = {IR_ASSIGN, IR_ASSIGN, IR_ASSIGN, IR_MUL, IR_ADD, IR_JGE};
    T->code = merge(2, T->code, mkIR(x[type]));
}

//语法树结点上添加一条load代码；
void add_load_IR(struct opn *O, struct node *T)
{

    mksymt();

    initOpn(&glo_res);
    glo_res.id = glo_name, glo_res.type = 'v', glo_res.level = glo_level, glo_res.offset = sT.index - 1;

    glo_res.address = g_sL.find(glo_name)->offset.const_int;
    glo_res.flage = g_sL.find(glo_name)->flage;

    glo_res.kind = 'T',
    glo_res.flage = '0';
    // printf("当前装入变量的名称为：%s;地址为：%d\n", glo_res.id, glo_res.address);
    //构造结果变量代码结点。
    glo_opn1 = *O;
    if (O->type == 'v')
    {
        // if (O->id == "p")
        // {
        //     // DisplaySymbolTable(sT), DisplaySymbolTable();

        glo_opn1.flage = g_sL.find(O->id)->flage, glo_opn1.flaga = g_sL.find(O->id)->flagca;
    }
    T->code = merge(2, T->code, mkIR(IR_LOAD));
    *O = glo_res;
}

//语法树结点检查并添加一条load代码；
void check_load(struct node *T, struct opn *O, int type)
{

    if ((O->type == 'v') && (g_sL.find(O->id)->flag == 'V' || g_sL.find(O->id)->flag == 'P'))
    {
        if ((strstr(T->Etrue, ".L") != NULL) || (strstr(T->while_head, ".L") != NULL))
        {
            if (g_sL.find(O->id)->flag != 'T')
            {
                iwT.sym_indexs[iwT.top] = O->offset;
                iwT.sym_name[iwT.top] = g_sL.find(O->id)->name;
                iwT.top++;
            }
        }
        if (g_sL.find(O->id)->status == 0)
        {

            g_sL.find(O->id)->status = 1, g_sL.find(O->id)->no_ris = no_tmp;
            add_load_IR(O, T);
        }
        else if ((strstr(T->while_head, ".L") != NULL))
        {

            g_sL.find(O->id)->status = 1, g_sL.find(O->id)->no_ris = no_tmp;

            add_load_IR(O, T);
        }
        else
        {

            char tmp[5];
            sprintf(tmp, "t%d", g_sL.find(O->id)->no_ris);
            O->type = 'v', O->id = tmp;
            O->kind = 'T';
        }
    }
    if (type == 0 && (O->type == 'i' || O->type == 'f'))
    {
        add_cal_IR(1, T, NULL, *O, 0);
        *O = glo_opn1;
    }
}

//语法树结点上添加一条alloca代码；
void add_alloca_IR(int type, struct node *T, string a, struct opn *O)
{
    initOpn(&glo_res);
    glo_res.type = 'v', glo_res.id = a, glo_res.offset = sT.index - 1, glo_res.level = glo_level;

    glo_res.address = g_sL.find(a)->offset.const_int;
    glo_res.kind = g_sL.find(a)->flag;
    glo_res.flage = g_sL.find(a)->flage;

    if (glo_level == 0 && g_sL.find(a)->flage == 'E')
        glo_res.flage = 'E';
    if (type == 0)
        glo_opn1.type = 'i',
        glo_opn1.const_int = 4, glo_opn1.offset = -1, glo_opn1.level = glo_level, glo_opn1.flage = '0';

    else
        glo_opn1 = *O;
    T->code = merge(2, T->code, mkIR(IR_ALLOCA));
    glo_res.flage = '0';
}

//语法树结点上生成数组初始化相关代码（只能ExpDes型结点可调用生成，其他不能调用）；
void add_initarr_IR(struct node *out_T, struct node *in_T)
{
    if (in_T)
    {
        struct codenode *tmp_c = out_T->code->prior;
        while (tmp_c->op != IR_ALLOCA)
            tmp_c = tmp_c->prior;

        switch ((int)in_T->kind)
        {
        case EXP_DES:
        {
            if (in_T->ptr[0])
            {
                add_initarr_IR(out_T, in_T->ptr[0]);
                struct node *tmp_el = in_T->ptr[0];
                while (tmp_el->ptr[1] != NULL)
                    tmp_el = tmp_el->ptr[1];

                if (tmp_el->length.const_int < in_T->length.const_int + in_T->place - 4 && glo_level > 0 && g_sL.find(tmp_c->result.id)->size.const_int < 200)
                {
                    glo_opn1.id = out_T->ptr[0]->ptr[1]->type_id, glo_opn1.type = 'v', glo_opn1.level = glo_level, glo_opn1.offset = tmp_c->result.offset;
                    // DisplaySymbolTable(sT), DisplaySymbolTable();
                    // cout << glo_opn1.id;
                    glo_opn1.address = g_sL.find(glo_opn1.id)->offset.const_int + g_sL.find(glo_opn1.id)->size.const_int - 4;
                    glo_opn1.flage = g_sL.find(glo_opn1.id)->flage;

                    glo_opn1.kind = 'A';
                    glo_res.type = 'i', glo_res.const_int = tmp_el->length.const_int * 4 + 4;
                    glo_opn2.type = 'i', glo_opn2.const_int = (in_T->length.const_int + in_T->place) * 4;
                    out_T->code = merge(2, out_T->code, mkIR(IR_ARROFF_EXPi0));
                }
            }

            else if (glo_level > 0 && g_sL.find(tmp_c->result.id)->size.const_int < 200)
            {
                glo_opn1.id = out_T->ptr[0]->ptr[1]->type_id, glo_opn1.type = 'v', glo_opn1.level = glo_level, glo_opn1.offset = tmp_c->result.offset;

                glo_opn1.address = g_sL.find(glo_opn1.id)->offset.const_int + g_sL.find(glo_opn1.id)->size.const_int - 4;
                glo_opn1.flage = g_sL.find(glo_opn1.id)->flage;

                glo_opn1.kind = 'A';
                glo_res.type = 'i', glo_res.const_int = in_T->length.const_int * 4;
                glo_opn2.type = 'i', glo_opn2.const_int = (in_T->length.const_int + in_T->place) * 4;
                out_T->code = merge(2, out_T->code, mkIR(IR_ARROFF_EXPi0));
            } //零初始化;

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

            struct codenode *tmp_code = out_T->code->prior;
            if (out_T->code->prior->op == IR_ASSIGN)
                tmp_code = tmp_code->prior;
            if (tmp_code->op == IR_ARROFF_EXPi)
            {
                if (tmp_code->opn2.const_int < in_T->length.const_int * 4 - 4 && glo_level > 0 && g_sL.find(tmp_c->result.id)->size.const_int < 200)
                {
                    glo_opn1.id = out_T->ptr[0]->ptr[1]->type_id, glo_opn1.type = 'v', glo_opn1.level = glo_level, glo_opn1.offset = tmp_c->result.offset;

                    glo_opn1.address = g_sL.find(glo_opn1.id)->offset.const_int + g_sL.find(glo_opn1.id)->size.const_int - 4;
                    glo_opn1.flage = g_sL.find(glo_opn1.id)->flage;

                    glo_opn1.kind = 'A';
                    glo_res.type = 'i', glo_res.const_int = tmp_code->opn2.const_int + 4;
                    glo_opn2.type = 'i', glo_opn2.const_int = in_T->length.const_int * 4;
                    out_T->code = merge(2, out_T->code, mkIR(IR_ARROFF_EXPi0));
                }
            }
            check_load(out_T, &in_T->out, 0);
            glo_res = in_T->out;

            glo_opn1.id = out_T->ptr[0]->ptr[1]->type_id, glo_opn1.type = 'v', glo_opn1.level = glo_level, glo_opn1.offset = tmp_c->result.offset;

            glo_opn1.address = g_sL.find(glo_opn1.id)->offset.const_int + g_sL.find(glo_opn1.id)->size.const_int - 4;
            glo_opn1.flage = g_sL.find(glo_opn1.id)->flage;

            glo_opn1.kind = 'A';
            glo_opn2 = in_T->length;
            glo_opn2.const_int *= 4;
            struct opn tmp_opn;
            tmp_opn = glo_opn1;
            if (glo_opn2.const_int > 4095) //避免超立即数上限问题；
            {
                add_cal_IR(1, out_T, NULL, glo_opn2, 0);
                glo_opn2 = glo_opn1;
            }
            glo_opn1 = tmp_opn;
            out_T->code = merge(2, out_T->code, mkIR(IR_ARROFF_EXPi));

            break;
        }
            //逐个生成数组初始化变量赋值语句；
        }
    }
}

void add_memset0arr_IR(struct node *T)
{
    string arr_id = g_sL.last_sym;
    int tmp_off = g_sL.find(g_sL.last_sym)->size.const_int;
    add_cal_IR(2, T, NULL, glo_opn1, 0);
    glo_res = glo_opn1;
    T->code = merge(2, T->code, mkIR(IR_ARG));
    add_cal_IR(2, T, NULL, glo_opn1, tmp_off);
    glo_res = glo_opn1;
    T->code = merge(2, T->code, mkIR(IR_ARG));
    glo_opn2.type = 'i', glo_opn2.status = 1, glo_opn2.const_int = -(g_sL.find(arr_id)->offset.const_int + g_sL.find(arr_id)->size.const_int - 4);

    glo_opn2.id = g_sL.find(arr_id)->name;
    mksymt();
    glo_opn1.id = glo_name, glo_opn1.type = 'v', glo_opn1.level = glo_level, glo_opn1.offset = sT.index - 1;
    glo_opn1.address = g_sL.find(glo_opn1.id)->offset.const_int;
    glo_opn1.kind = g_sL.find(glo_opn1.id)->flag;
    glo_opn1.flage = g_sL.find(glo_opn1.id)->flage;

    T->code = merge(2, T->code, mkIR(IR_ASSIGN));
    struct opn tmp_opn2;
    tmp_opn2.type = 'v', tmp_opn2.kind = 'T', tmp_opn2.status = 2, tmp_opn2.no_ris = 11;
    add_cal_IR(4, T, &glo_opn1, tmp_opn2, 0);

    T->code = merge(2, T->code, mkIR(IR_ARG));
    glo_res.type = 'v', glo_res.id = "memset(PLT)";
    glo_res.kind = 'F';
    T->code = merge(2, T->code, mkIR(IR_CALL_VOID));
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
        break;
    }
    case EQOP:
    {
        // printf("opn1:%d;opn2:%d\n", O1->const_int, O2->const_int);
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
        break;
    }
    case EQOP:
    {
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

void arroffset_cal(int aTindex)
{
    int tmp_out = iT.indexs[iT.top - 1].const_int, tmp_size = aT.arrs[aTindex].lim[glo_D - 1].const_int;
    iT.top--;
    int tmp2;
    if (glo_D == 1)
    {
        glo_res.type = 'i', glo_res.const_int = iT.indexs[iT.top].const_int;
    }
    else
    {
        for (int i = glo_D - 2; i > -1; i--)
        {
            tmp2 = tmp_size * iT.indexs[iT.top - 1].const_int;
            tmp_out = tmp2 + tmp_out;
            tmp_size = tmp_size * aT.arrs[aTindex].lim[i].const_int;
            iT.top--;
        }
        glo_res.type = 'i', glo_res.const_int = tmp_out;
    }
}