#ifndef SSA_H
#define SSA_H

#include "control_flow.h"
using namespace std;

// 1、block内静态重赋值；遍历一次IR；

// 2、插入phi函数；遍历一次符合要求基本块；

// 3、phi翻译成assign；

struct Hvar
{

    //块号
    int bindex;
    char flag;    //类型 H phi返回，A assign产生的
    int index;    // ssa序号
    string Hname; //对应临时变量名；
};

// SSA中变量结构体；
struct SSAvar
{
    //变量的活跃块；
    unordered_set<int> alive_B;
    //变量的phi块；
    unordered_map<string, int> NName2PhiB;
    //变量的数据流栈——当前对应临时变量名称；
    stack<string> varSSA;
    //添加的H型变量的名称对应，用于debug；
    vector<struct Hvar> hvar2NName;
    //分配状态；
    int status;
    int address;
    int no_ris;
    SSAvar()
    {
        status = 0;
        address = 0;
        no_ris = 0;
    }
};
struct SSARisA
{
    //分配状态；
    int status;
    int address;
    int no_ris;
    int level;
};

// SSA中函数结构体；
struct Funcstruct
{
    // var——id + var_level;不同作用域的不同变量；
    unordered_map<string, struct SSAvar> Vlist;
};

// SSA中全局结构体；
class SSAstruct
{
public:
    //根据函数名访问对应函数结构体；
    unordered_map<string, struct Funcstruct> Flist;
    struct SSAvar *find(string funcid, string varid);
  
};

//全局变量；
extern struct SSAvar nullvar;
extern struct SSAstruct g_ssaS;

// 1、block内静态重赋值；遍历一次IR；
//跑通顺序用例；

// 2、插入phi函数；遍历一次符合要求基本块；
void insert_phi();
int v_l2l(string rename);

// 3、phi翻译成assign；
//跑通全部用例；
void findAlive();

void RunSSA();

#endif //