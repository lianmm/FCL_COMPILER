/*IR到ARM的翻译实现：含翻译，分块，寄存器分配三部分*/
//在优化中必会用到的ARM增删改实现函数：split_a,merge_a,mkarm需要清楚其功能
//层次很杂乱，之后有机会再整理一下，本文件做优化应该不需要修改。
#include "../../include/backend/translation.h"
#include <queue>
#include <map>
#include <set>
#include <string>
using namespace std;

/*--------------------------------------------相关全局变量-------------------------------------*/

//实参设置的支持；
int ris3_status[11] = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};

struct arm_instruction null_ar;
struct arm_instruction *out_arm;
map<int, struct block, greater<int>> b_list;

char arm_op_strs[75][15] = {
    "ARM_FUNC", "ARM_FUNC_END", "ARM_BLOCK", "ARM_BLOCK_END", "ARM_VOID", "ARM_ALLOC_E",

    "mov", "mov", "mov_RE", "mov", "ldr", ".ltorg", "str", "str", "ldr", "ldr", ".word", ".space",

    "add", "add", "rsb", "sub", "mul",

    ".label:", "cmp", "b", "bl", "blt", "ble", "bgt", "bge", "beq", "bne", "moveq", "movne",

    "vmov.f32", "vmov.f32", "vfp_mov_rE", "vldr.f32",

    "vstr.32", "vstr.32", "vldr.32", "vldr.32",

    "vadd.f32", "vadd.f32", "vfp_rsb", "vsub.f32", "vmul.f32", "vdiv.f32", "vcmp.f32",

    "vmsr", "vmsr", "vcvt",

    "vmoveq.f32", "vmovne.f32",

    "vmov.s32", "vldr.s32", ".str.s32",
    "vmoveq.s32", "vmovne.s32"};

extern class codenode *oneir;

/*--------------------------------------------支持函数实现区------------------------------------*/

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
struct arm_instruction *mkarm(struct codenode *C, ARM_op op)
{
    struct arm_instruction *h = new struct arm_instruction();
    h->cal_type = C->cal_type;
    h->op = op;
    h->next = h;
    h->prior = h;
    h->opn1.type = '0';
    h->opn2.type = '0';
    h->result.type = '0';
    return h;
}

/*--------------------------------------------指令优化回补--------------------------------------*/

//模块化添加IR函数；

void add_movri_IR(struct codenode *head, struct opn *O)
{
    struct codenode *newIr = mkIR(IR_ASSIGN);
    newIr->opn2 = *O;
    mksymt();
    newIr->opn1.type = 'v', newIr->opn1.kind = 'T';
    newIr->opn1.id = g_sL.last_sym;
    newIr->opn1.cal_type = O->type;
    newIr->cal_type = O->type;
    split(out_IR, head), out_IR = merge(3, out_IR, newIr, head);
    *O = newIr->opn1;
}
IR_op nonOp(IR_op op)
{
    switch (op)
    {
    case IR_EQ:
        return IR_EQ;
    case IR_NEQ:
        return IR_NEQ;
    case IR_JGE:
        return IR_JLT;
    case IR_JLT:
        return IR_JGE;
    case IR_JLE:
        return IR_JGT;
    case IR_JGT:
        return IR_JLE;
    default:
        return op;
    }
}

//回补由于优化导致的立即数载入等语句的缺失；
void IRReplenishment()
{
    if (g_ssaS.Flist.size() > 0)
    {
        for (auto it = g_ssaS.Flist.begin(); it != g_ssaS.Flist.end(); it++)
        {
            no_tmp = g_sL.glo_ymT[it->first].func_t == NULL ? 0 : g_sL.glo_ymT[it->first].func_t->size();
            //置栈空间指针为函数已有大小，用于分配过多的phi返回值；
            g_sL.now_func = it->first;
            // cout << g_sL.now_func << endl;
            struct codenode *cur = g_sL.find(g_sL.now_func)->code_b, *end = g_sL.find(g_sL.now_func)->code_e;
            for (; cur != end; cur = cur->next)
            {
                switch (cur->op)
                {
                case IR_ASSIGN:
                {
                    if (cur->opn1.type == 'v' && cur->opn1.flage == 'E')
                    {
                        if (cur->opn2.type != 'v')
                            add_movri_IR(cur, &cur->opn2);
                        else if (g_sL.find(cur->opn2.id)->no_ris > 190)
                            add_movrd_IR(cur, &cur->opn2);
                        else if (g_sL.find(cur->opn2.id)->status == 1)
                            add_ldrrS_IR(cur, &cur->opn2);
                    }
                    else if (cur->opn2.type == 'v' && cur->opn2.flage == 'E')
                    {
                        if (g_sL.find(cur->opn1.id)->no_ris > 190)
                            add_movdr_IR(cur, &cur->opn1);
                        else if (g_sL.find(cur->opn1.id)->status == 1)
                            add_strSr_IR(cur, &cur->opn1);
                    }
                    else if (cur->opn1.cal_type == 'f' && g_sL.find(cur->opn2.id)->no_ris > 190)
                    {
                        add_movrd_IR(cur, &cur->opn2);
                        cur->opn2.cal_type = 'i';
                        cur->prior->opn1.cal_type = 'i';
                    }
                    // else if (cur->opn1.cal_type == 'f' && g_sL.find(cur->opn2.id)->status == 1)
                    // {
                    //     add_ldrrS_IR(cur, &cur->opn2);
                    // }
                    else if (cur->opn1.type == 'v' && g_sL.find(cur->opn1.id)->no_ris > 190)
                    {
                        if (cur->opn2.type != 'v')
                            add_movri_IR(cur, &cur->opn2);

                        else if (g_sL.find(cur->opn2.id)->no_ris > 190)
                        {
                            if (g_sL.find(cur->opn2.id)->no_ris == g_sL.find(cur->opn1.id)->no_ris)
                                cur->op = IR_VOID;
                            else
                                add_movrd_IR(cur, &cur->opn2);
                        }
                        else if (g_sL.find(cur->opn2.id)->status == 1)
                            add_ldrrS_IR(cur, &cur->opn2);
                    }
                    else if (cur->opn1.id == "r0" && g_sL.find(cur->opn2.id)->status == 1)
                    {
                        cur->result = cur->opn1;
                        cur->opn1 = cur->opn2;
                        cur->op = IR_LOAD;
                    }
                    break;
                }

                case IR_MINUS:
                {

                    if (cur->opn1.type == 'f')
                        add_movri_IR(cur, &cur->opn1);
                    if (cur->opn2.type == 'f')
                        add_movri_IR(cur, &cur->opn2);

                    // cout << "minus:" << cur->opn1.id << "\t" << cur->opn1.no_ris << endl;
                    if (cur->opn1.type != 'v')
                    {
                        if (cur->opn1.type == 'i' && (cur->opn1.const_int < 256 && cur->opn1.const_int >= 0))
                            ;
                        else
                        {
                            add_movri_IR(cur, &cur->opn1);
                        }
                    }
                    else if (g_sL.find(cur->opn1.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->opn1);
                    else if (g_sL.find(cur->opn1.id)->status == 1)
                        add_ldrrS_IR(cur, &cur->opn1);

                    if (cur->opn2.type != 'v')
                    {
                        // cout << "减法：" << cur->opn2.type << "\t" << cur->opn2.id << "\t" << cur->opn2.const_int << endl;
                        if (cur->opn2.type != 'i' && (cur->opn2.const_int > 255 || cur->opn2.const_int < 0))
                            add_movri_IR(cur, &cur->opn2);
                    }
                    else if (g_sL.find(cur->opn2.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->opn2);
                    else if (g_sL.find(cur->opn2.id)->status == 1)
                        add_ldrrS_IR(cur, &cur->opn2);

                    if (g_sL.find(cur->result.id)->no_ris > 190)
                        add_movdr_IR(cur, &cur->result);

                    else if (g_sL.find(cur->result.id)->status == 1)
                        add_strSr_IR(cur, &cur->result);
                    break;
                }
                case IR_MOD:
                {
                    if (cur->opn1.type == 'f')
                        add_movri_IR(cur, &cur->opn1);
                    if (cur->opn2.type == 'f')
                        add_movri_IR(cur, &cur->opn2);

                    if (cur->opn1.type != 'v')
                        add_movri_IR(cur, &cur->opn1);
                    else if (g_sL.find(cur->opn1.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->opn1);
                    else if (g_sL.find(cur->opn1.id)->status == 1)
                        add_ldrrS_IR(cur, &cur->opn1);
                    if (cur->opn2.type != 'v')
                        add_movri_IR(cur, &cur->opn2);
                    else if (g_sL.find(cur->opn2.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->opn2);
                    else if (g_sL.find(cur->opn2.id)->status == 1)
                        add_ldrrS_IR(cur, &cur->opn2);
                    if (g_sL.find(cur->result.id)->no_ris > 190)
                        add_movdr_IR(cur, &cur->result);
                    else if (g_sL.find(cur->result.id)->status == 1)
                        add_strSr_IR(cur, &cur->result);
                    break;
                }
                case IR_ADD:
                {
                    if (cur->opn1.type == 'f')
                        add_movri_IR(cur, &cur->opn1);
                    if (cur->opn2.type == 'f')
                        add_movri_IR(cur, &cur->opn2);

                    if (cur->opn1.type == 'i' && (cur->opn1.const_int > 256 || cur->opn1.const_int < 0))
                    {
                        add_movri_IR(cur, &cur->opn1);
                    }
                    if (cur->opn2.type == 'i')
                    {
                        if (cur->opn2.const_int > 256 || cur->opn2.const_int < 0)
                            add_movri_IR(cur, &cur->opn2);
                        else
                        {
                            opn tmpo = cur->opn2;
                            cur->opn2 = cur->opn1;
                            cur->opn1 = tmpo;
                        }
                    }

                    if (g_sL.find(cur->opn1.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->opn1);
                    else if (g_sL.find(cur->opn1.id)->status == 1)
                        add_ldrrS_IR(cur, &cur->opn1);
                    if (g_sL.find(cur->opn2.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->opn2);
                    else if (g_sL.find(cur->opn2.id)->status == 1)
                        add_ldrrS_IR(cur, &cur->opn2);
                    if (g_sL.find(cur->result.id)->no_ris > 190)
                        add_movdr_IR(cur, &cur->result);
                    else if (g_sL.find(cur->result.id)->status == 1)
                        add_strSr_IR(cur, &cur->result);
                    break;
                }
                case IR_MUL:
                {
                    if (cur->opn1.type == 'f')
                        add_movri_IR(cur, &cur->opn1);
                    if (cur->opn2.type == 'f')
                        add_movri_IR(cur, &cur->opn2);

                    if ((cur->opn2.type == 'i' && log2(cur->opn2.const_int) - (int)log2(cur->opn2.const_int) != 0) || cur->opn2.type == 'f')
                    {
                        add_movri_IR(cur, &cur->opn2);
                    }
                    if ((cur->opn1.type == 'i' && log2(cur->opn1.const_int) - (int)log2(cur->opn1.const_int) != 0) || cur->opn1.type == 'f')
                    {
                        add_movri_IR(cur, &cur->opn1);
                    }
                    if (g_sL.find(cur->opn1.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->opn1);
                    else if (g_sL.find(cur->opn1.id)->status == 1)
                        add_ldrrS_IR(cur, &cur->opn1);
                    if (g_sL.find(cur->opn2.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->opn2);
                    else if (g_sL.find(cur->opn2.id)->status == 1)
                        add_ldrrS_IR(cur, &cur->opn2);
                    if (g_sL.find(cur->result.id)->no_ris > 190)
                        add_movdr_IR(cur, &cur->result);
                    else if (g_sL.find(cur->result.id)->status == 1)
                        add_strSr_IR(cur, &cur->result);
                    break;
                }
                case IR_DIV:
                {
                    if (cur->opn1.type == 'f')
                        add_movri_IR(cur, &cur->opn1);
                    if (cur->opn2.type == 'f')
                        add_movri_IR(cur, &cur->opn2);

                    if (cur->opn2.type == 'i' && cur->opn2.const_int > 1024 && log2(cur->opn2.const_int) - (int)log2(cur->opn2.const_int) != 0)
                    {
                        add_movri_IR(cur, &cur->opn2);
                    }
                    if (cur->opn1.type == 'i' && cur->opn1.const_int > 1024 && log2(cur->opn1.const_int) - (int)log2(cur->opn1.const_int) != 0)
                    {
                        add_movri_IR(cur, &cur->opn1);
                    }

                    if (g_sL.find(cur->opn1.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->opn1);
                    else if (g_sL.find(cur->opn1.id)->status == 1)
                        add_ldrrS_IR(cur, &cur->opn1);
                    if (g_sL.find(cur->opn2.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->opn2);
                    else if (g_sL.find(cur->opn2.id)->status == 1)
                        add_ldrrS_IR(cur, &cur->opn2);
                    if (g_sL.find(cur->result.id)->no_ris > 190)
                        add_movdr_IR(cur, &cur->result);
                    else if (g_sL.find(cur->result.id)->status == 1)
                        add_strSr_IR(cur, &cur->result);
                    break;
                }
                case IR_JLT:
                case IR_JLE:
                case IR_JGT:
                case IR_JGE:
                case IR_EQ:
                case IR_NEQ:
                {
                    if (cur->opn1.type == 'f')
                        add_movri_IR(cur, &cur->opn1);
                    if (cur->opn2.type == 'f')
                        add_movri_IR(cur, &cur->opn2);

                    if (cur->opn1.cal_type == 'f' && cur->opn2.type == 'i')
                    {
                        cur->opn2.type = 'f';
                        cur->opn2.const_float = (float)cur->opn2.const_int;
                        add_movri_IR(cur, &cur->opn2);
                    }

                    if (cur->opn1.type != 'v' && cur->opn2.type == 'v')
                    {
                        opn tmpo = cur->opn1;
                        cur->opn1 = cur->opn2;
                        cur->opn2 = tmpo;
                        cur->op = nonOp(cur->op);
                    }
                    if (g_sL.find(cur->opn1.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->opn1);
                    else if (g_sL.find(cur->opn1.id)->status == 1)
                        add_ldrrS_IR(cur, &cur->opn1);
                    if (cur->opn2.type == 'f' || (cur->opn2.type == 'i' && (cur->opn2.const_int > 255 || cur->opn2.const_int < 0)))
                    {
                        add_movri_IR(cur, &cur->opn2);
                    }
                    if (g_sL.find(cur->opn2.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->opn2);
                    else if (g_sL.find(cur->opn2.id)->status == 1)
                        add_ldrrS_IR(cur, &cur->opn2);
                    // g_sscpS.find(cur->opn2.id)->insUseSite(cur, &cur->opn2);
                    // g_sscpS.find(cur->opn1.id)->insUseSite(cur, &cur->opn1);
                    // g_sscpS.insCTStop(cur, &cur->result);TODO
                    break;
                }
                case IR_AND:
                case IR_OR:
                {
                    break;
                }
                case IR_GOTO_JLT:
                case IR_GOTO_JLE:
                case IR_GOTO_JGT:
                case IR_GOTO_JGE:
                case IR_GOTO_EQ:
                case IR_GOTO_NEQ:
                case IR_GOTO_NOT:
                {

                    break;
                }
                case IR_GOTO_AND:
                case IR_GOTO_OR:
                {
                    break;
                }
                case IR_EXP_ARROFF:
                {
                    // cout << "IR_EXP_ARROFF:" << cur->opn2.id << cur->opn2.type << endl;
                    if (cur->opn2.type != 'v')
                        add_movri_IR(cur, &cur->opn2);
                    else if (g_sL.find(cur->opn2.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->opn2);
                    else if (g_sL.find(cur->opn2.id)->status == 1)
                        add_ldrrS_IR(cur, &cur->opn2);
                    if (g_sL.find(cur->result.id)->no_ris > 190)
                        add_movdr_IR(cur, &cur->result);
                    else if (g_sL.find(cur->result.id)->status == 1)
                        add_strSr_IR(cur, &cur->result);

                    break;
                }
                case IR_ARROFF_EXP:
                {
                    // cout << "IR_ARROFF_EXP:" << cur->opn2.id << cur->opn2.type << endl;

                    if (cur->opn2.type != 'v')
                        add_movri_IR(cur, &cur->opn2);
                    else if (g_sL.find(cur->opn2.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->opn2);
                    else if (g_sL.find(cur->opn2.id)->status == 1)
                        add_ldrrS_IR(cur, &cur->opn2);
                    if (cur->result.type != 'v')
                        add_movri_IR(cur, &cur->result);
                    else if (g_sL.find(cur->result.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->result);
                    break;
                }
                case IR_ARROFF_EXPi:
                {
                    // cout << "IR_ARROFF_EXPi:" << cur->opn2.id << cur->opn2.type << endl;

                    if (cur->result.type != 'v')
                        add_movri_IR(cur, &cur->result);
                    if (cur->opn2.type != 'v' && cur->opn2.const_int > 4095)
                        add_movri_IR(cur, &cur->opn2);
                    else if (g_sL.find(cur->result.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->result);
                    break;
                }
                case IR_EXP_ARROFFa:
                {
                    if (cur->opn2.type != 'v')
                        add_movri_IR(cur, &cur->opn2);
                    else if (g_sL.find(cur->opn2.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->opn2);
                    else if (g_sL.find(cur->opn2.id)->status == 1)
                        add_ldrrS_IR(cur, &cur->opn2);
                    break;
                }
                case IR_ARROFF_EXPi0:
                {
                    break;
                }
                case IR_VCVT:
                {

                    if (g_sL.find(cur->result.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->result);
                    if (g_sL.find(cur->opn2.id)->no_ris > 190)
                        add_movdr_IR(cur, &cur->opn2);
                    else if (g_sL.find(cur->opn2.id)->status == 1)
                        add_ldrrS_IR(cur, &cur->opn2);

                    break;
                }

                case IR_CALL:
                {
                    if (g_sL.find(cur->result.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->result);
                    break;
                }
                case IR_NOT:
                {
                    if (g_sL.find(cur->opn1.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->opn1);
                    else if (g_sL.find(cur->opn1.id)->status == 1)
                        add_ldrrS_IR(cur, &cur->opn1);
                    if (g_sL.find(cur->result.id)->no_ris > 190)
                        add_movdr_IR(cur, &cur->result);
                    else if (g_sL.find(cur->result.id)->status == 1)
                        add_strSr_IR(cur, &cur->result);
                    break;
                }
                case IR_UMINUS:
                {
                    if (g_sL.find(cur->opn1.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->opn1);
                    else if (g_sL.find(cur->opn1.id)->status == 1)
                        add_ldrrS_IR(cur, &cur->opn1);
                    if (g_sL.find(cur->result.id)->no_ris > 190)
                        add_movdr_IR(cur, &cur->result);
                    else if (g_sL.find(cur->result.id)->status == 1)
                        add_strSr_IR(cur, &cur->result);
                    break;
                }
                case IR_LOAD:
                {

                    if (cur->opn1.status == 1 && g_sL.find(cur->result.id)->status == 1)
                    {
                        opn tmpo = cur->result;
                        mksymt();
                        cur->result.id = g_sL.last_sym, cur->result.type = 'v', cur->result.kind = 'T', cur->cal_type = cur->opn1.cal_type;
                        cur->next->op = IR_ASSIGN;
                        cur->next->opn2 = cur->result,
                        cur->next->opn1 = tmpo;
                        cur->next->cal_type = cur->opn1.cal_type;
                        cur = cur->next;
                    }
                    break;
                }
                case IR_ALLOCA:
                {
                    break;
                }
                case IR_FUNCTION:
                {
                    break;
                }
                case IR_FUNC_END:
                {
                    break;
                }
                case IR_PARAM:
                {
                    break;
                }
                case IR_LABEL:
                {
                    break;
                }
                case IR_GOTO:
                {
                    break;
                }
                case BLOCK:
                {
                    break;
                }
                case IR_ARG:
                {

                    if (cur->result.type != 'v')
                        add_movri_IR(cur, &cur->result);
                    else if (g_sL.find(cur->result.id)->no_ris > 190)
                        add_movrd_IR(cur, &cur->result);
                    else if (g_sL.find(cur->result.id)->status == 1)
                        add_ldrrS_IR(cur, &cur->result);
                    break;
                }
                case IR_RETURN:
                {
                    break;
                }
                case IR_CALL_VOID:
                {
                    break;
                }
                case ARM_MOVNE:
                case ARM_MOVEQ:
                case ARM_MOVcont:
                {
                    if (g_sL.find(cur->opn2.id)->no_ris == g_sL.find(cur->opn1.id)->no_ris && g_sL.find(cur->opn1.id)->address == g_sL.find(cur->opn2.id)->address && g_sL.find(cur->opn1.id)->status != 0 && g_sL.find(cur->opn2.id)->status == g_sL.find(cur->opn1.id)->status)
                    {
                        cur->op = IR_VOID;
                    }
                    if (cur->opn2.type != 'v')
                    {
                        add_movri_IR(cur, &cur->opn2);
                        cur->prior->cont = cur->cont;
                    }
                    break;
                }
                default:
                    break;
                }
            }
        }
    }
}

/*------------------------------------------指令浮点翻译----------------------------------------*/
void IR_op_cal_type()
{
    if (out_IR != &null_ir && out_IR != NULL)
    {
        struct codenode *now = out_IR->next;
        if (now != NULL)
        {
            for (int i = 0; now != out_IR; now = now->next, i++)
            {
                now->cal_type = 'i';
                if ((int)now->op < (int)IR_ADD)
                {
                    if (now->op == IR_ASSIGN && now->opn1.id == "t2")
                    {
                        // printf("now->opn1.cal_type:%c, now->opn2.cal_type:%c\n", now->opn1.cal_type, now->opn2.cal_type);
                    }
                    if (now->opn1.cal_type == 'f' || now->opn2.cal_type == 'f')
                        now->cal_type = 'f';
                }
                else if ((int)now->op < (int)IR_JLT)
                {
                    if (now->opn1.cal_type == 'f' || now->opn2.cal_type == 'f' || now->result.cal_type == 'f')
                        now->cal_type = 'f';
                }
                else if ((int)now->op < (int)IR_GOTO_JLT)
                {
                    if (now->opn1.cal_type == 'f' || now->opn2.cal_type == 'f')
                        now->cal_type = 'f';
                }
                else if ((int)now->op < (int)IR_VCVT)
                {
                    // printf("%s: %c:%c", IR_op_strs[(int)now->op], now->opn2.type, now->opn2.cal_type);
                    if (now->opn1.cal_type == 'f' || now->opn2.cal_type == 'f' || now->result.cal_type == 'f')
                        now->cal_type = 'f';
                }
                else if ((int)now->op < (int)IR_FUNCTION)
                {
                    if (now->opn1.cal_type == 'f' || now->result.cal_type == 'f')
                        now->cal_type = 'f';
                }
                else if ((int)now->op < (int)IR_ARG)
                {
                    if (now->opn1.cal_type == 'f')
                        now->cal_type = 'f';
                }
                else
                {
                    if (now->result.cal_type == 'f')
                        now->cal_type = 'f';
                }
            }
        }
    }
}

void float_trslt()
{
    struct arm_instruction *now = out_arm->next;
    for (int i = 0; now != out_arm; now = now->next, i++)
    {
        if (now->cal_type == 'f')
        {
            switch ((int)now->op)
            {
            case arm_add:
                now->op = vfp_add;
                break;
            case arm_cmp:
                now->op = vfp_cmp;
                break;
            case arm_ldr:
                now->op = vfp_ldr;
                break;
            case arm_ldr_ri:
                now->op = vfp_ldr_si;
                break;
            case arm_ldr_l2:
                now->op = vfp_ldr_l2;
                break;
            case arm_mov_r0:
                now->op = vfp_mov_s0;
                break;
            case arm_mov_rE:
                now->op = vfp_mov_rE;
                break;
            case arm_mov_rr:
                now->op = vfp_mov_ss;
                break;
            case arm_mul:
                now->op = vfp_mul;
                break;
            case arm_rsb:
            {
                if (now->result.type == 'i')
                {
                    split_a(out_arm, now), out_arm = merge_a(3, out_arm, mkarm(out_IR, vfp_ldr_si), now);
                    now->prior->cal_type = 'f';
                    now->prior->opn1.cal_type = 'f', now->prior->opn1.type = 'v', now->prior->opn1.kind = 'T', now->prior->opn1.id = "s5", now->prior->opn1.status = 2, now->prior->opn1.no_ris = 105;
                    now->prior->opn2.type = 'i', now->prior->opn2.const_int = now->result.const_int, now->prior->opn2.cal_type = 'i';
                    now->result = now->prior->opn1;
                }

                now->op = vfp_sub;

                struct opn tmp_opn = now->opn2;
                now->opn2 = now->result, now->result = tmp_opn;
                break;
            }
            case arm_str:
                now->op = vfp_str;
                break;
            case arm_str_l2:
                now->op = vfp_str_l2;
                break;
            case arm_sub:
                now->op = vfp_sub;
                break;
            case arm_moveq:
                now->op = vfp_moveq;
                break;
            case arm_movne:
                now->op = vfp_movne;
                break;
            default:
                break;
            }
        }
    }
}

/*-------------------------------------------IR翻译函数实现区---------------------------------*/
//特定语句翻译；
void trslt_arg(int a_index, struct codenode *glo_begin, struct codenode *head, int st_index, string toid)
{

    int tmp_ris1 = head->result.no_ris, tmp_ris2 = a_index;
    int tmp_t1 = ris3_status[a_index], tmp_t2 = a2i(head->result.id);
    // printf("调用了函数：%s,参数个数：%d ,当前实参序号：%d\tname:%s\t%c\n", toid.c_str(), g_sL.find(toid)->paramnum, a_index, head->result.id.c_str(), head->result.cal_type);
    if (g_sL.find(toid)->paramnum == a_index)
    {
        head->op = IR_ASSIGN;
        head->opn2 = head->result;
        head->opn1.type = 'v', head->opn1.kind = 'T', head->opn1.status = 2, head->opn1.no_ris = 0;
        if (head->result.cal_type == 'f')
        {
            head->cal_type = 'f';
            head->opn1.cal_type = 'f';
            head->opn1.no_ris = 100;
        }
    }
    else if (a_index < 4)
    {
        if (head->result.cal_type == 'i')
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
                g_sL.find(i2s(tmp_t1))->no_ris = tmp_ris1, g_sL.find(i2s(tmp_t2))->no_ris = tmp_ris2;

                ris3_status[tmp_ris1] = tmp_t1, ris3_status[tmp_ris2] = tmp_t2;
            }
        }
        else if (head->result.cal_type == 'f')
        {
            // printf("\t%d %s:%d\n", a_index, head->result.id.c_str(), ris3_status[a_index]);

            head->op = IR_ASSIGN, head->cal_type = 'f';
            head->opn2 = head->result;
            head->opn1.type = 'v', head->opn1.kind = 'T', head->opn1.status = 2, head->opn1.no_ris = a_index + 100;
            head->opn1.cal_type = 'f';
            // ris3_status[a_index] = a2i(head->result.id);
            //  printf("\t%d\t%d\n", head->opn1.no_ris, head->result.no_ris);
        }
    }
    else
    {
        if (head->result.flage == 'E' && head->result.kind == 'A')
        {
            // printf("当前实参名：%s\n", head->result.id.c_str());
            oneir = mkIR(IR_ASSIGN);
            oneir->setOpn(Opn1, "r12", 'T');
            oneir->opn1.status = 2, oneir->opn1.no_ris = 12;
            oneir->opn2 = head->result;
            split(glo_begin, head), merge(3, glo_begin, oneir, head);
            head->op = IR_ASSIGN;
            head->setOpn(Opn2, "r12", 'T');
            head->opn2.status = 2, head->opn2.no_ris = 12;
            head->opn1.type = 'v', head->opn1.kind = 'R', head->opn1.status = 1, head->opn1.address = -4 * (a_index - 4);
        }
        else
        {
            head->op = IR_ASSIGN;
            head->opn2 = head->result;
            head->opn1.type = 'v', head->opn1.kind = 'R', head->opn1.status = 1, head->opn1.address = -4 * (a_index - 4);
        }
        // ris3_status[a_index] = a2i(head->result.id);
    }
}

void trslt_para(int a_index, struct codenode *glo_begin, struct codenode *head, int st_index)
{
    int tmp_ris1 = head->result.no_ris, tmp_ris2 = a_index;
    int tmp_t1 = ris3_status[a_index], tmp_t2 = a2i(head->result.id);
    if (a_index < 4)
    {
        head->opn1.type = 'v', head->opn1.status = 2, head->opn1.kind = 'T', head->opn1.no_ris = head->result.const_int;
        head->opn2.type = 'v', head->opn2.status = 1, head->opn2.kind = 'V', head->opn2.address = -(4 + 4 * head->result.const_int);
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
    if (head->cal_type == 'i')
    {
        double ans = -1;
        if (head->opn2.type == 'i')
        {
            ans = log2(head->opn2.const_int);
        }
        if (ans != -1 && ans == (int)ans)
        {

            return;
        }
        int a_index = 0;
        int tmp_ris1, tmp_ris2, tmp_t1, tmp_t2;
        for (a_index = 0; a_index < 2; a_index++)
        {
            {
                glo_opn2 = a_index == 0 ? head->opn1 : head->opn2;
                glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = a_index;
                // ris3_status[a_index] = a2i(head->result.id);
                split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);
            }
        }
        glo_res.type = 'v', glo_res.kind = 'F', glo_res.id = type == 0 ? "__aeabi_idiv" : "__aeabi_idivmod";
        split(glo_begin, head), merge(3, glo_begin, mkIR(IR_CALL_VOID), head);
        head->op = IR_ASSIGN;
        head->opn1 = head->result;
        head->opn2.type = 'v', head->opn2.kind = 'T', head->opn2.status = 2, head->opn2.no_ris = type == 0 ? 0 : 1;
        // ris3_status[a_index] = a2i(head->result.id);
    }
    else if (head->cal_type == 'f')
    {
    }
}

void trslt_goto(struct codenode *glo_begin, struct codenode *head)
{
    char tmp_label[36];
    strcpy(tmp_label, newLabel());
    struct opn tmp_res;
    struct opn tmp_res1;
    struct codenode *hnext2;
    struct codenode *cur = head, *Label = head, *Goto, *Gotoe;
    while (Label->op != IR_LABEL)
        Label = Label->next;
    Goto = Label;
    if (Label->prior->op == IR_GOTO)
        Goto = Label->prior;
    Gotoe = head;
    while (Gotoe->op != IR_GOTO_EQ && Gotoe->op != IR_GOTO_NEQ && Gotoe != Label)
        Gotoe = Gotoe->next;
    if (Goto != Label && Gotoe != Label)
    {
        tmp_res = Gotoe->result;
        tmp_res1 = Goto->opn1;
        Gotoe->op = (IR_op)((int)head->op + 8), Gotoe->result.id = tmp_label;
        head->op = IR_EQ;
        //信号为false时的转化；
        hnext2 = Goto;
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
        glo_opn1.type = 'v', glo_opn1.kind = 'L', glo_opn1.id = tmp_label;
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

        if (Gotoe->op == IR_GOTO_EQ || Gotoe->op == IR_GOTO_NEQ)
        {
            Gotoe->op = (IR_op)((int)head->op + 8);
            hnext2 = Label;
            tmp_res = Gotoe->result;

            Gotoe->result.id = tmp_label;
        }
        else if (Gotoe == Label && Goto == Label)
        {
            tmp_res = Label->opn1;

            hnext2 = Label;
            glo_res.type = 'v', glo_res.kind = 'L', glo_res.id = tmp_label;
            split(glo_begin, hnext2), merge(3, glo_begin, mkIR((IR_op)((int)head->op + 8)), hnext2);
        }
        else if (Gotoe == Label && Goto != Label)
        {
            return;
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
        glo_opn1.type = 'v', glo_opn1.kind = 'L', glo_opn1.id = tmp_label;
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

//函数体内部语句翻译（增删改IR代码）；
void func_trslt(struct codenode *glo_begin, struct codenode *begin, struct codenode *end, int argi, int parai)
{
    struct codenode *cur_C; //当前语句；
    int max_arg = 0;
    cur_C = begin;
    int i;

    for (i = 0; cur_C != end; cur_C = cur_C->next, i++)
    {
        if (cur_C->opn1.id == "t111" && cur_C->opn2.id == "t50")
        {
            cout << "t50分配寄存器：" << IR_op_strs[cur_C->op] << "\t" << cur_C->opn2.id << "\t" << cur_C->opn2.cal_type << "\t" << cur_C->opn2.no_ris << endl;
        }
        if (cur_C->op == IR_ASSIGN && g_sL.find(cur_C->opn2.id)->flag == 'P')
        {
            parai++;
        }
        if (cur_C->op == IR_LOAD && g_sL.find(cur_C->opn1.id)->flag == 'P' && cur_C->result.kind == 'S')
        {
            parai++;
        }
        if (cur_C->op == IR_ARG)
        {
            struct codenode *tmp_c = cur_C->next;

            while (tmp_c->op != IR_CALL && tmp_c->op != IR_CALL_VOID)
                tmp_c = tmp_c->next;
            // int tmp_offset;
            string tmp_id;
            // tmp_offset = tmp_c->op == IR_CALL ? tmp_c->opn1.offset : tmp_c->result.offset;
            tmp_id = tmp_c->op == IR_CALL ? tmp_c->opn1.id : tmp_c->result.id;
            trslt_arg(argi, glo_begin, cur_C, g_sL.find(begin->opn1.id)->val_index, tmp_id);
            argi++;
            max_arg = max_arg > argi ? max_arg : argi;
        }
        if (cur_C->op == IR_PARAM)
        {
            trslt_para(parai, glo_begin, cur_C, g_sL.find(begin->opn1.id)->val_index);
            parai++;
        }
        if (cur_C->op == IR_CALL || cur_C->op == IR_CALL_VOID)
        {
            argi = 1;
        }
        if (cur_C->op == IR_DIV)
        {
            trslt_div(glo_begin, cur_C, g_sL.find(begin->opn1.id)->val_index, 0);
        }
        if (cur_C->op == IR_MOD)
        {
            trslt_div(glo_begin, cur_C, g_sL.find(begin->opn1.id)->val_index, 1);
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
        if ((cur_C->op > IR_MOD && cur_C->op < IR_EQ) || cur_C->op == IR_NEQ)
        {
            trslt_goto(glo_begin, cur_C);
        }
    }
    max_arg--;
    // printf("g_sL.glo_ymT[begin->opn1.id].size:%d, max_arg: %d\n", g_sL.glo_ymT[begin->opn1.id].size, max_arg);
    if (max_arg > 4)
        g_sL.glo_ymT[begin->opn1.id].size += (max_arg - 4) * 4;

    if (g_sL.glo_ymT[begin->opn1.id].size % 8 == 0)
        g_sL.glo_ymT[begin->opn1.id].size += 4;
}

//全局翻译；
void glo_trslt()
{
    struct codenode *hC, *now_C;
    hC = out_IR;
    now_C = hC;
    int i = 0;
    int now_begin_index, now_end_index;
    struct codenode *now_begin, *now_end; //当前的函数体的开始语句索引与终止语句索引；
    auto evit = g_sL.glo_ymT.begin();

    for (i = 1; evit != g_sL.glo_ymT.end(); evit++, i++)
    {

        if (evit->second.flag == 'T' || evit->second.code_b == NULL)
            continue;
        //函数体语句翻译；
        else if (evit->second.flag == 'F')
        {
            if (evit->second.code_b == NULL || evit->second.code_e == NULL)
                continue;
            else
            {
                g_sL.now_func = evit->first;
                int argi = 1, parai = 0; //形参实参计算标志；
                func_trslt(hC, evit->second.code_b, evit->second.code_e, argi, parai);
            }
        }
        //全局变量语句翻译（增删改IR代码）；
        else
        {
            now_C = evit->second.code_b;
            if (now_C->op == IR_ALLOCA)
            {
                struct codenode *nnext = now_C->next, *nnext2 = nnext->next;

                if (now_C->result.kind == 'A' || now_C->result.flaga == 'A')
                {

                    now_C->opn2.type = strcmp(g_sL.glo_ymT.find(now_C->result.id)->second.type, "int") == 0 ? 'i' : 'f', now_C->opn2.const_int = 0, now_C->opn2.const_float = 0.0;
                    now_C->op = IR_EXT_ALLOCA;
                    if (now_C->next->op != IR_ASSIGN)
                    {

                        glo_opn1.type = 'v', glo_opn1.id = "\t.space";
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
                                if (nnext2->result.type == 'i' && now_C->opn2.type == 'f')
                                    nnext2->result.const_float = float(nnext2->result.const_int), nnext2->result.cal_type = 'f';
                                if (nnext2->result.type == 'f' && now_C->opn2.type == 'i')
                                    nnext2->result.const_int = int(nnext2->result.const_float), nnext2->result.cal_type = 'i';
                                nnext2->opn1.type = 'v', nnext2->opn1.id = "\t.word";
                                nnext2->op = IR_ARROFF_EXPie;
                            }
                            else if (nnext2->opn2.const_int > tmp_offset + 4)
                            {
                                nnext->opn1.type = 'v', nnext->opn1.id = "\t.space";
                                nnext->result.type = 'i', nnext->result.const_int = nnext2->opn2.const_int - tmp_offset - 4;
                                nnext2->result = nnext->opn2;
                                if (nnext2->result.type == 'i' && now_C->opn2.type == 'f')
                                    nnext2->result.const_float = float(nnext2->result.const_int), nnext2->result.cal_type = 'f';
                                if (nnext2->result.type == 'f' && now_C->opn2.type == 'i')
                                    nnext2->result.const_int = int(nnext2->result.const_float), nnext2->result.cal_type = 'i';
                                nnext2->opn1.type = 'v', nnext2->opn1.id = "\t.word";
                                nnext2->op = IR_ARROFF_EXPie;
                                nnext->op = IR_ARROFF_EXPie;
                            }
                            tmp_offset = nnext2->opn2.const_int;
                            nnext = nnext2->next, nnext2 = nnext->next;
                        }
                        if (tmp_offset < now_C->opn1.const_int - 4)
                        {
                            glo_opn1.type = 'v', glo_opn1.id = "\t.space";
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
                        if (nnext2->next->op == IR_VCVT)
                        {
                            nnext2->next->op = IR_VOID;
                            nnext2->next->next->op = IR_VOID;
                            now_C = nnext2->next->next;
                        }
                    }
                    else if (nnext->op != IR_ASSIGN)
                    {
                        now_C->opn2.type = strcmp(g_sL.glo_ymT.find(now_C->result.id)->second.type, "int") == 0 ? 'i' : 'f', now_C->opn2.const_int = 0, now_C->opn2.const_float = 0.0;
                        now_C->op = IR_EXT_ALLOCA;
                    }
                }
            }
            else if (now_C->op != IR_ALLOCA && now_C->op != IR_EXT_ALLOCA)
            {
                now_C->op = IR_VOID;
            }
        }
    }
}

//翻译后重新遍历IR代码，并生成全局arm双向循环表；
void gen_arm()
{

    struct codenode *cur_IR = out_IR;
    struct arm_instruction *now_arm = out_arm;
    // printf("\t%d\n", cur_IR);
    if (cur_IR != &null_ir)
        for (int i = 0; 1; i++)
        {
            // printf("翻译第%d条语句\n", i);
            // printf("\tout_arm->prior->op:%d\n", out_arm->prior->op);
            if (cur_IR->opn1.id == "t111" && cur_IR->opn2.id == "t50")
            {
                cout << "t50分配寄存器：" << IR_op_strs[cur_IR->op] << "\t" << cur_IR->opn2.id << "\t" << cur_IR->opn2.cal_type << "\t" << cur_IR->opn2.no_ris << endl;
            }
            if (cur_IR != &null_ir && cur_IR != NULL)

                switch ((int)cur_IR->op)
                {
                case IR_ASSIGN:
                {

                    if (cur_IR->opn1.id == "r0")
                    {

                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_mov_r0));
                        out_arm->prior->opn2 = cur_IR->opn2;
                        out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                    }
                    else if ((cur_IR->opn1.type == 'v' && cur_IR->opn1.kind == 'S'))
                    {
                        if (cur_IR->opn1.status == cur_IR->opn2.status && cur_IR->opn1.no_ris == cur_IR->opn2.no_ris && cur_IR->opn1.address == cur_IR->opn2.address)
                            ;
                        else if (cur_IR->opn2.id.empty())
                            ;
                        else if (cur_IR->opn1.status == 1 && cur_IR->opn2.status == 2)
                        {
                            opn tmpo;
                            tmpo.const_int = -cur_IR->opn1.address;
                            tmpo.type = 'i';
                            if (tmpo.const_int < -4095)
                            {
                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr_ri));
                                out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T';
                                out_arm->prior->opn1.no_ris = 12, out_arm->prior->opn1.status = 2;
                                out_arm->prior->opn2 = tmpo;
                                tmpo = out_arm->prior->opn1;
                            }
                            if (cur_IR->opn2.no_ris < 190)
                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_str));
                            else if (cur_IR->opn2.no_ris > 190)
                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfps_str));
                            out_arm->prior->opn1 = cur_IR->opn2;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T';
                            out_arm->prior->opn2.status = 2, out_arm->prior->opn2.no_ris = 11;
                            out_arm->prior->result = tmpo;
                            // out_arm->prior->opn1 = cur_IR->opn2;
                            // out_arm->prior->opn2 = cur_IR->opn1;
                        }
                        else if (cur_IR->opn1.status == 2 && cur_IR->opn2.status == 2)
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfps_mov_dd));
                            out_arm->prior->opn2 = cur_IR->opn2;
                            out_arm->prior->opn1 = cur_IR->opn1;
                        }
                        else if (cur_IR->opn1.status == 2 && cur_IR->opn2.status == 1)
                        {
                            opn tmpo;
                            tmpo.const_int = -cur_IR->opn2.address;
                            tmpo.type = 'i';
                            if (tmpo.const_int < -4095)
                            {
                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr_ri));
                                out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T';
                                out_arm->prior->opn1.no_ris = 12, out_arm->prior->opn1.status = 2;
                                out_arm->prior->opn2 = tmpo;
                                tmpo = out_arm->prior->opn1;
                            }
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfps_ldr));
                            out_arm->prior->opn1 = cur_IR->opn1;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T';
                            out_arm->prior->opn2.status = 2, out_arm->prior->opn2.no_ris = 11;
                            out_arm->prior->result = tmpo;
                            // out_arm->prior->opn2 = cur_IR->opn2;
                            // out_arm->prior->opn1 = cur_IR->opn1;
                        }
                        else if (cur_IR->opn1.status == 1 && cur_IR->opn2.status == 1)
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfps_ldr));
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfps_str));
                            // out_arm->prior->opn2 = cur_IR->opn2;
                            // out_arm->prior->opn1 = cur_IR->opn1;
                        }
                    }
                    else if ((cur_IR->opn1.type == 'v' && (cur_IR->opn1.kind == 'T' || cur_IR->opn1.kind == 'S')) && (cur_IR->opn2.type == 'v' && (cur_IR->opn2.kind == 'T' || cur_IR->opn2.kind == 'S')))
                    {
                        if (cur_IR->opn2.no_ris < 190 && cur_IR->opn1.no_ris < 190)
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_mov_rr));
                        else if (cur_IR->opn2.no_ris > 190 || cur_IR->opn1.no_ris > 190)
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfps_mov_dd));
                        out_arm->prior->opn2 = cur_IR->opn2;
                        out_arm->prior->opn1 = cur_IR->opn1;
                    }
                    else if (cur_IR->opn1.kind == 'H' || cur_IR->opn2.kind == 'H')
                    {
                        if (cur_IR->opn1.status == cur_IR->opn2.status && cur_IR->opn1.no_ris == cur_IR->opn2.no_ris && cur_IR->opn1.address == cur_IR->opn2.address)
                            ;
                        else if (cur_IR->opn2.id.empty())
                            ;
                        else if (cur_IR->opn1.status == 1 && cur_IR->opn2.status == 2)
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfps_str));
                            // out_arm->prior->opn1 = cur_IR->opn2;
                            // out_arm->prior->opn2 = cur_IR->opn1;
                        }
                        else if (cur_IR->opn1.status == 2 && cur_IR->opn2.status == 2)
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfps_mov_dd));
                            out_arm->prior->opn2 = cur_IR->opn2;
                            out_arm->prior->opn1 = cur_IR->opn1;
                        }
                        else if (cur_IR->opn1.status == 2 && cur_IR->opn2.status == 1)
                        {
                            opn tmpo;
                            tmpo.const_int = -cur_IR->opn2.address;
                            tmpo.type = 'i';
                            if (tmpo.const_int < -4095)
                            {
                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr_ri));
                                out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T';
                                out_arm->prior->opn1.no_ris = 12, out_arm->prior->opn1.status = 2;
                                out_arm->prior->opn2 = tmpo;
                                tmpo = out_arm->prior->opn1;
                            }
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfps_ldr));
                            out_arm->prior->opn1 = cur_IR->opn1;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T';
                            out_arm->prior->opn2.status = 2, out_arm->prior->opn2.no_ris = 11;
                            out_arm->prior->result = tmpo;
                            // out_arm->prior->opn2 = cur_IR->opn2;
                            // out_arm->prior->opn1 = cur_IR->opn1;
                        }
                        else if (cur_IR->opn1.status == 1 && cur_IR->opn2.status == 1)
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfps_ldr));
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfps_str));
                            // out_arm->prior->opn2 = cur_IR->opn2;
                            // out_arm->prior->opn1 = cur_IR->opn1;
                        }
                    }
                    else if ((cur_IR->opn2.kind == 'A' || cur_IR->opn2.flaga == 'A') && cur_IR->opn2.flage == 'E')
                    {
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_mov_rE));
                        out_arm->prior->opn2 = cur_IR->opn2;
                        out_arm->prior->opn1 = cur_IR->opn1;
                    }

                    else if (cur_IR->opn2.type == 'i')
                    {
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr_ri));
                        out_arm->prior->opn2 = cur_IR->opn2;
                        out_arm->prior->opn1 = cur_IR->opn1;
                    }
                    else if (cur_IR->opn2.type == 'f')
                    {
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfp_ldr_si));
                        out_arm->prior->opn2 = cur_IR->opn2;
                        out_arm->prior->opn1 = cur_IR->opn1;
                        out_arm->prior->opn2.const_int = *(int *)(&cur_IR->opn2.const_float);
                        out_arm->prior->opn2.cal_type = 'i';
                    }
                    else if (cur_IR->opn1.type == 'v' && cur_IR->opn1.flage == 'E')
                    {
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_mov_rE));
                        out_arm->prior->opn2 = cur_IR->opn1;
                        out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_str));
                        out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                        out_arm->prior->opn1 = cur_IR->opn2;
                        out_arm->prior->result.type = 'i', out_arm->prior->result.const_int = 0;
                    }

                    else if (cur_IR->opn1.type == 'v' && (cur_IR->opn1.kind == 'V' || cur_IR->opn1.kind == 'P'))
                    {
                        if (cur_IR->opn1.address < 4096 && cur_IR->cal_type == 'i' && cur_IR->opn1.address > -4096)
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_str));
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 11;
                            out_arm->prior->opn1 = cur_IR->opn2;
                            // printf("cur_IR->opn2name:%s.type:%c\n", cur_IR->opn2.id.c_str(), cur_IR->opn2.cal_type);
                            if (cur_IR->opn1.address < 0)
                            {
                                cur_IR->opn1.address += 4 * (g_sL.find(g_sL.now_func)->maxRis - 3);
                                if (g_sL.glo_ymT[g_sL.now_func].code_b->cal_type == 'f' && cur_IR->opn1.address < 0)
                                {
                                    cur_IR->opn1.address -= 24;
                                    if (g_sL.glo_ymT[g_sL.now_func].DrMaxNum != 0)
                                        cur_IR->opn1.address -= 8 * (((g_sL.glo_ymT[g_sL.now_func].DrMaxNum - 200 - 21) + (g_sL.glo_ymT[g_sL.now_func].DrMaxNum - 200 - 21) % 2) / 2);
                                }
                                else
                                {
                                    if (g_sL.glo_ymT[g_sL.now_func].DrMaxNum != 0)
                                        cur_IR->opn1.address -= 8 * (((g_sL.glo_ymT[g_sL.now_func].DrMaxNum - 200)) / 2 + 1);
                                }
                            }
                            out_arm->prior->result.type = 'i', out_arm->prior->result.const_int = -cur_IR->opn1.address;
                        }
                        else if (cur_IR->cal_type == 'f' && cur_IR->opn1.address < 1024 && cur_IR->opn1.address > -1024)
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_str));
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 11;
                            out_arm->prior->opn1 = cur_IR->opn2;
                            // printf("cur_IR->opn2name:%s.type:%c\n", cur_IR->opn2.id.c_str(), cur_IR->opn2.cal_type);
                            if (cur_IR->opn1.address < 0)
                            {
                                cur_IR->opn1.address += 4 * (g_sL.find(g_sL.now_func)->maxRis - 3);

                                if (g_sL.glo_ymT[g_sL.now_func].code_b->cal_type == 'f' && cur_IR->opn1.address < 0)
                                {
                                    cur_IR->opn1.address -= 24;
                                    if (g_sL.glo_ymT[g_sL.now_func].DrMaxNum != 0)
                                        cur_IR->opn1.address -= 8 * (((g_sL.glo_ymT[g_sL.now_func].DrMaxNum - 200 - 21) + (g_sL.glo_ymT[g_sL.now_func].DrMaxNum - 200 - 21) % 2) / 2);
                                }
                                else
                                {
                                    if (g_sL.glo_ymT[g_sL.now_func].DrMaxNum != 0)
                                        cur_IR->opn1.address -= 8 * (((g_sL.glo_ymT[g_sL.now_func].DrMaxNum - 200)) / 2 + 1);
                                }
                            }
                            out_arm->prior->result.type = 'i', out_arm->prior->result.const_int = -cur_IR->opn1.address;
                        }
                        else
                        {

                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr_ri));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                            if (cur_IR->opn1.address < 0)
                            {
                                cur_IR->opn1.address += 4 * (g_sL.find(g_sL.now_func)->maxRis - 3);

                                if (g_sL.glo_ymT[g_sL.now_func].code_b->cal_type == 'f' && cur_IR->opn1.address < 0)
                                {
                                    cur_IR->opn1.address -= 24;
                                    if (g_sL.glo_ymT[g_sL.now_func].DrMaxNum != 0)
                                        cur_IR->opn1.address -= 8 * (((g_sL.glo_ymT[g_sL.now_func].DrMaxNum - 200 - 21) + (g_sL.glo_ymT[g_sL.now_func].DrMaxNum - 200 - 21) % 2) / 2);
                                }
                                else
                                {
                                    if (g_sL.glo_ymT[g_sL.now_func].DrMaxNum != 0)
                                        cur_IR->opn1.address -= 8 * (((g_sL.glo_ymT[g_sL.now_func].DrMaxNum - 200)) / 2 + 1);
                                }
                            }
                            out_arm->prior->opn2.type = 'i', out_arm->prior->opn2.const_int = -cur_IR->opn1.address;
                            out_arm->prior->cal_type = 'i';
                            if (cur_IR->cal_type == 'i')
                            {
                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_str));
                                out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 11;
                                out_arm->prior->opn1 = cur_IR->opn2;
                                out_arm->prior->result.type = 'v', out_arm->prior->result.kind = 'T', out_arm->prior->result.no_ris = 0;
                            }
                            else if (cur_IR->cal_type == 'f')
                            {

                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_add));
                                out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                                out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 11;
                                out_arm->prior->result.type = 'v', out_arm->prior->result.kind = 'T', out_arm->prior->result.no_ris = 0;
                                out_arm->prior->cal_type = 'i';

                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_str));
                                out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                                out_arm->prior->opn1 = cur_IR->opn2;
                            }
                        }
                    }
                    else if (cur_IR->opn1.type == 'v' && (cur_IR->opn1.kind == 'R')) // R表示实参；
                    {
                        if ((cur_IR->cal_type == 'f' && cur_IR->opn1.address > -1022) || cur_IR->cal_type == 'i')
                        {

                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_str));
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 13;
                            out_arm->prior->opn1 = cur_IR->opn2;
                            out_arm->prior->result.type = 'i', out_arm->prior->result.const_int = -cur_IR->opn1.address;
                        }
                        else
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr_ri));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                            out_arm->prior->opn2.type = 'i', out_arm->prior->opn2.const_int = -cur_IR->opn1.address;
                            out_arm->prior->cal_type = 'i';

                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_add));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 13;
                            out_arm->prior->result.type = 'v', out_arm->prior->result.kind = 'T', out_arm->prior->result.no_ris = 0;
                            out_arm->prior->cal_type = 'i';

                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_str));
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                            out_arm->prior->opn1 = cur_IR->opn2;
                        }
                    }
                    break;
                }
                case IR_EXT_ALLOCA:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_alloc_E));
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
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_rsb));
                        out_arm->prior->opn2 = cur_IR->opn2;
                        out_arm->prior->result = cur_IR->opn1;
                    }
                    else
                    {
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_sub));
                        out_arm->prior->result = cur_IR->opn2;
                        out_arm->prior->opn2 = cur_IR->opn1;
                    }
                    out_arm->prior->opn1 = cur_IR->result;
                    break;
                }
                case IR_ADD:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_add));
                    out_arm->prior->opn2 = cur_IR->opn2;
                    out_arm->prior->opn1 = cur_IR->result;
                    out_arm->prior->result = cur_IR->opn1;
                    break;
                }
                case IR_MUL:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_mul));
                    out_arm->prior->opn2 = cur_IR->opn2;
                    out_arm->prior->opn1 = cur_IR->result;
                    out_arm->prior->result = cur_IR->opn1;
                    break;
                }
                case IR_DIV:
                {
                    if (cur_IR->cal_type == 'f')
                    {
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfp_div));
                        out_arm->prior->opn2 = cur_IR->opn1;
                        out_arm->prior->opn1 = cur_IR->result;
                        out_arm->prior->result = cur_IR->opn2;
                    }
                    else
                    {
                        if (cur_IR->opn2.const_int > 1024)
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr_ri));
                            out_arm->prior->opn1.type = 'v';
                            out_arm->prior->opn1.kind = 'T';
                            out_arm->prior->opn1.no_ris = 0;
                            out_arm->prior->opn1.status = 2;
                            out_arm->prior->opn1.id = "r0";

                            out_arm->prior->opn2.type = 'i';
                            out_arm->prior->opn2.cal_type = 'i';
                            out_arm->prior->opn2.const_int = cur_IR->opn2.const_int - 1;
                        }
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_mov_asr));
                        out_arm->prior->opn2 = cur_IR->opn1;
                        out_arm->prior->opn1 = cur_IR->result;
                        out_arm->prior->result = cur_IR->opn2;
                        out_arm->prior->result.const_int = (int)log2(cur_IR->opn2.const_int);
                    }
                    break;
                }
                case IR_EQ:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_cmp));
                    out_arm->prior->opn2 = cur_IR->opn2;
                    out_arm->prior->opn1 = cur_IR->opn1;
                    break;
                }

                case IR_GOTO_JLT:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_blt));
                    out_arm->prior->opn1 = cur_IR->result;
                    break;
                }
                case IR_GOTO_JLE:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ble));
                    out_arm->prior->opn1 = cur_IR->result;
                    break;
                }
                case IR_GOTO_JGT:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_bgt));
                    out_arm->prior->opn1 = cur_IR->result;
                    break;
                }
                case IR_GOTO_JGE:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_bge));
                    out_arm->prior->opn1 = cur_IR->result;
                    break;
                }
                case IR_GOTO_EQ:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_beq));
                    out_arm->prior->opn1 = cur_IR->result;
                    break;
                }
                case IR_GOTO_NEQ:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_bne));
                    out_arm->prior->opn1 = cur_IR->result;
                    break;
                }

                case IR_EXP_ARROFF:
                {
                    if (cur_IR->opn1.flage == 'E')
                    {
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_mov_rE));
                        out_arm->prior->opn2 = cur_IR->opn1;
                        out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                        out_arm->prior->cal_type = 'i';
                    }
                    else
                    {
                        struct codenode *now = cur_IR->prior;

                        // if ((now->op == IR_LOAD && now->opn1.kind == 'A') || (now->prior->op == IR_LOAD && now->prior->opn1.kind == 'A'))
                        // if () //形参数组，偏移量需要先load出来
                        // cout << "数组访问：" << cur_IR->opn1.id << "标志：" << cur_IR->opn1.type << cur_IR->opn1.kind << endl;
                        if (cur_IR->opn1.type == 'v' && cur_IR->opn1.kind == 'T')
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr_l2));
                            out_arm->prior->opn1 = cur_IR->result;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T',
                            out_arm->prior->opn2.no_ris = cur_IR->opn1.no_ris;
                            out_arm->prior->result = cur_IR->opn2;
                            out_arm->prior->cal_type = 'i';

                            break;
                        }
                        else
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr_ri));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                            out_arm->prior->opn2.type = 'i',
                            out_arm->prior->opn2.const_int = -cur_IR->opn1.address;
                            out_arm->prior->cal_type = 'i';

                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_add));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                            out_arm->prior->result.type = 'v', out_arm->prior->result.kind = 'T', out_arm->prior->result.no_ris = 11;
                            out_arm->prior->cal_type = 'i';
                        }
                    }
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr_l2));
                    out_arm->prior->opn1 = cur_IR->result;
                    out_arm->prior->result = cur_IR->opn2;

                    out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                    break;
                }
                case IR_ARROFF_EXP:
                {
                    if (cur_IR->opn1.flage == 'E')
                    {
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_mov_rE));
                        out_arm->prior->opn2 = cur_IR->opn1;
                        out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                        out_arm->prior->cal_type = 'i';
                    }
                    else
                    {
                        if (cur_IR->opn1.type == 'v' && cur_IR->opn1.kind == 'T')
                        // if (cur_IR->prior->op == IR_LOAD && cur_IR->prior->opn1.kind == 'A') //形参数组，偏移量需要先load出来
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_str_l2));
                            out_arm->prior->opn1 = cur_IR->result;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T',
                            out_arm->prior->opn2.no_ris = cur_IR->opn1.no_ris;
                            out_arm->prior->result = cur_IR->opn2;
                            break;
                        }
                        else
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr_ri));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                            out_arm->prior->opn2.type = 'i',
                            out_arm->prior->opn2.const_int = -cur_IR->opn1.address;
                            out_arm->prior->cal_type = 'i';

                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_add));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                            out_arm->prior->result.type = 'v', out_arm->prior->result.kind = 'T', out_arm->prior->result.no_ris = 11;
                            out_arm->prior->cal_type = 'i';
                        }
                    }
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_str_l2));
                    out_arm->prior->opn1 = cur_IR->result;
                    out_arm->prior->result = cur_IR->opn2;

                    out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                    break;
                }

                case IR_ARROFF_EXPi:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr_ri));
                    out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                    out_arm->prior->opn2.type = 'i', out_arm->prior->opn2.const_int = -cur_IR->opn1.address;
                    out_arm->prior->cal_type = 'i';

                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_add));
                    out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                    out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                    out_arm->prior->result.type = 'v', out_arm->prior->result.kind = 'T', out_arm->prior->result.no_ris = 11;
                    out_arm->prior->cal_type = 'i';

                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_str));
                    out_arm->prior->opn1 = cur_IR->result;
                    out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                    out_arm->prior->result = cur_IR->opn2;

                    break;
                }
                case IR_ARROFF_EXPie:
                {
                    if (cur_IR->opn1.id == "\t.space")
                    {
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_space));
                        out_arm->prior->opn1 = cur_IR->result;
                    }

                    else
                    {
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_word));
                        out_arm->prior->opn1 = cur_IR->result;
                    }
                    break;
                }

                case IR_EXP_ARROFFa:
                {
                    if (cur_IR->opn1.flage == 'E')
                    {
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_mov_rE));
                        out_arm->prior->opn2 = cur_IR->opn1;
                        out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                        out_arm->prior->cal_type = 'i';
                    }
                    else
                    {
                        if (cur_IR->prior->op == IR_LOAD && cur_IR->prior->opn1.kind == 'A') //形参数组，偏移量需要先load出来
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_add_l2));
                            out_arm->prior->opn1 = cur_IR->result;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T',
                            out_arm->prior->opn2.no_ris = cur_IR->prior->result.no_ris;
                            out_arm->prior->result = cur_IR->opn2;
                            out_arm->prior->cal_type = 'i';

                            break;
                        }
                        else
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr_ri));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                            out_arm->prior->opn2.type = 'i',
                            out_arm->prior->opn2.const_int = -cur_IR->opn1.address;
                            out_arm->prior->cal_type = 'i';

                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_add));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                            out_arm->prior->result.type = 'v', out_arm->prior->result.kind = 'T', out_arm->prior->result.no_ris = 11;
                            out_arm->prior->cal_type = 'i';
                        }
                    }
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_add_l2));
                    out_arm->prior->opn1 = cur_IR->result;
                    out_arm->prior->result = cur_IR->opn2;
                    out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                    out_arm->prior->cal_type = 'i';

                    break;
                }
                case IR_ARROFF_EXPi0:
                {
                    if (cur_IR->opn1.cal_type == 'i')
                    {
                        int inde = cur_IR->result.const_int;
                        for (; inde < cur_IR->opn2.const_int; inde += 4)
                        {
                            if (inde == cur_IR->result.const_int)
                            {
                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr_ri));
                                out_arm->prior->opn2.type = 'i', out_arm->prior->opn2.const_int = -cur_IR->opn1.address;
                                out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                                out_arm->prior->cal_type = 'i';

                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_add));
                                out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                                out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                                out_arm->prior->result.type = 'v', out_arm->prior->result.kind = 'T', out_arm->prior->result.no_ris = 11;
                                out_arm->prior->cal_type = 'i';

                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr_ri));
                                out_arm->prior->opn2.type = 'i', out_arm->prior->opn2.const_int = 0,
                                out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 12;
                                out_arm->prior->cal_type = 'i';
                            }

                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_str));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 12;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                            out_arm->prior->result.type = 'i', out_arm->prior->result.const_int = inde;
                        }
                    }
                    else if (cur_IR->opn1.cal_type == 'f')
                    {
                        int inde = cur_IR->result.const_int;
                        for (; inde < cur_IR->opn2.const_int; inde += 4)
                        {
                            if (inde == cur_IR->result.const_int)
                            {
                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr_ri));
                                out_arm->prior->opn2.type = 'i', out_arm->prior->opn2.const_int = -cur_IR->opn1.address;
                                out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                                out_arm->prior->cal_type = 'i';

                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_add));
                                out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                                out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                                out_arm->prior->result.type = 'v', out_arm->prior->result.kind = 'T', out_arm->prior->result.no_ris = 11;
                                out_arm->prior->cal_type = 'i';

                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfp_ldr_si));
                                float a = 0;
                                out_arm->prior->opn2.type = 'i', out_arm->prior->opn2.const_int = *(int *)(&a),
                                out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 104, out_arm->prior->opn1.cal_type = 'f';
                                out_arm->prior->cal_type = 'f';
                            }

                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfp_str));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 104, out_arm->prior->opn1.cal_type = 'f';
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0, out_arm->prior->opn2.cal_type = 'i';
                            out_arm->prior->result.type = 'i', out_arm->prior->result.const_int = inde;
                        }
                    }
                    break;
                }

                case IR_VCVT:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfp_vcvt));
                    out_arm->prior->opn2 = cur_IR->opn2;
                    out_arm->prior->opn1 = cur_IR->opn1;
                    out_arm->prior->result = cur_IR->result;
                    break;
                }

                case IR_CALL:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_bl));
                    out_arm->prior->opn1 = cur_IR->opn1;
                    if (cur_IR->result.cal_type == 'i')
                    {
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_mov_rr));
                        out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0, out_arm->prior->opn2.cal_type = 'i';
                    }
                    else if (cur_IR->result.cal_type == 'f')
                    {
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfp_mov_ss));
                        out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 100, out_arm->prior->opn2.cal_type = 'f';
                    }
                    out_arm->prior->opn1 = cur_IR->result;

                    break;
                }
                case IR_UMINUS:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_rsb));
                    out_arm->prior->opn1 = cur_IR->result;
                    out_arm->prior->opn2 = cur_IR->opn1;
                    out_arm->prior->result.type = 'i', out_arm->prior->result.const_int = 0;
                    out_arm->prior->result.cal_type = 'i';
                    break;
                }
                case IR_LOAD:
                {

                    if (cur_IR->opn1.kind == 'H' || (cur_IR->opn1.kind == 'S'))
                    {
                        if (cur_IR->opn1.status == 1)
                        {
                            opn tmpo;
                            tmpo.const_int = -cur_IR->opn1.address;
                            tmpo.type = 'i';
                            if (tmpo.const_int < -4095)
                            {
                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr_ri));
                                out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T';
                                out_arm->prior->opn1.no_ris = 12, out_arm->prior->opn1.status = 2;
                                out_arm->prior->opn2 = tmpo;
                                tmpo = out_arm->prior->opn1;
                            }

                            if (cur_IR->result.no_ris > 190)
                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfps_ldr));
                            else
                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr));

                            out_arm->prior->opn1 = cur_IR->result;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T';
                            out_arm->prior->opn2.status = 2, out_arm->prior->opn2.no_ris = 11;
                            out_arm->prior->result = tmpo;

                            // printf("asawdadwa");
                        }
                        else if (cur_IR->opn1.status == 2)
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfps_mov_dd));
                            out_arm->prior->opn1 = cur_IR->result;
                            out_arm->prior->opn2 = cur_IR->opn1;
                        }
                    }
                    else if ((cur_IR->result.kind == 'S' && cur_IR->result.no_ris > 190))
                    {

                        opn tmpo;
                        if (cur_IR->opn1.address < 0)
                        {
                            cur_IR->opn1.address += 4 * (g_sL.find(g_sL.now_func)->maxRis - 3);

                            if (g_sL.glo_ymT[g_sL.now_func].code_b->cal_type == 'f')
                            {
                                cur_IR->opn1.address -= 24;
                                if (g_sL.glo_ymT[g_sL.now_func].DrMaxNum != 0)
                                    cur_IR->opn1.address -= 8 * (((g_sL.glo_ymT[g_sL.now_func].DrMaxNum - 200 - 21) + (g_sL.glo_ymT[g_sL.now_func].DrMaxNum - 200 - 21) % 2) / 2);
                            }
                            else
                            {
                                // cout << "DrMaxNum:" << g_sL.glo_ymT[g_sL.now_func].DrMaxNum << (g_sL.glo_ymT[g_sL.now_func].DrMaxNum - 200) << "\t" << (g_sL.glo_ymT[g_sL.now_func].DrMaxNum - 200) % 2 << endl;

                                if (g_sL.glo_ymT[g_sL.now_func].DrMaxNum != 0)
                                    cur_IR->opn1.address -= 8 * (((g_sL.glo_ymT[g_sL.now_func].DrMaxNum - 200)) / 2 + 1);
                            }
                        }
                        // cout << "wopn1:" << cur_IR->opn1.id << "\t" << cur_IR->opn1.address << cur_IR->opn1.kind << cur_IR->opn1.status << "\topn2:" << cur_IR->result.id << "\t" << cur_IR->result.kind << cur_IR->result.status << "\t" << cur_IR->result.no_ris << endl;

                        tmpo.const_int = -cur_IR->opn1.address;
                        tmpo.type = 'i';
                        if (tmpo.const_int > 4095)
                        {

                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr_ri));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T';
                            out_arm->prior->opn1.no_ris = 12, out_arm->prior->opn1.status = 2;
                            out_arm->prior->opn2 = tmpo;
                            tmpo = out_arm->prior->opn1;
                        }
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfps_ldr));
                        out_arm->prior->opn1 = cur_IR->result;
                        out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T';
                        out_arm->prior->opn2.status = 2, out_arm->prior->opn2.no_ris = 11;
                        out_arm->prior->result = tmpo;
                    }
                    else if (cur_IR->opn1.type == 'v' && (cur_IR->opn1.kind == 'T' || cur_IR->opn1.kind == 'S') && cur_IR->result.type == 'v' && (cur_IR->result.kind == 'T'))
                    {
                        if (cur_IR->opn1.no_ris != cur_IR->result.no_ris)
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_mov_rr));
                            out_arm->prior->opn1 = cur_IR->result;
                            out_arm->prior->opn2 = cur_IR->opn1;
                        }
                    }
                    else if (cur_IR->opn1.type == 'v' && cur_IR->opn1.flage == 'E')
                    {
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_mov_rE));
                        out_arm->prior->opn1 = cur_IR->result, out_arm->prior->opn1.no_ris = 12, out_arm->prior->opn1.cal_type = 'i';
                        out_arm->prior->opn2 = cur_IR->opn1;
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr));
                        out_arm->prior->opn1 = cur_IR->result;
                        out_arm->prior->opn2 = out_arm->prior->prior->opn1;
                        out_arm->prior->result.type = 'i', out_arm->prior->result.const_int = 0;
                    }
                    else
                    {
                        if (cur_IR->opn1.address < 0)
                        {
                            cur_IR->opn1.address += 4 * (g_sL.find(g_sL.now_func)->maxRis - 3);

                            if (g_sL.glo_ymT[g_sL.now_func].code_b->cal_type == 'f')
                            {
                                cur_IR->opn1.address -= 24;
                                if (g_sL.glo_ymT[g_sL.now_func].DrMaxNum != 0)
                                    cur_IR->opn1.address -= 8 * (((g_sL.glo_ymT[g_sL.now_func].DrMaxNum - 200 - 21) + (g_sL.glo_ymT[g_sL.now_func].DrMaxNum - 200 - 21) % 2) / 2);
                            }
                            else
                            {
                                if (g_sL.glo_ymT[g_sL.now_func].DrMaxNum != 0)
                                    cur_IR->opn1.address -= 8 * (((g_sL.glo_ymT[g_sL.now_func].DrMaxNum - 200)) / 2 + 1);
                            }
                        }

                        if (cur_IR->opn1.address < 4096 && cur_IR->cal_type == 'i' && cur_IR->opn1.address > -4096)
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr));
                            out_arm->prior->opn1 = cur_IR->result;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 11;

                            out_arm->prior->result.type = 'i', out_arm->prior->result.const_int = -cur_IR->opn1.address;
                        }
                        else if (cur_IR->opn1.address < 1024 && cur_IR->cal_type == 'f' && cur_IR->opn1.address > -1024)
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr));
                            out_arm->prior->opn1 = cur_IR->result;
                            out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 11;

                            out_arm->prior->result.type = 'i', out_arm->prior->result.const_int = -cur_IR->opn1.address;
                        }
                        else
                        {

                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr_ri));
                            out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;

                            out_arm->prior->opn2.type = 'i', out_arm->prior->opn2.const_int = -cur_IR->opn1.address;
                            out_arm->prior->cal_type = 'i';
                            if (cur_IR->cal_type == 'i')
                            {
                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr));
                                out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 11;
                                out_arm->prior->opn1 = cur_IR->result;
                                out_arm->prior->result.type = 'v', out_arm->prior->result.kind = 'T', out_arm->prior->result.no_ris = 0;
                            }
                            else if (cur_IR->cal_type == 'f')
                            {

                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_add));
                                out_arm->prior->opn1.type = 'v', out_arm->prior->opn1.kind = 'T', out_arm->prior->opn1.no_ris = 0;
                                out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 11;
                                out_arm->prior->result.type = 'v', out_arm->prior->result.kind = 'T', out_arm->prior->result.no_ris = 0;
                                out_arm->prior->cal_type = 'i';

                                out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ldr));
                                out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 0;
                                out_arm->prior->opn1 = cur_IR->result;
                            }
                        }
                    }
                    break;
                }
                case IR_FUNCTION:
                {
                    // if ((g_sL.find(g_sL.now_func)->maxRis % 2) == 0)
                    //     g_sL.find(g_sL.now_func)->size += 4;
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_func));
                    out_arm->prior->opn1 = cur_IR->opn1;
                    out_arm->prior->opn2 = cur_IR->opn2;
                    out_arm->prior->result = cur_IR->result;
                    out_arm->prior->cal_type = cur_IR->cal_type;
                    g_sL.now_func = cur_IR->opn1.id;
                    // printf("out_arm->prior->op: %d\t%c\n", out_arm->prior->op, out_arm->prior->opn1.type);
                    break;
                }
                case IR_FUNC_END:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_func_end));
                    out_arm->prior->opn1 = cur_IR->opn1;
                    out_arm->prior->opn2 = cur_IR->opn2;
                    out_arm->prior->result = cur_IR->result;
                    out_arm->prior->cal_type = cur_IR->cal_type;
                    g_sL.now_func = "glo";

                    break;
                }

                case IR_LABEL:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_label));
                    out_arm->prior->opn1 = cur_IR->opn1;

                    break;
                }
                case IR_GOTO:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_b));
                    // cout << "ir_goto:" << cur_IR->opn1.id << "\t" << cur_IR->opn1.type << endl;
                    out_arm->prior->opn1 = cur_IR->opn1;

                    break;
                }

                case IR_ARG:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_void));
                    break;
                }
                case IR_PARAM:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_str));
                    out_arm->prior->opn1 = cur_IR->opn1;
                    out_arm->prior->opn2.type = 'v', out_arm->prior->opn2.kind = 'T', out_arm->prior->opn2.no_ris = 11;
                    out_arm->prior->result.type = 'i', out_arm->prior->result.const_int = cur_IR->opn2.address;
                    break;
                }

                case IR_CALL_VOID:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_bl));
                    out_arm->prior->opn1 = cur_IR->result;
                    break;
                }
                case ARM_MOVNE:
                {
                    if (cur_IR->opn1.kind == 'H' || cur_IR->opn2.kind == 'H')
                    {
                        if (cur_IR->opn1.status == cur_IR->opn2.status && cur_IR->opn1.no_ris == cur_IR->opn2.no_ris && cur_IR->opn1.address == cur_IR->opn2.address)
                            ;
                        else if (cur_IR->opn2.id.empty())
                            ;
                        else
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfps_movne));
                            out_arm->prior->opn1 = cur_IR->opn1;
                            out_arm->prior->opn2 = cur_IR->opn2;
                        }
                    }
                    else
                    {
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_movne));
                        out_arm->prior->opn1 = cur_IR->opn1;
                        out_arm->prior->opn2 = cur_IR->opn2;
                    }
                    break;
                }
                case ARM_MOVEQ:
                {
                    if (cur_IR->opn1.kind == 'H' || cur_IR->opn2.kind == 'H')
                    {
                        if (cur_IR->opn1.status == cur_IR->opn2.status && cur_IR->opn1.no_ris == cur_IR->opn2.no_ris && cur_IR->opn1.address == cur_IR->opn2.address)
                            ;
                        else if (cur_IR->opn2.id.empty())
                            ;
                        else
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfps_moveq));
                            out_arm->prior->opn1 = cur_IR->opn1;
                            out_arm->prior->opn2 = cur_IR->opn2;
                        }
                    }
                    else
                    {
                        out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_moveq));
                        out_arm->prior->opn1 = cur_IR->opn1;
                        out_arm->prior->opn2 = cur_IR->opn2;
                    }
                    break;
                }
                case ARM_MOVcont:
                {
                    if (cur_IR->opn1.kind == 'H' || cur_IR->opn2.kind == 'H')
                    {
                        if (cur_IR->opn1.status == cur_IR->opn2.status && cur_IR->opn1.no_ris == cur_IR->opn2.no_ris && cur_IR->opn1.address == cur_IR->opn2.address)
                            ;
                        else if (cur_IR->opn2.id.empty())
                            ;
                        else
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfps_movCont));
                            out_arm->prior->cont = cur_IR->cont;
                            out_arm->prior->opn1 = cur_IR->opn1;
                            out_arm->prior->opn2 = cur_IR->opn2;
                            out_arm->prior->result = cur_IR->result;
                        }
                    }
                    else if (cur_IR->opn1.kind == 'T' && cur_IR->opn2.kind == 'T')
                    {
                        if (cur_IR->opn1.status == cur_IR->opn2.status && cur_IR->opn1.no_ris == cur_IR->opn2.no_ris && cur_IR->opn1.address == cur_IR->opn2.address)
                            ;
                        else if (cur_IR->opn2.id.empty())
                            ;
                        else
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_mov_rr));
                            out_arm->prior->cont = cur_IR->cont;
                            out_arm->prior->opn1 = cur_IR->opn1;
                            out_arm->prior->opn2 = cur_IR->opn2;
                            out_arm->prior->result = cur_IR->result;
                        }
                    }
                    else if (cur_IR->opn1.kind == 'S' || cur_IR->opn2.kind == 'S')
                    {
                        if (cur_IR->opn1.status == cur_IR->opn2.status && cur_IR->opn1.no_ris == cur_IR->opn2.no_ris && cur_IR->opn1.address == cur_IR->opn2.address)
                            ;
                        else if (cur_IR->opn2.id.empty())
                            ;
                        else
                        {
                            out_arm = merge_a(2, out_arm, mkarm(cur_IR, vfps_movCont));
                            out_arm->prior->cont = cur_IR->cont;
                            out_arm->prior->opn1 = cur_IR->opn1;
                            out_arm->prior->opn2 = cur_IR->opn2;
                            out_arm->prior->result = cur_IR->result;
                        }
                    }
                    break;
                }

                case ARM_ITORG:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_ltorg));
                    break;
                }
                case ARM_CPSR_Z1:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_msr_z1));
                    break;
                }
                case ARM_CPSR_Z0:
                {
                    out_arm = merge_a(2, out_arm, mkarm(cur_IR, arm_msr_z0));
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

/*----------------------------------------分块--------------------------------------*/
void Divide_blocks()
{
    struct arm_instruction *hC, *now_C;
    hC = out_arm;
    now_C = hC;
    int i = 0;
    int now_begin_index, now_end_index;
    struct arm_instruction *now_begin, *now_end; //当前的函数体的开始语句索引与终止语句索引；
    struct block tmp_block;
    while (now_C->op != arm_func)
        now_C = now_C->next;
    if (now_C->op == arm_func)
    {
        // printf("now_C->op: %s\n", arm_op_strs[now_C->op]);

        tmp_block.b_begin = now_C;
        tmp_block.size = 0;
        tmp_block.index = block_num;
        tmp_block.b_end = NULL;
        b_list[0] = tmp_block;
    }
    now_C = now_C->next;

    for (i = 1; now_C != hC; now_C = now_C->next, i++)
    {
        auto it = b_list.begin();
        struct codenode C;
        C.cal_type = 'i';
        if (it->second.b_end == NULL && it->second.b_begin != NULL)
            it->second.size++;
        if (it->second.b_end == NULL && it->second.b_begin != NULL && it->second.size % 60 == 0 && it->second.size > 59)
        {
            glo_opn1.type = 'v', glo_opn1.kind = 'L', glo_opn1.id = newLabel();
            split_a(hC, now_C);

            hC = merge_a(5, hC, mkarm(&C, arm_b), mkarm(&C, arm_ltorg), mkarm(&C, arm_label), now_C);
            now_C->prior->prior->prior->opn1 = glo_opn1;
            now_C->prior->opn1 = glo_opn1;
            // now_C = now_C->prior->prior;
        }
        if (now_C->op == arm_func || now_C->op == arm_label)
        {
            // printf("now_C->op: %s\n", arm_op_strs[now_C->op]);

            if (it->second.b_end == NULL)
            {
                it->second.b_end = now_C->prior;
            }
            glo_opn1.type = 'i', glo_opn1.const_int = block_num;
            tmp_block.b_begin = now_C;
            tmp_block.size = 0;
            tmp_block.index = block_num;
            b_list[i] = tmp_block;
            block_num++;
            if (now_C->prior->op == arm_b)
                split_a(hC, now_C), hC = merge_a(3, hC, mkarm(&C, arm_ltorg), now_C);
        }
        else if (now_C->op == arm_func_end || now_C->op == arm_b)
        {
            it = b_list.begin();
            glo_opn2.type = 'i', glo_opn2.const_int = it->second.size;
            it->second.b_end = now_C;
        }
    }
}

void display_bl()
{
    auto it = b_list.begin();
    printf("------------------------------bl:-----------------------------\n");
    for (int i = 0; it != b_list.end(); it++, i++)
    {

        printf("\t%d\tindex:%d\tsize:%d\tbegin:%s;\tend:%s;\n", it->first, it->second.index, it->second.size, arm_op_strs[it->second.b_begin->op], arm_op_strs[it->second.b_end->op]);
    }
    printf("------------------------------   -----------------------------\n");
}

/*----------------------------------集成接口----------------------------------------*/
void translation()
{
    // printf("begin translating...\n");
    null_ar.op = arm_void;
    out_arm = &null_ar;
    IR_op_cal_type(); //翻译和寄存器分配前维护指令的计算类型，浮点or整型；

    if (opti_flag == 1)
        IRReplenishment();
    if (opti_flag)

        putout_IR(out_IR, ".irr");
    glo_ris_allot(); //对于每条IR完成寄存器分配；
    if (opti_flag)

        putout_IR(out_IR, ".irra");

    // //                  // DisplaySymbolTable();
    glo_trslt(); //通过IR替换使IR更接近ARM，方便生成；
    if (opti_flag)
        putout_IR(out_IR, ".irt");
    // DisplaySymbolTable();
    gen_arm();     //遍历IR生成ARM；
    float_trslt(); //在ARM生成后依据指令计算类型进行指令替换，正确生成浮点指令；

    Divide_blocks(); //对于ARM进行基本块分块；由于IR不方便故在ARM层完成分块；（优化可能要改）
    // // display_bl();//打印分块情况，debug时调用；
}
