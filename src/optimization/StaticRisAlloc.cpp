#include "../../include/optimization/StaticRisAlloc.h"
using namespace std;
int tmp_sp_phi = 0;
struct VStruct nullsra;
GloSRAStruct g_sraS;

//支持函数；
class VStruct *GloSRAStruct::find(string var)
{
    nullsra.VarName = "voidSRA";

    if (FList.find(now_func) == FList.end())
    {
        // cout << now_func << "无此函数!" << endl;
        return &nullsra;
    }
    else if (FList[now_func].VList.find(var) == FList[now_func].VList.end())
    {
        // cout << now_func << ": " << var << "无此变量!" << endl;
        return &nullsra;
    }
    else
    {
        return &FList[now_func].VList[var];
    }
}
class BStruct *GloSRAStruct::find(int BB)
{
    nullsra.VarName = "voidSRA";

    if (FList.find(now_func) == FList.end())
    {
        // cout << now_func << "无此函数!" << endl;
        return (BStruct *)&nullsra;
    }
    else if (FList[now_func].BList.find(BB) == FList[now_func].BList.end())
    {
        // cout << now_func << ": " << BB << "无此块!" << endl;
        return (BStruct *)&nullsra;
    }
    else
    {
        return &FList[now_func].BList[BB];
    }
}

void GloSRAStruct::insertg(struct codenode *C, struct opn *O, int index)
{
    if (find(O->id) == &nullsra)
    {
        struct VStruct tmpc;
        tmpc.VarName = O->id;
        tmpc.lastSite = 0, tmpc.lastUse = O;
        FList[now_func].VList[tmpc.VarName] = tmpc;
        FList[now_func].VList[tmpc.VarName].useSite.clear();
        FList[now_func].VList[tmpc.VarName].genSite.clear();
    }
    // cout << find(O->id)->VarName;
    if (find(C->localBB) == (BStruct *)&nullsra)
    {
        // cout << "添加新块" << endl;
        struct BStruct tmpc;
        tmpc.index = C->localBB;
        FList[now_func].BList[C->localBB] = tmpc;
        // FList[now_func].BList[C->localBB].gVNames.clear();
    }
    find(O->id)->insGenSite(C, O, index);
    // cout << "新块块号：" << find(C->localBB)->index << find(C->localBB)->gVNames.size() << endl;
    find(C->localBB)->gVNames.emplace(O->id);
}

void GloSRAStruct::insertu(struct codenode *C, struct opn *O, int index)
{
    if (find(O->id) == &nullsra)
    {
        struct VStruct tmpc;
        tmpc.VarName = O->id;
        tmpc.lastSite = 0, tmpc.lastUse = O;
        FList[now_func].VList[tmpc.VarName] = tmpc;
        FList[now_func].VList[tmpc.VarName].useSite.clear();
        FList[now_func].VList[tmpc.VarName].genSite.clear();
    }
    // cout << find(O->id)->VarName << find(O->id)->useSite.size() << endl;

    find(O->id)->insUseSite(C, O, index);
}

void GloSRAStruct::Display()
{
    printf("--------------------SRAStruct--------------------\n");
    if (FList.size() > 0)
    { // auto效率比较低，但打印函数最终代码中不执行。
        for (auto it = FList.begin(); it != FList.end(); it++)
        {
            g_sL.now_func = it->first;
            cout << it->first << "\n-------------------------------------\n";
            if (it->second.VList.size() > 0)
            {
                for (auto it2 = it->second.VList.begin(); it2 != it->second.VList.end(); it2++)
                {
                    cout << it2->first << ": ." << g_sL.find(it2->first)->flag << endl;
                    cout << "\tgenSite:\n";
                    for (auto itu = it2->second.genSite.begin(); itu != it2->second.genSite.end(); itu++)
                    {
                        cout << "\t\t" << IR_op_strs[(int)itu->codePr->op] << "\t" << itu->opnPr->id << "\t" << itu->localBB << "\t" << itu->Site << endl;
                    }
                    cout << "\tuseSite:\n";
                    for (auto itu = it2->second.useSite.begin(); itu != it2->second.useSite.end(); itu++)
                    {
                        cout << "\t\t" << IR_op_strs[(int)itu->codePr->op] << "\t" << itu->opnPr->id << "\t" << itu->localBB << "\t" << itu->Site << endl;
                    }
                    if (it2->second.lastcode != NULL && it2->second.lastUse != NULL)
                    {
                        cout << "last" << it2->second.lastSite << ":" << IR_op_strs[it2->second.lastcode->op] << "\t" << it2->second.lastUse->id << "块位置：" << it2->second.lastcode->localBB << endl;
                    }
                    cout << "\n\n";
                }
            }
            for (auto it2 = it->second.BList.begin(); it2 != it->second.BList.end(); it2++)
            {
                cout << it2->first << ": ." << endl;
                cout << "\tgVNames:\n";
                for (auto itu = it2->second.gVNames.begin(); itu != it2->second.gVNames.end(); itu++)
                {
                    cout << "\t\t" << *itu << "\t" << g_sL.find(*itu)->alias << "\t" << g_sL.find(*itu)->no_ris << "\t" << endl;
                }

                cout << "\n\n";
            }

            cout << "\n-------------------------------------\n";
        }
    }

    printf("-----------------------------------------------\n");
}

void add_ldrrS_IR(struct codenode *head, struct opn *O)
{
    struct codenode *newIr = mkIR(IR_LOAD);
    newIr->opn1 = *O;
    newIr->cont = head->cont;
    mksymt();
    newIr->result.type = 'v', newIr->result.kind = 'T';
    newIr->result.id = g_sL.last_sym;
    newIr->result.cal_type = O->cal_type;
    split(out_IR, head), out_IR = merge(3, out_IR, newIr, head);
    *O = newIr->result;
}
void add_strSr_IR(struct codenode *head, struct opn *O)
{
    struct codenode *newIr = mkIR(IR_ASSIGN);
    newIr->opn2 = *O;
    newIr->cont = head->cont;

    mksymt();
    newIr->opn1.type = 'v', newIr->opn1.kind = 'T';
    newIr->opn1.id = g_sL.last_sym;
    newIr->opn1.cal_type = O->cal_type;
    codenode *hn = head->next;
    split(out_IR, hn), out_IR = merge(3, out_IR, newIr, hn);
    *O = newIr->opn2;
}
void add_movrd_IR(struct codenode *head, struct opn *O)
{
    struct codenode *newIr = mkIR(IR_ASSIGN);
    newIr->opn2 = *O;
    newIr->cont = head->cont;
    if (newIr->cont != "")
        newIr->op = ARM_MOVcont;
    mksymt();
    newIr->opn1.type = 'v', newIr->opn1.kind = 'T';
    newIr->opn1.id = g_sL.last_sym;
    newIr->opn1.cal_type = O->cal_type;
    split(out_IR, head), out_IR = merge(3, out_IR, newIr, head);
    *O = newIr->opn1;
}
void add_movdr_IR(struct codenode *head, struct opn *O)
{

    // cout << IR_op_strs[head->op] << O->id << endl;

    struct codenode *newIr = mkIR(IR_ASSIGN);
    newIr->opn1 = *O;
    newIr->cont = head->cont;
    if (newIr->cont != "")
        newIr->op = ARM_MOVcont;
    mksymt();
    newIr->opn2.type = 'v', newIr->opn2.kind = 'T';
    newIr->opn2.id = g_sL.last_sym;
    newIr->opn2.cal_type = O->cal_type;
    struct codenode *hn = head->next;
    // cout << IR_op_strs[newIr->op] << "\t" << newIr->opn1.id << "\t" << newIr->opn2.id << endl;
    split(out_IR, hn), out_IR = merge(3, out_IR, newIr, hn);
    *O = newIr->opn2;
}

void add_load(struct codenode *head, struct opn *O)
{
    O->status = g_sL.find(O->id)->status;
    O->no_ris = g_sL.find(O->id)->no_ris;
    O->address = g_sL.find(O->id)->address;
    // cout << "load:" << O->id << "\t" << O->status << endl;

    if (g_sL.find(O->id)->status == 1)
    {
        add_ldrrS_IR(head, O);
    }
    else if (g_sL.find(O->id)->status == 2)
    {

        add_movrd_IR(head, O);
    }
}
void add_store(struct codenode *head, struct opn *O)
{
    O->status = g_sL.find(O->id)->status;
    O->no_ris = g_sL.find(O->id)->no_ris;
    O->address = g_sL.find(O->id)->address;

    if (g_sL.find(O->id)->status == 1)
    {
        add_strSr_IR(head, O);
    }
    else if (g_sL.find(O->id)->status == 2)
    {
        add_movdr_IR(head, O);
    }
}

void BStaticRisAlloc(int curB, unordered_map<string, int> *alloced_V, unordered_set<int> *UQB)
{
    // cout << curB << "\t" << endl;
    basic_block *B = g_bbL.find(g_sL.now_func, curB);
    // 深度优先树上递归；
    if (g_bbL.find(g_sL.now_func, curB)->next.size() > 0)
    {
        for (auto it = g_bbL.find(g_sL.now_func, curB)->next.begin(); it != g_bbL.find(g_sL.now_func, curB)->next.end(); it++)
        {
            if (UQB->find(it->first) == UQB->end())
            {
                UQB->emplace(it->first);
                BStaticRisAlloc(it->first, alloced_V, UQB);
            }
        }
    }
    // for (auto itv = alloced_V->begin(); itv != alloced_V->end();) //按照作用域释放寄存器；
    // {
    //     if (B->level == 1 && v_l2l(itv->first) > 3)
    //     {
    //         // cout << "变量名：" << itv->first << "块层数：" << B->level << endl;
    //         string tmpv = itv->first;
    //         g_sL.find(g_sL.now_func)->StackPool->emplace(itv->second);
    //         itv++;
    //         alloced_V->erase(tmpv);
    //         continue;
    //     }
    //     itv++;
    // }

    for (auto itv = g_sraS.find(curB)->gVNames.begin(); itv != g_sraS.find(curB)->gVNames.end(); itv++)
    {
        if (*itv != "" && alloced_V->find(g_sL.find(*itv)->alias) == alloced_V->end())
        {
            int tmp_ris;
            if (g_sL.find(g_sL.now_func)->StackPool->size() > 0)
            {
                tmp_ris = *g_sL.find(g_sL.now_func)->StackPool->begin();
                g_sL.find(g_sL.now_func)->StackPool->erase(tmp_ris);
                if (g_sL.find(g_sL.now_func)->DrMaxNum < tmp_ris)
                {
                    g_sL.find(g_sL.now_func)->DrMaxNum = tmp_ris;
                }
            }
            else if (g_sL.find(g_sL.now_func)->StackPool->size() == 0)
            {

                tmp_ris = tmp_sp_phi + 4 + 300;
                tmp_sp_phi += 4;
            }
            (*alloced_V)[g_sL.find(*itv)->alias] = tmp_ris;
        }
        int tmp_ris = alloced_V->find(g_sL.find(*itv)->alias)->second;
        if (tmp_ris < 290)
        {
            g_sL.find(*itv)->status = 2;
            g_sL.find(*itv)->no_ris = tmp_ris;
        }
        else
        {
            g_sL.find(*itv)->status = 1;
            g_sL.find(*itv)->no_ris = tmp_ris;
            g_sL.find(*itv)->address = tmp_ris - 300;
        }
    }
}

void FuncStaticRisAlloc()
{
    // cout << g_sL.now_func << ":" << endl;
    codenode *begin = g_sL.find(g_sL.now_func)->code_b, *end = g_sL.find(g_sL.now_func)->code_e, *cur = begin->next;
    // //扫一遍代码，维护gensite，usesite,方便重写代码；
    for (int index = 0; cur != end; cur = cur->next, index++)
    {
        switch (cur->op)
        {
        case IR_ASSIGN:
        {
            // cout << cur->opn1.id << "\tflag:" << cur->opn1.kind << endl;
            // cout << cur->opn1.id << cur->opn1.kind << endl;
            //生成统计；
            if (cur->opn1.kind == 'H' || cur->opn1.kind == 'S')
            {
                g_sraS.insertg(cur, &cur->opn1, index * 3);
            }
            //调用统计；
            if (cur->opn2.kind == 'S' || cur->opn2.kind == 'H')
            {
                // cout << "assign:" << cur->opn2.id << endl;
                g_sraS.insertu(cur, &cur->opn2, index * 3 + 1);
            }
            break;
        }
        case IR_ADD:
        case IR_MINUS:
        case IR_MUL:
        case IR_DIV:
        case IR_MOD:
        {
            if (cur->opn1.kind == 'H' || cur->opn1.kind == 'S')
            {
                g_sraS.insertu(cur, &cur->opn1, index * 3);
            }
            if (cur->opn2.kind == 'H' || cur->opn2.kind == 'S')
            {
                g_sraS.insertu(cur, &cur->opn2, index * 3 + 1);
            }
            if (cur->result.kind == 'H' || cur->result.kind == 'S')
            {
                g_sraS.insertg(cur, &cur->result, index * 3 + 2);
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
            if (cur->opn2.kind == 'H' || cur->opn2.kind == 'S')
            {
                g_sraS.insertu(cur, &cur->opn2, index * 3 + 1);
            }
            if (cur->opn1.kind == 'H' || cur->opn1.kind == 'S')
            {
                g_sraS.insertu(cur, &cur->opn1, index * 3);
            }
            if (cur->result.kind == 'H' || cur->result.kind == 'S')
            {
                g_sraS.insertg(cur, &cur->result, index * 3 + 2);
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
            if (cur->opn1.kind == 'H' || cur->opn1.kind == 'S')
            {
                g_sraS.insertu(cur, &cur->opn1, index * 3);
            }
            break;
        }
        case IR_GOTO_AND:
        case IR_GOTO_OR:
        {
            break;
        }
        case IR_EXP_ARROFF:
        {
            if (cur->opn2.kind == 'H' || cur->opn2.kind == 'S')
            {
                g_sraS.insertu(cur, &cur->opn2, index * 3 + 1);
            }
            if (cur->result.kind == 'H' || cur->result.kind == 'S')
            {
                g_sraS.insertg(cur, &cur->result, index * 3 + 2);
            }

            break;
        }
        case IR_ARROFF_EXP:
        {
            if (cur->opn2.kind == 'H' || cur->opn2.kind == 'S')
            {
                g_sraS.insertu(cur, &cur->opn2, index * 3 + 1);
            }
            if (cur->result.kind == 'H' || cur->result.kind == 'S')
            {
                g_sraS.insertu(cur, &cur->result, index * 3 + 2);
            }

            break;
        }
        case IR_ARROFF_EXPi:
        {
            if (cur->opn2.kind == 'H' || cur->opn2.kind == 'S')
            {
                g_sraS.insertu(cur, &cur->opn2, index * 3 + 1);
            }
            if (cur->result.kind == 'H' || cur->result.kind == 'S')
            {
                g_sraS.insertu(cur, &cur->result, index * 3 + 2);
            }
            break;
        }
        case IR_EXP_ARROFFa:
        {
            if (cur->opn2.kind == 'H' || cur->opn2.kind == 'S')
            {
                g_sraS.insertu(cur, &cur->opn2, index * 3 + 1);
            }
            if (cur->result.kind == 'H' || cur->result.kind == 'S')
            {
                g_sraS.insertu(cur, &cur->result, index * 3 + 2);
            }

            break;
        }
        case IR_ARROFF_EXPi0:
        {
            break;
        }
        case IR_VCVT:
        {
            if (cur->result.kind == 'H' || cur->result.kind == 'S')
            {
                g_sraS.insertu(cur, &cur->result, index * 3 + 2);
            }
            if (cur->opn2.kind == 'H' || cur->opn2.kind == 'S')
            {
                g_sraS.insertg(cur, &cur->opn2, index * 3 + 1);
            }
            break;
        }

        case IR_CALL:
        {
            if (cur->result.kind == 'H' || cur->result.kind == 'S')
            {
                g_sraS.insertg(cur, &cur->result, index * 3 + 2);
            }
            break;
        }
        case IR_NOT:
        {
            if (cur->opn1.kind == 'H' || cur->opn1.kind == 'S')
            {
                g_sraS.insertu(cur, &cur->opn1, index * 3);
            }
            if (cur->result.kind == 'H' || cur->result.kind == 'S')
            {
                g_sraS.insertg(cur, &cur->result, index * 3 + 2);
            }
            break;
        }
        case IR_UMINUS:
        {
            if (cur->opn1.kind == 'H' || cur->opn1.kind == 'S')
            {
                g_sraS.insertu(cur, &cur->opn1, index * 3);
            }
            if (cur->result.kind == 'H' || cur->result.kind == 'S')
            {
                g_sraS.insertg(cur, &cur->result, index * 3 + 2);
            }
            break;
        }
        case IR_LOAD:
        {
            //生成统计；

            if (cur->result.kind == 'H' || cur->result.kind == 'S')
            {
                g_sraS.insertg(cur, &cur->result, index * 3 + 2);
            }
            //调用统计；
            if (cur->opn1.kind == 'H' || cur->opn1.kind == 'S')
            {
                g_sraS.insertu(cur, &cur->opn1, index * 3);
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
            if (cur->result.kind == 'H' || cur->result.kind == 'S')
            {
                g_sraS.insertu(cur, &cur->result, index * 3 + 2);
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
            if (cur->opn1.kind == 'H' || cur->opn1.kind == 'S')
            {
                g_sraS.insertg(cur, &cur->opn1, index * 3);
            }
            if (cur->opn2.kind == 'H' || cur->opn2.kind == 'S')
            {
                g_sraS.insertu(cur, &cur->opn2, index * 3 + 1);
            }
            break;
        }
        default:
            break;
        }

        if (cur->opn1.kind == 'S' || cur->opn1.kind == 'H')
        {
            g_sraS.find(cur->opn1.id)->lastUse = g_sraS.find(cur->opn1.id)->lastSite < index * 3 ? &cur->opn1 : g_sraS.find(cur->opn1.id)->lastUse;
            g_sraS.find(cur->opn1.id)->lastcode = g_sraS.find(cur->opn1.id)->lastSite < index * 3 ? cur : g_sraS.find(cur->opn1.id)->lastcode;
            g_sraS.find(cur->opn1.id)->lastSite = g_sraS.find(cur->opn1.id)->lastSite < index * 3 ? index * 3 : g_sraS.find(cur->opn1.id)->lastSite;
        }
        if (cur->opn2.kind == 'S' || cur->opn2.kind == 'H')
        {
            g_sraS.find(cur->opn2.id)->lastUse = g_sraS.find(cur->opn2.id)->lastSite < index * 3 + 1 ? &cur->opn2 : g_sraS.find(cur->opn2.id)->lastUse;
            g_sraS.find(cur->opn2.id)->lastcode = g_sraS.find(cur->opn2.id)->lastSite < index * 3 + 1 ? cur : g_sraS.find(cur->opn2.id)->lastcode;
            g_sraS.find(cur->opn2.id)->lastSite = g_sraS.find(cur->opn2.id)->lastSite < index * 3 + 1 ? index * 3 + 1 : g_sraS.find(cur->opn2.id)->lastSite;
        }
        if (cur->result.kind == 'S' || cur->result.kind == 'H')
        {
            g_sraS.find(cur->result.id)->lastUse = g_sraS.find(cur->result.id)->lastSite < index * 3 + 2 ? &cur->result : g_sraS.find(cur->result.id)->lastUse;
            g_sraS.find(cur->result.id)->lastcode = g_sraS.find(cur->result.id)->lastSite < index * 3 + 2 ? cur : g_sraS.find(cur->result.id)->lastcode;
            g_sraS.find(cur->result.id)->lastSite = g_sraS.find(cur->result.id)->lastSite < index * 3 + 2 ? index * 3 + 2 : g_sraS.find(cur->result.id)->lastSite;
        }
    }

    // DisplaySRAStruct();
    //进行分配；
    unordered_map<string, int> alloced_V;
    unordered_set<int> UQB;
    UQB.emplace(0);
    BStaticRisAlloc(0, &alloced_V, &UQB);

    // 添加语句；
    for (auto itv = g_sraS.FList[g_sraS.now_func].VList.begin(); itv != g_sraS.FList[g_sraS.now_func].VList.end(); itv++)
    {
        for (auto site = itv->second.genSite.begin(); site != itv->second.genSite.end(); site++)
        {
            if (site->codePr->op != IR_ASSIGN && site->codePr->op != ARM_MOVcont && site->codePr->op != IR_LOAD)
                add_store(site->codePr, site->opnPr);
            // for (auto siteu = itv->second.useSite.begin(); siteu != itv->second.useSite.end();)
            // {
            //     prSite era;
            //     era.localBB = -2;
            //     if (siteu->localBB == site->localBB)
            //     {
            //         siteu->opnPr->id = g_sL.last_sym;
            //         siteu->opnPr->kind = 'T', siteu->opnPr->type = 'v';
            //         siteu->opnPr->status = 0;
            //         era = *siteu;
            //         siteu++;
            //         itv->second.useSite.erase(era);
            //         continue;
            //     }
            //     siteu++;
            // } // cout << itv->first << site->codePr << endl;
        }
        int lastBB = -1;
        for (auto site = itv->second.useSite.begin(); site != itv->second.useSite.end(); site++)
        {
            // if (site->localBB != lastBB) //每个块至多一个load语句；
            {
                // cout << "load:" << itv->first << site->codePr << endl;
                if (site->codePr->op != IR_ASSIGN && site->codePr->op != ARM_MOVcont && site->codePr->op != IR_LOAD)
                    add_load(site->codePr, site->opnPr);
                lastBB = site->localBB;
            }
            // else
            // {
            //     site->opnPr->id = g_sL.last_sym;
            //     site->opnPr->kind = 'T', site->opnPr->type = 'v';
            //     site->opnPr->status = 0;
            // }
        }
    }

    if (g_sL.find(g_sL.now_func)->DrMaxNum > 290)
        g_sL.find(g_sL.now_func)->DrMaxNum = 263;
    // cout << g_sL.now_func << ":" << g_sL.find(g_sL.now_func)->DrMaxNum << endl;
    // DisplaySRAStruct();
}

void StaticRisAlloc()
{
    g_bbL.glo_list.clear();
    BBInit(2);
    GenCFGTree();
    // DisplayBBList();
    findAlive();

    for (auto itf = g_ssaS.Flist.begin(); itf != g_ssaS.Flist.end(); itf++)
    {
        g_sraS.now_func = itf->first, g_sL.now_func = itf->first;
        //置栈空间指针为函数已有大小，用于分配过多的phi返回值；
        tmp_sp_phi = g_sL.find(g_sL.now_func)->size;
        //声明寄存器池；
        set<int> SRisPool = {222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263};
        if (!float_flag) //整型可以多些；
        {
            for (int i = 202; i < 222; i++)
                SRisPool.emplace(i);
        }
        g_sL.glo_ymT[g_sL.now_func].StackPool = new set<int>(SRisPool);
        //已分配的变量；
        no_tmp = g_sL.glo_ymT[itf->first].func_t == NULL ? 0 : g_sL.glo_ymT[itf->first].func_t->size();
        struct FStruct FL;
        g_sraS.FList[itf->first] = FL;
        FuncStaticRisAlloc();

        g_sL.find(g_sL.now_func)->size = tmp_sp_phi;
    }

    // if (DeFlag)
    //     g_sraS.Display();
    // DisplaySRAStruct();
}