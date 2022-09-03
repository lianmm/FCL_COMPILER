#include "../../include/optimization/loop_unroll.h"

class LoopStruct nullLoopStruct;
class GLoopsStruct g_llS;
class GloSRAStruct g_lvS;

unordered_set<string> newHVar;

inline bool equalOpn(opn opn1, opn opn2)
{
    if (opn1.type != opn2.type)
        return false;
    if (opn1.type == 'i' && opn1.const_int != opn2.const_int)
        return false;
    if (opn1.type == 'f' && opn1.const_float != opn2.const_float)
        return false;
    if (opn1.type == 'v' && (opn1.id != opn2.id || opn1.kind != opn2.kind))
        return false;
    return true;
}

//全局类内支持函数；
class LoopStruct *GLoopsStruct::find(int lid)
{
    nullLoopStruct.index = -2; //不存在-2号块，所以是空结构；

    if (FList.find(now_func) == FList.end())
    {
        // cout << now_func << "无此函数!" << endl;
        return &nullLoopStruct;
    }
    else if (FList[now_func].LList.find(lid) == FList[now_func].LList.end())
    {
        // cout << now_func << ": " << lid << "无此循环!" << endl;
        return &nullLoopStruct;
    }
    else
    {
        return &FList[now_func].LList[lid];
    }
}
void GLoopsStruct::Display()
{
    cout << "------------------LoopList-------------------------\n";

    for (auto itf = FList.begin(); itf != FList.end(); itf++)
    {
        cout << itf->first << ":\n";
        cout << "循环处理顺序：\n";
        for (auto itl = itf->second.LCopeOrder.begin(); itl != itf->second.LCopeOrder.end(); itl++)
        {

            cout << "\t" << itl->index << ": " << itl->Level;
        }
        cout << endl;
        for (auto itl = itf->second.LList.begin(); itl != itf->second.LList.end(); itl++)
        {
            cout << itl->second.index << ":\n\n";
            cout << "\tBegin:" << itl->second.BeginBlock << "\tEnd:" << itl->second.EndBlock << endl;
            cout << "\tBegin:" << itl->second.BeginSite << "\tEnd:" << itl->second.EndSite << endl;

            cout << "\n\tloopVar:" << itl->second.LoopVar << endl;
            if (itl->second.CmpCode != NULL)
                cout << "\tCmpCode:" << IR_op_strs[itl->second.CmpCode->op] << "\t" << itl->second.CmpCode->opn1.id << "\t" << itl->second.CmpCode->opn1.kind << "\t" << itl->second.CmpCode->opn2.const_int << endl;
            cout << "\n\tCalStack:" << endl;
            for (int i = 0; i < itl->second.CalStack.size(); i++)
            {
                cout << "\t" << itl->second.CalStack[i].calKind << "\t" << itl->second.CalStack[i].ParaOpn.const_int << endl;
            }
            cout << "\tCmpStack:" << endl;
            for (int i = 0; i < itl->second.CmpStack.size(); i++)
            {
                cout << "\t" << itl->second.CmpStack[i].calKind << "\t" << itl->second.CmpStack[i].ParaOpn.const_int << endl;
            }

            cout << "\tinitValue: " << itl->second.initValue.const_int << endl;

            cout << "\twhileTimes: " << itl->second.whileTimes << "\tCopyTimes: " << itl->second.CopyTimes << "\n\n";

            cout << "copyLabel: " << itl->second.copyLabel << endl;
            cout << "pre2newVN:\n";
            for (auto itv = itl->second.pre2newVN.begin(); itv != itl->second.pre2newVN.end(); itv++)
            {
                cout << itv->first << ":" << itv->second.id << "\t";
            }
            cout << endl;
        }
    }
    cout << "-------------------------------------------------\n";
}

//循环结构体初始化；
void GLoopsStruct::LoopsInit()
{
    for (auto itf = wL.begin(); itf != wL.end(); itf++)
    {
        FLoopsStruct tmpF;
        g_llS.FList[itf->first] = tmpF;
        for (auto itl = itf->second.begin(); itl != itf->second.end(); itl++)
        {
            LoopStruct tmpL;
            tmpL.BeginBlock = ".L" + to_string(itl->first);
            tmpL.EndBlock = ".L" + to_string(itl->first + 2);
            tmpL.index = itl->first;
            g_llS.FList[itf->first].LList[itl->first] = tmpL;
            LoopOrderUnit tmpou;
            if (g_bbL.find(itf->first, itl->first)->begin == NULL)
                cout << "NUllLOOP: " << itl->first << endl;
            else
                tmpou.Level = g_bbL.find(itf->first, itl->first)->begin->level;
            tmpou.index = itl->first;
            if (tmpou.Level < 3)
                g_llS.FList[itf->first].LCopeOrder.emplace(tmpou);
        }
    }
}

//反向搜索循环依赖变量的条件判断流；
bool rDFSCmp(string *AimVar, string CurVar, int Loop)
{
    if (g_sL.find(CurVar)->flag == 'H')
    {
        *AimVar = CurVar;
        return 1;
    }
    int fixFlag = 0;
    for (auto itg = g_lvS.find(CurVar)->genSite.begin(); itg != g_lvS.find(CurVar)->genSite.end(); itg++)
    {
        if (itg->Site < g_llS.find(Loop)->BeginSite || itg->Site > g_llS.find(Loop)->EndSite)
            continue;
        else if (g_llS.find(Loop)->BeginSite < itg->Site && g_llS.find(Loop)->EndSite > itg->Site)
        {
            if (fixFlag == 1)
                return 0;
            fixFlag = 1;
            switch (itg->codePr->op)
            {
            case IR_ASSIGN:
            {
                return rDFSCmp(AimVar, itg->codePr->opn2.id, Loop);
                break;
            }
            case ARM_MOVcont:
            {
                return rDFSCmp(AimVar, itg->codePr->opn2.id, Loop);
                break;
            }
            case IR_LOAD:
            {
                return rDFSCmp(AimVar, itg->codePr->opn1.id, Loop);
                break;
            }
            case IR_UMINUS:
            {
                return rDFSCmp(AimVar, itg->codePr->opn1.id, Loop);

                break;
            }
            case IR_ADD:
            {
                calProcedure tmpcP;
                tmpcP.calKind = "+";

                if (itg->codePr->opn1.type == 'v' && itg->codePr->opn2.type != 'v')
                {
                    tmpcP.ParaOpn = itg->codePr->opn2;
                    g_llS.find(Loop)->CmpStack.emplace(g_llS.find(Loop)->CmpStack.begin(), tmpcP);
                    return rDFSCmp(AimVar, itg->codePr->opn1.id, Loop);
                }
                else if (itg->codePr->opn2.type == 'v' && itg->codePr->opn1.type != 'v')
                {
                    tmpcP.ParaOpn = itg->codePr->opn1;
                    g_llS.find(Loop)->CmpStack.emplace(g_llS.find(Loop)->CmpStack.begin(), tmpcP);
                    return rDFSCmp(AimVar, itg->codePr->opn2.id, Loop);
                }
                else if (itg->codePr->opn1.type == 'v' || itg->codePr->opn2.type == 'v')
                    return 0;
                break;
            }
            case IR_MINUS:
            {
                calProcedure tmpcP;

                if (itg->codePr->opn1.type == 'v' && itg->codePr->opn2.type != 'v')
                {
                    tmpcP.calKind = "-";
                    tmpcP.ParaOpn = itg->codePr->opn2;
                    g_llS.find(Loop)->CmpStack.emplace(g_llS.find(Loop)->CmpStack.begin(), tmpcP);
                    return rDFSCmp(AimVar, itg->codePr->opn1.id, Loop);
                }
                else if (itg->codePr->opn2.type == 'v' && itg->codePr->opn1.type != 'v')
                {
                    tmpcP.calKind = "-/";
                    tmpcP.ParaOpn = itg->codePr->opn1;
                    g_llS.find(Loop)->CmpStack.emplace(g_llS.find(Loop)->CmpStack.begin(), tmpcP);
                    return rDFSCmp(AimVar, itg->codePr->opn2.id, Loop);
                }
                else if (itg->codePr->opn1.type == 'v' || itg->codePr->opn2.type == 'v')
                    return 0;
                break;
            }
            case IR_MUL:
            {
                calProcedure tmpcP;
                tmpcP.calKind = "x";

                if (itg->codePr->opn1.type == 'v' && itg->codePr->opn2.type != 'v')
                {
                    tmpcP.ParaOpn = itg->codePr->opn2;
                    g_llS.find(Loop)->CmpStack.emplace(g_llS.find(Loop)->CmpStack.begin(), tmpcP);
                    return rDFSCmp(AimVar, itg->codePr->opn1.id, Loop);
                }
                else if (itg->codePr->opn2.type == 'v' && itg->codePr->opn1.type != 'v')
                {
                    tmpcP.ParaOpn = itg->codePr->opn1;
                    g_llS.find(Loop)->CmpStack.emplace(g_llS.find(Loop)->CmpStack.begin(), tmpcP);
                    return rDFSCmp(AimVar, itg->codePr->opn2.id, Loop);
                }
                else if (itg->codePr->opn1.type == 'v' || itg->codePr->opn2.type == 'v')
                    return 0;
                break;
            }
            case IR_DIV:
            {
                calProcedure tmpcP;

                if (itg->codePr->opn1.type == 'v' && itg->codePr->opn2.type != 'v')
                {
                    tmpcP.calKind = "/";
                    tmpcP.ParaOpn = itg->codePr->opn2;
                    g_llS.find(Loop)->CmpStack.emplace(g_llS.find(Loop)->CmpStack.begin(), tmpcP);
                    return rDFSCmp(AimVar, itg->codePr->opn1.id, Loop);
                }
                else if (itg->codePr->opn2.type == 'v' && itg->codePr->opn1.type != 'v')
                {
                    tmpcP.calKind = "//";
                    tmpcP.ParaOpn = itg->codePr->opn1;
                    g_llS.find(Loop)->CmpStack.emplace(g_llS.find(Loop)->CmpStack.begin(), tmpcP);
                    return rDFSCmp(AimVar, itg->codePr->opn2.id, Loop);
                }
                else if (itg->codePr->opn1.type == 'v' || itg->codePr->opn2.type == 'v')
                    return 0;
                break;
            }
            case IR_MOD:
            {
                calProcedure tmpcP;

                if (itg->codePr->opn1.type == 'v' && itg->codePr->opn2.type != 'v')
                {
                    tmpcP.calKind = "%";
                    tmpcP.ParaOpn = itg->codePr->opn2;
                    g_llS.find(Loop)->CmpStack.emplace(g_llS.find(Loop)->CmpStack.begin(), tmpcP);
                    return rDFSCmp(AimVar, itg->codePr->opn1.id, Loop);
                }
                else if (itg->codePr->opn2.type == 'v' && itg->codePr->opn1.type != 'v')
                {
                    tmpcP.calKind = "%/";
                    tmpcP.ParaOpn = itg->codePr->opn1;
                    g_llS.find(Loop)->CmpStack.emplace(g_llS.find(Loop)->CmpStack.begin(), tmpcP);
                    return rDFSCmp(AimVar, itg->codePr->opn2.id, Loop);
                }
                else if (itg->codePr->opn1.type == 'v' || itg->codePr->opn2.type == 'v')
                    return 0;
                break;
            }
            default:
                return 0; //其他则必为变量，判定为复杂循环无法展开；
            }
        }
    }
    return 0; //???
}

//反向搜索循环依赖变量的“自增”ssa环流；搜到返回1，搜不到返回0；
bool rDFSCal(string AimVar, string CurVar, int Loop)
{
    int fixFlag = 0;                                                //循环依赖变量修改标志位；如果是一说明可能存在多次定值，多次定值则判定为复杂循环，函数退出；
    if (AimVar == CurVar && g_llS.find(Loop)->CalStack.size() != 0) //发现环流，退出；
        return 1;
    if (g_sL.find(CurVar)->flag == 'H' && CurVar != AimVar) //发现H变量，则判定为复杂循环，退出；
    {
        // printf("%d 内acc存在H分支输入 %s \n", Loop, CurVar.c_str());
        return 0;
    }
    for (auto itg = g_lvS.find(CurVar)->genSite.begin(); itg != g_lvS.find(CurVar)->genSite.end(); itg++)
    {
        if (itg->Site < g_llS.find(Loop)->BeginSite || itg->Site > g_llS.find(Loop)->EndSite)
            continue;

        else if (g_llS.find(Loop)->BeginSite < itg->Site && g_llS.find(Loop)->EndSite > itg->Site)
        {
            if (fixFlag == 1)
            {
                // printf("%d 内acc存在多分支输入 %s \n", Loop, CurVar.c_str());
                return 0;
            }
            if (g_bbL.find(g_sL.now_func, itg->localBB)->level > g_bbL.find(g_sL.now_func, Loop)->level) //作用域非线性，认为是复杂循环；
            {
                // printf("%d 内acc在内层作用域中 %d > %d\n", Loop, g_bbL.find(g_sL.now_func, itg->localBB)->level, g_bbL.find(g_sL.now_func, Loop)->level);
                return 0;
            }
            fixFlag = 1;
            switch (itg->codePr->op)
            {
            case IR_ASSIGN:
            {
                return rDFSCal(AimVar, itg->codePr->opn2.id, Loop);
                break;
            }
            case ARM_MOVcont:
            {
                return rDFSCal(AimVar, itg->codePr->opn2.id, Loop);
                break;
            }
            case IR_LOAD:
            {
                return rDFSCal(AimVar, itg->codePr->opn1.id, Loop);
                break;
            }
            case IR_UMINUS:
            {
                return rDFSCal(AimVar, itg->codePr->opn1.id, Loop);

                break;
            }
            case IR_ADD:
            {
                calProcedure tmpcP;
                tmpcP.calKind = "+";

                if (itg->codePr->opn1.type == 'v' && itg->codePr->opn2.type != 'v')
                {
                    tmpcP.ParaOpn = itg->codePr->opn2;
                    g_llS.find(Loop)->CalStack.emplace(g_llS.find(Loop)->CalStack.begin(), tmpcP);
                    return rDFSCal(AimVar, itg->codePr->opn1.id, Loop);
                }
                else if (itg->codePr->opn2.type == 'v' && itg->codePr->opn1.type != 'v')
                {
                    tmpcP.ParaOpn = itg->codePr->opn1;

                    g_llS.find(Loop)->CalStack.emplace(g_llS.find(Loop)->CalStack.begin(), tmpcP);
                    return rDFSCal(AimVar, itg->codePr->opn2.id, Loop);
                }
                else if (itg->codePr->opn1.type == 'v' || itg->codePr->opn2.type == 'v')
                    return 0;
                break;
            }
            case IR_MINUS:
            {
                calProcedure tmpcP;

                if (itg->codePr->opn1.type == 'v' && itg->codePr->opn2.type != 'v')
                {
                    tmpcP.calKind = "-";
                    tmpcP.ParaOpn = itg->codePr->opn2;
                    g_llS.find(Loop)->CalStack.emplace(g_llS.find(Loop)->CalStack.begin(), tmpcP);
                    return rDFSCal(AimVar, itg->codePr->opn1.id, Loop);
                }
                else if (itg->codePr->opn2.type == 'v' && itg->codePr->opn1.type != 'v')
                {
                    tmpcP.calKind = "-/";
                    tmpcP.ParaOpn = itg->codePr->opn1;
                    g_llS.find(Loop)->CalStack.emplace(g_llS.find(Loop)->CalStack.begin(), tmpcP);
                    return rDFSCal(AimVar, itg->codePr->opn2.id, Loop);
                }
                else if (itg->codePr->opn1.type == 'v' || itg->codePr->opn2.type == 'v')
                    return 0;
                break;
            }
            case IR_MUL:
            {
                calProcedure tmpcP;
                tmpcP.calKind = "x";

                if (itg->codePr->opn1.type == 'v' && itg->codePr->opn2.type != 'v')
                {
                    tmpcP.ParaOpn = itg->codePr->opn2;
                    g_llS.find(Loop)->CalStack.emplace(g_llS.find(Loop)->CalStack.begin(), tmpcP);
                    return rDFSCal(AimVar, itg->codePr->opn1.id, Loop);
                }
                else if (itg->codePr->opn2.type == 'v' && itg->codePr->opn1.type != 'v')
                {
                    tmpcP.ParaOpn = itg->codePr->opn1;
                    g_llS.find(Loop)->CalStack.emplace(g_llS.find(Loop)->CalStack.begin(), tmpcP);
                    return rDFSCal(AimVar, itg->codePr->opn2.id, Loop);
                }
                else if (itg->codePr->opn1.type == 'v' || itg->codePr->opn2.type == 'v')
                    return 0;
                break;
            }
            case IR_DIV:
            {
                calProcedure tmpcP;

                if (itg->codePr->opn1.type == 'v' && itg->codePr->opn2.type != 'v')
                {
                    tmpcP.calKind = "/";
                    tmpcP.ParaOpn = itg->codePr->opn2;
                    g_llS.find(Loop)->CalStack.emplace(g_llS.find(Loop)->CalStack.begin(), tmpcP);
                    return rDFSCal(AimVar, itg->codePr->opn1.id, Loop);
                }
                else if (itg->codePr->opn2.type == 'v' && itg->codePr->opn1.type != 'v')
                {
                    tmpcP.calKind = "//";
                    tmpcP.ParaOpn = itg->codePr->opn1;
                    g_llS.find(Loop)->CalStack.emplace(g_llS.find(Loop)->CalStack.begin(), tmpcP);
                    return rDFSCal(AimVar, itg->codePr->opn2.id, Loop);
                }
                else if (itg->codePr->opn1.type == 'v' || itg->codePr->opn2.type == 'v')
                    return 0;
                break;
            }
            case IR_MOD:
            {
                calProcedure tmpcP;

                if (itg->codePr->opn1.type == 'v' && itg->codePr->opn2.type != 'v')
                {
                    tmpcP.calKind = "%";
                    tmpcP.ParaOpn = itg->codePr->opn2;
                    g_llS.find(Loop)->CalStack.emplace(g_llS.find(Loop)->CalStack.begin(), tmpcP);
                    return rDFSCal(AimVar, itg->codePr->opn1.id, Loop);
                }
                else if (itg->codePr->opn2.type == 'v' && itg->codePr->opn1.type != 'v')
                {
                    tmpcP.calKind = "%/";
                    tmpcP.ParaOpn = itg->codePr->opn1;
                    g_llS.find(Loop)->CalStack.emplace(g_llS.find(Loop)->CalStack.begin(), tmpcP);
                    return rDFSCal(AimVar, itg->codePr->opn2.id, Loop);
                }
                else if (itg->codePr->opn1.type == 'v' || itg->codePr->opn2.type == 'v')
                    return 0;
                break;
            }
            default:
            {
                // printf("%d %s 存在非简单运算赋值流！\n", Loop, CurVar.c_str());
                return 0;
            } //其他则必为变量，判定为复杂循环无法展开；
            }
        }
    }
    return 0; //??
}

//内存模拟运行计算，比较运算栈；
bool LoopStruct::runCmp(opn inO)
{
    opn tmpO = inO;
    for (int i = 0; i < CmpStack.size(); i++)
    {

        string kind = CmpStack[i].calKind;
        if (CmpStack[i].ParaOpn.type != tmpO.type)
        {
            // printf("%d出现强制转换！", index);
            exit(1);
        }
        if (kind == "+")
        {

            tmpO.const_int = tmpO.const_int + CmpStack[i].ParaOpn.const_int;
        }
        else if (kind == "x")
        {

            tmpO.const_int = tmpO.const_int * CmpStack[i].ParaOpn.const_int;
        }
        else if (kind == "-")
        {

            tmpO.const_int = tmpO.const_int - CmpStack[i].ParaOpn.const_int;
        }
        else if (kind == "-/")
        {

            tmpO.const_int = CmpStack[i].ParaOpn.const_int - tmpO.const_int;
        }
        else if (kind == "/")
        {
            tmpO.const_int = tmpO.const_int / CmpStack[i].ParaOpn.const_int;
        }
        else if (kind == "//")
        {

            tmpO.const_int = CmpStack[i].ParaOpn.const_int / tmpO.const_int;
        }
        else if (kind == "%")
        {

            tmpO.const_int = tmpO.const_int % CmpStack[i].ParaOpn.const_int;
        }
        else if (kind == "%/")
        {

            tmpO.const_int = CmpStack[i].ParaOpn.const_int % tmpO.const_int;
        }
        else if (kind == "==")
        {

            tmpO.const_int = (int)(CmpStack[i].ParaOpn.const_int == tmpO.const_int);
        }
        else if (kind == "!=")
        {
            tmpO.const_int = (int)(CmpStack[i].ParaOpn.const_int != tmpO.const_int);
        }
        else if (kind == ">")
        {
            tmpO.const_int = (int)(tmpO.const_int > CmpStack[i].ParaOpn.const_int);
        }
        else if (kind == ">=")
        {
            tmpO.const_int = (int)(tmpO.const_int >= CmpStack[i].ParaOpn.const_int);
        }
        else if (kind == "<")
        {

            tmpO.const_int = (int)(tmpO.const_int < CmpStack[i].ParaOpn.const_int);
        }
        else if (kind == "<=")
        {

            tmpO.const_int = (int)(tmpO.const_int <= CmpStack[i].ParaOpn.const_int);
        }
    }

    // if (tmpO.type == 'i')
    // {

    //     if (tmpO.const_int == 0)
    //     {
    //         cout << " return false;" << tmpO.const_int << endl;
    //     }
    //     else
    //     {
    //         cout << " return true;" << tmpO.const_int << endl;
    //         // return true;
    //     }
    // }
    // else if (tmpO.type == 'f')
    // {
    //     if (tmpO.const_float == 0)
    //         return false;
    //     else
    //         return true;
    // }
    // else
    // {
    //     //printf("%d计算出错!\n", index);
    //     exit(1);
    // }
    return (bool)tmpO.const_int;
}
opn LoopStruct::runCal(opn inO)
{
    opn tmpO = inO;
    for (int i = 0; i < CalStack.size(); i++)
    {
        string kind = CalStack[i].calKind;
        if (CalStack[i].ParaOpn.type != tmpO.type)
        {
            // printf("%d出现强制转换！", index);
            exit(1);
        }
        if (kind == "+")
        {

            tmpO.const_int = tmpO.const_int + CalStack[i].ParaOpn.const_int;
        }
        else if (kind == "x")
        {

            tmpO.const_int = tmpO.const_int * CalStack[i].ParaOpn.const_int;
        }
        else if (kind == "-")
        {

            tmpO.const_int = tmpO.const_int - CalStack[i].ParaOpn.const_int;
        }
        else if (kind == "-/")
        {

            tmpO.const_int = CalStack[i].ParaOpn.const_int - tmpO.const_int;
        }
        else if (kind == "/")
        {
            tmpO.const_int = tmpO.const_int / CalStack[i].ParaOpn.const_int;
        }
        else if (kind == "//")
        {

            tmpO.const_int = CalStack[i].ParaOpn.const_int / tmpO.const_int;
        }
        else if (kind == "%")
        {

            tmpO.const_int = tmpO.const_int % CalStack[i].ParaOpn.const_int;
        }
        else if (kind == "%/")
        {

            tmpO.const_int = CalStack[i].ParaOpn.const_int % tmpO.const_int;
        }
        else if (kind == "==")
        {

            tmpO.const_int = (int)(CmpStack[i].ParaOpn.const_int == tmpO.const_int);
        }
        else if (kind == "!=")
        {
            tmpO.const_int = (int)(CmpStack[i].ParaOpn.const_int != tmpO.const_int);
        }
        else if (kind == ">")
        {
            tmpO.const_int = (int)(tmpO.const_int > CmpStack[i].ParaOpn.const_int);
        }
        else if (kind == ">=")
        {
            tmpO.const_int = (int)(tmpO.const_int >= CmpStack[i].ParaOpn.const_int);
        }
        else if (kind == "<")
        {

            tmpO.const_int = (int)(tmpO.const_int < CmpStack[i].ParaOpn.const_int);
        }
        else if (kind == "<=")
        {

            tmpO.const_int = (int)(tmpO.const_int <= CmpStack[i].ParaOpn.const_int);
        }
    }
    return tmpO;
}

//设定此循环的复制次数；返回是否可展开；
bool LoopStruct::setCopyTimes()
{
    //找CMP语句；
    codenode *begin = g_bbL.find(g_llS.now_func, index)->begin, *end = g_bbL.find(g_llS.now_func, index)->end, *cur = end;
    for (; cur != begin; cur = cur->prior)
    {
        if ((cur->op > IR_MOD && cur->op < IR_AND) || cur->op == IR_NOT)
        {
            CmpCode = cur;
            break;
        }
    }

    if (CmpCode == NULL)
    {
        SFlag = 1;
        return 0;
    }
    if ((CmpCode->op <= IR_MOD || CmpCode->op >= IR_AND) && CmpCode->op != IR_NOT)
    {
        SFlag = 1;
        // printf("%d内存在无效的条件判断！\n", index);
        return 0;
    }

    if (CmpCode->opn1.type == 'v' && CmpCode->opn2.type == 'v') //条件判断过于复杂；
    {
        SFlag = 1;
        // printf("%d条件判断不可常数化；\n", index);
        return 0;
    }
    codenode *nowa = CmpCode;
    while (nowa->op != IR_LABEL)
        nowa = nowa->next;
    // cout << "label_>next:" << nowa->opn1.id << endl;
    if (L2i(nowa->opn1.id.c_str()) != index + 1)
        SFlag = 1;
    //处理CMP语句；找循环依赖量；

    calProcedure tmpcp;
    switch (CmpCode->op)
    {
    case IR_JGE:
        tmpcp.calKind = ">=";
        break;
    case IR_JGT:
        tmpcp.calKind = ">";
        break;
    case IR_JLE:
        tmpcp.calKind = "<=";
        break;
    case IR_JLT:
        tmpcp.calKind = "<";
        break;
    case IR_EQ:
        tmpcp.calKind = "==";
        break;
    case IR_NEQ:
        tmpcp.calKind = "!=";
        break;
    case IR_NOT: //求非等于求
        tmpcp.calKind = "==";
        cur->result = cur->opn2;
        cur->opn2.type = cur->opn1.cal_type;
        cur->opn2.const_int = 0, cur->opn2.const_float = 0;
        break;
    default:
        break;
    }
    if (cur->opn1.type == 'v' && cur->opn2.type != 'v')
    {
        LoopVar = (cur->opn1.id);
        tmpcp.ParaOpn = cur->opn2;
    }
    else if (cur->opn2.type == 'v' && cur->opn1.type != 'v')
    {
        LoopVar = cur->opn2.id;
        tmpcp.ParaOpn = cur->opn1;
    }
    CmpStack.emplace(CmpStack.begin(), tmpcp);

    //处理CMP前的计算语句为栈结构以用于内存模拟执行；
    if (g_sL.find(LoopVar)->flag != 'H')
    {
        if (!rDFSCmp(&LoopVar, LoopVar, index)) //条件过于复杂，判定为复杂循环；
        {
            // printf("%d 内Cmp运算过于复杂  %s\n", index, LoopVar.c_str());
            return 0;
        }
    }
    if (g_sL.find(LoopVar)->flag != 'H')
    {
        // printf("%d内rDFSCmp出错！\n", index);
        exit(1);
    }

    //初值探找；
    int fixFlag = 0;
    for (auto itg = g_lvS.find(LoopVar)->genSite.begin(); itg != g_lvS.find(LoopVar)->genSite.end(); itg++)
    {
        if (BeginSite < itg->Site && EndSite > itg->Site)
            continue;
        else if (itg->Site < BeginSite || itg->Site > EndSite)
        {
            if (itg->codePr->op == IR_ASSIGN || itg->codePr->op == ARM_MOVcont)
            {
                if (fixFlag == 1 && !equalOpn(itg->codePr->opn2, initValue))
                {
                    // printf("%d 内init输入不唯一 %c %d,%d \n", index, initValue.type, initValue.const_int, itg->codePr->opn2.const_int);
                    return 0;
                }
                fixFlag = 1;
                initValue = itg->codePr->opn2;
            }
        }
    }
    if (initValue.type != 'i' && initValue.type != 'f') //无初值，认为循环进入过于复杂；
    {
        // printf("%d 内init过于复杂 %c %s \n", index, initValue.type, initValue.id.c_str());
        return 0;
    }

    //探查处理ACC语句，存为运算栈结构用于内存模拟执行；
    if (!rDFSCal(LoopVar, LoopVar, index)) //未找到自增数据流，认为循环控制过于复杂；
    {
        // printf("%d 内acc过于复杂 %s \n", index, LoopVar.c_str());
        return 0;
    }

    //内存模拟执行条件判断和变量“自增”，计算循环总次数；
    whileTimes = 0;
    opn tmpO = initValue;
    bool flag = runCmp(tmpO);
    while (flag) //循环条件不再能进入时，模拟终止；
    {
        // //printf("第 %d 次acc开始\n", whileTimes);
        int pval = tmpO.const_int;
        tmpO = runCal(tmpO);
        int nval = tmpO.const_int;
        flag = runCmp(tmpO);
        whileTimes++;
        // cout << "\t" << whileTimes;
        // if (fabs(nval - CmpStack[CalStack.size() - 1].ParaOpn.const_int) > fabs(pval - CmpStack[CalStack.size() - 1].ParaOpn.const_int))
        // {
        //     //printf("复杂循环或死循环！\n");
        //     return 0;
        // }
        // //printf("第 %d 次acc结束,当前值 %d\n", whileTimes, tmpO.const_int);
    }
    // //printf("ACC结束\n");

    //判断是否能完全展开去除条件判断；
    int tmpAns = log2(whileTimes);
    if ((float)tmpAns == log2(whileTimes))
        LinearFlag = 1;
    //设定合适的展开层数；
    if (whileTimes % 2 == 0 && whileTimes != 0) //当前版本实现偶数次循环展开一层；
    {
        int tmp = whileTimes;
        CopyTimes = 0;
        while (tmp % 2 == 0) //质因数分解式中含有二的最大幂数
        {
            tmp /= 2;
            CopyTimes++;
        }
        return 1;
    }

    return 0;
}

//预先维护变量对应；
void LoopStruct::setPNMap()
{
    string nLabel = newLabel();
    copyLabel = nLabel;
    //改原有代码中的变量信息；
    for (auto itu = g_lvS.find(BeginBlock)->useSite.begin(); itu != g_lvS.find(BeginBlock)->useSite.end();)
    {
        if (itu->Site > BeginSite && itu->Site < EndSite)
        {
            itu->opnPr->id = nLabel;
            g_lvS.insertu(itu->codePr, itu->opnPr, itu->Site); //维护到变量表；添加新的

            prSite tmp = *itu;
            itu++;
            g_lvS.find(BeginBlock)->useSite.erase(tmp); //维护到变量表；删除旧的
            continue;
        }
        itu++;
    }
    opn O;
    O.type = 'v', O.kind = 'L', O.id = BeginBlock;
    pre2newVN[nLabel] = O; //新标签对应为旧标签；

    //遍历所有的H型变量；
    for (auto itpr = g_bbL.find(g_sL.now_func, index)->alive_VB.begin(); itpr != g_bbL.find(g_sL.now_func, index)->alive_VB.end(); itpr++)
    {
        mksymt();
        g_sL.find(g_sL.last_sym)->flag = 'H';
        newHVar.emplace(g_sL.last_sym);                                   //维护新H变量表方便之后赋值折叠；
        string newHVar = g_sL.last_sym;                                   //维护新变量在ssa系统中的信息；
        g_sL.find(g_sL.last_sym)->alias = g_sL.find(itpr->second)->alias; //寄存器分配用；
        opn O;
        O = *g_lvS.find(itpr->second)->genSite.begin()->opnPr;
        int genHFlag = 0;
        for (auto itpru = g_lvS.find(itpr->second)->genSite.begin(); itpru != g_lvS.find(itpr->second)->genSite.end();) //改原有代码中的变量信息；
        {
            if (itpru->Site > BeginSite && itpru->Site < EndSite)
            {
                genHFlag = 1;
                itpru->opnPr->id = newHVar;
                g_lvS.insertg(itpru->codePr, itpru->opnPr, itpru->Site); //维护到变量表；添加新的

                prSite tmp;
                tmp = *itpru;
                itpru++;
                g_lvS.find(itpr->second)->genSite.erase(tmp); //维护到变量表；删除旧的
                continue;
            }
            itpru++;
        }
        pre2newVN[newHVar] = O; //新变量对应为旧变量；

        O = *g_lvS.find(itpr->second)->genSite.begin()->opnPr;
        if (genHFlag)
            O.id = newHVar;
        pre2newVN[itpr->second] = O; //旧变量对应为新变量；/或自映射；
    }
}

//复制代码生成新的展开后循环；
//变量处理；
void LoopStruct::mapVal(opn *inO, opn *outO, codenode *cur)
{
    if (inO->type != 'v')
        ;
    else if (inO->id == "fp")
    {
        *outO = *inO;
        pre2newVN[string("fp")] = *inO;
    }
    else if (inO->id == "r0")
    {
        *outO = *inO;
        pre2newVN[string("r0")] = *inO;
    }
    else if (inO->id == "s0")
    {
        *outO = *inO;
        pre2newVN[string("s0")] = *inO;
    }
    else if (inO->id == ".s32.f32" || inO->id == ".f32.s32")
    {
        *outO = *inO;
    }

    else if (pre2newVN.find(inO->id) != pre2newVN.end())
    {
        *outO = pre2newVN[inO->id];
        // if (outO->id == BeginBlock)
        // {
        //     g_lvS.insertu(C, outO, (EndSite + BeginSite) >> 1); //维护旧的
        // }
        // string preName = g_sL.find(inO->id)->alias;
        // if (g_bbL.find(g_sL.now_func, index)->alive_VB.find(preName) != g_bbL.find(g_sL.now_func, index)->alive_VB.end() && outO->id == g_bbL.find(g_sL.now_func, index)->alive_VB[preName])
        // {
        //     g_lvS.insertu(C, outO, (EndSite + BeginSite) >> 1); //维护旧的
        // }
    }
    else if (inO->kind == 'L')
    {
        // cout << this->index << "\t" << inO->id << "\t" << this->EndSite << "?<\t" << g_lvS.find(inO->id)->genSite.begin()->Site << endl;
        if (g_lvS.find(inO->id)->genSite.begin()->Site > this->EndSite || g_lvS.find(inO->id)->genSite.begin()->Site < this->BeginSite)
        {
            *outO = *inO;
            pre2newVN[inO->id] = *inO; //新块处理；块复制加信息映射
        }
        else
        {
            *outO = *inO;
            outO->id = newLabel();
            pre2newVN[inO->id] = *outO; //新块处理；块复制加信息映射
        }
    }
    else if (inO->kind == 'T')
    {
        *outO = *inO;
        mksymt(), outO->id = g_sL.last_sym;
        pre2newVN[inO->id] = *outO;
    }
    else if (inO->kind == 'H')
    {
        if (g_lvS.find(inO->id)->genSite.begin()->Site < this->BeginSite || g_lvS.find(inO->id)->genSite.begin()->Site > this->EndSite)
        {
            *outO = *inO;
            pre2newVN[inO->id] = *outO;
        }
        else
        {
            *outO = *inO;
            mksymt(), outO->id = g_sL.last_sym;

            newHVar.emplace(g_sL.last_sym);                         //维护新H变量表方便之后赋值折叠；
            g_sL.find(outO->id)->alias = g_sL.find(inO->id)->alias; //维护别名，方便寄存器分配；
            g_sL.find(outO->id)->flag = 'H';
            pre2newVN[inO->id] = *outO;
        }
    }
    else if (inO->kind == 'S')
    {
        if ((int)g_lvS.find(inO->id)->genSite.size() != 1)
        {
            // printf("S型变量 %s 多定值点\n", inO->id.c_str());
            return;
        }
        if (g_lvS.find(inO->id)->genSite.begin()->Site < BeginSite || g_lvS.find(inO->id)->genSite.begin()->Site > EndSite) //定值点在循环外，则自映射；
        {
            *outO = *inO;
            pre2newVN[inO->id] = *outO;
        }
        else
        {
            *outO = *inO;
            mksymt(), outO->id = g_sL.last_sym;
            g_sL.find(outO->id)->alias = g_sL.find(inO->id)->alias; //维护别名，方便寄存器分配；
            g_sL.find(outO->id)->flag = 'S';
            pre2newVN[inO->id] = *outO;
        }
    }
}
//代码复制；
void LoopStruct::LoopCopy()
{
    //设置新加代码段的段头语句；
    codenode *copyCode = mkIR(IR_LABEL), *oneIr, *begin, *cur, *eraBegin, *eraEnd;
    copyCode->opn1.type = 'v', copyCode->opn1.kind = 'L', copyCode->opn1.id = copyLabel;
    cur = CmpCode->next;
    g_lvS.insertg(copyCode, &copyCode->opn1, (BeginSite + EndSite) / 2);

    for (; cur->op != IR_GOTO_EQ; cur = cur->next)
    {
        //新建语句；复制构造；
        oneIr = new codenode;
        *oneIr = *cur;
        oneIr->next = oneIr->prior = oneIr;
        oneIr->cont = "";
        //设定新语句变量；
        mapVal(&cur->opn1, &oneIr->opn1, oneIr);
        mapVal(&cur->opn2, &oneIr->opn2, oneIr);
        mapVal(&cur->result, &oneIr->result, oneIr);
        int index = (BeginSite + EndSite) / 6;
        switch (oneIr->op)
        {
        case IR_ASSIGN:
        {
            //生成统计；
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->opn1, index * 3);
            }
            //调用统计；
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                // cout << "assign:" << oneIr->opn2.id << endl;
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            break;
        }
        case IR_ADD:
        case IR_MINUS:
        case IR_MUL:
        case IR_DIV:
        case IR_MOD:
        {
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);
            }
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }
            break;
        }
        case IR_JLT:
        case IR_JLE:
        case IR_JGT:
        case IR_JGE:
        case IR_EQ:
        case IR_NEQ:
        {
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }
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
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);
            }
            g_lvS.insertu(oneIr, &oneIr->result, index * 3 + 2);

            break;
        }
        case IR_GOTO_AND:
        case IR_GOTO_OR:
        {
            break;
        }
        case IR_EXP_ARROFF:
        {
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }

            break;
        }
        case IR_ARROFF_EXP:
        {
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->result, index * 3 + 2);
            }

            break;
        }
        case IR_ARROFF_EXPi:
        {
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->result, index * 3 + 2);
            }
            break;
        }
        case IR_EXP_ARROFFa:
        {
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->result, index * 3 + 2);
            }

            break;
        }
        case IR_ARROFF_EXPi0:
        {
            break;
        }
        case IR_VCVT:
        {
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->result, index * 3 + 2);
            }
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            break;
        }

        case IR_CALL:
        {
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }
            break;
        }
        case IR_NOT:
        {
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }
            break;
        }
        case IR_UMINUS:
        {
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }
            break;
        }
        case IR_LOAD:
        {
            //生成统计；

            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }
            //调用统计；
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);
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

            g_lvS.insertg(oneIr, &oneIr->opn1, index * 3);

            break;
        }
        case IR_GOTO:
        {
            g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);

            break;
        }
        case BLOCK:
        {
            break;
        }
        case IR_ARG:
        {
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->result, index * 3 + 2);
            }
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
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->opn1, index * 3);
            }
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            break;
        }
        default:
            break;
        }
        copyCode = merge(2, copyCode, oneIr);
    }

    if (g_bbL.find(g_sL.now_func, index + 1)->begin == NULL)
    {
        // printf("%d第一块为空\n", index);
        return;
    }
    begin = g_bbL.find(g_sL.now_func, index + 1)->begin->next, cur = begin;
    //遍历原有循环内代码，同时复制出对应新代码段；
    for (int index = (BeginSite + EndSite) / 6; !(cur->op == IR_LABEL && L2i(cur->opn1.id.c_str()) == this->index + 2); cur = cur->next)
    {
        //新建语句；复制构造；
        oneIr = new codenode;
        *oneIr = *cur;
        oneIr->next = oneIr->prior = oneIr;
        //设定新语句变量；
        mapVal(&cur->opn1, &oneIr->opn1, oneIr);
        mapVal(&cur->opn2, &oneIr->opn2, oneIr);
        mapVal(&cur->result, &oneIr->result, oneIr);
        //维护变量表中的信息；
        switch (oneIr->op)
        {
        case IR_ASSIGN:
        {
            //生成统计；
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->opn1, index * 3);
            }
            //调用统计；
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                // cout << "assign:" << oneIr->opn2.id << endl;
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            break;
        }
        case IR_ADD:
        case IR_MINUS:
        case IR_MUL:
        case IR_DIV:
        case IR_MOD:
        {
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);
            }
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }
            break;
        }
        case IR_JLT:
        case IR_JLE:
        case IR_JGT:
        case IR_JGE:
        case IR_EQ:
        case IR_NEQ:
        {
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }
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
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);
            }
            g_lvS.insertu(oneIr, &oneIr->result, index * 3 + 2);

            break;
        }
        case IR_GOTO_AND:
        case IR_GOTO_OR:
        {
            break;
        }
        case IR_EXP_ARROFF:
        {
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }

            break;
        }
        case IR_ARROFF_EXP:
        {
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->result, index * 3 + 2);
            }

            break;
        }
        case IR_ARROFF_EXPi:
        {
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->result, index * 3 + 2);
            }
            break;
        }
        case IR_EXP_ARROFFa:
        {
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->result, index * 3 + 2);
            }

            break;
        }
        case IR_ARROFF_EXPi0:
        {
            break;
        }
        case IR_VCVT:
        {
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->result, index * 3 + 2);
            }
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            break;
        }

        case IR_CALL:
        {
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }
            break;
        }
        case IR_NOT:
        {
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }
            break;
        }
        case IR_UMINUS:
        {
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }
            break;
        }
        case IR_LOAD:
        {
            //生成统计；

            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }
            //调用统计；
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);
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

            g_lvS.insertg(oneIr, &oneIr->opn1, index * 3);

            break;
        }
        case IR_GOTO:
        {
            g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);

            break;
        }
        case BLOCK:
        {
            break;
        }
        case IR_ARG:
        {
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->result, index * 3 + 2);
            }
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
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->opn1, index * 3);
            }
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            break;
        }
        default:
            break;
        }

        //语句连接；
        copyCode = merge(2, copyCode, oneIr);
        // cout << IR_op_strs[cur->op] << "\t" << L2i(cur->opn1.id.c_str()) << endl;
    }
    // putout_IR(copyCode, ".irloop");
    eraEnd = copyCode; //复制到最后一条的跳转语句为删除的首条；删除的尾条为复制新块的首条；
    //将全部新加代码合并到合适的位置；
    codenode *endNext = cur->next;
    split(out_IR, cur), merge(3, out_IR, copyCode, cur);
    if ((int)g_lvS.find(copyCode->opn1.id)->useSite.size() == 1)
    {
        eraBegin = g_lvS.find(copyCode->opn1.id)->useSite.begin()->codePr;
        // cout << IR_op_strs[eraBegin->op] << "\t" << eraBegin->opn1.id << "\n"
        //      << IR_op_strs[eraEnd->op] << "\t" << eraEnd->opn1.id << endl;
        eraBegin->op = IR_VOID, eraEnd->op = IR_VOID;
    }
}

void LoopStruct::SLoopCopy()
{
    opn O;
    O.type = 'v', O.kind = 'L', O.id = EndBlock;
    pre2newVN[EndBlock] = O;

    //设置新加代码段的段头语句；
    codenode *copyCode = mkIR(IR_LABEL), *oneIr, *begin, *cur, *eraBegin, *eraEnd;
    copyCode->opn1.type = 'v', copyCode->opn1.kind = 'L', copyCode->opn1.id = copyLabel;
    g_lvS.insertg(copyCode, &copyCode->opn1, (BeginSite + EndSite) / 2);

    begin = g_bbL.find(g_sL.now_func, this->index)->begin->next, cur = begin;
    //遍历原有循环内代码，同时复制出对应新代码段；
    for (int index = (BeginSite + EndSite) / 6; !(cur->op == IR_LABEL && L2i(cur->opn1.id.c_str()) == this->index + 2); cur = cur->next)
    {
        // cout << "目标：" << this->index + 2 << "op:" << IR_op_strs[L2i(cur->opn1.id.c_str())] << endl;
        // if (cur->op == IR_LABEL)
        //     cout << "当前: " << L2i(cur->opn1.id.c_str()) << endl;
        //新建语句；复制构造；
        oneIr = new codenode;
        *oneIr = *cur;
        oneIr->next = oneIr->prior = oneIr;
        //设定新语句变量；
        mapVal(&cur->opn1, &oneIr->opn1, oneIr);
        mapVal(&cur->opn2, &oneIr->opn2, oneIr);
        mapVal(&cur->result, &oneIr->result, oneIr);
        //维护变量表中的信息；
        switch (oneIr->op)
        {
        case IR_ASSIGN:
        {
            //生成统计；
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->opn1, index * 3);
            }
            //调用统计；
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                // cout << "assign:" << oneIr->opn2.id << endl;
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            break;
        }
        case IR_ADD:
        case IR_MINUS:
        case IR_MUL:
        case IR_DIV:
        case IR_MOD:
        {
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);
            }
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }
            break;
        }
        case IR_JLT:
        case IR_JLE:
        case IR_JGT:
        case IR_JGE:
        case IR_EQ:
        case IR_NEQ:
        {
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }
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
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);
            }
            g_lvS.insertu(oneIr, &oneIr->result, index * 3 + 2);

            break;
        }
        case IR_GOTO_AND:
        case IR_GOTO_OR:
        {
            break;
        }
        case IR_EXP_ARROFF:
        {
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }

            break;
        }
        case IR_ARROFF_EXP:
        {
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->result, index * 3 + 2);
            }

            break;
        }
        case IR_ARROFF_EXPi:
        {
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->result, index * 3 + 2);
            }
            break;
        }
        case IR_EXP_ARROFFa:
        {
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->result, index * 3 + 2);
            }

            break;
        }
        case IR_ARROFF_EXPi0:
        {
            break;
        }
        case IR_VCVT:
        {
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->result, index * 3 + 2);
            }
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            break;
        }

        case IR_CALL:
        {
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }
            break;
        }
        case IR_NOT:
        {
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }
            break;
        }
        case IR_UMINUS:
        {
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);
            }
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }
            break;
        }
        case IR_LOAD:
        {
            //生成统计；

            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->result, index * 3 + 2);
            }
            //调用统计；
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);
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

            g_lvS.insertg(oneIr, &oneIr->opn1, index * 3);

            break;
        }
        case IR_GOTO:
        {
            g_lvS.insertu(oneIr, &oneIr->opn1, index * 3);

            break;
        }
        case BLOCK:
        {
            break;
        }
        case IR_ARG:
        {
            if (oneIr->result.kind == 'H' || oneIr->result.kind == 'S' || oneIr->result.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->result, index * 3 + 2);
            }
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
            if (oneIr->opn1.kind == 'H' || oneIr->opn1.kind == 'S' || oneIr->opn1.kind == 'T')
            {
                g_lvS.insertg(oneIr, &oneIr->opn1, index * 3);
            }
            if (oneIr->opn2.kind == 'S' || oneIr->opn2.kind == 'H' || oneIr->opn2.kind == 'T')
            {
                g_lvS.insertu(oneIr, &oneIr->opn2, index * 3 + 1);
            }
            break;
        }
        default:
            break;
        }

        //语句连接；
        copyCode = merge(2, copyCode, oneIr);
        // cout << IR_op_strs[cur->op] << "\t" << L2i(cur->opn1.id.c_str()) << endl;
    }
    // putout_IR(copyCode, ".irloop");
    // codenode *newir = mkIR(IR_LABEL);
    // newir->opn1 = pre2newVN[EndBlock];
    // copyCode = merge(3, copyCode, newir);

    //将全部新加代码合并到合适的位置；
    codenode *endNext = cur->next;
    split(out_IR, cur), merge(3, out_IR, copyCode, cur);
}

//完全展开循环代码线性化；
void LoopStruct::LoopLinear()
{
    //删掉比较语句及之前的全部语句；
    codenode *erab = g_bbL.find(g_sL.now_func, index)->begin->next, *erae = CmpCode->next;
    split(out_IR, erab), split(erab, erae), out_IR = merge(3, out_IR, erae);

    //删除两条跳转语句；
    codenode *cur = erae->prior;
    while (cur->op != IR_GOTO_EQ)
        cur = cur->next;
    cur->op = IR_VOID;
    codenode *movb = cur->next, *move;
    while (cur->op != IR_GOTO)
        cur = cur->next;
    cur->op = IR_VOID;

    move = cur;
    if (move != movb)
        split(out_IR, movb), split(movb, move), out_IR = merge(3, out_IR, move);
    for (auto itu = g_lvS.find(BeginBlock)->useSite.begin(); itu != g_lvS.find(BeginBlock)->useSite.end(); itu++)
    {
        if (itu->Site < EndSite && itu->Site > BeginSite) //将循环内的所有出口语句前添加原条件块的phi语句；
        {
            // if (0)
            // {
            //     split(out_IR, itu->codePr);
            //     codenode *head = new codenode;
            //     *head = *movb;
            //     head->prior = head->next = head;
            //     for (cur = movb; cur != move->next; cur = cur->next)
            //     {
            //         codenode *one = new codenode;
            //         *one = *cur;
            //         one->prior = one->next = one;
            //         head = merge(2, head, one);
            //     }
            //     out_IR = merge(3, out_IR, head, itu->codePr);
            // }
            itu->opnPr->id = cur->opn1.id;
        }
    }
}

//以函数为单位遍历处理每个循环；
void funcLoopUnroll()
{
    //代码扫描；
    codenode *begin = g_sL.find(g_sL.now_func)->code_b, *end = g_sL.find(g_sL.now_func)->code_e, *cur = begin->next;
    for (int index = 0; cur != end; cur = cur->next, index++)
    {
        // cout << "扫描" << IR_op_strs[cur->op] << "\t" << cur->opn1.id << endl;

        switch (cur->op)
        {
        case IR_ASSIGN:
        {
            // cout << cur->opn1.id << cur->opn1.kind << endl;
            //生成统计；
            if (cur->opn1.kind == 'H' || cur->opn1.kind == 'S' || cur->opn1.kind == 'T')
            {
                g_lvS.insertg(cur, &cur->opn1, index * 3);
            }
            //调用统计；
            if (cur->opn2.kind == 'S' || cur->opn2.kind == 'H' || cur->opn2.kind == 'T')
            {
                // cout << "assign:" << cur->opn2.id << endl;
                g_lvS.insertu(cur, &cur->opn2, index * 3 + 1);
            }
            break;
        }
        case IR_ADD:
        case IR_MINUS:
        case IR_MUL:
        case IR_DIV:
        case IR_MOD:
        {
            if (cur->opn1.kind == 'H' || cur->opn1.kind == 'S' || cur->opn1.kind == 'T')
            {
                g_lvS.insertu(cur, &cur->opn1, index * 3);
            }
            if (cur->opn2.kind == 'S' || cur->opn2.kind == 'H' || cur->opn2.kind == 'T')
            {
                g_lvS.insertu(cur, &cur->opn2, index * 3 + 1);
            }
            if (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T')
            {
                g_lvS.insertg(cur, &cur->result, index * 3 + 2);
            }
            break;
        }
        case IR_JLT:
        case IR_JLE:
        case IR_JGT:
        case IR_JGE:
        case IR_EQ:
        case IR_NEQ:
        {
            if (cur->opn2.kind == 'S' || cur->opn2.kind == 'H' || cur->opn2.kind == 'T')
            {
                g_lvS.insertu(cur, &cur->opn2, index * 3 + 1);
            }
            if (cur->opn1.kind == 'H' || cur->opn1.kind == 'S' || cur->opn1.kind == 'T')
            {
                g_lvS.insertu(cur, &cur->opn1, index * 3);
            }
            if (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T')
            {
                g_lvS.insertg(cur, &cur->result, index * 3 + 2);
            }
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
            if (cur->opn1.kind == 'H' || cur->opn1.kind == 'S' || cur->opn1.kind == 'T')
            {
                g_lvS.insertu(cur, &cur->opn1, index * 3);
            }
            g_lvS.insertu(cur, &cur->result, index * 3 + 2);

            break;
        }
        case IR_GOTO_AND:
        case IR_GOTO_OR:
        {
            break;
        }
        case IR_EXP_ARROFF:
        {
            if (cur->opn2.kind == 'S' || cur->opn2.kind == 'H' || cur->opn2.kind == 'T')
            {
                g_lvS.insertu(cur, &cur->opn2, index * 3 + 1);
            }
            if (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T')
            {
                g_lvS.insertg(cur, &cur->result, index * 3 + 2);
            }

            break;
        }
        case IR_ARROFF_EXP:
        {
            if (cur->opn2.kind == 'S' || cur->opn2.kind == 'H' || cur->opn2.kind == 'T')
            {
                g_lvS.insertu(cur, &cur->opn2, index * 3 + 1);
            }
            if (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T')
            {
                g_lvS.insertu(cur, &cur->result, index * 3 + 2);
            }

            break;
        }
        case IR_ARROFF_EXPi:
        {
            if (cur->opn2.kind == 'S' || cur->opn2.kind == 'H' || cur->opn2.kind == 'T')
            {
                g_lvS.insertu(cur, &cur->opn2, index * 3 + 1);
            }
            if (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T')
            {
                g_lvS.insertu(cur, &cur->result, index * 3 + 2);
            }
            break;
        }
        case IR_EXP_ARROFFa:
        {
            if (cur->opn2.kind == 'S' || cur->opn2.kind == 'H' || cur->opn2.kind == 'T')
            {
                g_lvS.insertu(cur, &cur->opn2, index * 3 + 1);
            }
            if (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T')
            {
                g_lvS.insertu(cur, &cur->result, index * 3 + 2);
            }

            break;
        }
        case IR_ARROFF_EXPi0:
        {
            break;
        }
        case IR_VCVT:
        {
            if (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T')
            {
                g_lvS.insertu(cur, &cur->result, index * 3 + 2);
            }
            if (cur->opn2.kind == 'S' || cur->opn2.kind == 'H' || cur->opn2.kind == 'T')
            {
                g_lvS.insertg(cur, &cur->opn2, index * 3 + 1);
            }
            break;
        }

        case IR_CALL:
        {
            if (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T')
            {
                g_lvS.insertg(cur, &cur->result, index * 3 + 2);
            }
            break;
        }
        case IR_NOT:
        {
            if (cur->opn1.kind == 'H' || cur->opn1.kind == 'S' || cur->opn1.kind == 'T')
            {
                g_lvS.insertu(cur, &cur->opn1, index * 3);
            }
            if (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T')
            {
                g_lvS.insertg(cur, &cur->result, index * 3 + 2);
            }
            break;
        }
        case IR_UMINUS:
        {
            if (cur->opn1.kind == 'H' || cur->opn1.kind == 'S' || cur->opn1.kind == 'T')
            {
                g_lvS.insertu(cur, &cur->opn1, index * 3);
            }
            if (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T')
            {
                g_lvS.insertg(cur, &cur->result, index * 3 + 2);
            }
            break;
        }
        case IR_LOAD:
        {
            //生成统计；

            if (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T')
            {
                g_lvS.insertg(cur, &cur->result, index * 3 + 2);
            }
            //调用统计；
            if (cur->opn1.kind == 'H' || cur->opn1.kind == 'S' || cur->opn1.kind == 'T')
            {
                g_lvS.insertu(cur, &cur->opn1, index * 3);
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
            if (g_llS.find(L2i(cur->opn1.id.c_str())) != &nullLoopStruct)
                g_llS.find(L2i(cur->opn1.id.c_str()))->BeginSite = index * 3;

            if (g_llS.find(L2i(cur->opn1.id.c_str()) - 2) != &nullLoopStruct)
                g_llS.find(L2i(cur->opn1.id.c_str()) - 2)->EndSite = index * 3 + 2;
            g_lvS.insertg(cur, &cur->opn1, index * 3);

            break;
        }
        case IR_GOTO:
        {
            g_lvS.insertu(cur, &cur->opn1, index * 3);

            break;
        }
        case BLOCK:
        {
            break;
        }
        case IR_ARG:
        {
            if (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T')
            {
                g_lvS.insertu(cur, &cur->result, index * 3 + 2);
            }
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
            if (cur->opn1.kind == 'H' || cur->opn1.kind == 'S' || cur->opn1.kind == 'T')
            {
                g_lvS.insertg(cur, &cur->opn1, index * 3);
            }
            if (cur->opn2.kind == 'S' || cur->opn2.kind == 'H' || cur->opn2.kind == 'T')
            {
                g_lvS.insertu(cur, &cur->opn2, index * 3 + 1);
            }
            break;
        }
        default:
            break;
        }
    }
    // g_llS.Display();

    // //循环扫描处理；
    for (auto itl = g_llS.FList[g_llS.now_func].LCopeOrder.begin(); itl != g_llS.FList[g_llS.now_func].LCopeOrder.end(); itl++) //在处理队列中顺序处理，保证先展开内层循环再展开外层循环；
    {

        //根据顺序取出循环结构；
        LoopStruct *curL;
        curL = g_llS.find(itl->index);
        int qianTaoFlag = 1;
        //设定循环复制次数；如不为零进入展开;
        if (curL->setCopyTimes())
        {
            int times = 0;
            // //printf("展开%d次\n", curL->CopyTimes);
            while (curL->CopyTimes) //展开最多次数；
            {
                newHVar.clear(); //清除新H变量表；
                curL->pre2newVN.clear();
                curL->setPNMap(); //预处理上下文相关变量；
                curL->LoopCopy(); //循环复制展开；
                curL->CopyTimes--;
                //将单定值H变量替换成对等S变量，为之后的SSCP创造机会；
                // for (auto ith = newHVar.begin(); ith != newHVar.end(); ith++)
                // {
                //     if ((int)g_lvS.find(*ith)->genSite.size() == 1)
                //     {
                //         g_lvS.find(*ith)->genSite.begin()->opnPr->kind = 'S';
                //         g_sL.find(*ith)->flag = 'S';
                //         for (auto itu = g_lvS.find(*ith)->useSite.begin(); itu != g_lvS.find(*ith)->useSite.end(); itu++)
                //         {
                //             itu->opnPr->kind = 'S';
                //         }
                //     }
                // }
                if (times == 5)
                    break;
                times++;
                // cout << "第" << curL->CopyTimes << "次展开后：\n";
                //     // g_lvS.Display();
                //     // putout_IR(out_IR, ".irlur" + to_string(curL->CopyTimes));
            }
        }
        else if (!curL->SFlag) //复杂循环展开
        {
            curL->CopyTimes = 1;
            // cout << "index:" << curL->index << endl;

            if (g_bbL.find(g_sL.now_func, curL->index + 1)->begin == NULL)
            {
                // DisplayBBList();
                // printf("%d第一块为空\n", curL->index);
                break;
            }
            curL->pre2newVN.clear();
            curL->setPNMap();  //预处理上下文相关变量；
            curL->SLoopCopy(); //循环复制展开；
            curL->CopyTimes--;
        }
        putout_IR(out_IR, "irlur" + to_string(curL->index));
        // g_llS.Display();
        //完全展开的循环做线性化；
        // if (curL->LinearFlag)
        //     curL->LoopLinear();
    }
}

void LoopUnroll()
{
    // g_bbL.glo_list.clear();
    // BBInit(2);
    // DisplayBBList();
    g_llS.LoopsInit(); //全局循环初始化；
    for (auto itf = g_ssaS.Flist.begin(); itf != g_ssaS.Flist.end(); itf++)
    {
        g_llS.now_func = itf->first, g_sL.now_func = itf->first, g_lvS.now_func = itf->first; //设置当前函数名；

        no_tmp = g_sL.glo_ymT[itf->first].func_t == NULL ? 0 : g_sL.glo_ymT[itf->first].func_t->size(); //设置当前临时变量数；

        funcLoopUnroll();
    }
    // if (DeFlag)
    // {
    //     g_llS.Display();
    //     g_lvS.Display();
    // }
}