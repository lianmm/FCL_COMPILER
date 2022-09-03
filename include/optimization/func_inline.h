#ifndef FUNC_I_H
#define FUNC_I_H

#include "ssa.h"
using namespace std;

class CallStuct
{
public:
    vector<codenode *> argCode;
    opn *retOpn;
    codenode *callCode;
    string callFunc;
    unordered_map<string, opn> pre2new;
    void funcCopy();
    void mapVal(opn *inO, opn *outO, codenode *cur);

    bool operator<(const CallStuct &b) const
    {
        if ((callCode) == (b.callCode))
            return false; //去重
        //降序
        if (callCode != b.callCode)
            return retOpn < b.retOpn;
        else if (retOpn != b.retOpn)
            return callFunc < b.callFunc;
        return 0;
    }
};

class FIFStruct
{
public:
    string Fid;
    vector<opn *> paraOpn;
    unordered_set<opn *> rtnOpn;
    set<CallStuct> callList;
    unordered_set<string> callIdList;

    int InlineFlag;
    void callInit();
    void callInline();
};

class FIGStruct
{
public:
    string now_func;
    unordered_map<string, FIFStruct> FList;
    void display();
};
extern class FIGStruct g_ffS;
void FuncInline();

#endif //
