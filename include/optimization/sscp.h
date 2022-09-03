#ifndef SSCP_H
#define SSCP_H

#include "ssa.h"

using namespace std;

enum Var_Status
{
    top,
    value,
    bottom,
};

struct Semi_Lattice
{
    Var_Status status;
    unordered_set<int> intVal;
    unordered_set<float> floatVal;
};

class prSite
{
public:
    codenode *codePr;
    opn *opnPr;
    int localBB;
    int Site;
    bool operator<(const prSite &b) const
    {
        if ((opnPr) == (b.opnPr))
            return false; //去重
        //降序
        if (Site != b.Site)
            return Site < b.Site;
        else if (localBB != b.localBB)
            return localBB < b.localBB;
        else
            return (unsigned long long int)(opnPr) < (unsigned long long int)(b.opnPr);
    }

}; //保存一个指令指针加一个变量指针结构；

struct SSAEdge
{
    unordered_set<string> in;
    string op;
    codenode *edgeIR;
    SSAEdge()
    {
        this->in.clear();
        this->op = "x", this->edgeIR = NULL;
    }
    SSAEdge(string in, string op, codenode *edgeIR)
    {
        this->in.insert(in);
        this->op = op, this->edgeIR = edgeIR;
    }
    SSAEdge(string in1, string in2, string op, codenode *edgeIR)
    {
        this->in.insert(in1), this->in.insert(in2);
        this->op = op, this->edgeIR = edgeIR;
    }
    bool operator<(const SSAEdge &b) const
    {
        if (op == b.op)
            return false; //去重
        //降序
        if (op != b.op)
            return op > b.op;
        else
            return in.size() > b.in.size();
    }
};

int constCal(codenode *opcode, int a, int b);
float constCal(codenode *opcode, float a, float b);

//每个临时变量的结点结构；
class CTStruct
{
public:
    string VarName;
    //变量标志位；
    char type; // v,i,f
    char kind; // T,S,H,G,A
    char cal_type;

    struct Semi_Lattice SLattice; // SSCP和SCCP使用的半栅结构；

    set<prSite> genSite; //此变量生成位点指针结构体，用于构成ssa形式图；
    set<prSite> useSite; //此变量调用位点指针结构体，用于构成ssa形式图；

    void insUseSite(codenode *C, opn *O)
    {
        struct prSite Pr;
        Pr.codePr = C, Pr.opnPr = O, Pr.localBB = C->localBB, Pr.Site = 0;
        useSite.emplace(Pr);
    }

    void varMeet(codenode *C, CTStruct *a, CTStruct *b) //传播阶段meet过程；
    {
        if (this->SLattice.status == bottom) //已计算过是未知则直接跳过；
        {
            return;
        }
        else
        {
            if (a->SLattice.status == bottom || b->SLattice.status == bottom) //未知传递；
            {
                this->SLattice.status = bottom;
            }
            else if (a->SLattice.status == top || b->SLattice.status == top) //未初始化传递,要么被覆盖，要么不改变，故直接退出；
            {
                return;
            }
            else //内存模拟常量运算并传递；
            {
                if (cal_type == 'i')
                {
                    if (C->op > IR_MOD && C->op < IR_AND) //条件语句特判；
                    {
                        // cout << "\t" << a->cal_type << "\t" << b->cal_type;
                        if (a->cal_type == b->cal_type)
                        {
                            if (a->cal_type == 'i' && b->cal_type == 'i')
                            {
                                SLattice.intVal.emplace(constCal(C, *a->SLattice.intVal.begin(), (*b->SLattice.intVal.begin())));
                            }
                            else if (a->cal_type == 'f' && b->cal_type == 'f')
                            {
                                SLattice.intVal.emplace((int)constCal(C, *a->SLattice.floatVal.begin(), (*b->SLattice.floatVal.begin())));
                            }
                        }
                        else
                        {
                            if (a->cal_type == 'i' && b->cal_type == 'f')
                            {
                                SLattice.intVal.emplace((int)constCal(C, (float)*a->SLattice.intVal.begin(), (*b->SLattice.floatVal.begin())));
                            }
                            else if (a->cal_type == 'f' && b->cal_type == 'i')
                            {
                                SLattice.intVal.emplace((int)constCal(C, *a->SLattice.floatVal.begin(), (float)(*b->SLattice.intVal.begin())));
                            }
                        }
               
                    }
                    else if (a->SLattice.intVal.size() == 0 || b->SLattice.intVal.size() == 0)
                    {
                        cout << "\t" << this->VarName << "\t传播出错，输入不合法：" << a->VarName << "\t" << b->VarName << endl;
                        return;
                    }
                    else
                    {
                        int ans = constCal(C, *a->SLattice.intVal.begin(), *b->SLattice.intVal.begin());
                        SLattice.intVal.emplace(ans);
                    }
                    if ((int)SLattice.intVal.size() > 1) //利用set去重特性，根据size判断是否未知；
                    {
                        SLattice.status = bottom;
                    }
                    else if (SLattice.intVal.size() == 1)
                    {
                        SLattice.status = value;
                    }
                }
                else if (cal_type == 'f')
                {
                    if (a->SLattice.floatVal.size() == 0 || b->SLattice.floatVal.size() == 0)
                    {
                        cout << "\t" << this->VarName << "\t传播出错，输入不合法：" << a->VarName << "\t" << b->VarName << endl;
                        return;
                    }
                    float ina = *(a->SLattice.floatVal.begin()), inb = *(b->SLattice.floatVal.begin());

                    float ans = constCal(C, ina, inb);
                    SLattice.floatVal.emplace(ans);
                    if ((int)SLattice.floatVal.size() > 1) //利用set去重特性，根据size判断是否未知；
                    {
                        SLattice.status = bottom;
                    }
                    else if (SLattice.floatVal.size() == 1)
                    {
                        SLattice.status = value;
                    }
                }
            }
        }
    }

    void varMeet(codenode *C, CTStruct *a) //传播阶段meet过程；
    {
        if (this->SLattice.status == bottom) //已计算过是未知则直接跳过；
        {
            return;
        }
        else
        {
            if (a->SLattice.status == bottom) //未知传递；
            {
                this->SLattice.status = bottom;
            }
            else if (a->SLattice.status == top) //未初始化传递,要么被覆盖，要么不改变，故直接退出；
            {
                return;
            }
            else //内存模拟常量运算并传递；
            {
                switch (C->op)
                {
                case IR_VCVT:
                {
                    if (C->opn1.id == ".s32.f32")
                    {
                        if (a->SLattice.floatVal.size() == 0)
                        {
                            cout << "\t" << this->VarName << "\t传播出错，输入不合法：" << a->VarName << endl;
                            return;
                        }
                        SLattice.intVal.emplace(int(*(a->SLattice.floatVal.begin())));
                        if ((int)SLattice.intVal.size() > 1)
                        {
                            SLattice.status = bottom;
                        }
                        else
                        {
                            SLattice.status = value;
                        }
                    }
                    else if (C->opn1.id == ".f32.s32")
                    {
                        if (a->SLattice.intVal.size() == 0)
                        {
                            cout << "\t" << this->VarName << "\t传播出错，输入不合法：" << a->VarName << endl;
                            return;
                        }
                        SLattice.floatVal.emplace(float(*(a->SLattice.intVal.begin())));
                        if ((int)SLattice.floatVal.size() > 1)
                        {
                            SLattice.status = bottom;
                        }
                        else
                        {
                            SLattice.status = value;
                        }
                    }
                    break;
                }
                case IR_ASSIGN:
                {
                    if (cal_type == 'i')
                    {
                        if (a->SLattice.intVal.size() == 0)
                        {
                            cout << "\t" << this->VarName << "\t传播出错，输入不合法：" << a->VarName << endl;
                            return;
                        }
                        SLattice.intVal.emplace(int(*(a->SLattice.intVal.begin())));
                        if ((int)SLattice.intVal.size() > 1)
                        {
                            SLattice.status = bottom;
                        }
                        else
                        {
                            SLattice.status = value;
                        }
                    }
                    else if (cal_type == 'f')
                    {
                        if (a->SLattice.floatVal.size() == 0)
                        {
                            cout << "\t" << this->VarName << "\t传播出错，输入不合法：" << a->VarName << endl;
                            return;
                        }
                        SLattice.floatVal.emplace(float(*(a->SLattice.floatVal.begin())));
                        if ((int)SLattice.floatVal.size() > 1)
                        {
                            SLattice.status = bottom;
                        }
                        else
                        {
                            SLattice.status = value;
                        }
                    }
                    break;
                }
                case IR_LOAD:
                {
                    if (cal_type == 'i')
                    {
                        if (a->SLattice.intVal.size() == 0)
                        {
                            cout << "\t" << this->VarName << "\t传播出错，输入不合法：" << a->VarName << endl;
                            return;
                        }
                        SLattice.intVal.emplace(int(*(a->SLattice.intVal.begin())));
                        int size = (int)SLattice.intVal.size();
                        if (size > 1)
                        {
                            SLattice.status = bottom;
                        }
                        else
                        {
                            SLattice.status = value;
                        }
                    }
                    else if (cal_type == 'f')
                    {
                        if (a->SLattice.floatVal.size() == 0)
                        {
                            cout << "\t" << this->VarName << "\t传播出错，输入不合法：" << a->VarName << endl;
                            return;
                        }
                        SLattice.floatVal.emplace(float(*(a->SLattice.floatVal.begin())));
                        if ((int)SLattice.floatVal.size() > 1)
                        {
                            SLattice.status = bottom;
                        }
                        else
                        {
                            SLattice.status = value;
                        }
                    }
                    break;
                }
                case IR_NOT:
                {
                    if (cal_type == 'i')
                    {
                        if (a->SLattice.intVal.size() == 0)
                        {
                            cout << "\t" << this->VarName << "\t传播出错，输入不合法：" << a->VarName << endl;
                            return;
                        }
                        SLattice.intVal.emplace(!(*(a->SLattice.intVal.begin())));
                        if ((int)SLattice.intVal.size() > 1)
                        {
                            SLattice.status = bottom;
                        }
                        else
                        {
                            SLattice.status = value;
                        }
                    }
                    else if (cal_type == 'f')
                    {
                        if (a->SLattice.floatVal.size() == 0)
                        {
                            cout << "\t" << this->VarName << "\t传播出错，输入不合法：" << a->VarName << endl;
                            return;
                        }
                        SLattice.floatVal.emplace(!(int)(*(a->SLattice.floatVal.begin())));
                        if ((int)SLattice.floatVal.size() > 1)
                        {
                            SLattice.status = bottom;
                        }
                        else
                        {
                            SLattice.status = value;
                        }
                    }
                    break;
                }
                case IR_UMINUS:
                {
                    if (cal_type == 'i')
                    {
                        if (a->SLattice.intVal.size() == 0)
                        {
                            cout << "\t" << this->VarName << "\t传播出错，输入不合法：" << a->VarName << endl;
                            return;
                        }
                        SLattice.intVal.emplace(0 - (*(a->SLattice.intVal.begin())));
                        if ((int)SLattice.intVal.size() > 1)
                        {
                            SLattice.status = bottom;
                        }
                        else
                        {
                            SLattice.status = value;
                        }
                    }
                    else if (cal_type == 'f')
                    {
                        if (a->SLattice.floatVal.size() == 0)
                        {
                            cout << "\t" << this->VarName << "\t传播出错，输入不合法：" << a->VarName << endl;
                            return;
                        }
                        SLattice.floatVal.emplace(0 - (*(a->SLattice.floatVal.begin())));
                        if ((int)SLattice.floatVal.size() > 1)
                        {
                            SLattice.status = bottom;
                        }
                        else
                        {
                            SLattice.status = value;
                        }
                    }
                    break;
                }
                default:
                    break;
                }
            }
        }
    }
};

class FCTStuct
{

public:
    map<string, CTStruct> CTList;
};

//临时变量全局表；
class GloCPStruct
{
public:
    string now_func;
    unordered_map<string, FCTStuct> FList;
    class CTStruct *find(string varid);
    void insCTStop(struct codenode *C, struct opn *O)
    {
        if (find(O->id)->VarName == "voidCFT")
        {
            struct CTStruct tmpc;
            tmpc.VarName = O->id;
            tmpc.cal_type = O->cal_type;
            tmpc.kind = O->kind;
            tmpc.type = O->type;
            // if (FList[now_func].CTList.find(O->id) != FList[now_func].CTList.end())
            //     tmpc.useSite = FList[now_func].CTList[tmpc.VarName].useSite;
            FList[now_func].CTList[tmpc.VarName] = tmpc;
        }
        prSite tmpP;
        tmpP.codePr = C, tmpP.opnPr = O, tmpP.localBB = C->localBB, tmpP.Site = 0;
        find(O->id)->genSite.emplace(tmpP);
        find(O->id)->SLattice.status = top;
    }
    void insCTSbottom(struct codenode *C, struct opn *O)
    {
        if (find(O->id)->VarName == "voidCFT")
        {
            struct CTStruct tmpc;
            tmpc.VarName = O->id;
            tmpc.cal_type = O->cal_type;
            tmpc.kind = O->kind;
            tmpc.type = O->type;
            tmpc.SLattice.status = bottom;
            // if (FList[now_func].CTList.find(O->id) != FList[now_func].CTList.end())
            //     tmpc.useSite = FList[now_func].CTList[tmpc.VarName].useSite;
            FList[now_func].CTList[tmpc.VarName] = tmpc;
        }
        prSite tmpP;
        tmpP.codePr = C, tmpP.opnPr = O, tmpP.localBB = C->localBB, tmpP.Site = 0;
        find(O->id)->genSite.emplace(tmpP);
        find(O->id)->SLattice.status = bottom;
    }
    void insCTSval(struct codenode *C, struct opn *O, int val)
    {
        if (find(O->id)->VarName == "voidCFT")
        {
            struct CTStruct tmpc;
            tmpc.VarName = O->id;
            tmpc.cal_type = O->cal_type;
            tmpc.kind = O->kind;
            tmpc.type = O->type;
            tmpc.SLattice.status = value;
            // if (FList[now_func].CTList.find(O->id) != FList[now_func].CTList.end())
            //     tmpc.useSite = FList[now_func].CTList[tmpc.VarName].useSite;
            FList[now_func].CTList[tmpc.VarName] = tmpc;
        }
        prSite tmpP;
        tmpP.codePr = C, tmpP.opnPr = O, tmpP.localBB = C->localBB, tmpP.Site = 0;
        find(O->id)->genSite.emplace(tmpP);
        find(O->id)->SLattice.intVal.emplace(val);
        find(O->id)->SLattice.status = value;
    }
    void insCTSval(struct codenode *C, struct opn *O, float val)
    {
        if (find(O->id)->VarName == "voidCFT")
        {
            struct CTStruct tmpc;
            tmpc.VarName = O->id;
            tmpc.cal_type = O->cal_type;
            tmpc.kind = O->kind;
            tmpc.type = O->type;

            FList[now_func].CTList[tmpc.VarName] = tmpc;
        }
        prSite tmpP;
        tmpP.codePr = C, tmpP.opnPr = O, tmpP.localBB = C->localBB, tmpP.Site = 0;
        find(O->id)->genSite.emplace(tmpP);
        find(O->id)->SLattice.floatVal.emplace(val);
        find(O->id)->SLattice.status = value;
    }
    void insertU(codenode *C, opn *O)
    {
        if (find(O->id)->VarName == "voidCFT")
        {
            struct CTStruct tmpc;
            tmpc.VarName = O->id;
            tmpc.cal_type = O->cal_type;
            tmpc.kind = O->kind;
            tmpc.type = O->type;
            tmpc.SLattice.status = top;
            FList[now_func].CTList[tmpc.VarName] = tmpc;
        }
        find(O->id)->insUseSite(C, O);
    }
    void reClear();
    void Display();
};

extern class GloCPStruct g_sscpS;
extern class CTStruct nullcfts;
extern map<string, set<SSAEdge>> SSAworkList;       //数据流工作薄；
extern map<int, unordered_set<int>> CFGworkList;    //控制流工作薄；
extern map<int, unordered_set<int>> executedCEList; //已执行边表；
extern set<int> AvailableBBList;                    //可达块表；
extern unordered_set<int> DeadBBList;
extern unordered_set<string> constTList; //常数变量表；
extern set<SSAEdge> nullssaedge;

extern unordered_set<string> workSLsit;
void SSConstantPropagation(int runTimes);
void DisplayGCPStruct();
void SetCTStruct(class CTStruct &tmpS, struct opn &O);
void DFSBlockSSCPInit(int curB);

#endif //