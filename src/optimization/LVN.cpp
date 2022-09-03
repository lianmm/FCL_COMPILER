#include "../../include/optimization/LVN.h"
GLVN g_lvnH;         //公共子表达式hash表
GloSRAStruct g_lvnS; // LVN依赖的数据流形式图
const int limit = 15;
void FLVN::CodeScan()
{
    int lastb = 0;
    codenode *begin = g_sL.find(g_sL.now_func)->code_b, *end = g_sL.find(g_sL.now_func)->code_e, *cur = begin;
    BLVN tmpb;
    tmpb.index = 0, tmpb.BeginSite = 0;
    g_lvnH.FList[g_sL.now_func].BList[tmpb.index] = tmpb;
    int index = 0;
    index++;
    for (; cur != end; cur = cur->next, index++)
    {
        switch (cur->op)
        {
        case IR_ASSIGN:
        {
            // cout << cur->opn1.id << "\tflag:" << cur->opn1.kind << endl;
            // cout << cur->opn1.id << cur->opn1.kind << endl;
            //生成统计；
            if (cur->opn1.type == 'v' && (cur->opn1.kind == 'H' || cur->opn1.kind == 'S' || cur->opn1.kind == 'T'))
            {
                g_lvnS.insertg(cur, &cur->opn1, index);
            }
            //调用统计；
            if (cur->opn2.type == 'v' && (cur->opn2.kind == 'S' || cur->opn2.kind == 'T' || cur->opn2.kind == 'H'))
            {
                // cout << "assign:" << cur->opn2.id << endl;
                g_lvnS.insertu(cur, &cur->opn2, index);
            }
            break;
        }
        case IR_ADD:
        case IR_MINUS:
        case IR_MUL:
        case IR_DIV:
        case IR_MOD:
        {
            if (cur->opn1.type == 'v' && (cur->opn1.kind == 'H' || cur->opn1.kind == 'S' || cur->opn1.kind == 'T'))
            {
                g_lvnS.insertu(cur, &cur->opn1, index);
            }
            if (cur->opn2.type == 'v' && (cur->opn2.kind == 'H' || cur->opn2.kind == 'S' || cur->opn2.kind == 'T'))
            {
                g_lvnS.insertu(cur, &cur->opn2, index);
            }
            if (cur->result.type == 'v' && (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T'))
            {
                g_lvnS.insertg(cur, &cur->result, index);
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
            if (cur->opn2.type == 'v' && (cur->opn2.kind == 'H' || cur->opn2.kind == 'S' || cur->opn2.kind == 'T'))
            {
                g_lvnS.insertu(cur, &cur->opn2, index);
            }
            if (cur->opn1.type == 'v' && (cur->opn1.kind == 'H' || cur->opn1.kind == 'S' || cur->opn1.kind == 'T'))
            {
                g_lvnS.insertu(cur, &cur->opn1, index);
            }
            if (cur->result.type == 'v' && (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T'))
            {
                g_lvnS.insertg(cur, &cur->result, index);
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
            if (cur->opn1.type == 'v' && (cur->opn1.kind == 'H' || cur->opn1.kind == 'S' || cur->opn1.kind == 'T'))
            {
                g_lvnS.insertu(cur, &cur->opn1, index);
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
            if (cur->opn1.type == 'v' && (cur->opn1.kind == 'H' || cur->opn1.kind == 'S' || cur->opn1.kind == 'T'))
            {
                g_lvnS.insertu(cur, &cur->opn1, index);
            }
            if (cur->opn2.type == 'v' && (cur->opn2.kind == 'H' || cur->opn2.kind == 'S' || cur->opn2.kind == 'T'))
            {
                g_lvnS.insertu(cur, &cur->opn2, index);
            }
            if (cur->result.type == 'v' && (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T'))
            {
                g_lvnS.insertg(cur, &cur->result, index);
            }

            break;
        }
        case IR_ARROFF_EXP:
        {
            if (cur->opn1.type == 'v' && (cur->opn1.kind == 'H' || cur->opn1.kind == 'S' || cur->opn1.kind == 'T'))
            {
                g_lvnS.insertu(cur, &cur->opn1, index);
            }
            if (cur->opn2.type == 'v' && (cur->opn2.kind == 'H' || cur->opn2.kind == 'S' || cur->opn2.kind == 'T'))
            {
                g_lvnS.insertu(cur, &cur->opn2, index);
            }
            if (cur->result.type == 'v' && (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T'))
            {
                g_lvnS.insertu(cur, &cur->result, index);
            }

            break;
        }
        case IR_ARROFF_EXPi:
        {
            if (cur->opn2.type == 'v' && (cur->opn2.kind == 'H' || cur->opn2.kind == 'S' || cur->opn2.kind == 'T'))
            {
                g_lvnS.insertu(cur, &cur->opn2, index);
            }
            if (cur->result.type == 'v' && (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T'))
            {
                g_lvnS.insertu(cur, &cur->result, index);
            }
            break;
        }
        case IR_EXP_ARROFFa:
        {
            if (cur->opn2.type == 'v' && (cur->opn2.kind == 'H' || cur->opn2.kind == 'S' || cur->opn2.kind == 'T'))
            {
                g_lvnS.insertu(cur, &cur->opn2, index);
            }
            if (cur->result.type == 'v' && (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T'))
            {
                g_lvnS.insertg(cur, &cur->result, index);
            }

            break;
        }
        case IR_ARROFF_EXPi0:
        {
            break;
        }
        case IR_VCVT:
        {
            {
                if (cur->result.type == 'v' && (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T'))
                {
                    g_lvnS.insertu(cur, &cur->result, index);
                }
                if (cur->opn2.type == 'v' && (cur->opn2.kind == 'H' || cur->opn2.kind == 'S' || cur->opn2.kind == 'T'))
                {
                    g_lvnS.insertg(cur, &cur->opn2, index);
                }
            }

            break;
        }

        case IR_CALL:
        {
            if (cur->result.type == 'v' && (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T'))
            {
                g_lvnS.insertg(cur, &cur->result, index);
            }
            break;
        }
        case IR_NOT:
        {
            if (cur->opn1.type == 'v' && (cur->opn1.kind == 'H' || cur->opn1.kind == 'S' || cur->opn1.kind == 'T'))
            {
                g_lvnS.insertu(cur, &cur->opn1, index);
            }
            if (cur->result.type == 'v' && (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T'))
            {
                g_lvnS.insertg(cur, &cur->result, index);
            }
            break;
        }
        case IR_UMINUS:
        {
            if (cur->opn1.type == 'v' && (cur->opn1.kind == 'H' || cur->opn1.kind == 'S' || cur->opn1.kind == 'T'))
            {
                g_lvnS.insertu(cur, &cur->opn1, index);
            }
            if (cur->result.type == 'v' && (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T'))
            {
                g_lvnS.insertg(cur, &cur->result, index);
            }
            break;
        }
        case IR_LOAD:
        {
            //生成统计；

            if (cur->result.type == 'v' && (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T'))
            {
                g_lvnS.insertg(cur, &cur->result, index);
            }
            //调用统计；
            if (cur->opn1.type == 'v' && (cur->opn1.kind == 'H' || cur->opn1.kind == 'S' || cur->opn1.kind == 'T'))
            {
                g_lvnS.insertu(cur, &cur->opn1, index);
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
            //维护上块；
            g_lvnH.FList[g_sL.now_func].BList[lastb].EndSite = index - 1;
            //维护新块；
            BLVN tmpb;
            tmpb.index = L2i(cur->opn1.id.c_str());
            tmpb.BeginSite = index;
            lastb = tmpb.index;
            g_lvnH.FList[g_sL.now_func].BList[tmpb.index] = tmpb;

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
            if (cur->result.type == 'v' && (cur->result.kind == 'H' || cur->result.kind == 'S' || cur->result.kind == 'T'))
            {
                g_lvnS.insertu(cur, &cur->result, index);
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
            if (cur->opn1.type == 'v' && (cur->opn1.kind == 'H' || cur->opn1.kind == 'S' || cur->opn1.kind == 'T'))
            {
                g_lvnS.insertg(cur, &cur->opn1, index);
            }
            if (cur->opn2.type == 'v' && (cur->opn2.kind == 'H' || cur->opn2.kind == 'S' || cur->opn2.kind == 'T'))
            {
                g_lvnS.insertu(cur, &cur->opn2, index);
            }
            break;
        }
        default:
            break;
        }
    }
}

//改代码进行覆盖；
void UpdateCode(string toid, opn O, int curB, int index)
{

    if (g_sL.find(toid)->flag == 'T')
    {
        int flag = 1, begins = g_lvnH.FList[g_sL.now_func].BList[curB].BeginSite, ends = g_lvnH.FList[g_sL.now_func].BList[curB].EndSite;
        for (auto itu = g_lvnS.find(toid)->useSite.begin(); itu != g_lvnS.find(toid)->useSite.end(); itu++)
        {
            if (itu->Site < begins || itu->Site > ends)
            {
                flag = 0;
                break;
            }
        }
        if (flag)
        {
            //改调用；
            for (auto itu = g_lvnS.find(toid)->useSite.begin(); itu != g_lvnS.find(toid)->useSite.end(); itu++)
            {
                *itu->opnPr = O;
            }

            //删除定值语句；
            if (g_lvnS.find(toid)->genSite.size() > 0)
                g_lvnS.find(toid)->genSite.begin()->codePr->op = IR_VOID;
            else
            {
                printf("无定值语句的T变量：%s\n", toid.c_str());
                return;
            }
        }
    }
    else if (g_sL.find(toid)->flag == 'S')
    {
        int flag = 1, begins = g_lvnH.FList[g_sL.now_func].BList[curB].BeginSite, ends = g_lvnH.FList[g_sL.now_func].BList[curB].EndSite;
        for (auto itu = g_lvnS.find(toid)->useSite.begin(); itu != g_lvnS.find(toid)->useSite.end(); itu++)
        {
            if (itu->Site < begins || itu->Site > ends)
            {
                flag = 0;
                break;
            }
        }
        if (flag)
        {
            //改调用；
            for (auto itu = g_lvnS.find(toid)->useSite.begin(); itu != g_lvnS.find(toid)->useSite.end(); itu++)
            {
                *itu->opnPr = O;
            }
            //删除定值语句；
            if (g_lvnS.find(toid)->genSite.size() > 0)
                g_lvnS.find(toid)->genSite.begin()->codePr->op = IR_VOID;
            else
            {
                printf("无定值语句的T变量：%s\n", toid.c_str());
                return;
            }
        }
    }
}

//块内合并公共子表达式；
void BLVN::Block_LVN(int curB, unordered_set<int> *UQB)
{
    // cout << g_sL.now_func << g_lvnS.now_func << ":" << curB << endl;
    codenode *begin = g_bbL.find(g_sL.now_func, index)->begin, *cur = begin, *end = g_bbL.find(g_sL.now_func, index)->end;
    int local = g_lvnH.FList[g_sL.now_func].BList[curB].BeginSite;
    int callNo;
    for (; cur != end; cur = cur->next, local++)
    {
        string tmp = to_string(cur->op);
        switch (cur->op)
        {
        case IR_ASSIGN:
        {
            if (cur->opn2.type == 'i')
            {
                tmp += "i" + to_string(cur->opn2.const_int);
            }
            else if (cur->opn2.type == 'f')
            {
                tmp += "f" + to_string(cur->opn2.const_float);
            }
            else
                tmp += cur->opn2.id;
            if (cur->opn1.kind == 'V') //外部变量去除load状态；
            {
                string era1 = to_string(IR_ASSIGN) + cur->opn1.id;
                string era2 = to_string(IR_LOAD) + cur->opn1.id;
                if (Hash.find(era1) != Hash.end())
                    Hash.erase(era1);
                if (Hash.find(era2) != Hash.end())
                    Hash.erase(era2);
            }
            if (Hash.find(tmp) != Hash.end() && local - HashSite[tmp] < limit)
            {
                UpdateCode(cur->opn1.id, Hash[tmp], index, local);
            }
            else if (cur->opn2.type == 'v' && (cur->opn2.kind == 'T' || cur->opn2.kind == 'H' || cur->opn2.kind == 'S') && a2i(cur->opn2.id) != -1 && cur->opn2.cal_type == cur->opn1.cal_type) //赋值折叠；
            {
                UpdateCode(cur->opn1.id, cur->opn2, index, local);
            }
            else
            {
                HashSite[tmp] = local;
                Hash[tmp] = cur->opn1;
            }
            break;
        }
        case IR_ADD:
        case IR_MUL:
        {
            if (cur->opn1.type == 'i')
            {
                tmp += cur->opn2.id + "i" + to_string(cur->opn1.const_int);
            }
            else if (cur->opn1.type == 'f')
            {
                tmp += cur->opn2.id + "f" + to_string(cur->opn1.const_float);
            }
            else if (cur->opn2.type == 'i')
            {
                tmp += cur->opn1.id + "i" + to_string(cur->opn2.const_int);
            }
            else if (cur->opn2.type == 'f')
            {
                tmp += cur->opn1.id + "f" + to_string(cur->opn2.const_float);
            }
            else if (cur->opn1.id < cur->opn2.id)
            {
                tmp += cur->opn1.id + cur->opn2.id;
            }
            else if (cur->opn1.id > cur->opn2.id)
            {
                tmp += cur->opn2.id + cur->opn1.id;
            }
            if (Hash.find(tmp) != Hash.end() && local - HashSite[tmp] < limit)
            {
                UpdateCode(cur->result.id, Hash[tmp], index, local);
            }
            else
            {
                HashSite[tmp] = local;
                Hash[tmp] = cur->result;
            }
            break;
        }
        case IR_MINUS:
        case IR_DIV:
        case IR_MOD:
        {
            if (cur->opn1.type == 'i')
            {
                tmp += "i" + to_string(cur->opn1.const_int) + cur->opn2.id;
            }
            else if (cur->opn1.type == 'f')
            {
                tmp += "f" + to_string(cur->opn1.const_float) + cur->opn2.id;
            }
            else if (cur->opn2.type == 'i')
            {
                tmp += cur->opn1.id + "i" + to_string(cur->opn2.const_int);
            }
            else if (cur->opn2.type == 'f')
            {
                tmp += cur->opn1.id + "f" + to_string(cur->opn2.const_float);
            }
            else
            {
                tmp += cur->opn1.id + cur->opn2.id;
            }
            if (Hash.find(tmp) != Hash.end() && local - HashSite[tmp] < limit)
            {
                UpdateCode(cur->result.id, Hash[tmp], index, local);
            }
            else
            {
                HashSite[tmp] = local;
                Hash[tmp] = cur->result;
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
            break;
        }
        case IR_GOTO_AND:
        case IR_GOTO_OR:
        {
            break;
        }
        case IR_EXP_ARROFF:
        {
            if (cur->opn2.type == 'i')
            {
                tmp += cur->opn1.id + "i" + to_string(cur->opn2.const_int);
            }
            else
                tmp += cur->opn1.id + cur->opn2.id;
            if (Hash.find(tmp) != Hash.end() && local - HashSite[tmp] < limit)
            {
                UpdateCode(cur->result.id, Hash[tmp], index, local);
            }
            else
            {
                HashSite[tmp] = local;
                Hash[tmp] = cur->result;
            }
            break;
        }
        case IR_ARROFF_EXP:
        {
            string tmp2;
            if (cur->opn2.type == 'i')
            {
                tmp2 = cur->opn1.id + "i" + to_string(cur->opn2.const_int);
            }
            else
                tmp2 = cur->opn1.id + cur->opn2.id;
            tmp += tmp2;
            string tmp3 = to_string((int)IR_EXP_ARROFF) + tmp2;
            if (Hash.find(tmp3) != Hash.end())
            {
                Hash.erase(tmp3);
            }
            break;
        }
        case IR_ARROFF_EXPi:
        {
            break;
        }
        case IR_EXP_ARROFFa:
        {
            if (cur->opn2.type == 'i')
            {
                tmp += cur->opn1.id + "i" + to_string(cur->opn2.const_int);
            }
            else
                tmp += cur->opn1.id + cur->opn2.id;
            if (Hash.find(tmp) != Hash.end() && local - HashSite[tmp] < limit)
            {
                UpdateCode(cur->result.id, Hash[tmp], index, local);
            }
            else
            {
                HashSite[tmp] = local;
                Hash[tmp] = cur->result;
            }
            break;
        }
        case IR_ARROFF_EXPi0:
        {
            break;
        }
        case IR_VCVT:
        {
            tmp += cur->result.id;

            if (Hash.find(tmp) != Hash.end() && local - HashSite[tmp] < limit)
            {
                UpdateCode(cur->opn2.id, Hash[tmp], index, local);
            }
            else
            {
                HashSite[tmp] = local;
                Hash[tmp] = cur->opn2;
            }
            break;
        }

        case IR_CALL:
        {
            tmp += cur->opn1.id + to_string(callNo);

            // if (Hash.find(tmp) != Hash.end()&&local-HashSite[tmp]<20 )
            // {
            //     UpdateCode(cur->result.id, Hash[tmp],index);
            // }
            // else
            // HashSite[tmp] = local;
            // Hash[tmp] = cur->result;
            break;
        }
        case IR_NOT:
        {
            tmp += cur->opn1.id;
            if (Hash.find(tmp) != Hash.end() && local - HashSite[tmp] < limit)
            {
                UpdateCode(cur->result.id, Hash[tmp], index, local);
            }
            else
            {
                HashSite[tmp] = local;
                Hash[tmp] = cur->result;
            }
            break;
        }
        case IR_UMINUS:
        {
            tmp += cur->opn1.id;
            if (Hash.find(tmp) != Hash.end() && local - HashSite[tmp] < limit)
            {
                UpdateCode(cur->result.id, Hash[tmp], index, local);
            }
            else
            {
                HashSite[tmp] = local;
                Hash[tmp] = cur->result;
            }
            break;
        }
        case IR_LOAD:
        {
            tmp += cur->opn1.id;
            if (Hash.find(tmp) != Hash.end() && local - HashSite[tmp] < limit)
            {
                UpdateCode(cur->result.id, Hash[tmp], index, local);
            }
            // else if (cur->opn2.type == 'v' && cur->opn1.type == 'v' && (cur->opn1.kind == 'T' || cur->opn1.kind == 'S') && a2i(cur->opn1.id) != -1) //赋值折叠；
            // {
            //     UpdateCode(cur->result.id, cur->opn1, index);
            // }
            else
            {
                HashSite[tmp] = local;
                Hash[tmp] = cur->result;
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
        case ARM_MOVEQ:
        case ARM_MOVcont:
        {

            break;
        }
        default:
            break;
        }

        // cout << "当前语句str: " << tmp << "\t" << IR_op_strs[cur->op] << "\t" << cur->opn1.id << "\t" << cur->opn2.id << "\t" << cur->result.id << "\t" << endl;
        // for (auto it = Hash.begin(); it != Hash.end(); it++)
        // {
        //     cout << it->first << " -> " << it->second.id << "\t";
        // }
        // cout << "\n\n";
    }

    if (g_bbL.find(g_sL.now_func, curB)->next.size() > 0)
    {
        for (auto it = g_bbL.find(g_sL.now_func, curB)->next.begin(); it != g_bbL.find(g_sL.now_func, curB)->next.end(); it++)
        {
            if (UQB->find(it->first) == UQB->end())
            {
                UQB->emplace(it->first);
                g_lvnH.FList[g_sL.now_func].BList[it->first].Block_LVN(it->first, UQB);
            }
        }
    }
}

void FLVN::Func_LVN()
{
    BLVN tmpb;
    unordered_set<int> UQB;
    g_lvnS.now_func = fid;
    g_sL.now_func = fid;
    BList[0].Block_LVN(0, &UQB);
}

void GLVN::Glo_LVN()
{
    //块相关结构初始化；
    g_bbL.glo_list.clear();
    BBInit(2);
    // GenCFGTree();
    if (DeFlag)
        DisplayBBList();

    for (auto itf = g_ssaS.Flist.begin(); itf != g_ssaS.Flist.end(); itf++)
    {
        // LVN初始化；
        FLVN tmpfn;
        tmpfn.fid = itf->first;
        g_lvnH.FList[itf->first] = tmpfn;
        FStruct tmpfv;

        g_lvnS.FList[itf->first] = tmpfv;
        g_lvnS.now_func = itf->first;
        g_sL.now_func = itf->first;

        //代码扫描统计形成ssa形式图；方便后期修改代码；
        g_lvnH.FList[itf->first].CodeScan();
        if (DeFlag)
            g_lvnS.Display();
        // 运行lvn并简化代码；
        g_lvnS.now_func = itf->first;
        g_sL.now_func = itf->first;

        g_lvnH.FList[itf->first].Func_LVN();
    }
}
