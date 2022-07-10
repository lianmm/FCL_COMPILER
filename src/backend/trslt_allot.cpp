#include "trslt_allot.h"
#include <queue>
#include <map>
#include <set>
using namespace std;

/*--------------------------------------------相关全局变量-------------------------------------*/
//临时变量分配数组。
int tmp_allot[MAXLENGTH];
int tmp_sp;
int block_num = 0;
//寄存器分配支持；
int ris[10] = {4, 5, 6, 7, 8, 9, 10}; //寄存器太少了，应考虑想办法将1，2，3用起来；TODO
map<int, int, greater<int>> tmp_map;
//实参设置的支持；
int ris3_status[11] = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
struct arm_instruction null_ar;
struct arm_instruction *out_arm;
struct blocks b_list;
/*--------------------------------------------支持函数实现区------------------------------------*/

void printris(set<int, greater<int>> *ris_pq)
{
    printf("ris_pq:");
    for (set<int>::iterator it = ris_pq->begin(); it != ris_pq->end(); it++)
    {
        printf("\t%d ", *it);
    }

    printf("\n");
}

void printmap(map<int, int, greater<int>> *tmp_map)
{
    // printf("tmp_map $%d:", tmp_map->size());
    if (tmp_map->size() != 0)
        for (map<int, int, greater<int>>::iterator it = tmp_map->begin(); it != tmp_map->end(); it++)
        {
            printf("\t[%d]:%d ", it->first, it->second);
        }

    printf("\n");
}

//合并多个arm代码的双向循环链表，首尾相连
struct arm_instruction *merge_a(int num, ...)
{

    struct arm_instruction *h1, *h2, *p, *t1, *t2;
    va_list ap;
    va_start(ap, num);
    h1 = va_arg(ap, struct arm_instruction *);

    while (--num > 0)
    {
        h2 = va_arg(ap, struct arm_instruction *);

        if (h1 == &null_ar)
            h1 = h2;
        else if (h2 != &null_ar)
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
void split_a(struct arm_instruction *head1, struct arm_instruction *head2)
{
    struct arm_instruction *tail2 = head1->prior, *tail1 = head2->prior;
    head1->prior = tail1, tail1->next = head1;
    head2->prior = tail2, tail2->next = head2;
}

//构造新语句；
//生成一条TAC代码的结点组成的双向循环链表，返回头指针
struct arm_instruction *mkarm(ARM_op op)
{
    struct arm_instruction *h = (struct arm_instruction *)malloc(sizeof(struct arm_instruction));
    h->op = op;
    h->next = h;
    h->prior = h;
    h->opn1.type = '0';
    h->opn2.type = '0';
    h->result.type = '0';
    return h;
}

/*-------------------------------------------IR翻译函数实现区---------------------------------*/

void trslt_arg(int a_index, struct codenode *glo_begin, struct codenode *head, int st_index, int toffset)
{

    int tmp_ris1 = head->result.no_ris, tmp_ris2 = a_index;
    int tmp_t1 = ris3_status[a_index], tmp_t2 = a2i(head->result.id);
    // printf("调用了函数：%s,参数个数：%d,当前实参序号：%d\n", sT.symbols[toffset].name, sT.symbols[toffset].paramnum, a_index);
    if (sT.symbols[toffset].paramnum == a_index)
    {
        head->op = IR_ASSIGN;
        head->opn2 = head->result;
        head->opn1.type = 'v', head->opn1.kind = 'T', head->opn1.status = 2, head->opn1.no_ris = 0;
    }
    else if (a_index < 4)
    {

        if (ris3_status[a_index] == -1)
        {

            // printf("\t%d %s:%d\n", a_index, head->result.id, ris3_status[a_index]);
            head->op = IR_ASSIGN;
            head->opn2 = head->result;
            head->opn1.type = 'v', head->opn1.kind = 'T', head->opn1.status = 2, head->opn1.no_ris = a_index;
            // ris3_status[a_index] = a2i(head->result.id);
            //  printf("\t%d\t%d\n", head->opn1.no_ris, head->result.no_ris);
        }
        else
        {

            // printf("\t%d:%d\n", a_index, ris3_status[a_index]);
            initOpn(&glo_opn1), initOpn(&glo_opn2);
            glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = 0;
            glo_opn2.type = 'v', glo_opn2.kind = 'T', glo_opn2.status = 2, glo_opn2.no_ris = tmp_ris2;
            split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);
            initOpn(&glo_opn1), initOpn(&glo_opn2);
            glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = tmp_ris2;
            glo_opn2.type = 'v', glo_opn2.kind = 'T', glo_opn2.status = 2, glo_opn2.no_ris = tmp_ris1;
            split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);
            head->opn1.type = 'v', head->opn1.kind = 'T', head->opn1.status = 2, head->opn1.no_ris = tmp_ris1;
            head->opn2.type = 'v', head->opn2.kind = 'T', head->opn2.status = 2, head->opn2.no_ris = 0;
            head->op = IR_ASSIGN;
            //改符号表
            // printf("符号表：%d: %d, %d, %d, %d\n", st_index, tmp_t1, tmp_ris1, tmp_t2, tmp_ris2);
            fsT.st[st_index].Tsyms[tmp_t1].no_ris = tmp_ris1, fsT.st[st_index].Tsyms[tmp_t2].no_ris = tmp_ris2;
            ris3_status[tmp_ris1] = tmp_t1, ris3_status[tmp_ris2] = tmp_t2;
            // display_fsT();
        }
    }
    else
    {

        head->op = IR_ASSIGN;
        head->opn2 = head->result;
        head->opn1.type = 'v', head->opn1.kind = 'R', head->opn1.status = 1, head->opn1.address = -4 * (a_index - 4);
        // ris3_status[a_index] = a2i(head->result.id);
    }
}

void trslt_para(int a_index, struct codenode *glo_begin, struct codenode *head, int st_index)
{
    int tmp_ris1 = head->result.no_ris, tmp_ris2 = a_index;
    int tmp_t1 = ris3_status[a_index], tmp_t2 = a2i(head->result.id);
    if (a_index < 4)
    {
        head->opn1.type = 'v', head->opn1.status = 2, head->opn1.kind = 'T', head->opn1.no_ris = a_index;
        head->opn2.type = 'v', head->opn2.status = 1, head->opn2.kind = 'V', head->opn2.address = -(16 + 4 * a_index);
    }
    else
    {
        head->op = IR_ALLOCA;
        // struct codenode *hnext = head->next;
        // split(glo_begin, head), split(head, hnext);
        // merge(2, glo_begin, hnext);
        // head = hnext->prior;
    }
}

void trslt_div(struct codenode *glo_begin, struct codenode *head, int st_index, int type)
{
    int a_index = 0;
    int tmp_ris1, tmp_ris2, tmp_t1, tmp_t2;
    for (a_index = 0; a_index < 2; a_index++)
    {

        tmp_t1 = ris3_status[a_index], tmp_ris2 = a_index;
        if (a_index == 0)
            tmp_ris1 = head->opn1.no_ris, tmp_t2 = a2i(head->opn1.id);
        else
            tmp_ris1 = head->opn2.no_ris, tmp_t2 = a2i(head->opn2.id);
        if (ris3_status[a_index] == tmp_t2)
            ;
        else if (ris3_status[a_index] == -1)
        {
            glo_opn2 = a_index == 0 ? head->opn1 : head->opn2;
            glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = a_index;
            // ris3_status[a_index] = a2i(head->result.id);
            split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);
        }
        else
        {
            initOpn(&glo_opn1), initOpn(&glo_opn2);
            glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = 0;
            glo_opn2.type = 'v', glo_opn2.kind = 'T', glo_opn2.status = 2, glo_opn2.no_ris = tmp_ris2;
            split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);
            initOpn(&glo_opn1), initOpn(&glo_opn2);
            glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = tmp_ris2;
            glo_opn2.type = 'v', glo_opn2.kind = 'T', glo_opn2.status = 2, glo_opn2.no_ris = tmp_ris1;
            split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);
            glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = tmp_ris1;
            glo_opn2.type = 'v', glo_opn2.kind = 'T', glo_opn2.status = 2, glo_opn2.no_ris = 0;
            split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);

            //改符号表
            fsT.st[st_index].Tsyms[tmp_t1].no_ris = tmp_ris1, fsT.st[st_index].Tsyms[tmp_t2].no_ris = tmp_ris2;
            ris3_status[tmp_ris1] = tmp_t1, ris3_status[tmp_ris2] = tmp_t2;
            // display_fsT();
        }
    }
    glo_res.type = 'v', glo_res.kind = 'F', strcpy(glo_res.id, type == 0 ? "__aeabi_idiv" : "__aeabi_idivmod");
    split(glo_begin, head), merge(3, glo_begin, mkIR(IR_CALL_VOID), head);
    head->op = IR_ASSIGN;
    head->opn1 = head->result;
    head->opn2.type = 'v', head->opn2.kind = 'T', head->opn2.status = 2, head->opn2.no_ris = type == 0 ? 0 : 1;
    // ris3_status[a_index] = a2i(head->result.id);
}

void trslt_goto(struct codenode *glo_begin, struct codenode *head)
{
    char tmp_label[36];
    strcpy(tmp_label, newLabel());
    struct opn tmp_res;
    struct opn tmp_res1;
    struct codenode *hnext2;
    if (head->next->next->op == IR_GOTO)
    {
        tmp_res = head->next->result;
        tmp_res1 = head->next->next->opn1;
        head->next->op = (IR_op)((int)head->op + 8), strcpy(head->next->result.id, tmp_label);
        head->op = IR_EQ;
        //信号为false时的转化；
        hnext2 = head->next->next;
        glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = 0, glo_opn1.flage = ' ', glo_opn1.flaga = ' ';
        glo_opn2.type = 'i', glo_opn2.const_int = 1;
        split(glo_begin, hnext2), merge(3, glo_begin, mkIR(IR_ASSIGN), hnext2);
        glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = 0;
        glo_opn2.type = 'i', glo_opn2.const_int = 0;
        split(glo_begin, hnext2), merge(3, glo_begin, mkIR(IR_EQ), hnext2);
        // printf("前一项寄存器值：%d\n", hnext2->prior->opn1.no_ris);
        glo_opn1 = tmp_res1;
        glo_opn1.kind = 'L';
        // printf("goto: %c\n", glo_opn1.type);
        split(glo_begin, hnext2), merge(3, glo_begin, mkIR(IR_GOTO), hnext2);
        //信号为true时的转化；
        glo_opn1.type = 'v', glo_opn1.kind = 'L', strcpy(glo_opn1.id, tmp_label);
        split(glo_begin, hnext2), merge(3, glo_begin, mkIR(IR_LABEL), hnext2);
        glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = 0, glo_opn1.flage = ' ', glo_opn1.flaga = ' ';
        glo_opn2.type = 'i', glo_opn2.const_int = 0;
        split(glo_begin, hnext2), merge(3, glo_begin, mkIR(IR_ASSIGN), hnext2);
        glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = 0;
        glo_opn2.type = 'i', glo_opn2.const_int = 0;
        split(glo_begin, hnext2), merge(3, glo_begin, mkIR(IR_EQ), hnext2);
        // printf("前一项寄存器值：%d\n", hnext2->prior->opn1.no_ris);

        glo_opn1 = tmp_res;
        glo_opn1.kind = 'L';
        split(glo_begin, hnext2), merge(3, glo_begin, mkIR(IR_GOTO), hnext2);
        head = hnext2;
    }
    else
    {

        if (head->next->op == IR_GOTO_EQ || head->next->op == IR_GOTO_NEQ)
        {
            head->next->op = (IR_op)((int)head->op + 8);
            hnext2 = head->next->next;
            tmp_res = head->next->result;

            strcpy(head->next->result.id, tmp_label);
        }
        else if (head->next->op == IR_LABEL)
        {
            tmp_res = head->next->opn1;

            hnext2 = head->next;
            glo_res.type = 'v', glo_res.kind = 'L', strcpy(glo_res.id, tmp_label);
            split(glo_begin, hnext2), merge(3, glo_begin, mkIR((IR_op)((int)head->op + 8)), hnext2);
        }
        head->op = IR_EQ;
        //将非相等判断的信号转化成相等性信号方便与或操作。
        //信号为false时的转化；
        glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = 0;
        glo_opn2.type = 'i', glo_opn2.const_int = 1;
        split(glo_begin, hnext2), merge(3, glo_begin, mkIR(IR_ASSIGN), hnext2);
        glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = 0;
        glo_opn2.type = 'i', glo_opn2.const_int = 0;
        split(glo_begin, hnext2), merge(3, glo_begin, mkIR(IR_EQ), hnext2);
        // printf("前一项寄存器值：%d\n", hnext2->prior->opn1.no_ris);
        glo_opn1 = tmp_res;
        glo_opn1.kind = 'L';
        // printf("goto: %c\n", glo_opn1.type);
        split(glo_begin, hnext2), merge(3, glo_begin, mkIR(IR_GOTO), hnext2);
        //信号为true时的转化；
        glo_opn1.type = 'v', glo_opn1.kind = 'L', strcpy(glo_opn1.id, tmp_label);
        split(glo_begin, hnext2), merge(3, glo_begin, mkIR(IR_LABEL), hnext2);
        glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = 0;
        glo_opn2.type = 'i', glo_opn2.const_int = 0;
        split(glo_begin, hnext2), merge(3, glo_begin, mkIR(IR_ASSIGN), hnext2);
        glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = 0;
        glo_opn2.type = 'i', glo_opn2.const_int = 0;
        split(glo_begin, hnext2), merge(3, glo_begin, mkIR(IR_EQ), hnext2);
        // printf("前一项寄存器值：%d\n", hnext2->prior->opn1.no_ris);

        glo_opn1 = tmp_res;
        glo_opn1.kind = 'L';
        split(glo_begin, hnext2), merge(3, glo_begin, mkIR(IR_GOTO), hnext2);
        head = hnext2;
    }
}

//分配后翻译增删改IR代码；
void trslt_after_allot(struct codenode *glo_begin, struct codenode *begin, struct codenode *end, int argi, int parai)
{
    struct codenode *cur_C; //当前语句；

    cur_C = begin;
    int i;

    for (i = 0; cur_C != end; cur_C = cur_C->next, i++)
    {
        if (cur_C->op == IR_ARG)
        {
            struct codenode *tmp_c = cur_C->next;

            while (tmp_c->op != IR_CALL && tmp_c->op != IR_CALL_VOID)
                tmp_c = tmp_c->next;
            char tmp_offset;
            tmp_offset = tmp_c->op == IR_CALL ? tmp_c->opn1.offset : tmp_c->result.offset;

            trslt_arg(argi, glo_begin, cur_C, sT.symbols[begin->opn1.offset].val_index, tmp_offset);
            argi++;
        }
        if (cur_C->op == IR_PARAM)
        {
            trslt_para(parai, glo_begin, cur_C, sT.symbols[begin->opn1.offset].val_index);
            parai++;
        }
        if (cur_C->op == IR_CALL || cur_C->op == IR_CALL_VOID)
        {
            argi = 1;
        }
        if (cur_C->op == IR_DIV)
        {
            trslt_div(glo_begin, cur_C, sT.symbols[begin->result.offset].val_index, 0);
        }
        if (cur_C->op == IR_MOD)
        {
            trslt_div(glo_begin, cur_C, sT.symbols[begin->opn1.offset].val_index, 1);
        }
        if (cur_C->op == IR_NOT)
        {
            struct codenode *tmp_C = cur_C->next;
            if (cur_C->next->op == IR_NOT)
            {
                int not_num = 2;

                while (tmp_C->next->op == IR_NOT || tmp_C->next->op == IR_UMINUS)
                    if (tmp_C->next->op == IR_NOT)
                        not_num++, tmp_C->op = IR_VOID, tmp_C = tmp_C->next;
                    else if (tmp_C->next->op == IR_UMINUS)
                        tmp_C->op = IR_VOID, tmp_C = tmp_C->next;
                tmp_C->op = IR_VOID;

                if (not_num % 2 == 0)
                    tmp_C->next->op = tmp_C->next->op == IR_GOTO_EQ ? IR_GOTO_NEQ : IR_GOTO_EQ;
            }
            cur_C->op = IR_EQ;
            cur_C->opn2.type = 'i', cur_C->opn2.const_int = 0;
            if (cur_C->next->op > IR_GOTO_OR || cur_C->next->op < IR_GOTO_JLT)
            {
                glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = cur_C->opn1.no_ris;
                glo_opn2.type = 'i', glo_opn2.const_int = 0;
                split(glo_begin, tmp_C), merge(3, glo_begin, mkIR(ARM_MOVNE), tmp_C);
                glo_opn2.type = 'i', glo_opn2.const_int = 1;
                split(glo_begin, tmp_C), merge(3, glo_begin, mkIR(ARM_MOVEQ), tmp_C);
                cur_C = tmp_C->prior;
            }
        }
        if (cur_C->op > IR_MOD && cur_C->op < IR_EQ || cur_C->op == IR_NEQ)
        {
            trslt_goto(glo_begin, cur_C);
        }
    }
}

//分配前翻译增删改IR代码；
void trslt_before_allot()
{
    struct codenode *hC, *now_C;
    hC = out_IR;
    now_C = hC;
    int i = 0;
    int now_begin_index, now_end_index;
    struct codenode *now_begin, *now_end; //当前的函数体的开始语句索引与终止语句索引；

    if (now_C->op == IR_ALLOCA)
    {
        struct codenode *nnext = now_C->next, *nnext2 = nnext->next;

        if (sT.symbols[now_C->result.offset].flag == 'A' || sT.symbols[now_C->result.offset].flagca == 'A')
        {

            now_C->opn2.type = strcmp(sT.symbols[now_C->result.offset].type, "int") == 0 ? 'i' : 'f', now_C->opn2.const_int = 0, now_C->opn2.const_float = 0.0;
            now_C->op = IR_EXT_ALLOCA;
            if (now_C->next->op != IR_ASSIGN)
            {
                glo_opn1.type = 'v', strcpy(glo_opn1.id, "\t.space");
                glo_res = now_C->opn1;
                split(hC, nnext), merge(3, hC, mkIR(IR_ARROFF_EXPie), nnext);
            }
            else
            {
                int tmp_offset = -4;
                while (nnext->op == IR_ASSIGN)
                {
                    if (nnext2->opn2.const_int == tmp_offset + 4)
                    {
                        nnext->op = IR_VOID;
                        nnext2->result = nnext->opn2;
                        nnext2->opn1.type = 'v', strcpy(nnext2->opn1.id, "\t.word");
                        nnext2->op = IR_ARROFF_EXPie;
                    }
                    else if (nnext2->opn2.const_int > tmp_offset + 4)
                    {
                        nnext->opn1.type = 'v', strcpy(nnext->opn1.id, "\t.space");
                        nnext->result.type = 'i', nnext->result.const_int = nnext2->opn2.const_int - tmp_offset - 4;
                        nnext2->result = nnext->opn2;
                        nnext2->opn1.type = 'v', strcpy(nnext2->opn1.id, "\t.word");
                        nnext2->op = IR_ARROFF_EXPie;
                        nnext->op = IR_ARROFF_EXPie;
                    }
                    tmp_offset = nnext2->opn2.const_int;
                    nnext = nnext2->next, nnext2 = nnext->next;
                }
                if (tmp_offset < now_C->opn1.const_int - 4)
                {
                    glo_opn1.type = 'v', strcpy(glo_opn1.id, "\t.space");
                    glo_res.type = 'i', glo_res.const_int = now_C->opn1.const_int - 4 - tmp_offset;
                    split(hC, nnext), merge(3, hC, mkIR(IR_ARROFF_EXPie), nnext);
                }
            }
        }
        else
        {

            if (nnext->op == IR_ASSIGN && nnext2->op == IR_ASSIGN)
            {
                now_C->opn2 = nnext->opn2;
                now_C->op = IR_EXT_ALLOCA;
                nnext2->op = IR_VOID, nnext->op = IR_VOID;
                now_C = nnext2;
            }
            else if (nnext->op != IR_ASSIGN)
            {
                now_C->opn2.type = strcmp(sT.symbols[now_C->result.offset].type, "int") == 0 ? 'i' : 'f', now_C->opn2.const_int = 0, now_C->opn2.const_float = 0.0;
                now_C->op = IR_EXT_ALLOCA;
            }
        }
    }
    now_C = now_C->next;

    for (i = 1; now_C != hC; now_C = now_C->next, i++)
    { //全局变量翻译；

        if (now_C->op == IR_ALLOCA && (now_C->result.kind != 'P') && strcmp(sT.symbols[now_C->result.offset].name, now_C->result.id) == 0 && now_C->result.offset < sT.index)
        {
            struct codenode *nnext = now_C->next, *nnext2 = nnext->next;

            if (sT.symbols[now_C->result.offset].flag == 'A' || sT.symbols[now_C->result.offset].flagca == 'A')
            {

                now_C->opn2.type = strcmp(sT.symbols[now_C->result.offset].type, "int") == 0 ? 'i' : 'f', now_C->opn2.const_int = 0, now_C->opn2.const_float = 0.0;
                now_C->op = IR_EXT_ALLOCA;
                if (now_C->next->op != IR_ASSIGN)
                {

                    glo_opn1.type = 'v', strcpy(glo_opn1.id, "\t.space");
                    glo_res = now_C->opn1;
                    split(hC, nnext), merge(3, hC, mkIR(IR_ARROFF_EXPie), nnext);
                }
                else
                {

                    int tmp_offset = -4;
                    while (nnext->op == IR_ASSIGN)
                    {
                        if (nnext2->opn2.const_int == tmp_offset + 4)
                        {
                            nnext->op = IR_VOID;
                            nnext2->result = nnext->opn2;
                            nnext2->opn1.type = 'v', strcpy(nnext2->opn1.id, "\t.word");
                            nnext2->op = IR_ARROFF_EXPie;
                        }
                        else if (nnext2->opn2.const_int > tmp_offset + 4)
                        {
                            nnext->opn1.type = 'v', strcpy(nnext->opn1.id, "\t.space");
                            nnext->result.type = 'i', nnext->result.const_int = nnext2->opn2.const_int - tmp_offset - 4;
                            nnext2->result = nnext->opn2;
                            nnext2->opn1.type = 'v', strcpy(nnext2->opn1.id, "\t.word");
                            nnext2->op = IR_ARROFF_EXPie;
                            nnext->op = IR_ARROFF_EXPie;
                        }
                        tmp_offset = nnext2->opn2.const_int;
                        nnext = nnext2->next, nnext2 = nnext->next;
                    }
                    if (tmp_offset < now_C->opn1.const_int - 4)
                    {
                        glo_opn1.type = 'v', strcpy(glo_opn1.id, "\t.space");
                        glo_res.type = 'i', glo_res.const_int = now_C->opn1.const_int - 4 - tmp_offset;
                        split(hC, nnext), merge(3, hC, mkIR(IR_ARROFF_EXPie), nnext);
                    }
                }
            }
            else
            {
                if (nnext->op == IR_ASSIGN && nnext2->op == IR_ASSIGN)
                {

                    now_C->opn2 = nnext->opn2;
                    now_C->op = IR_EXT_ALLOCA;
                    nnext2->op = IR_VOID, nnext->op = IR_VOID;
                    now_C = nnext2;
                }
                else if (nnext->op != IR_ASSIGN)
                {
                    now_C->opn2.type = strcmp(sT.symbols[now_C->result.offset].type, "int") == 0 ? 'i' : 'f', now_C->opn2.const_int = 0, now_C->opn2.const_float = 0.0;
                    now_C->op = IR_EXT_ALLOCA;
                }
            }
        }
    }
}
//翻译输出时重新遍历IR代码，并生成全局arm双向循环表；
void trslt_out()
{
    struct codenode *cur_IR = out_IR;
    struct arm_instruction *now_arm = out_arm;
    // printf("\t%d\n", cur_IR);
    if (cur_IR != &null_ir)
        for (int i = 0; 1; i++)
        {
            // printf("翻译第%d条语句\n", i);
            // printf("\tout_arm->prior->op:%d\n", out_arm->prior->op);

            if (cur_IR != &null_ir && cur_IR != NULL)

                switch ((int)cur_IR->op)
                {
                case IR_ASSIGN:
                {
                    if (strcmp(cur_IR->opn1.id, "r0") == 0)
                    {
                        out_arm = merge_a(2, out_arm, mkarm(arm_mov_r0));
                        out_arm->prior->opn2 = cur_IR->opn2;
                        out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                    }
                    else if ((cur_IR->opn1.type == 'v' && cur_IR->opn1.kind == 'T') && (cur_IR->opn2.type == 'v' && cur_IR->opn2.kind == 'T'))
                    {
                        out_arm = merge_a(2, out_arm, mkarm(arm_mov_rr));
                        out_arm->prior->opn2 = cur_IR->opn2;
                        out_arm->prior->opn1 = cur_IR->opn1;
                    }

                    else if ((sT.symbols[cur_IR->opn2.offset].flag == 'A' || sT.symbols[cur_IR->opn2.offset].flagca == 'A') && cur_IR->opn2.flage == 'E')
                    {
                        out_arm = merge_a(2, out_arm, mkarm(arm_mov_rE));
                        out_arm->prior->opn2 = cur_IR->opn2;
                        out_arm->prior->opn1 = cur_IR->opn1;
                    }

                    else if (cur_IR->opn2.type == 'i')
                    {
                        out_arm = merge_a(2, out_arm, mkarm(arm_ldr_ri));
                        out_arm->prior->opn2 = cur_IR->opn2;
                        out_arm->prior->opn1 = cur_IR->opn1;
                    }
                    else if (cur_IR->opn2.type == 'f')
                    { // TODO;
                    }
                    else if (cur_IR->opn1.type == 'v' && cur_IR->opn1.flage == 'E')
                    {
                        out_arm = merge_a(2, out_arm, mkarm(arm_mov_rE));
                        out_arm->prior->opn2 = cur_IR->opn1;
                        out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                        out_arm = merge_a(2, out_arm, mkarm(arm_str));
                        out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                        out_arm->prior->opn1 = cur_IR->opn2;
                        out_arm->prior->result.type = 'i', out_arm->prior->result.const_int = 0;
                    }

                    else if (cur_IR->opn1.type == 'v' && (cur_IR->opn1.kind == 'V' || cur_IR->opn1.kind == 'P'))
                    {
                        if (cur_IR->opn1.address < 4096)
                        {
                            out_arm = merge_a(2, out_arm, mkarm(arm_str));
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 11;
                            out_arm->prior->opn1 = cur_IR->opn2;
                            out_arm->prior->result.type = 'i', out_arm->prior->result.const_int = -cur_IR->opn1.address;
                        }
                        else
                        {
                            out_arm = merge_a(2, out_arm, mkarm(arm_ldr_ri));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                            out_arm->prior->opn2.type = 'i', out_arm->prior->opn2.const_int = -cur_IR->opn1.address;
                            out_arm = merge_a(2, out_arm, mkarm(arm_str));
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 11;
                            out_arm->prior->opn1 = cur_IR->opn2;
                            out_arm->prior->result.type = 'v', out_arm->prior->result.kind = 'T', out_arm->prior->result.no_ris = 0;
                        }
                    }
                    else if (cur_IR->opn1.type == 'v' && (cur_IR->opn1.kind == 'R')) // R表示实参；
                    {
                        out_arm = merge_a(2, out_arm, mkarm(arm_str));
                        out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 13;
                        out_arm->prior->opn1 = cur_IR->opn2;
                        out_arm->prior->result.type = 'i', out_arm->prior->result.const_int = -cur_IR->opn1.address;
                    }
                    break;
                }
                case IR_EXT_ALLOCA:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_alloc_E));
                    out_arm->prior->opn1 = cur_IR->opn1;
                    out_arm->prior->opn2 = cur_IR->opn2;
                    out_arm->prior->result = cur_IR->result;
                    break;
                }
                case IR_VOID:
                {
                    break;
                }

                case IR_MINUS:
                {
                    if (cur_IR->opn1.type != 'v')
                    {
                        out_arm = merge_a(2, out_arm, mkarm(arm_rsb));
                        out_arm->prior->opn2 = cur_IR->opn2;
                        out_arm->prior->result = cur_IR->opn1;
                    }
                    else
                    {
                        out_arm = merge_a(2, out_arm, mkarm(arm_sub));
                        out_arm->prior->result = cur_IR->opn2;
                        out_arm->prior->opn2 = cur_IR->opn1;
                    }
                    out_arm->prior->opn1 = cur_IR->result;
                    break;
                }
                case IR_ADD:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_add));
                    out_arm->prior->opn2 = cur_IR->opn2;
                    out_arm->prior->opn1 = cur_IR->result;
                    out_arm->prior->result = cur_IR->opn1;
                    break;
                }
                case IR_MUL:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_mul));
                    out_arm->prior->opn2 = cur_IR->opn2;
                    out_arm->prior->opn1 = cur_IR->result;
                    out_arm->prior->result = cur_IR->opn1;
                    break;
                }

                case IR_EQ:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_cmp));
                    out_arm->prior->opn2 = cur_IR->opn2;
                    out_arm->prior->opn1 = cur_IR->opn1;
                    break;
                }

                case IR_GOTO_JLT:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_blt));
                    out_arm->prior->opn1 = cur_IR->result;
                    break;
                }
                case IR_GOTO_JLE:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_ble));
                    out_arm->prior->opn1 = cur_IR->result;
                    break;
                }
                case IR_GOTO_JGT:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_bgt));
                    out_arm->prior->opn1 = cur_IR->result;
                    break;
                }
                case IR_GOTO_JGE:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_bge));
                    out_arm->prior->opn1 = cur_IR->result;
                    break;
                }
                case IR_GOTO_EQ:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_beq));
                    out_arm->prior->opn1 = cur_IR->result;
                    break;
                }
                case IR_GOTO_NEQ:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_bne));
                    out_arm->prior->opn1 = cur_IR->result;
                    break;
                }

                case IR_EXP_ARROFF:
                {
                    if (cur_IR->opn1.flage == 'E')
                    {
                        out_arm = merge_a(2, out_arm, mkarm(arm_mov_rE));
                        out_arm->prior->opn2 = cur_IR->opn1;
                        out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                    }
                    else
                    {
                        if (cur_IR->prior->op == IR_LOAD && cur_IR->prior->opn1.kind == 'A') //形参数组，偏移量需要先load出来
                        {
                            out_arm = merge_a(2, out_arm, mkarm(arm_ldr_l2));
                            out_arm->prior->opn1 = cur_IR->result;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T',
                            out_arm->prior->opn2.no_ris = cur_IR->prior->result.no_ris;
                            out_arm->prior->result = cur_IR->opn2;
                            break;
                        }
                        else
                        {
                            out_arm = merge_a(2, out_arm, mkarm(arm_ldr_ri));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                            out_arm->prior->opn2.type = 'i',
                            out_arm->prior->opn2.const_int = -cur_IR->opn1.address;
                            out_arm = merge_a(2, out_arm, mkarm(arm_add));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                            out_arm->prior->result.type = 'v', out_arm->prior->result.kind = 'T', out_arm->prior->result.no_ris = 11;
                        }
                    }
                    out_arm = merge_a(2, out_arm, mkarm(arm_ldr_l2));
                    out_arm->prior->opn1 = cur_IR->result;
                    out_arm->prior->result = cur_IR->opn2;

                    out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                    break;
                }
                case IR_ARROFF_EXP:
                {
                    if (cur_IR->opn1.flage == 'E')
                    {
                        out_arm = merge_a(2, out_arm, mkarm(arm_mov_rE));
                        out_arm->prior->opn2 = cur_IR->opn1;
                        out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                    }
                    else
                    {
                        if (cur_IR->prior->op == IR_LOAD && cur_IR->prior->opn1.kind == 'A') //形参数组，偏移量需要先load出来
                        {
                            out_arm = merge_a(2, out_arm, mkarm(arm_str_l2));
                            out_arm->prior->opn1 = cur_IR->result;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T',
                            out_arm->prior->opn2.no_ris = cur_IR->prior->result.no_ris;
                            out_arm->prior->result = cur_IR->opn2;
                            break;
                        }
                        else
                        {
                            out_arm = merge_a(2, out_arm, mkarm(arm_ldr_ri));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                            out_arm->prior->opn2.type = 'i',
                            out_arm->prior->opn2.const_int = -cur_IR->opn1.address;
                            out_arm = merge_a(2, out_arm, mkarm(arm_add));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                            out_arm->prior->result.type = 'v', out_arm->prior->result.kind = 'T', out_arm->prior->result.no_ris = 11;
                        }
                    }
                    out_arm = merge_a(2, out_arm, mkarm(arm_str_l2));
                    out_arm->prior->opn1 = cur_IR->result;
                    out_arm->prior->result = cur_IR->opn2;

                    out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                    break;
                }

                case IR_ARROFF_EXPi:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_ldr_ri));
                    out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                    out_arm->prior->opn2.type = 'i', out_arm->prior->opn2.const_int = -cur_IR->opn1.address;
                    out_arm = merge_a(2, out_arm, mkarm(arm_add));
                    out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                    out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                    out_arm->prior->result.type = 'v', out_arm->prior->result.kind = 'T', out_arm->prior->result.no_ris = 11;
                    out_arm = merge_a(2, out_arm, mkarm(arm_str));
                    out_arm->prior->opn1 = cur_IR->result;
                    out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                    out_arm->prior->result = cur_IR->opn2;

                    break;
                }
                case IR_ARROFF_EXPie:
                {
                    if (!strcmp(cur_IR->opn1.id, "\t.space"))
                        out_arm = merge_a(2, out_arm, mkarm(arm_space));
                    else
                        out_arm = merge_a(2, out_arm, mkarm(arm_word));
                    out_arm->prior->opn1 = cur_IR->result;
                    break;
                }

                case IR_EXP_ARROFFa:
                {
                    if (cur_IR->opn1.flage == 'E')
                    {
                        out_arm = merge_a(2, out_arm, mkarm(arm_mov_rE));
                        out_arm->prior->opn2 = cur_IR->opn1;
                        out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                    }
                    else
                    {
                        if (cur_IR->prior->op == IR_LOAD && cur_IR->prior->opn1.kind == 'A') //形参数组，偏移量需要先load出来
                        {
                            out_arm = merge_a(2, out_arm, mkarm(arm_add_l2));
                            out_arm->prior->opn1 = cur_IR->result;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T',
                            out_arm->prior->opn2.no_ris = cur_IR->prior->result.no_ris;
                            out_arm->prior->result = cur_IR->opn2;
                            break;
                        }
                        else
                        {
                            out_arm = merge_a(2, out_arm, mkarm(arm_ldr_ri));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                            out_arm->prior->opn2.type = 'i',
                            out_arm->prior->opn2.const_int = -cur_IR->opn1.address;
                            out_arm = merge_a(2, out_arm, mkarm(arm_add));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                            out_arm->prior->result.type = 'v', out_arm->prior->result.kind = 'T', out_arm->prior->result.no_ris = 11;
                        }
                    }
                    out_arm = merge_a(2, out_arm, mkarm(arm_add_l2));
                    out_arm->prior->opn1 = cur_IR->result;
                    out_arm->prior->result = cur_IR->opn2;

                    out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                    break;
                }
                case IR_ARROFF_EXPi0:
                {
                    int inde = cur_IR->result.const_int;
                    for (; inde < cur_IR->opn2.const_int; inde += 4)
                    {
                        if (inde == cur_IR->result.const_int)
                        {
                            out_arm = merge_a(2, out_arm, mkarm(arm_ldr_ri));
                            out_arm->prior->opn2.type = 'i', out_arm->prior->opn2.const_int = -cur_IR->opn1.address,
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;

                            out_arm = merge_a(2, out_arm, mkarm(arm_add));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                            out_arm->prior->result.type = 'v', out_arm->prior->result.kind = 'T', out_arm->prior->result.no_ris = 11;

                            out_arm = merge_a(2, out_arm, mkarm(arm_ldr_ri));
                            out_arm->prior->opn2.type = 'i', out_arm->prior->opn2.const_int = 0,
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 12;
                        }

                        out_arm = merge_a(2, out_arm, mkarm(arm_str));
                        out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 12;
                        out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                        out_arm->prior->result.type = 'i', out_arm->prior->result.const_int = inde;
                    }
                    break;
                }

                case IR_CALL:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_bl));
                    out_arm->prior->opn1 = cur_IR->opn1;
                    out_arm = merge_a(2, out_arm, mkarm(arm_mov_rr));
                    out_arm->prior->opn1 = cur_IR->result;
                    out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                    break;
                }
                case IR_UMINUS:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_rsb));
                    out_arm->prior->opn1 = cur_IR->result;
                    out_arm->prior->opn2 = cur_IR->opn1;
                    out_arm->prior->opn2.type = 'i', out_arm->prior->opn2.const_int = 0;
                    break;
                }
                case IR_LOAD:
                {
                    if (cur_IR->opn1.type == 'v' && cur_IR->opn1.flage == 'E')
                    {
                        out_arm = merge_a(2, out_arm, mkarm(arm_mov_rE));
                        out_arm->prior->opn1 = cur_IR->result;
                        out_arm->prior->opn2 = cur_IR->opn1;
                        out_arm = merge_a(2, out_arm, mkarm(arm_ldr));
                        out_arm->prior->opn1 = cur_IR->result;
                        out_arm->prior->opn2 = cur_IR->result;
                        out_arm->prior->result.type = 'i', out_arm->prior->result.const_int = 0;
                    }
                    else
                    {
                        if (cur_IR->opn1.address < 4096)
                        {
                            out_arm = merge_a(2, out_arm, mkarm(arm_ldr));
                            out_arm->prior->opn1 = cur_IR->result;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 11;
                            out_arm->prior->result.type = 'i', out_arm->prior->result.const_int = -cur_IR->opn1.address;
                        }
                        else
                        {
                            out_arm = merge_a(2, out_arm, mkarm(arm_ldr_ri));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                            out_arm->prior->opn2.type = 'i', out_arm->prior->opn2.const_int = -cur_IR->opn1.address;
                            out_arm = merge_a(2, out_arm, mkarm(arm_ldr));
                            out_arm->prior->opn1 = cur_IR->result;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 11;
                            out_arm->prior->result.type = 'v', out_arm->prior->result.kind = 'T', out_arm->prior->result.no_ris = 0;
                        }
                    }
                    break;
                }
                case IR_FUNCTION:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_func));
                    out_arm->prior->opn1 = cur_IR->opn1;
                    out_arm->prior->opn2 = cur_IR->opn2;
                    out_arm->prior->result = cur_IR->result;
                    // printf("out_arm->prior->op: %d\t%c\n", out_arm->prior->op, out_arm->prior->opn1.type);
                    break;
                }
                case IR_FUNC_END:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_func_end));
                    out_arm->prior->opn1 = cur_IR->opn1;
                    out_arm->prior->opn2 = cur_IR->opn2;
                    out_arm->prior->result = cur_IR->result;
                    break;
                }

                case IR_LABEL:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_label));
                    out_arm->prior->opn1 = cur_IR->opn1;

                    break;
                }
                case IR_GOTO:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_b));
                    out_arm->prior->opn1 = cur_IR->opn1;

                    break;
                }

                case IR_ARG:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_void));
                    break;
                }
                case IR_PARAM:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_str));
                    out_arm->prior->opn1 = cur_IR->opn1;
                    out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 11;
                    out_arm->prior->result.type = 'i', out_arm->prior->result.const_int = cur_IR->opn2.address;
                    break;
                }

                case IR_CALL_VOID:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_bl));
                    out_arm->prior->opn1 = cur_IR->result;
                    break;
                }
                case ARM_MOVNE:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_movne));
                    out_arm->prior->opn1 = cur_IR->opn1;
                    out_arm->prior->opn2 = cur_IR->opn2;
                    break;
                }
                case ARM_MOVEQ:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_moveq));
                    out_arm->prior->opn1 = cur_IR->opn1;
                    out_arm->prior->opn2 = cur_IR->opn2;
                    break;
                }
                case ARM_ITORG:
                {
                    out_arm = merge_a(2, out_arm, mkarm(arm_ltorg));
                    break;
                }
                default:
                {
                    break;
                }
                }
            if (cur_IR->next == out_IR || cur_IR->next == &null_ir || cur_IR->next == NULL)
                break;
            cur_IR = cur_IR->next;
        }
}

/*-------------------------------------------寄存器分配函数实现区---------------------------------*/
//维护临时变量下次调用信息；
void maintain_tmp_use(struct opn *O, int index)
{
    // printf("tmp_allot[a2i(O->id)]: %d", tmp_allot[a2i(O->id)]);
    O->next_use = tmp_allot[a2i(O->id)];
    tmp_allot[a2i(O->id)] = index;
}

//计算最大活跃变量数；
void cal_alive_num(struct opn *O, int &ans)
{
    if (tmp_allot[a2i(O->id)] == 0 && O->next_use != 0)
        ans++, tmp_allot[a2i(O->id)] = 1;
    else if (tmp_allot[a2i(O->id)] == 0 && O->next_use == 0)
        tmp_allot[a2i(O->id)] = 1;
    else if (O->next_use == 0)
        ans--;
}

//给临时变量分配寄存器或栈空间；
void tmp_ris_allot(struct opn *O, struct codenode *begin, struct codenode *glo_begin, struct codenode *head, set<int, greater<int>> *ris_pq, int eind)
{

    int dlt;
    // if (1)
    // {
    //     // printf("%s: %s,:%s $%d: 当前应分配的寄存器：%d,nextuse:%d\n", begin->opn1.id, arm_op_strs[head->op], O->id, eind, *ris_pq->begin(), O->next_use);
    //     printris(ris_pq);
    // }

    int st_index = begin->opn1.offset;
    //该临时变量第一次出现，应该分配寄存器或栈空间存储；
    if (tmp_allot[a2i(O->id)] == 0)
    {
        if (O->next_use < 3)
        {

            // printf("特分配%d号寄存器\n", 12);
            fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].status = 2;
            fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris = 12;
            O->status = 2;
            O->no_ris = 12;
        }
        else if (ris_pq->empty()) //寄存器已满，分配内存区；
        {
            // printf("分配栈空间！\n");

            tmp_map[O->next_use] = a2i(O->id); //插入到map里;
            // printmap(&tmp_map);
            int tmp_t = tmp_map.begin()->second;
            if (tmp_t == a2i(O->id)) //新变量在调用后为最晚调用的临时变量；直接入栈，分配12号寄存器并插入存语句；
            {
                //分配12号寄存器；并把对应结点写入变量结点中；
                //插入存入栈语句；
                struct codenode *next_code = head->next;
                glo_opn1.type = 'v', glo_opn1.kind = 'V', strcpy(glo_opn1.id, O->id), glo_opn1.address = tmp_sp + 4, glo_opn1.status = 1, glo_opn1.flage = '0';
                glo_opn2.type = 'v', glo_opn2.status = 2, glo_opn2.kind = 'T', glo_opn2.no_ris = 12;
                split(glo_begin, next_code), merge(3, glo_begin, mkIR(IR_ASSIGN), next_code);
                //分配空间并维护函数空间大小；
                dlt = tmp_map.begin()->first;
                tmp_map.erase(dlt);
                fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].status = 1;
                fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].address = tmp_sp + 4;
                fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris = 12;
                O->status = 2, O->no_ris = 12;
            }
            else //新变量在调用后不是最晚的临时变量；
            {
                int tmp_ris;
                //插入存入栈语句；将最晚调用的临时变量存入栈；
                struct codenode *next_code = head->next;
                split(glo_begin, head); //换语句插入位置；
                glo_opn1.type = 'v', glo_opn1.kind = 'V', strcpy(glo_opn1.id, O->id), glo_opn1.address = tmp_sp + 4, glo_opn1.status = 1, glo_opn1.flage = '0';
                glo_opn2.type = 'v', glo_opn2.status = 2, glo_opn2.no_ris = fsT.st[sT.symbols[st_index].val_index].Tsyms[tmp_t].no_ris, glo_opn2.kind = 'T';
                tmp_ris = fsT.st[sT.symbols[st_index].val_index].Tsyms[tmp_t].no_ris;
                merge(3, glo_begin, mkIR(IR_ASSIGN), head);
                //修改符号表中的信息，将最晚调用的临时变量设为栈存储。
                fsT.st[sT.symbols[st_index].val_index].Tsyms[tmp_t].status = 1;
                fsT.st[sT.symbols[st_index].val_index].Tsyms[tmp_t].address = tmp_sp + 4;
                //将这个临时变量的寄存器分配给新临时变量；改符号表；
                dlt = tmp_map.begin()->first;
                tmp_map.erase(dlt);
                fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].status = 2;
                fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris = tmp_ris;
                ris3_status[tmp_ris] = a2i(O->id);
                O->status = 2, O->no_ris = tmp_ris;
            }
            tmp_sp += 4;

            // display_fsT(sT.symbols[st_index].val_index);
        }
        else //寄存器有空，分配寄存器；
        {
            // printf("分配%d号寄存器\n", *ris_pq->begin());
            int a2ians = a2i(O->id);

            tmp_map.insert(std::map<int, int>::value_type(O->next_use, a2ians));

            fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].status = 2;
            fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris = *ris_pq->begin();
            ris3_status[fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris] = a2i(O->id);
            O->status = 2;
            O->no_ris = *ris_pq->begin();
            ris_pq->erase(O->no_ris);
            // printf("aaaaaaaaaaa "), printOpn(*O), printf("\t%c", O->kind), printf(": %d\n", tmp_allot[a2i(O->id)]);
        }
        tmp_allot[a2i(O->id)] = 1;
    }
    //该寄存器非第一次出现，且不是最后一次出现；（调用了一个活跃的变量）；
    else if (O->next_use > 2)
    {
        struct T_symbol *tmp_Tsym = &fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)];
        //当前临时变量分配到了寄存器里；
        if (tmp_Tsym->status == 2)
        {
            // printf("调用%d号寄存器的值；\n", tmp_Tsym->no_ris);
            O->status = 2, O->no_ris = tmp_Tsym->no_ris;
            tmp_map[O->next_use] = a2i(O->id);
        }
        //当前临时变量分配到了栈空间里；
        else if (tmp_Tsym->status == 1)
        {
            O->status = 2;
            tmp_map[O->next_use] = a2i(O->id);

            int tmp_t1 = tmp_map.begin()->second;
            //如果本次调用的变量下次调用的时间是所有存在寄存器中的变量中最晚的，则直接取到寄存器12中用完即删，仍放在栈中；
            if (tmp_t1 == a2i(O->id))
            {
                // printf("调用栈中内容\n");

                glo_opn1.type = 'v', glo_opn1.status = 1, glo_opn1.address = tmp_Tsym->address, glo_opn1.kind = 'V', glo_opn1.flage = '0';
                glo_res.type = 'v', glo_res.status = 2, glo_res.no_ris = 12, glo_res.kind = 'T';
                strcpy(glo_opn1.id, O->id);
                split(glo_begin, head), merge(3, glo_begin, mkIR(IR_LOAD), head);
                tmp_Tsym->status = 1;
                dlt = tmp_map.begin()->first;
                tmp_map.erase(dlt);
                // FST中分配方式是1，而O中分配方式是2，即从本条命令从寄存器12中取用，下一次调用语句仍然访问栈空间；
                O->status = 2, O->address = tmp_Tsym->address, O->no_ris = 12;
            }
            //如果本次调用的变量下次调用的时间不是所有存在寄存器中的变量中最晚的，则进行寄存器与栈空间的变量交换。
            else if (tmp_t1 != a2i(O->id))
            {
                // printf("置换栈中内容\n");
                int tmp_ris1 = fsT.st[sT.symbols[st_index].val_index].Tsyms[tmp_t1].no_ris;
                //做一次move；
                glo_opn1.status = 2, glo_opn1.no_ris = 12, glo_opn1.kind = 'T';
                glo_opn2.status = 2, glo_opn2.no_ris = tmp_ris1, glo_opn2.kind = 'T';
                split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);

                //设定一节点地址为变量地址；二节点为寄存器；做一次load；
                glo_opn1.status = 1, glo_opn1.address = fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].address, strcpy(glo_opn1.id, tmp_Tsym->name), glo_opn1.kind = 'V', glo_opn1.flage = '0';
                glo_res.status = 2, glo_res.no_ris = tmp_ris1, glo_res.kind = 'T', glo_res.type = 'v';
                split(glo_begin, head), merge(3, glo_begin, mkIR(IR_LOAD), head);

                //设定一节点地址为变量地址，二结点为寄存器；做一次store；
                glo_opn1.status = 1, glo_opn1.address = fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].address, strcpy(glo_opn1.id, tmp_Tsym->name), glo_opn1.kind = 'V', glo_opn1.flage = '0';
                glo_opn2.status = 2, glo_opn2.no_ris = 12, glo_opn2.kind = 'T', glo_opn2.type = 'v';
                split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);

                //改符号表项；
                fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].status = 2, fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris = tmp_ris1;
                fsT.st[sT.symbols[st_index].val_index].Tsyms[tmp_t1].status = 1, fsT.st[sT.symbols[st_index].val_index].Tsyms[tmp_t1].address = fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].address;
                ris3_status[tmp_ris1] = a2i(O->id);
                dlt = tmp_map.begin()->first;
                tmp_map.erase(dlt);

                //改下一条语句变量项；
                O->status = 2, O->no_ris = tmp_ris1;
                ris3_status[fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris] = a2i(O->id);
            }
        }
    }
    //该寄存器是最后一次出现，调用后释放相关栈空间和寄存器（重新进入寄存器分配池队列）；
    else if (O->next_use < 3)
    {
        struct T_symbol *tmp_Tsym1 = &fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)];
        //存在栈空间分配；不再使用此变量，此时还要调用一次，在栈中的变量要再取一次。
        if (fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].status % 2 == 1)
        {
            // printf("调用并释放栈中内容！\n");
            glo_opn1.type = 'v', glo_opn1.status = 1, glo_opn1.address = tmp_Tsym1->address, glo_opn1.kind = 'V', glo_opn1.flage = '0';
            glo_res.type = 'v', glo_res.status = 2, glo_res.no_ris = 12, glo_res.kind = 'T';
            split(glo_begin, head), merge(3, glo_begin, mkIR(IR_LOAD), head);
            tmp_Tsym1->status = 1;
            // FST中分配方式是1，而O中分配方式是2，即从本条命令从寄存器10中取用，下一次调用语句仍然访问栈空间；
            O->status = 2, O->address = tmp_Tsym1->address, O->no_ris = 12;
            tmp_map.erase(O->next_use);
            //载入语句;
        }
        //只存在寄存器里；不再使用此变量，还要调用一次，但是不需要载入操作。
        else
        {
            // printf("释放%d号寄存器\n", fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris);
            O->status = 2, O->no_ris = fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris;
            if (fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris != 12)
                ris_pq->insert(fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris);
            // printf("当前最小号寄存器号数%d\n", ris_pq->top());
            tmp_map.erase(O->next_use);
            fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].status = 2;
            ris3_status[fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris] = -1;

            // fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris = 0;
        }
    }
    tmp_map.erase(eind);
    // printmap(&tmp_map);
    // printris(ris_pq);
}

//以一个函数为单位进行寄存器分配；
int func_ris_allot(struct codenode *begin, struct codenode *end, int end_index, struct codenode *glo_begin)
{
    //初始化寄存器状态数组;
    for (int rssi = 0; rssi < 10; rssi++)
        ris3_status[rssi] = -1;
    set<int, greater<int>> ris_pq = {4, 5, 6, 7, 8, 9, 10};

    //反向循环计算临时变量的失效时间及维护每个语句的临时变量的下次使用信息；
    //维护用到的寄存器号最大值，方便函数进入保护现场，退出恢复现场；
    int used_ris_num = 0;
    struct codenode *cur_C; //当前语句；
    cur_C = end;
    int i;
    int tmp_num = fsT.st[sT.symbols[begin->opn1.offset].val_index].top;
    for (i = 0; cur_C != begin; cur_C = cur_C->prior, i++)
    {

        if (cur_C->opn1.type == 'v' && cur_C->opn1.kind == 'T')
        {
            maintain_tmp_use(&cur_C->opn1, 3 * (end_index - i));
        }
        if (cur_C->opn2.type == 'v' && cur_C->opn2.kind == 'T')
        {
            maintain_tmp_use(&cur_C->opn2, 3 * (end_index - i) + 1);
        }
        if (cur_C->result.type == 'v' && cur_C->result.kind == 'T')
        {
            maintain_tmp_use(&cur_C->result, 3 * (end_index - i) + 2);
        }
    }

    //正向循环计算最大活动临时变量数目，以分配相应栈空间；
    int begin_index = end_index - i;
    int alive_tmp_num = 0, max_alive_tmp = 0;
    memset(tmp_allot, 0, (tmp_num + 2) * 4); //清空数组中的值，复用此数组；
    for (i = 0; cur_C != end; cur_C = cur_C->next, i++)
    {
        if (cur_C->opn1.type == 'v' && cur_C->opn1.kind == 'T')
        {
            // printf("aaaaaaaaaaa "), printOpn(cur_C->opn1), printf("\t%c", cur_C->opn1.kind), printf(": %d\n", tmp_allot[a2i(cur_C->opn1.id)]);

            cal_alive_num(&cur_C->opn1, alive_tmp_num);
        }
        if (cur_C->opn2.type == 'v' && cur_C->opn2.kind == 'T')
        {
            cal_alive_num(&cur_C->opn2, alive_tmp_num);
        }
        if (cur_C->result.type == 'v' && cur_C->result.kind == 'T')
        {
            cal_alive_num(&cur_C->result, alive_tmp_num);
        }
        // printf("当前索引：%d\t当前临时变量数：%d\n", (int)cur_C->op, alive_tmp_num);
        max_alive_tmp = alive_tmp_num > max_alive_tmp ? alive_tmp_num : max_alive_tmp;
    }
    // printf("活性变量个数：%d\n", alive_tmp_num);

    //正向循环完成寄存器分配；并在寄存器不足时插入合适的访存语句；同时维护寄存器号最大值；
    cur_C = begin;
    int pre_func_size = sT.symbols[begin->opn1.offset].size.const_int;
    tmp_sp = pre_func_size;                  // printf("临时变量数：%d\n", tmp_num);
    memset(tmp_allot, 0, (tmp_num + 2) * 4); //清空数组中的值，复用此数组；
    tmp_map.clear();
    for (i = 0; cur_C != end; cur_C = cur_C->next, i++)
    {
        if (cur_C->opn1.type == 'v' && cur_C->opn1.kind == 'T' && a2i(cur_C->opn1.id) > -1)
        {
            tmp_ris_allot(&cur_C->opn1, begin, glo_begin, cur_C, &ris_pq, 3 * (begin_index + i));
        }
        if (cur_C->opn2.type == 'v' && cur_C->opn2.kind == 'T' && a2i(cur_C->opn2.id) > -1)
        {
            tmp_ris_allot(&cur_C->opn2, begin, glo_begin, cur_C, &ris_pq, 3 * (begin_index + i) + 1);
        }
        if (cur_C->result.type == 'v' && cur_C->result.kind == 'T' && a2i(cur_C->result.id) > -1)
        {
            tmp_ris_allot(&cur_C->result, begin, glo_begin, cur_C, &ris_pq, 3 * (begin_index + i) + 2);
        }
    }
    // display_fsT(sT.symbols[begin->opn1.offset].val_index);

    return max_alive_tmp * 4;
}

//全局寄存器分配；
void glo_ris_allot()
{
    // printf("glo_ris_alloting\n");
    struct codenode *hC, *now_C;
    hC = out_IR;
    now_C = hC;
    int i = 0;
    int now_begin_index, now_end_index;
    struct codenode *now_begin, *now_end; //当前的函数体的开始语句索引与终止语句索引；

    //大循环,找出所有的func_end和function语句并按函数体分别分配寄存器；
    if (now_C->op == IR_FUNCTION)
    {
        now_begin = now_C, now_begin_index = i;
    }
    now_C = now_C->next;
    for (i = 1; now_C != hC; now_C = now_C->next, i++)
    {

        if (now_C->op == IR_FUNCTION)
            now_begin = now_C,
            now_begin_index = i;
        else if (now_C->op == IR_FUNC_END)
        {
            now_end = now_C, now_end_index = i;
            int add_size = func_ris_allot(now_begin, now_end, now_end_index, hC);
            sT.symbols[now_begin->opn1.offset].size.const_int += add_size; //按照使用的寄存器个数与额外内存大小扩大函数栈帧大小；
            if (add_size < 41)
            {
                now_begin->opn2.type = 'i', now_begin->opn2.const_int = add_size;
                now_end->opn2.type = 'i', now_end->opn2.const_int = add_size;
            }
            else if (add_size > 40)
            {
                now_begin->opn2.type = 'i', now_begin->opn2.const_int = 40;
                now_begin->result.type = 'i', now_begin->result.const_int = add_size;
                now_end->opn2.type = 'i', now_end->opn2.const_int = 40;
                now_end->result.type = 'i', now_end->result.const_int = add_size;
            }

            //寄存器分配后翻译；
            int argi = 1, parai = 0; //形参实参计算标志；
            trslt_after_allot(hC, now_begin, now_end, argi, parai);
            now_begin = now_end = NULL;
        }

        // printf("%d: now_begin:%d; now_end:%d", i, now_begin_index, now_end_index);
        // printf("\tOP: %s\n", IR_op_strs[int(now_C->op)]);
    }
}

void Divide_blocks()
{
    struct arm_instruction *hC, *now_C;
    hC = out_arm;
    now_C = hC;
    int i = 0;
    int now_begin_index, now_end_index;
    struct arm_instruction *now_begin, *now_end; //当前的函数体的开始语句索引与终止语句索引；

    if (now_C->op == arm_func)
    {
        glo_opn1.type = 'i', glo_opn1.const_int = block_num;
        b_list.bl[b_list.top].b_begin = now_C;
        b_list.bl[b_list.top].size = 0;
        b_list.bl[b_list.top].index = block_num;
        b_list.top = 1;
    }
    now_C = now_C->next;

    for (i = 1; now_C != hC; now_C = now_C->next, i++)
    { //全局变量翻译；

        if (b_list.bl[b_list.top - 1].b_end == NULL)
            b_list.bl[b_list.top - 1].size++;
        // if (b_list.bl[b_list.top - 1].size % 60 == 0 && b_list.bl[b_list.top - 1].size > 59)
        // {
        //     glo_opn1.type = 'v', glo_opn1.kind = 'L', strcpy(glo_opn1.id, newLabel());
        //     split_a(hC, now_C);
        //     hC = merge_a(5, hC, mkarm(arm_b), mkarm(arm_ltorg), mkarm(arm_label), now_C);
        //     now_C->prior->prior->prior->opn1 = glo_opn1;
        //     now_C->prior->opn1 = glo_opn1;
        //     // now_C = now_C->prior->prior;
        // }
        if (now_C->op == arm_func || now_C->op == arm_label)
        {
            if (b_list.bl[b_list.top - 1].b_end == NULL)
            {
                b_list.bl[b_list.top - 1].b_end = now_C->prior;
            }
            glo_opn1.type = 'i', glo_opn1.const_int = block_num;
            b_list.bl[b_list.top].b_begin = now_C;
            b_list.bl[b_list.top].size = 0;
            b_list.bl[b_list.top].index = block_num;

            // if (b_list.bl[b_list.top - 1].index == 45)
            // {
            //     b_list.bl = (struct block *)realloc(b_list.bl,100* sizeof(struct block));
            // }
            b_list.top++, block_num++;
        }
        else if (now_C->op == arm_func_end || now_C->op == arm_b)
        {
            glo_opn2.type = 'i', glo_opn2.const_int = b_list.bl[b_list.top - 1].size;
            b_list.bl[b_list.top - 1].b_end = now_C;
        }
    }
}

void clear_IR()
{

    struct codenode *code = out_IR, *cp = code->prior, *cn = code->next;
    while (1)
    {
        cp = code->prior, cn = code->next;
        if (cp != cn)
        {
            cp->next = cn, cn->prior = cp;
            free(code), code = cn;
        }
        else
        {
            if (cp != code)
                free(code);
            free(cp);
            break;
        }
    }
}

void display_bl()
{
    printf("------------------------------bl:-----------------------------\n");
    for (int i = 0; i < b_list.top; i++)
    {

        printf("\tindex:%d\tsize:%d\tbegin:%s;%s\tend:%s;%s\n", b_list.bl[i].index, b_list.bl[i].size, IR_op_strs[b_list.bl[i].b_begin->op], b_list.bl[i].b_begin->opn1.id, IR_op_strs[b_list.bl[i].b_end->op], b_list.bl[i].b_end->opn1.id);
    }
    printf("------------------------------   -----------------------------\n");
}

void translation()
{
    null_ar.op = arm_void;
    out_arm = &null_ar;

    trslt_before_allot();
    glo_ris_allot();
    // display_bl();
    trslt_out();
    // Divide_blocks();
}