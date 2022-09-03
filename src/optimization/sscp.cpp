#include "../../include/optimization/sscp.h"
using namespace std;
struct CTStruct nullcfts;
struct GloCPStruct g_sscpS;
int runtimes;
map<string, set<SSAEdge>> SSAworkList;    //数据流工作薄；
map<int, unordered_set<int>> CFGworkList; //控制流工作薄；

map<int, unordered_set<int>> executedCEList; //已执行边表；
set<int> AvailableBBList;                    //可达块表；
unordered_set<int> DeadBBList;
unordered_set<string> constTList; //常数变量表；
unordered_set<string> DeadTList;  //被折叠变量表；

set<SSAEdge> nullssaedge;
// //支持函数；
class CTStruct *GloCPStruct::find(string varid)
{
    nullcfts.VarName = "voidCFT";

    if (FList.find(now_func) == FList.end())
    {
        // cout << now_func << "无此函数!" << endl;
        return &nullcfts;
    }

    else if (FList[now_func].CTList.find(varid) == FList[now_func].CTList.end())
    {
        // cout << now_func << ": " << varid << "无此变量!" << endl;
        return &nullcfts;
    }
    else
    {
        return &FList[now_func].CTList[varid];
    }
}

void GloCPStruct::reClear()
{
    for (auto itf = FList.begin(); itf != FList.end(); itf++)
    {
        for (auto itv = itf->second.CTList.begin(); itv != itf->second.CTList.end(); itv++)
        {
            itv->second.genSite.clear();
            itv->second.useSite.clear();
            itv->second.SLattice.status = top;
            itv->second.SLattice.intVal.clear();
            itv->second.SLattice.floatVal.clear();
            itv->second.VarName = "", itv->second.kind = '0';
            itv->second.type = '0', itv->second.cal_type = 'i';
        }
        itf->second.CTList.clear();
    }
    // FList.clear();
}

void GloCPStruct::Display()
{
    printf("--------------------GCPStruct--------------------\n");
    if (FList.size() > 0)
    { // auto效率比较低，但打印函数最终代码中不执行。
        for (auto it = FList.begin(); it != FList.end(); it++)
        {
            cout << it->first << "\n-------------------------------------\n";
            if (it->second.CTList.size() > 0)
            {
                for (auto it2 = it->second.CTList.begin(); it2 != it->second.CTList.end(); it2++)
                {
                    cout << it2->first << ": kind：" << it2->second.kind << "." << it2->second.cal_type << endl;
                    cout << "\tgenSite:\n";
                    for (auto itu = it2->second.genSite.begin(); itu != it2->second.genSite.end(); itu++)
                    {
                        cout << "\t\t" << IR_op_strs[(int)itu->codePr->op] << "\t" << itu->opnPr->id << endl;
                    }
                    cout << "\tuseSite:\n";
                    for (auto itu = it2->second.useSite.begin(); itu != it2->second.useSite.end(); itu++)
                    {
                        cout << "\t\t" << IR_op_strs[(int)itu->codePr->op] << "\t" << itu->opnPr->id << endl;
                    }
                    if (it2->second.SLattice.status == top)
                        cout << "\n\tSLattice: top\n";
                    else if (it2->second.SLattice.status == bottom)
                    {
                        cout << "\n\tSLattice: bottom";
                        if (it2->second.cal_type == 'i')
                        {
                            for (auto it3 = it2->second.SLattice.intVal.begin(); it3 != it2->second.SLattice.intVal.end(); it3++)
                                cout << "\n\tSLattice: value:"
                                     << *(it3) << endl;
                        }
                        else if (it2->second.cal_type == 'f')
                        {
                            for (auto it3 = it2->second.SLattice.floatVal.begin(); it3 != it2->second.SLattice.floatVal.end(); it3++)
                                cout << "\n\tSLattice: value:"
                                     << *(it3) << endl;
                        }
                    }
                    else if (it2->second.SLattice.status == value)
                    {
                        cout << "\n\tSLattice: value:";

                        if (it2->second.SLattice.intVal.size() > 0)
                        {
                            cout << *(it2->second.SLattice.intVal.begin()) << endl;
                        }
                        else if (it2->second.SLattice.floatVal.size() > 0)
                        {
                            cout << *(it2->second.SLattice.floatVal.begin()) << endl;
                        }
                    }
                    cout << "\n\n";
                }
            }
            cout << "\n-------------------------------------\n";
        }
    }

    printf("-----------------------------------------------\n");
}

int constCal(codenode *opcode, int a, int b)
{
    int ans = 0;

    switch (opcode->op)
    {
    case IR_ADD:
        ans = a + b;
        break;
    case IR_MINUS:
        ans = a - b;
        break;
    case IR_MUL:
        ans = a * b;
        break;
    case IR_DIV:
        ans = a / b;
        break;
    case IR_MOD:
        ans = a % b;
        break;
    case IR_JLT:
        ans = (int)(a < b);
        break;
    case IR_JLE:
        ans = (int)(a <= b);
        break;
    case IR_JGT:
        ans = (int)(a > b);
        break;
    case IR_JGE:
        ans = (int)(a >= b);
        break;
    case IR_EQ:
        ans = (int)(a == b);
        break;
    case IR_NEQ:
        ans = (int)(a != b);
        break;
    default:
        break;
    }
    return ans;
}
float constCal(codenode *opcode, float a, float b)
{
    float ans = 0;

    switch (opcode->op)
    {
    case IR_ADD:
        ans = a + b;
        break;
    case IR_MINUS:
        ans = a - b;
        break;
    case IR_MUL:
        ans = a * b;
        break;
    case IR_DIV:
        ans = a / b;
        break;
    case IR_MOD:
        ans = (float)((int)a % (int)b);
        break;
    case IR_JLT:
        ans = (int)(a < b);
        break;
    case IR_JLE:
        ans = (int)(a <= b);
        break;
    case IR_JGT:
        ans = (int)(a > b);
        break;
    case IR_JGE:
        ans = (int)(a >= b);
        break;
    case IR_EQ:
        ans = (int)(a == b);
        break;
    case IR_NEQ:
        ans = (int)(a != b);
        break;
    default:
        break;
    }

    return ans;
}

//将常量转化到CTStruct结构里，方便传播；
void SetCTStruct(class CTStruct &tmpS, struct opn &O)
{
    tmpS.VarName = "";
    tmpS.type = 'v', tmpS.kind = 'T', tmpS.SLattice.status = value;
    tmpS.cal_type = O.type;
    if (O.type == 'i')
        tmpS.SLattice.intVal.emplace(O.const_int);
    else if (O.type == 'f')
        tmpS.SLattice.floatVal.emplace(O.const_float);
}

void DFSBlockSSCPInit(int curB)
{
    string fid = g_sscpS.now_func;
    codenode *begin = g_sL.find(g_sscpS.now_func)->code_b, *end = g_sL.find(g_sscpS.now_func)->code_e, *cur = begin->next;
    if (begin == end)
        ;
    //代码扫描；

    for (; cur != end; cur = cur->next)
    {
        // cout << IR_op_strs[cur->op]
        //      << "\t" << cur->opn1.id << "\tflag:" << cur->opn1.kind

        //      << "\t" << cur->opn2.id << "\tflag:" << cur->opn2.type << "\t" << cur->opn2.kind

        //      << "\t" << cur->result.id << "\tflag:" << cur->result.type << "\t" << cur->result.kind << endl;

        switch (cur->op)
        {

        case IR_ASSIGN:
        {

            //生成统计；
            if (cur->opn1.kind == 'H')
            {
                g_sscpS.insCTStop(cur, &cur->opn1);
            }
            else if (cur->opn1.type == 'v' && (cur->opn1.kind == 'T' || cur->opn1.kind == 'S'))
            {
                if (cur->opn2.type == 'i' && cur->opn1.id != "r0")
                {
                    g_sscpS.insCTSval(cur, &cur->opn1, cur->opn2.const_int);
                    SSAworkList[cur->opn1.id] = nullssaedge;
                }
                else if (cur->opn2.type == 'f' && cur->opn1.id != "r0")
                {
                    g_sscpS.insCTSval(cur, &cur->opn1, cur->opn2.const_float);
                    SSAworkList[cur->opn1.id] = nullssaedge;
                }
                else if (cur->opn2.type == 'v' && cur->opn1.id != "r0")
                    g_sscpS.insCTStop(cur, &cur->opn1);
            }
            //调用统计；
            if (cur->opn2.type == 'v' && (cur->opn2.kind == 'T' || cur->opn2.kind == 'S' || cur->opn2.kind == 'H'))
            {
                g_sscpS.find(cur->opn2.id)->insUseSite(cur, &cur->opn2);
            }
            break;
        }
        case IR_ADD:
        case IR_MINUS:
        case IR_MUL:
        case IR_DIV:
        case IR_MOD:
        {
            if (cur->opn2.type == 'v')
                g_sscpS.find(cur->opn2.id)->insUseSite(cur, &cur->opn2);
            if (cur->opn1.type == 'v')
                g_sscpS.find(cur->opn1.id)->insUseSite(cur, &cur->opn1);
            g_sscpS.insCTStop(cur, &cur->result);
            break;
        }
        case IR_JLT:
        case IR_JLE:
        case IR_JGT:
        case IR_JGE:
        case IR_EQ:
        case IR_NEQ:
        {
            if (cur->opn2.type == 'v' && (cur->opn2.kind == 'T' || cur->opn2.kind == 'S'))
                g_sscpS.find(cur->opn2.id)->insUseSite(cur, &cur->opn2);
            if (cur->opn1.type == 'v')
                g_sscpS.find(cur->opn1.id)->insUseSite(cur, &cur->opn1);
            g_sscpS.insCTStop(cur, &cur->result);
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
            if (cur->opn1.type == 'v')
                g_sscpS.find(cur->opn1.id)->insUseSite(cur, &cur->opn1);
            break;
        }
        case IR_GOTO_AND:
        case IR_GOTO_OR:
        {
            break;
        }
        case IR_EXP_ARROFF:
        {
            if (cur->opn1.type == 'v' && cur->opn1.type == 'T')
                g_sscpS.find(cur->opn1.id)->insUseSite(cur, &cur->opn1);
            if (cur->opn2.type == 'v')
                g_sscpS.find(cur->opn2.id)->insUseSite(cur, &cur->opn2);
            g_sscpS.insCTSbottom(cur, &cur->result);
            SSAEdge tmpssaedge(cur->opn2.id, "x", cur);
            SSAworkList[cur->result.id].emplace(tmpssaedge);

            break;
        }
        case IR_ARROFF_EXP:
        {
            if (cur->opn1.type == 'v' && cur->opn1.type == 'T')
                g_sscpS.find(cur->opn1.id)->insUseSite(cur, &cur->opn1);
            if (cur->opn2.type == 'v')
                g_sscpS.find(cur->opn2.id)->insUseSite(cur, &cur->opn2);
            if (cur->result.type == 'v')
                g_sscpS.find(cur->result.id)->insUseSite(cur, &cur->result);

            break;
        }
        case IR_ARROFF_EXPi:
        {
            if (cur->opn1.type == 'v' && cur->opn1.type == 'T')
                g_sscpS.find(cur->opn1.id)->insUseSite(cur, &cur->opn1);
            if (cur->opn2.type == 'v')
                g_sscpS.find(cur->opn2.id)->insUseSite(cur, &cur->opn2);
            if (cur->result.type == 'v')
                g_sscpS.find(cur->result.id)->insUseSite(cur, &cur->result);
            break;
        }
        case IR_EXP_ARROFFa:
        {
            if (cur->opn2.type == 'v')
                g_sscpS.find(cur->opn2.id)->insUseSite(cur, &cur->opn2);
            if (cur->result.type == 'v')
                g_sscpS.find(cur->result.id)->insUseSite(cur, &cur->result);

            break;
        }
        case IR_ARROFF_EXPi0:
        {
            break;
        }
        case IR_VCVT:
        {
            if (cur->result.type == 'v')
                g_sscpS.find(cur->result.id)->insUseSite(cur, &cur->result);
            g_sscpS.insCTStop(cur, &cur->opn2);
            break;
        }

        case IR_CALL:
        {
            g_sscpS.insCTSbottom(cur, &cur->result);
            SSAEdge tmpe("", "x", cur);
            SSAworkList[cur->result.id].emplace(tmpe);
            break;
        }
        case IR_NOT:
        {
            if (cur->opn1.type == 'v')
                g_sscpS.find(cur->opn1.id)->insUseSite(cur, &cur->opn1);
            g_sscpS.insCTStop(cur, &cur->result);
            break;
        }
        case IR_UMINUS:
        {
            if (cur->opn1.type == 'v')
            {
                g_sscpS.find(cur->opn1.id)->insUseSite(cur, &cur->opn1);
            }
            g_sscpS.insCTStop(cur, &cur->result);
            break;
        }
        case IR_LOAD:
        {
            //生成统计；
            if (cur->opn1.kind == 'V')
                g_sscpS.insCTSbottom(cur, &cur->result);
            else if (cur->opn1.kind == 'S' || cur->opn1.kind == 'T' || cur->opn1.kind == 'H' || cur->opn1.kind == 'P')
                g_sscpS.insCTStop(cur, &cur->result);
            //调用统计；
            if (cur->opn1.kind == 'S' || cur->opn1.kind == 'T' || cur->opn1.kind == 'H')
                g_sscpS.find(cur->opn1.id)->insUseSite(cur, &cur->opn1);

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
            if (cur->result.type == 'v')
                g_sscpS.find(cur->result.id)->insUseSite(cur, &cur->result);
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
            if (cur->opn2.type != 'v')
            {
                if (cur->opn2.type == 'i')
                {
                    g_sscpS.insCTSval(cur, &cur->opn1, cur->opn2.const_int);
                    SSAworkList[cur->opn1.id] = nullssaedge;
                }
                else if (cur->opn2.type == 'f')
                {
                    g_sscpS.insCTSval(cur, &cur->opn1, cur->opn2.const_float);
                    SSAworkList[cur->opn1.id] = nullssaedge;
                }
            }
            if (cur->opn2.type == 'v')
            {
                g_sscpS.insCTStop(cur, &cur->opn1);
                if (g_sscpS.find(cur->opn2.id) == &nullcfts)
                {
                    struct CTStruct tmpS;
                    g_sscpS.FList[g_sscpS.now_func].CTList[cur->opn2.id] = (tmpS);
                }
                g_sscpS.find(cur->opn2.id)->insUseSite(cur, &cur->opn2);
            }
            break;
        }
        default:
            break;
        }
    }
}

// void AssignFold()
// {
//     //变量扫描；
//     // for (auto itv = g_sscpS.FList[g_sscpS.now_func].CTList.begin(); itv != g_sscpS.FList[g_sscpS.now_func].CTList.end();)
//     // {
//     //     if (itv->second.genSite.codePr->op == IR_ASSIGN && itv->second.genSite.codePr->opn2.type == 'v' && itv->second.genSite.codePr->opn1.kind != 'H' && a2i(itv->second.genSite.codePr->opn2.id) > -1 && itv->second.genSite.codePr->opn1.cal_type == itv->second.genSite.codePr->opn2.cal_type) //找到可折叠项；
//     //     {
//     //         // cout << "AssignFold:" << itv->first << endl;
//     //         // cout << "\t" << itv->second.genSite.codePr->opn2.id << "->" << itv->first << endl;
//     //         string tmpv = itv->first;
//     //         for (auto itu = itv->second.useSite.begin(); itu != itv->second.useSite.end(); itu++)
//     //         {
//     //             (*(itu)->opnPr) = itv->second.genSite.codePr->opn2;                                     //修改待删调用位置为定值变量；
//     //             g_sscpS.find(itv->second.genSite.codePr->opn2.id)->insUseSite(itu->codePr, itu->opnPr); //添加待删变量调用到定值变量调用；
//     //         }
//     //         prSite tmpp;
//     //         tmpp.codePr = itv->second.genSite.codePr, tmpp.opnPr = &itv->second.genSite.codePr->opn2;
//     //         g_sscpS.find(itv->second.genSite.codePr->opn2.id)->useSite.erase(tmpp); //删除定值变量调用索引；
//     //         codenode *genN = itv->second.genSite.codePr->next;
//     //         split(out_IR, itv->second.genSite.codePr), split(itv->second.genSite.codePr, genN), merge(2, out_IR, genN); //删除定值语句;
//     //         if (SSAworkList.find(itv->first) != SSAworkList.end())
//     //             SSAworkList.erase(itv->first);
//     //         string eraseVar = itv->first;
//     //         itv++;
//     //         // g_sscpS.FList[g_sscpS.now_func].CTList.erase(eraseVar);
//     //         continue;
//     //     }
//     //     else if (itv->second.genSite.codePr->op == IR_LOAD && itv->second.genSite.codePr->opn1.flage != 'E' && itv->second.genSite.codePr->opn1.address >= 0)
//     //     // && itv->second.genSite.codePr->opn1.kind != 'H'
//     //     {
//     //         // cout << "loadFold:\t" << itv->second.genSite.codePr->opn1.id << "->" << itv->first << endl;
//     //         string tmpv = itv->first;
//     //         for (auto itu = itv->second.useSite.begin(); itu != itv->second.useSite.end(); itu++)
//     //         {
//     //             (*(itu)->opnPr) = itv->second.genSite.codePr->opn1;                                     //修改待删调用位置为定值变量；
//     //             g_sscpS.find(itv->second.genSite.codePr->opn1.id)->insUseSite(itu->codePr, itu->opnPr); //添加待删变量调用到定值变量调用；
//     //         }
//     //         prSite tmpp;
//     //         tmpp.codePr = itv->second.genSite.codePr, tmpp.opnPr = &itv->second.genSite.codePr->opn1;
//     //         g_sscpS.find(itv->second.genSite.codePr->opn1.id)->useSite.erase(tmpp); //删除定值变量调用索引；
//     //         codenode *genN = itv->second.genSite.codePr->next;
//     //         split(out_IR, itv->second.genSite.codePr), split(itv->second.genSite.codePr, genN), merge(2, out_IR, genN); //删除定值语句;
//     //         if (SSAworkList.find(itv->first) != SSAworkList.end())
//     //             SSAworkList.erase(itv->first);
//     //         string eraseVar = itv->first;
//     //         itv++;
//     //         // g_sscpS.FList[g_sscpS.now_func].CTList.erase(eraseVar);
//     //         continue;
//     //     }
//     //     itv++;
//     // }
// }

// //指令合并，两条add变一条，两条mul变一条，两条sub变一条（被减数位），add+mul合成加乘；TODO
// void InstructionCombine()
// { //变量扫描；
//     for (auto itv = g_sscpS.FList[g_sscpS.now_func].CTList.begin(); itv != g_sscpS.FList[g_sscpS.now_func].CTList.end();)
//     {
//         itv++;
//     }
// }

void FuncSSCPropagation()
{
    g_sL.now_func = g_sscpS.now_func;
    string fid = g_sscpS.now_func;
    codenode *begin = g_sL.find(g_sL.now_func)->code_b, *end = g_sL.find(g_sL.now_func)->code_e;
    if (begin == end)
        ;

    //变量扫描；
    while (!SSAworkList.empty())
    {
        string curV = (SSAworkList.begin()->first);
        // cout << "对" << curV << "进行传播" << endl;
        SSAworkList.erase(curV);

        //代码扫描；
        for (auto itn = g_sscpS.find(curV)->useSite.begin(); itn != g_sscpS.find(curV)->useSite.end(); itn++)
        {
            codenode *curC = itn->codePr;
            switch (curC->op)
            {
            case IR_ASSIGN:
            {
                // cout << "\t通过assign传播至 " << curC->opn1.id << "\t" << curC->opn1.kind << endl;
                if ((curC->opn1.kind == 'S' || curC->opn1.kind == 'T') && curC->opn1.id != "r0")
                {

                    g_sscpS.find(curC->opn1.id)->varMeet(curC, g_sscpS.find(curC->opn2.id));
                    SSAEdge tmpe(curC->opn2.id, "=", curC);
                    SSAworkList[curC->opn1.id].emplace(tmpe);
                }

                break;
            }
            case IR_ADD:
            case IR_MINUS:
            case IR_MUL:
            case IR_DIV:
            case IR_MOD:
            {
                // cout << "\t通过add传播至 " << curC->result.id << endl;
                struct CTStruct tmpS;
                if (curC->opn2.type != 'v')
                {
                    SetCTStruct(tmpS, curC->opn2);
                    g_sscpS.find(curC->result.id)->varMeet(curC, g_sscpS.find(curC->opn1.id), &tmpS);
                }
                else if (curC->opn1.type != 'v')
                {
                    SetCTStruct(tmpS, curC->opn1);
                    g_sscpS.find(curC->result.id)->varMeet(curC, g_sscpS.find(curC->opn2.id), &tmpS);
                }
                else
                    g_sscpS.find(curC->result.id)->varMeet(curC, g_sscpS.find(curC->opn1.id), g_sscpS.find(curC->opn2.id));
                SSAEdge tmpe(curC->opn2.id, curC->opn1.id, "=", curC);
                SSAworkList[curC->result.id].emplace(tmpe);

                break;
            }
            case IR_JLT:
            case IR_JLE:
            case IR_JGT:
            case IR_JGE:
            case IR_EQ:
            case IR_NEQ:
            {
                struct CTStruct tmpS;
                if (curC->opn2.type != 'v')
                {
                    tmpS.VarName = "tmpConst";
                    tmpS.type = 'v', tmpS.kind = 'T', tmpS.SLattice.status = value;
                    tmpS.cal_type = curC->opn2.type;
                    if (curC->opn2.type == 'i')
                        tmpS.SLattice.intVal.emplace(curC->opn2.const_int);
                    else
                        tmpS.SLattice.floatVal.emplace(curC->opn2.const_float);
                    g_sscpS.find(curC->result.id)->varMeet(curC, g_sscpS.find(curC->opn1.id), &tmpS);
                    // cout << "neqOpn2:" << curC->opn2.id << "flag:" << curC->opn2.kind << endl;
                }
                else
                    g_sscpS.find(curC->result.id)->varMeet(curC, g_sscpS.find(curC->opn1.id), g_sscpS.find(curC->opn2.id));

                if (g_sscpS.find(curC->result.id)->SLattice.status == value)
                {

                    if (g_sscpS.find(curC->result.id)->cal_type == 'i')
                    {
                        if (*g_sscpS.find(curC->result.id)->SLattice.intVal.begin() == 0)
                        {
                            curC->op = ARM_CPSR_Z0;
                            if (curC->gotoTCode != NULL)
                                curC->gotoTCode->op = IR_VOID;
                            struct codenode *now = curC;
                            while (now->op != IR_GOTO_NEQ && now->op != IR_GOTO_EQ && now->op != IR_GOTO && now->op != IR_LABEL)
                            {
                                now = now->next;
                                // now->prior->op = IR_VOID;
                            }
                            if (now->op == IR_LABEL)
                            {
                                curC->op = ARM_CPSR_Z0;
                            }
                            else if (now->op == IR_GOTO_NEQ)
                            {
                                // cout << "goto:" << now->result.id << "\t" << now->result.type << endl;
                                now->op = IR_GOTO, now->opn1 = now->result;
                            }
                            else if (now->op == IR_GOTO_EQ)
                            {
                                now->op = IR_VOID, now->opn1 = now->result;
                            }
                        }

                        else if (*g_sscpS.find(curC->result.id)->SLattice.intVal.begin() != 0)
                        {
                            curC->op = ARM_CPSR_Z1;
                            //修改goto语句；
                            if (curC->gotoTCode != NULL)
                            {
                                curC->gotoTCode->op = IR_GOTO;
                                curC->gotoTCode->opn1 = curC->gotoTCode->result;
                                codenode *tmp = curC->gotoTCode->next;
                                while (tmp->op != IR_LABEL)
                                {
                                    tmp->op = IR_VOID;
                                    tmp = tmp->next;
                                }
                            }
                            struct codenode *now = curC;
                            while (now->op != IR_GOTO_NEQ && now->op != IR_GOTO_EQ && now->op != IR_GOTO && now->op != IR_LABEL)
                            {
                                now = now->next;
                                now->cont = "";
                            }
                            if (now->op == IR_LABEL)
                            {
                                curC->op = ARM_CPSR_Z1;
                            }
                            else if (now->op == IR_GOTO_NEQ)
                            {
                                now->op = IR_VOID, now->opn1 = now->result;
                            }
                            else if (now->op == IR_GOTO_EQ)
                            {
                                // cout << "goto:" << now->result.id << "\t" << now->result.type << endl;
                                now->op = IR_GOTO, now->opn1 = now->result;
                                codenode *tmp = now->next;
                                while (tmp->op != IR_LABEL)
                                {
                                    tmp->op = IR_VOID;
                                    tmp = tmp->next;
                                }
                            }
                        }
                    }
                    else if (g_sscpS.find(curC->result.id)->cal_type == 'f')
                    {
                        if (*g_sscpS.find(curC->result.id)->SLattice.floatVal.begin() == 0)
                        {
                            curC->op = ARM_CPSR_Z0;
                            if (curC->gotoTCode != NULL)
                                curC->gotoTCode->op = IR_VOID;
                            struct codenode *now = curC;
                            while (now->op != IR_GOTO_NEQ && now->op != IR_GOTO_EQ && now->op != IR_GOTO && now->op != IR_LABEL)
                            {
                                now = now->next;
                                // now->prior->op = IR_VOID;
                            }
                            if (now->op == IR_LABEL)
                            {
                                curC->op = ARM_CPSR_Z0;
                            }
                            else if (now->op == IR_GOTO_NEQ)
                            {
                                now->op = IR_GOTO, now->opn1 = now->result;
                            }
                            else if (now->op == IR_GOTO_EQ)
                            {
                                now->op = IR_VOID, now->opn1 = now->result;
                            }
                        }
                        else if (*g_sscpS.find(curC->result.id)->SLattice.floatVal.begin() != 0)
                        {
                            curC->op = ARM_CPSR_Z1;
                            if (curC->gotoTCode != NULL)
                            {
                                curC->gotoTCode->op = IR_GOTO;
                                curC->gotoTCode->opn1 = curC->gotoTCode->result;
                                codenode *tmp = curC->gotoTCode->next;
                                while (tmp->op != IR_LABEL)
                                {
                                    tmp->op = IR_VOID;
                                    tmp = tmp->next;
                                }
                            }
                            struct codenode *now = curC;
                            while (now->op != IR_GOTO_NEQ && now->op != IR_GOTO_EQ && now->op != IR_GOTO && now->op != IR_LABEL)
                            {
                                now = now->next;
                                now->cont = "";
                            }
                            if (now->op == IR_LABEL)
                            {
                                curC->op = ARM_CPSR_Z1;
                            }
                            else if (now->op == IR_GOTO_NEQ)
                            {
                                now->op = IR_VOID, now->opn1 = now->result;
                            }
                            else if (now->op == IR_GOTO_EQ)
                            {
                                // cout << "下降goto:" << now->result.id << "\t" << now->result.type << endl;
                                now->op = IR_GOTO, now->opn1 = now->result;
                                codenode *tmp = now->next;
                                while (tmp->op != IR_LABEL)
                                {
                                    tmp->op = IR_VOID;
                                    tmp = tmp->next;
                                }
                            }
                        }
                    }
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
            case IR_GOTO_NOT:
            case IR_GOTO_AND:
            case IR_GOTO_OR:
            {
                break;
            }
            case IR_GOTO_EQ:
            {
                // cout << curC->opn1.id << "\t" << curC->opn1.type << curC->opn2.id << "\t" << curC->opn2.type << endl;
                if (g_sscpS.find(curC->opn1.id)->SLattice.status == value && curC->prior->op != IR_LABEL)
                {
                    if (g_sscpS.find(curC->opn1.id)->cal_type == 'i')
                    {
                        if (*g_sscpS.find(curC->opn1.id)->SLattice.intVal.begin() == 1)
                        {
                            // cout << "当地goto:" << curC->result.id << "\t" << curC->result.type << endl;
                            curC->op = IR_GOTO, curC->opn1 = curC->result, curC->opn2 = curC->result;
                            // cout << curC->opn1.id << "\t" << curC->opn1.type << endl;
                            split(out_IR, curC), merge(3, out_IR, mkIR(ARM_CPSR_Z1), curC);
                        }
                        else
                        {
                            split(out_IR, curC), merge(3, out_IR, mkIR(ARM_CPSR_Z0), curC);
                            curC->op = IR_VOID;
                        }
                    }
                    else if (g_sscpS.find(curC->opn1.id)->cal_type == 'f')
                    {
                        if (*g_sscpS.find(curC->opn1.id)->SLattice.floatVal.begin() == 1)
                        {
                            // cout << "goto:" << curC->result.id << "\t" << curC->result.type << endl;

                            split(out_IR, curC), merge(3, out_IR, mkIR(ARM_CPSR_Z1), curC);
                            curC->op = IR_GOTO, curC->opn1 = curC->result;
                        }
                        else
                        {
                            split(out_IR, curC), merge(3, out_IR, mkIR(ARM_CPSR_Z0), curC);
                            curC->op = IR_VOID;
                        }
                    }
                }
                break;
                // else
                // {
                //     cout << "SSC运行出错，出现不同类常量相比！" << endl;
                // }
            }
            case IR_GOTO_NEQ:
            {
                break;
            }
            case IR_EXP_ARROFF:
            {
                break;
            }
            case IR_ARROFF_EXP:
            {
                break;
            }
            case IR_ARROFF_EXPi:
            {
                break;
            }
            case IR_EXP_ARROFFa:
            {
                break;
            }
            case IR_ARROFF_EXPi0:
            {
                break;
            }
            case IR_VCVT:
            {
                g_sscpS.find(curC->opn2.id)->varMeet(curC, g_sscpS.find(curC->result.id));
                if (curC->result.id != curC->opn2.id)
                {
                    SSAEdge tmpe(curC->result.id, "=", curC);
                    SSAworkList[curC->opn2.id].emplace(tmpe);
                }

                break;
            }
            case IR_CALL:
            {
                break;
            }
            case IR_NOT:
            {
                g_sscpS.find(curC->result.id)->varMeet(curC, g_sscpS.find(curC->opn1.id));
                SSAEdge tmpe(curC->opn1.id, "=", curC);
                SSAworkList[curC->result.id].emplace(tmpe);

                break;
            }
            case IR_UMINUS:
            {
                g_sscpS.find(curC->result.id)->varMeet(curC, g_sscpS.find(curC->opn1.id));

                SSAEdge tmpe(curC->opn1.id, "=", curC);
                SSAworkList[curC->result.id].emplace(tmpe);

                break;
            }
            case IR_LOAD:
            {
                // cout << "\t通过load传播至" << curC->result.id << endl;
                if (curC->result.kind == 'S' || curC->result.kind == 'T')
                {
                    g_sscpS.find(curC->result.id)->varMeet(curC, g_sscpS.find(curC->opn1.id));

                    SSAEdge tmpe(curC->opn1.id, "=", curC);
                    SSAworkList[curC->result.id].emplace(tmpe);
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
            {
                break;
            }
            case ARM_MOVEQ:
            case ARM_ITORG:
            case ARM_MOVcont:
            {
                if (curC->opn1.kind != 'H')
                {
                    g_sscpS.find(curC->opn1.id)->varMeet(curC, g_sscpS.find(curC->opn1.id));

                    SSAEdge tmpe(curC->opn2.id, "=", curC);
                    SSAworkList[curC->opn1.id].emplace(tmpe);
                }

                break;
            }
            default:
                break;
            }
        }
        //记录传播形成的临时变量；
        if (g_sscpS.find(curV)->SLattice.status == value)
        {
            constTList.emplace(curV);
        }
    }
}

void SSCPCodeDelete()
{
    if (!constTList.empty())
    {
        for (auto it = constTList.begin(); it != constTList.end(); it++)
        {
            string curV = *it;
            if (g_sscpS.find(curV)->useSite.size() > 0)
            {
                for (auto itu = g_sscpS.find(curV)->useSite.begin(); itu != g_sscpS.find(curV)->useSite.end(); itu++) //改指令；
                {
                    if (itu->codePr->op != IR_GOTO)
                    {
                        itu->opnPr->id = "", itu->opnPr->kind = '0';
                        if (g_sscpS.find(curV)->SLattice.intVal.size() > 0)
                        {
                            itu->opnPr->type = 'i';
                            itu->opnPr->const_int = *(g_sscpS.find(curV)->SLattice.intVal.begin());
                        }
                        else if (g_sscpS.find(curV)->SLattice.floatVal.size() > 0)
                        {
                            itu->opnPr->type = 'f';
                            itu->opnPr->const_float = *(g_sscpS.find(curV)->SLattice.floatVal.begin());
                        }
                    }
                }
            }
            //删除定值语句；
            for (auto itg = g_sscpS.find(curV)->genSite.begin(); itg != g_sscpS.find(curV)->genSite.end();)
            {
                codenode *C = itg->codePr, *Cnext = C->next;
                split(out_IR, C), split(C, Cnext), merge(2, out_IR, Cnext);
                prSite P = *itg;
                itg++;
                g_sscpS.find(curV)->genSite.erase(P);
            }
            g_sscpS.FList[g_sscpS.now_func].CTList.erase(curV);

            // g_sscpS.find(curV)->genSite.codePr = NULL;
        }
    }
}

void SSCPropagation()
{
    std::unordered_map<string, unordered_map<int, struct basic_block *>>::iterator it = g_bbL.glo_list.begin();

    if (g_bbL.glo_list.find(string("glo")) != g_bbL.glo_list.end())
    {
    }

    for (; it != g_bbL.glo_list.end(); it++) //遍历所有函数；
    {
        if (it->first != "glo")
        {
            SSAworkList.clear();
            constTList.clear();
            // cout << it->first << ":\n";
            g_sscpS.now_func = it->first;
            DFSBlockSSCPInit(0); // DFS所有的块并进行变量初始化；
                                 // DisplayGCPStruct();

            // if (DeFlag)
            //     g_sscpS.Display();
            // if (float_flag == 0)
            //     AssignFold();
            // DisplayGCPStruct();

            // cout << it->first << ":\n";
            FuncSSCPropagation(); // 以函数为单位运行SSCP传播；
            // g_sscpS.Display();

            SSCPCodeDelete(); //改指令与重写代码；

            // if (DeFlag)
            //     g_sscpS.Display();
        }
    }

    g_sscpS.now_func = "glo";
}

void SSConstantPropagation(int runTimes)
{
    runtimes = runTimes;

    // if (runTimes == 1)
    {
        SSCPropagation();
    }

    g_sscpS.reClear();
}
