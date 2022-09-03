#include "StaticRisAlloc.h"
using namespace std;

class BLVN
{
public:
    int index;
    int BeginSite, EndSite;
    unordered_map<string, opn> Hash;
    unordered_map<string, int> HashSite;

    void Block_LVN(int curB, unordered_set<int> *UQB);
};

class FLVN
{
public:
    string fid;
    unordered_map<int, BLVN> BList;
    void Func_LVN();
    void CodeScan();
};

class GLVN
{
public:
    unordered_map<string, FLVN> FList;
    void display();
    void Glo_LVN();
};

extern GLVN g_lvnH;         //公共子表达式hash表
extern GloSRAStruct g_lvnS; // LVN依赖的数据流形式图
