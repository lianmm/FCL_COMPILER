#ifndef BB_H
#define BB_H

#include "../midend/glo_gen_IR.h"
#include <vector>
#include <set>
#include <unordered_set>
#include <unordered_map>
using namespace std;

struct phi_node
{
    //输入块号；
    int index;
    //参数对应的临时变量名称；
    string new_name;
    //翻译后的位置;
    codenode *phiIRSite;
};

struct nextEdge
{
    int index;
    codenode *gotoCode;
    bool operator<(const nextEdge &b) const
    {
        if (index == b.index)
            return false; //去重
        //降序
        if (index != b.index)
            return gotoCode > b.gotoCode;
        else
            return index > b.index;
    }
    nextEdge()
    {
        index = 0;
        gotoCode = NULL;
    }
};

struct basic_block
{
    int index;
    int size;
    codenode *begin, *end;
    // 直接前驱 可能有多个
    set<int> preds;
    map<int, nextEdge> next;
    unordered_set<int> dominators;
    unordered_set<int> df;
    unordered_set<int> idom; //直接支配前驱；
    set<int> idomS;          //直接支配后继；
    int dfsNext;
    int preTNode;
    unordered_set<string> PhiCodes;
    //每个变量的phi函数；
    unordered_map<string, vector<phi_node>> phi_nodes;
    // 每一个变量最后的名称
    unordered_map<string, string> alive_V;
    // 每一个变量最初的名称
    unordered_map<string, string> alive_VB;
    // 是否是关键边新建基本块
    bool critical_block;
    //基本块作用域层数；
    int level;
    //条件跳转块；
    int ConditionFlag;
    basic_block()
    {
        size = 0;
        index = 0;
        begin = NULL;
        end = NULL;
        level = 0;
        this->ConditionFlag = 0;
    }
    basic_block &operator=(const basic_block &b)
    {
        this->ConditionFlag = b.ConditionFlag;
        this->size = b.size;
        this->index = b.index;
        this->begin = b.begin;
        this->end = b.end;
        this->preds = b.preds;
        this->next = b.next;
        this->dominators = b.dominators;
        this->df = b.df;
        return *this;
    }
};

// vector<basic_block *> all_bb_map;

// 全局对应的基本块表
class glo_bb_list
{
public:
    unordered_map<string, unordered_map<int, struct basic_block *>> glo_list;
    // 各个函数的bb的最大index
    unordered_map<string, int> max_index;
    int last_block;
    glo_bb_list()
    {
        last_block = -1;
    }
    struct basic_block *find(string funcid, int bindex); // find块的函数。查改使用，增删不能用；

    //有需求加find函数的函数，目前用不上就不实现。
};

extern class glo_bb_list g_bbL;

bool if_blockend(codenode *p);

void splitBlock();
void DivideBasicBlock();
void DisplayBBList();
void BBFold(int rtime);
void BBInit(int runtime);
int L2i(const char *in);

#endif //