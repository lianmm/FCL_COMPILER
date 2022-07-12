#include "../midend/optimization.h"
#include <queue>
#include <map>
#include <string>
#include <set>
using namespace std;
enum ARM_op
{
    arm_func,
    arm_func_end,
    arm_block,
    arm_block_end,
    arm_void,
    arm_alloc_E,
    arm_mov_r0,
    arm_mov_rr,
    arm_mov_rE,
    arm_ldr_ri,
    arm_ltorg,
    arm_str,
    arm_str_l2,
    arm_ldr,
    arm_ldr_l2,
    arm_word,
    arm_space,
    arm_add,
    arm_add_l2,
    arm_rsb,
    arm_sub,
    arm_mul,
    arm_label,
    arm_cmp,
    arm_b,
    arm_bl,
    arm_blt,
    arm_ble,
    arm_bgt,
    arm_bge,
    arm_beq,
    arm_bne,
    arm_moveq,
    arm_movne
};

struct arm_instruction
{                                  //三地址TAC代码结点,采用双向循环链表存放中间语言代码
    enum ARM_op op;                // TAC代码的运算符种类
    struct opn opn1, opn2, result; // 2个操作数和运算结果
    struct arm_instruction *next, *prior;
    arm_instruction()
    {
        this->op = arm_void;
        this->next = this;
        this->prior = this;
    }
};

struct block
{
    int index;
    int size;
    struct arm_instruction *b_begin;
    struct arm_instruction *b_end;
    block()
    {
        this->index = 0;
        this->size = 0;
        this->b_begin = this->b_end = NULL;
    }
};

extern int block_num;
extern int tmp_allot[MAXLENGTH];
extern int tmp_sp;
extern map<int, struct block, greater<int>> b_list;
extern char arm_op_strs[50][15];
extern map<int, int, greater<int>> tmp_map;
extern int ris3_status[11];
extern struct arm_instruction *out_arm;
extern struct arm_instruction null_ar;
extern char arm_op_strs[50][15];
void translation();
void clear_IR();
void clear_ast(struct node *T);
