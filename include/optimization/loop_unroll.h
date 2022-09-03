#include "sscp.h"
#include "StaticRisAlloc.h"

using namespace std;

class LoopOrderUnit
{
public:
    int index;
    int Level;
    bool operator<(const LoopOrderUnit &b) const
    {
        //去重
        if ((index) == (b.index))
            return false;
        //降序
        if (Level != b.Level)
            return Level > b.Level;
        else if (index != b.index)
            return index > b.index;
        return 0;
    }
};

class calProcedure
{
public:
    string calKind; // "+" or "x" or "-" or "-/" or "/" or "//" or "%" or "%/"
    opn ParaOpn;
};

class LoopStruct
{
public:
    /*基本信息*/
    int index; //块头标号作为循环编码；
    string BeginBlock, EndBlock;
    int BeginSite, EndSite; //循环线性范围；
    // unordered_set<int> inLoopBlock; //循环块范围；

    /*复杂程度信息*/
    string LoopVar;                //循环依赖变量；
    codenode *CmpCode = NULL;      //比较语句；
    vector<calProcedure> CalStack; //循环依赖变量线性运算句；
    vector<calProcedure> CmpStack; //循环依赖变量线性运算句；
    opn initValue;
    int whileTimes = 0; //总循环次数；
    int CopyTimes = 0;  //合适的展开层数；
    int SFlag = 0;
    /*展开维护信息*/
    int LinearFlag;                       //是否完全展开标志；
    string copyLabel;                     //复制代码的头块标签；
    unordered_map<string, opn> pre2newVN; //循环旧块到新块之间的变量映射；

    bool runCmp(opn inO); //内存模拟比较；
    opn runCal(opn inO);  //内存模拟运算；
    bool setCopyTimes();  //设定此循环的复制次数；返回次数是否大于0；
    void setPNMap();      //维护变量对应；
    void LoopCopy();      //复制代码生成新的展开后循环；
    void SLoopCopy();     //复制代码生成新的展开后循环；

    void LoopLinear(); //循环展开后将能继续优化成线性代码的循环线性化（去除条件跳转）；

    void mapVal(opn *inO, opn *outO, codenode *cur);
};

class FLoopsStruct
{
public:
    unordered_map<int, LoopStruct> LList;
    set<LoopOrderUnit> LCopeOrder;
};

class GLoopsStruct
{

public:
    string now_func;
    unordered_map<string, FLoopsStruct> FList;
    class LoopStruct *find(int lid);
    void Display();
    void LoopsInit();
};

//循环初始化；

//全局扫描代码初始化变量gen,use；维护循环site点

//判断循环复杂程度；维护ACC,CMPcode；

//遍历一个简单循环所有变量，H型变量，L型变量加对应关系（预先处理）；S型变量判定制点范围，外则自映射，内则新变量（复制时处理）；T型直接新变量（复制时处理）；

//代码复制；查map实现有效复制；

//代码拼接；

extern class GLoopsStruct g_llS;
extern class GloSRAStruct g_lvS;

void LoopUnroll();
