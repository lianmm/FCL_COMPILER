#ifndef LCM_H
#define LCM_H

#include "StaticRisAlloc.h"
using namespace std;

// 每个循环的结构体
struct loop_struct
{
    basic_block *begin;
    // 循环体的下一个节点
    basic_block *end;
    // 循环的出口节点集
    set<basic_block *> exit;
    // 循环的所有节点
    set<basic_block *> loop_bb;
    // 入口的回边
    set<basic_block *> pres;
    // 此循环内部需要外提的表达式
    vector<codenode *> lcm_codes;
    // 当前循环所在函数名
    string func_name;
    // 循环体内外提的phi函数
    set<pair<string, codenode *>> phi_define;
};

// all loops
extern vector<loop_struct> loops;

extern map<int, loop_struct> find_loop;

// 是否在循环中定值
bool if_defoutloop(opn o, loop_struct &x, set<string> &def_out_opn, set<string> &cannot_out);

bool phi_def_out(codenode *n, loop_struct &x);

string if_motion(codenode *n, loop_struct &x, set<string> &def_out_opn, set<string> &cannot_out);

void add_dom(basic_block *bb, basic_block *rk);

void loopsInit();

void insert_prebb(vector<loop_struct>::iterator x);

void code_motion();

void lcm();

#endif
