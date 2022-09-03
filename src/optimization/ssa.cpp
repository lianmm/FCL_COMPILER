#include "../../include/optimization/ssa.h"
using namespace std;

struct SSAvar nullvar;
struct SSARisA nullRA;
struct SSAstruct g_ssaS;
struct SSAvar *SSAstruct::find(string funcid, string varid)
{
    nullvar.alive_B.clear();

    if (Flist.find(funcid) == Flist.end())
    {
        // cout << funcid << "无此函数!" << endl;
        return &nullvar;
    }
    else if (Flist[funcid].Vlist.find(varid) == Flist[funcid].Vlist.end())
    {
        // cout << varid << "无此变量!" << endl;
        return &nullvar;
    }
    else
    {
        return &Flist[funcid].Vlist[varid];
    }
}

inline string o2v_l(struct opn *O)
{
    return O->id + "_" + to_string(O->decl_level);
}
inline string v_l2v(string rename)
{
    char tmp[35];
    for (int i = 0; 1; i++)
    {
        if (rename[i] != '_')
            tmp[i] = rename[i];
        else
        {
            tmp[i] = '\0';
            break;
        }
    }
    return string(tmp);
}
int v_l2l(string rename)
{
    char tmp[35];
    int j = 0;
    bool f = 0;
    for (int i = 0; i < rename.size(); i++)
    {
        if (f == 1)
        {
            tmp[j] = rename[i];
            j++;
        }
        if (rename[i] == '_')
            f = 1;
    }
    return atoi(tmp);
}

void DisplaySSAstruct()
{
    printf("--------------------SSAstruct--------------------\n");
    if (g_ssaS.Flist.size() > 0)
    { // auto效率比较低，但打印函数最终代码中不执行。
        for (auto it = g_ssaS.Flist.begin(); it != g_ssaS.Flist.end(); it++)
        {
            cout << it->first << "\n-------------------------------------\n";
            if (it->second.Vlist.size() > 0)
            {
                for (auto it2 = it->second.Vlist.begin(); it2 != it->second.Vlist.end(); it2++)
                {
                    cout << it2->first << ":\n";
                    if (it2->second.alive_B.size() > 0)
                    {
                        cout << "\n\talive_B:";
                        for (auto it3 = it2->second.alive_B.begin(); it3 != it2->second.alive_B.end(); it3++)
                        {
                            cout << "\t" << *it3;
                        }
                    }
                    if (it2->second.varSSA.size() > 0)
                    {
                        cout << "\n\tvarSSA.top:";

                        cout << "\t" << it2->second.varSSA.top();
                    }
                    if (it2->second.hvar2NName.size() > 0)
                    {
                        cout << "\n\thvar2NName:\n";
                        for (int i = 0; i < it2->second.hvar2NName.size(); i++)
                        {
                            cout << "\t\t" << it2->second.hvar2NName[i].index << it2->first << "->" << it2->second.hvar2NName[i].Hname << "\tflag: " << it2->second.hvar2NName[i].flag << "\tB:" << it2->second.hvar2NName[i].bindex << endl;
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
void AliveVUnoin(unordered_map<string, string> &a, unordered_map<string, string> &b)
{
    for (auto it = b.begin(); it != b.end(); it++)
    {
        if (a.find(it->first) == a.end())
        {
            a[it->first] = it->second;
        }
    }
}
void CAliveVUnoin(unordered_map<string, string> &a, unordered_map<string, string> &b) //复制求并
{
    for (auto it = b.begin(); it != b.end(); it++)
    {
        a[it->first] = it->second;
    }
}

// 1.维护活跃变量和活跃块的对应；
void findAlive()
{
    std::unordered_map<string, unordered_map<int, struct basic_block *>>::iterator it = g_bbL.glo_list.begin();

    for (; it != g_bbL.glo_list.end(); it++) //遍历所有函数；
    {
        if (it->first != "glo")
        { // printf("\t%s", it->first.c_str());
            string fid = it->first;
            struct Funcstruct nullFSSAs;
            g_ssaS.Flist[it->first] = nullFSSAs;
            int curB = 0;
            while (1) //对于每一个块；
            {
                g_bbL.find(fid, curB)->begin->localBB = curB;

                codenode *begin = g_bbL.find(fid, curB)->begin, *end = g_bbL.find(fid, curB)->end, *cur = begin;
                if (begin == end)
                {
                }
                else
                {
                    if (begin->op == IR_ASSIGN && begin->opn1.type == 'v' && begin->opn1.kind == 'V' && cur->opn1.flage != 'E')
                    {
                        //维护alive_B;
                        g_ssaS.Flist[fid].Vlist[o2v_l(&begin->opn1)].alive_B.emplace(curB);

                        //维护alive_V;无则添加，有则覆盖；
                        g_bbL.find(fid, curB)->alive_V[o2v_l(&begin->opn1)] = "void";
                    }
                    else if (begin->op == IR_PARAM && g_sL.find(begin->opn1.id)->flag != 'A')
                    {
                        //维护alive_B;
                        g_ssaS.Flist[fid].Vlist[o2v_l(&begin->opn1)].alive_B.emplace(curB);

                        begin->level = 1;
                        //维护alive_V;无则添加，有则覆盖；
                        g_bbL.find(fid, curB)->alive_V[o2v_l(&begin->opn1)] = "void";
                    }
                    //处理全局默认初始化值
                    cur = cur->next;
                    for (; cur != end->next; cur = cur->next) //遍历每条指令；
                    {
                        cur->localBB = curB;
                        switch (cur->op)
                        {
                        case IR_ASSIGN:
                        {
                            if (cur->opn1.type == 'v' && cur->opn1.kind == 'V' && cur->opn1.flage != 'E')
                            {
                                //维护alive_B;
                                g_ssaS.Flist[fid].Vlist[o2v_l(&cur->opn1)].alive_B.insert(curB);
                                //维护alive_V;无则添加，有则覆盖；
                                g_bbL.find(fid, curB)->alive_V[o2v_l(&cur->opn1)] = "void";
                            }
                            break;
                        }
                        case IR_LOAD:
                        {
                            if ((cur->opn1.type == 'v' && cur->opn1.kind == 'V' && cur->opn1.flage != 'E') || (cur->opn1.type == 'v' && cur->opn1.kind == 'P' && cur->opn1.flaga != 'A'))
                            {
                                //维护alive_B;
                                g_ssaS.Flist[fid].Vlist[o2v_l(&cur->opn1)].alive_B.insert(curB);
                                //维护alive_V;无则添加，有则覆盖；
                                g_bbL.find(fid, curB)->alive_V[o2v_l(&cur->opn1)] = "void";
                            }
                            break;
                        }
                        case IR_PARAM:
                        {
                            cur->level = 1;
                            if (cur->opn1.kind == 'A')
                                break;

                            //维护alive_B;
                            // printf("para:%s\n", o2v_l(&cur->opn1).c_str());
                            g_ssaS.Flist[fid].Vlist[o2v_l(&cur->opn1)].alive_B.insert(curB);
                            //维护alive_V;无则添加，有则覆盖；
                            g_bbL.find(fid, curB)->alive_V[o2v_l(&cur->opn1)] = "void";

                            break;
                        }
                        case IR_JGE:
                        case IR_JGT:
                        case IR_JLE:
                        case IR_JLT:
                        case IR_EQ:
                        case IR_NEQ:
                        {
                            if (g_bbL.find(fid, curB)->preds.size() > 1 && g_bbL.find(fid, curB)->begin->whileCFlag == 1)
                                g_bbL.find(fid, curB)->ConditionFlag = 1;
                        }

                        default:
                            break;
                        }
                    }
                    // printf("\tbindex:%d", curB);
                    //深度优先遍历，避免查不到的问题；
                }

                if (g_bbL.find(fid, g_bbL.find(fid, curB)->dfsNext)->index != -2 && g_bbL.find(fid, curB)->dfsNext != 0)
                {
                    curB = g_bbL.find(fid, curB)->dfsNext;
                }
                else
                {
                    break;
                }
            }
        }
    }
}

// 2、插入phi函数；遍历一次符合要求基本块；
void insert_phi()
{
    // printf("函数个数：%lu\n", g_ssaS.Flist.size());
    for (auto y = g_ssaS.Flist.begin(); y != g_ssaS.Flist.end(); y++)
    {
        // cout << "当前函数：" << y->first << endl;
        if ((*y).first != "glo")
        {
            for (auto x = (*y).second.Vlist.begin(); x != (*y).second.Vlist.end(); x++) // x遍历变量；
            {
                // cout << "当前变量：" << x->first << endl;

                unordered_set<int> alreadylist;
                unordered_set<int> worklist = (*x).second.alive_B;
                unordered_set<int> everonworklist = worklist;
                while (!worklist.empty())
                {
                    basic_block *n = g_bbL.find((*y).first, *(worklist.begin()));
                    worklist.erase(worklist.begin());
                    for (auto m = n->df.begin(); m != n->df.end(); m++) // m遍历n的所有支配边界结点；
                    {
                        if (alreadylist.find((*m)) == alreadylist.end())
                        {
                            // cout << "目标块：" << *m << "\t" << g_bbL.find(y->first, *m)->level << "变量：" << x->first << "\t" << v_l2l(x->first) << endl;
                            if (g_bbL.find(y->first, *m)->level > v_l2l(x->first))
                            {
                                vector<phi_node> NULL_PHI;
                                g_bbL.find((*y).first, (*m))->phi_nodes[(*x).first] = NULL_PHI;

                                // cout << "当前结点的phi函数个数：" << g_bbL.find((*y).first, (*m))->phi_nodes.size() << endl;

                                alreadylist.insert(*m);
                            }
                        }
                        if (everonworklist.find(*m) == everonworklist.end())
                        {
                            worklist.insert(*m);
                            everonworklist.insert(*m);
                        }
                    }
                }
            }
        }
    }
}

// 2.5.参数初始化；
void DFSInitPhiParams(string fid, int cur, int p, unordered_set<int> *UTN)
{
    //去重；
    if (UTN->find(cur) == UTN->end())
    {
        //处理；
        AliveVUnoin(g_bbL.find(fid, cur)->alive_V, g_bbL.find(fid, p)->alive_V);
        UTN->emplace(cur);

        //递归；
        if (g_bbL.find(fid, cur)->next.size() > 0)
        {
            for (auto it = g_bbL.find(fid, cur)->next.begin(); it != g_bbL.find(fid, cur)->next.end(); it++)
            {
                DFSInitPhiParams(fid, it->first, cur, UTN);
            }
        }
    }
}

void InitPhiParams()
{
    auto it = g_bbL.glo_list.begin();
    for (; it != g_bbL.glo_list.end(); it++)
    {
        if (it->first != "glo")
        {
            unordered_set<int> unique_tnode;
            DFSInitPhiParams(it->first, 0, -1, &unique_tnode);
        }
    }
}

// 3.静态单赋值；同时给跨块分配寄存器；
void blockSSAssign(string fid, int curB)
{
    unordered_map<string, string> phiVar;
    unordered_map<string, int> push_time;
    codenode *begin = g_bbL.find(fid, curB)->begin, *end = g_bbL.find(fid, curB)->end, *cur = begin;
    if (begin == end)
        ;
    else
    {
        //设定phi返回值对应的临时变量；
        if (g_bbL.find(fid, curB)->phi_nodes.size() > 0)
        {
            for (auto itv = g_bbL.find(fid, curB)->phi_nodes.begin(); itv != g_bbL.find(fid, curB)->phi_nodes.end(); itv++)
            {
                glo_level = 1; //防止添加多余的临时变量；
                mksymt();
                g_sL.find(g_sL.last_sym)->alias = itv->first;
                struct Hvar tmp_H;
                tmp_H.index = g_ssaS.Flist[fid].Vlist[itv->first].varSSA.size() + 1;
                tmp_H.Hname = g_sL.last_sym;
                tmp_H.bindex = curB;
                tmp_H.flag = 'H';
                g_ssaS.find(fid, itv->first)->hvar2NName.push_back(tmp_H);

                g_sL.find(g_sL.last_sym)->flag = 'H'; // H表示此临时变量是phi函数返回值，（P用于表示形参）；
                //传递类型；TODO
                g_ssaS.Flist[fid].Vlist[itv->first].varSSA.emplace(g_sL.last_sym);
                if (push_time.find(itv->first) == push_time.end())
                {
                    push_time[itv->first] = 1;
                }
                else
                {
                    push_time[itv->first]++;
                }
                //维护alive_V;无则添加，有则覆盖；
                g_bbL.find(fid, curB)->alive_V[itv->first] = g_sL.last_sym;
                g_bbL.find(fid, curB)->alive_VB[itv->first] = g_sL.last_sym;

                // printf("PHI替换：%s -> %s\n", itv->first.c_str(), g_sL.last_sym.c_str());
            }
        }
        int NoPara = 0;
        //块内顺序静态单赋值；
        if (begin->op == IR_ASSIGN && begin->opn1.type == 'v' && begin->opn1.kind == 'V' && cur->opn1.flage != 'E')
        {

            //维护varSSA；映射为新临时变量名；
            glo_level = 1; //防止添加多余的临时变量；
            mksymt();
            g_sL.find(g_sL.last_sym)->alias = o2v_l(&cur->opn1);

            struct Hvar tmp_H;
            tmp_H.index = g_ssaS.Flist[fid].Vlist[o2v_l(&cur->opn1)].varSSA.size() + 1;
            tmp_H.Hname = g_sL.last_sym;
            tmp_H.bindex = curB;
            tmp_H.flag = 'S';
            g_ssaS.find(fid, o2v_l(&cur->opn1))->hvar2NName.push_back(tmp_H);

            //传递类型；
            cur->opn1.cal_type == 'i' ? strcpy(g_sL.find(g_sL.last_sym)->type, "int") : strcpy(g_sL.find(g_sL.last_sym)->type, "float");
            g_sL.find(g_sL.last_sym)->flag = 'S';
            g_sL.find(g_sL.last_sym)->genSite = &cur->opn1;
            g_sL.find(g_sL.last_sym)->gencode = cur;

            g_ssaS.Flist[fid].Vlist[o2v_l(&cur->opn1)].varSSA.emplace(g_sL.last_sym);
            if (push_time.find(o2v_l(&cur->opn1)) == push_time.end())
            {
                push_time[o2v_l(&cur->opn1)] = 1;
            }
            else
            {
                push_time[o2v_l(&cur->opn1)]++;
            }
            //维护alive_V;无则添加，有则覆盖；
            g_bbL.find(fid, curB)->alive_V[o2v_l(&cur->opn1)] = g_sL.last_sym;
            // printf("ASSIGN替换：%s -> %s\n", o2v_l(&cur->opn1).c_str(), g_sL.last_sym.c_str());
            //改指令；
            begin->opn1.id = g_sL.last_sym;
            begin->opn1.kind = 'S';
            begin->opn1.no_ris = 0;
            begin->opn1.status = 0;
            begin->opn1.address = 0;
        }
        else if (begin->op == IR_PARAM && g_sL.find(begin->opn1.id)->flag != 'A')
        {
            begin->op = IR_ASSIGN;
            //维护varSSA；映射为新临时变量名；
            glo_level = 1; //防止添加多余的临时变量；
            mksymt();
            g_sL.find(g_sL.last_sym)->alias = o2v_l(&cur->opn1);

            struct Hvar tmp_H;
            tmp_H.index = g_ssaS.Flist[fid].Vlist[o2v_l(&cur->opn1)].varSSA.size() + 1;
            tmp_H.Hname = g_sL.last_sym;
            tmp_H.bindex = curB;
            tmp_H.flag = 'S';
            g_ssaS.find(fid, o2v_l(&cur->opn1))->hvar2NName.push_back(tmp_H);
            //传递类型；
            cur->opn1.cal_type == 'i' ? strcpy(g_sL.find(g_sL.last_sym)->type, "int") : strcpy(g_sL.find(g_sL.last_sym)->type, "float");
            g_sL.find(g_sL.last_sym)->flag = 'S';
            g_sL.find(g_sL.last_sym)->genSite = &cur->opn1;
            g_sL.find(g_sL.last_sym)->gencode = cur;

            g_ssaS.Flist[fid].Vlist[o2v_l(&cur->opn1)].varSSA.emplace(g_sL.last_sym);
            if (push_time.find(o2v_l(&cur->opn1)) == push_time.end())
            {
                push_time[o2v_l(&cur->opn1)] = 1;
            }
            else
            {
                push_time[o2v_l(&cur->opn1)]++;
            }
            //维护alive_V;无则添加，有则覆盖；
            g_bbL.find(fid, curB)->alive_V[o2v_l(&cur->opn1)] = g_sL.last_sym;
            // printf("ASSIGN替换：%s -> %s\n", o2v_l(&cur->opn1).c_str(), g_sL.last_sym.c_str());
            //改指令；
            begin->opn2 = begin->opn1;
            begin->opn2.type = 'v', begin->opn2.status = 2, begin->opn2.no_ris = NoPara + cur->opn2.cal_type == 'f' ? 100 : 0, begin->opn2.kind = 'T';

            begin->opn1.id = g_sL.last_sym;
            begin->opn1.kind = 'S';
            begin->opn1.no_ris = 0;
            begin->opn1.status = 0;
            begin->opn1.address = 0;

            NoPara++;
        }
        else if (begin->op == IR_PARAM && g_sL.find(begin->opn1.id)->flag == 'A')
        {
            NoPara++;
        }
        cur = cur->next;
        for (; cur != end->next; cur = cur->next)
        {
            switch (cur->op)
            {
            case IR_ASSIGN:
            {
                if ((cur->opn1.type == 'v' && cur->opn1.kind == 'V' && cur->opn1.flage != 'E') || (cur->opn1.type == 'v' && cur->opn1.kind == 'P' && cur->opn1.flaga != 'A'))
                {

                    //维护varSSA栈结构;映射为新临时变量名；
                    glo_level = 1; //防止添加多余的临时变量；
                    mksymt();
                    g_sL.find(g_sL.last_sym)->alias = o2v_l(&cur->opn1);

                    struct Hvar tmp_H;
                    tmp_H.index = g_ssaS.Flist[fid].Vlist[o2v_l(&cur->opn1)].varSSA.size() + 1;
                    tmp_H.Hname = g_sL.last_sym;
                    tmp_H.bindex = curB;
                    tmp_H.flag = 'S';
                    g_ssaS.find(fid, o2v_l(&cur->opn1))->hvar2NName.push_back(tmp_H);

                    //传递类型；
                    cur->opn1.cal_type == 'i' ? strcpy(g_sL.find(g_sL.last_sym)->type, "int") : strcpy(g_sL.find(g_sL.last_sym)->type, "float");
                    g_sL.find(g_sL.last_sym)->flag = 'S';
                    g_sL.find(g_sL.last_sym)->genSite = &cur->opn1;
                    g_sL.find(g_sL.last_sym)->gencode = cur;

                    g_ssaS.Flist[fid].Vlist[o2v_l(&cur->opn1)].varSSA.emplace(g_sL.last_sym);
                    if (push_time.find(o2v_l(&cur->opn1)) == push_time.end())
                    {
                        push_time[o2v_l(&cur->opn1)] = 1;
                    }
                    else
                    {
                        push_time[o2v_l(&cur->opn1)]++;
                    }
                    //维护alive_V;无则添加，有则覆盖；
                    g_bbL.find(fid, curB)->alive_V[o2v_l(&cur->opn1)] = g_sL.last_sym;
                    // printf("ASSIGN替换：%s -> %s\n", o2v_l(&cur->opn1).c_str(), g_sL.last_sym.c_str());

                    //改指令；
                    cur->opn1.id = g_sL.last_sym;
                    cur->opn1.kind = 'S';
                    cur->opn1.no_ris = 0;
                    cur->opn1.status = 0;
                    cur->opn1.address = 0;
                }
                break;
            }
            case IR_PARAM:
            {
                if (cur->opn1.kind == 'A')
                {
                    NoPara++;
                    break;
                }
                if (NoPara < 4)
                {
                    cur->op = IR_ASSIGN;
                    //维护varSSA；映射为新临时变量名；
                    glo_level = 1; //防止添加多余的临时变量；
                    mksymt();
                    g_sL.find(g_sL.last_sym)->alias = o2v_l(&cur->opn1);

                    struct Hvar tmp_H;
                    tmp_H.index = g_ssaS.Flist[fid].Vlist[o2v_l(&cur->opn1)].varSSA.size() + 1;
                    tmp_H.Hname = g_sL.last_sym;
                    tmp_H.bindex = curB;
                    tmp_H.flag = 'S';
                    g_ssaS.find(fid, o2v_l(&cur->opn1))->hvar2NName.push_back(tmp_H);

                    //传递类型；
                    cur->opn1.cal_type == 'i' ? strcpy(g_sL.find(g_sL.last_sym)->type, "int") : strcpy(g_sL.find(g_sL.last_sym)->type, "float");
                    g_sL.find(g_sL.last_sym)->flag = 'S';
                    g_sL.find(g_sL.last_sym)->genSite = &cur->opn1;
                    g_sL.find(g_sL.last_sym)->gencode = cur;

                    g_ssaS.Flist[fid].Vlist[o2v_l(&cur->opn1)].varSSA.emplace(g_sL.last_sym);
                    if (push_time.find(o2v_l(&cur->opn1)) == push_time.end())
                    {
                        push_time[o2v_l(&cur->opn1)] = 1;
                    }
                    else
                    {
                        push_time[o2v_l(&cur->opn1)]++;
                    }
                    //维护alive_V;无则添加，有则覆盖；
                    g_bbL.find(fid, curB)->alive_V[o2v_l(&cur->opn1)] = g_sL.last_sym;
                    // printf("ASSIGN替换：%s -> %s\n", o2v_l(&cur->opn1).c_str(), g_sL.last_sym.c_str());
                    //改指令；
                    cur->opn2 = cur->opn1;
                    cur->opn2.type = 'v', cur->opn2.status = 2, cur->opn2.no_ris = NoPara, cur->opn2.kind = 'T';
                    cur->opn2.no_ris = cur->opn2.cal_type == 'f' ? 100 + cur->opn2.no_ris : cur->opn2.no_ris;
                    cur->opn1.id = g_sL.last_sym;
                    cur->opn1.kind = 'S';
                    cur->opn1.no_ris = 0;
                    cur->opn1.status = 0;
                    cur->opn1.address = 0;

                    NoPara++;
                }
                else
                {
                    cur->op = IR_LOAD;
                    //维护varSSA；映射为新临时变量名；
                    glo_level = 1; //防止添加多余的临时变量；
                    mksymt();
                    g_sL.find(g_sL.last_sym)->alias = o2v_l(&cur->opn1);

                    struct Hvar tmp_H;
                    tmp_H.index = g_ssaS.Flist[fid].Vlist[o2v_l(&cur->opn1)].varSSA.size() + 1;
                    tmp_H.Hname = g_sL.last_sym;
                    tmp_H.bindex = curB;
                    tmp_H.flag = 'S';
                    g_ssaS.find(fid, o2v_l(&cur->opn1))->hvar2NName.push_back(tmp_H);

                    //传递类型；
                    cur->opn1.cal_type == 'i' ? strcpy(g_sL.find(g_sL.last_sym)->type, "int") : strcpy(g_sL.find(g_sL.last_sym)->type, "float");
                    g_sL.find(g_sL.last_sym)->flag = 'S';
                    g_sL.find(g_sL.last_sym)->genSite = &cur->result;
                    g_sL.find(g_sL.last_sym)->gencode = cur;

                    g_ssaS.Flist[fid].Vlist[o2v_l(&cur->opn1)].varSSA.emplace(g_sL.last_sym);
                    if (push_time.find(o2v_l(&cur->opn1)) == push_time.end())
                    {
                        push_time[o2v_l(&cur->opn1)] = 1;
                    }
                    else
                    {
                        push_time[o2v_l(&cur->opn1)]++;
                    }
                    //维护alive_V;无则添加，有则覆盖；
                    g_bbL.find(fid, curB)->alive_V[o2v_l(&cur->opn1)] = g_sL.last_sym;
                    // printf("ASSIGN替换：%s -> %s\n", o2v_l(&cur->opn1).c_str(), g_sL.last_sym.c_str());
                    //改指令；
                    cur->opn1.status = 1;
                    cur->result.type = 'v';
                    cur->result.id = g_sL.last_sym;
                    cur->result.kind = 'S';
                    cur->result.no_ris = 0;
                    cur->result.status = 0;
                    cur->result.address = 0;

                    NoPara++;
                }
                // cur->op = IR_ASSIGN;
                break;
            }
            case IR_ALLOCA:
            {
            }
            // case IR_ADD:
            // case IR_MINUS:
            // case IR_MUL:
            // case IR_DIV:
            // case IR_MOD:
            // case IR_JLT:
            // case IR_JLE:
            // case IR_JGT:
            // case IR_JGE:
            // case IR_EQ:
            // case IR_NEQ:
            // case IR_AND:
            // case IR_OR: // 123
            // {
            //     if (cur->opn1.type == 'v' && cur->opn1.kind == 'V' && cur->opn1.flage != 'E')
            //     { //改指令；
            //         cur->opn1.id = g_ssaS.find(fid, o2v_l(&cur->opn1))->varSSA.top();
            //         cur->opn1.kind = 'T';
            //         cur->opn1.no_ris = 0;
            //         cur->opn1.status = 0;
            //         cur->opn1.address = 0;
            //     }
            //     if (cur->opn2.type == 'v' && cur->opn2.kind == 'V' && cur->opn2.flage != 'E')
            //     { //改指令；
            //         cur->opn1.id = g_ssaS.find(fid, o2v_l(&cur->opn2))->varSSA.top();
            //         cur->opn1.kind = 'T';
            //         cur->opn1.no_ris = 0;
            //         cur->opn1.status = 0;
            //         cur->opn1.address = 0;
            //     }
            //     if (cur->result.type == 'v' && cur->result.kind == 'V' && cur->result.flage != 'E')
            //     { //改指令；
            //         cur->opn1.id = g_ssaS.find(fid, o2v_l(&cur->result))->varSSA.top();
            //         cur->opn1.kind = 'T';
            //         cur->opn1.no_ris = 0;
            //         cur->opn1.status = 0;
            //         cur->opn1.address = 0;
            //     }
            //     break;
            // }
            // case IR_ARG:         // 3
            // case IR_ARROFF_EXPi: // 3
            // case IR_EXP_ARROFF:  // 3
            // {
            //     if (cur->result.type == 'v' && cur->result.kind == 'V' && cur->result.flage != 'E')
            //     { //改指令；
            //         cur->opn1.id = g_ssaS.find(fid, o2v_l(&cur->result))->varSSA.top();
            //         cur->opn1.kind = 'T';
            //         cur->opn1.no_ris = 0;
            //         cur->opn1.status = 0;
            //         cur->opn1.address = 0;
            //     }
            // }
            case IR_LOAD: // 1
            {
                if ((cur->opn1.type == 'v' && cur->opn1.kind == 'V' && cur->opn1.flage != 'E') || (cur->opn1.type == 'v' && cur->opn1.kind == 'P' && cur->opn1.flaga != 'A'))
                { //改指令；
                    if (g_ssaS.find(fid, o2v_l(&cur->opn1))->varSSA.size() > 0)
                    {
                        cur->opn1.id = g_ssaS.find(fid, o2v_l(&cur->opn1))->varSSA.top();
                        cur->opn1.kind = g_sL.find(cur->opn1.id)->flag;
                        // printf(" cur->opn1.id:%s_%c\n", cur->opn1.id.c_str(), cur->opn1.kind);
                        cur->opn1.no_ris = g_sL.find(cur->opn1.id)->no_ris;
                        cur->opn1.status = g_sL.find(cur->opn1.id)->status;
                        cur->opn1.address = g_sL.find(cur->opn1.id)->address;
                        g_sL.find(cur->opn1.id)->UseSites.emplace(&cur->opn1);
                    }
                    else
                    {
                        printf("符号流空栈！\n");
                    }
                }
            }
                // case IR_VCVT: // 12
                // {
                //     if (cur->opn1.type == 'v' && cur->opn1.kind == 'V' && cur->opn1.flage != 'E')
                //     { //改指令；
                //         cur->opn1.id = g_ssaS.find(fid, o2v_l(&cur->opn1))->varSSA.top();
                //         cur->opn1.kind = 'T';
                //         cur->opn1.no_ris = 0;
                //         cur->opn1.status = 0;
                //         cur->opn1.address = 0;
                //     }
                //     if (cur->opn2.type == 'v' && cur->opn2.kind == 'V' && cur->opn2.flage != 'E')
                //     { //改指令；
                //         cur->opn1.id = g_ssaS.find(fid, o2v_l(&cur->opn2))->varSSA.top();
                //         cur->opn1.kind = 'T';
                //         cur->opn1.no_ris = 0;
                //         cur->opn1.status = 0;
                //         cur->opn1.address = 0;
                //     }
                // }
                // case IR_CALL:   // 3
                // case IR_NOT:    // 13
                // case IR_UMINUS: // 13
                // {
                //     if (cur->opn1.type == 'v' && cur->opn1.kind == 'V' && cur->opn1.flage != 'E')
                //     { //改指令；
                //         cur->opn1.id = g_ssaS.find(fid, o2v_l(&cur->opn1))->varSSA.top();
                //         cur->opn1.kind = 'T';
                //         cur->opn1.no_ris = 0;
                //         cur->opn1.status = 0;
                //         cur->opn1.address = 0;
                //     }
                //     if (cur->result.type == 'v' && cur->result.kind == 'V' && cur->result.flage != 'E')
                //     { //改指令；
                //         cur->opn1.id = g_ssaS.find(fid, o2v_l(&cur->result))->varSSA.top();
                //         cur->opn1.kind = 'T';
                //         cur->opn1.no_ris = 0;
                //         cur->opn1.status = 0;
                //         cur->opn1.address = 0;
                //     }
                //     break;
                // }
                // case IR_ARROFF_EXP: // 1

            default:
                break;
            }
        }

        //给CFG后继结点传递phi参数；
        if (g_bbL.find(fid, curB)->next.size() > 0)
        {
            for (auto it = g_bbL.find(fid, curB)->next.begin(); it != g_bbL.find(fid, curB)->next.end(); it++) //每个后继；
            {
                if (g_bbL.find(fid, it->first)->phi_nodes.size() > 0) //含phi函数;
                {
                    for (auto itv = g_bbL.find(fid, it->first)->phi_nodes.begin(); itv != g_bbL.find(fid, it->first)->phi_nodes.end(); itv++) //每个变量；
                    {
                        // if (g_bbL.find(fid, curB)->alive_V.find(itv->first) != g_bbL.find(fid, curB)->alive_V.end())
                        {
                            struct phi_node tmppn;
                            tmppn.new_name = g_bbL.find(fid, curB)->alive_V[itv->first];
                            tmppn.index = curB;
                            g_bbL.find(fid, it->first)->phi_nodes[itv->first].push_back(tmppn); //加入参数表；
                        }
                    }
                }

                {
                    CAliveVUnoin(g_bbL.find(fid, it->first)->alive_V, g_bbL.find(fid, curB)->alive_V);
                }
            }
        }
    }

    // 支配者树上递归；
    if (g_bbL.find(fid, curB)->idomS.size() > 0)
    {
        for (auto it = g_bbL.find(fid, curB)->idomS.begin(); it != g_bbL.find(fid, curB)->idomS.end(); it++)
        {
            blockSSAssign(fid, *it);
        }
    }

    // //返回时出栈；
    if (push_time.size() > 0)
    {
        for (auto itv = push_time.begin(); itv != push_time.end(); itv++)
        {
            for (int time = 0; time < itv->second; time++)
                g_ssaS.Flist[fid].Vlist[itv->first].varSSA.pop();
            // if (phiVar.size() > 0)
            // {
            //     for (auto itpv = phiVar.begin(); itpv != phiVar.end(); itpv++)
            //         g_ssaS.Flist[fid].Vlist[itpv->first].varSSA.emplace(itpv->second);
            // }
        }
    }
    //给phi返回分配寄存器；
    // if (g_bbL.find(fid, curB)->phi_nodes.size() > 0)
    // {
    //     for (auto itpv = g_bbL.find(fid, curB)->alive_VB.begin(); itpv != g_bbL.find(fid, curB)->alive_VB.end(); itpv++)
    //     // if (g_bbL.find(fid, curB)->alive_V.size() > 0)
    //     // {
    //     //     for (auto itpv = g_bbL.find(fid, curB)->alive_V.begin(); itpv != g_bbL.find(fid, curB)->alive_V.end(); itpv++)
    //     {
    //         //新分配
    //         if (alced_V->find(itpv->first) == alced_V->end())
    //         {
    //             if (SRisPool->size() > 0) //分配寄存器；
    //             {
    //                 g_ssaS.find(fid, itpv->first)->status = 2;
    //                 int tmp_ris = *SRisPool->begin();
    //                 g_ssaS.find(fid, itpv->first)->no_ris = tmp_ris;
    //                 SRisPool->erase(tmp_ris);
    //                 //计算最大用量存入符号表；
    //                 g_sL.glo_ymT[fid].DrMaxNum = g_sL.glo_ymT[fid].DrMaxNum > tmp_ris ? g_sL.glo_ymT[fid].DrMaxNum : tmp_ris;
    //             }
    //             else //分配栈空间；
    //             {
    //                 g_ssaS.find(fid, itpv->first)->status = 1;
    //                 g_ssaS.find(fid, itpv->first)->address = tmp_sp_phi + 4;
    //                 tmp_sp_phi += 4;
    //             }
    //         }
    //         //分配状况维护到临时变量符号表项；同时实现分配继承；
    //         g_sL.find(itpv->second)->status = g_ssaS.find(fid, itpv->first)->status;
    //         g_sL.find(itpv->second)->address = g_ssaS.find(fid, itpv->first)->address;
    //         g_sL.find(itpv->second)->no_ris = g_ssaS.find(fid, itpv->first)->no_ris;
    //         // g_sL.find(itpv->second)->flag = 'H';
    //         strcpy(g_sL.find(itpv->second)->type, "float");
    //         alced_V->emplace(itpv->first);
    //     }
    //     //分配释放；
    //     for (auto itav = alced_V->begin(); itav != alced_V->end(); itav++)
    //     {
    //         if (g_bbL.find(fid, curB)->alive_VB.find(*itav) == g_bbL.find(fid, curB)->alive_VB.end())
    //         {
    //             if (g_ssaS.find(fid, *itav)->status == 2) //寄存器释放；
    //             {
    //                 // SRisPool->emplace(g_ssaS.find(fid, *itav)->no_ris);
    //                 // g_ssaS.find(fid, *itav)->no_ris = 0;
    //                 // g_ssaS.find(fid, *itav)->status = 0;
    //                 // g_ssaS.find(fid, *itav)->address = 0;
    //             }
    //         }
    //     }
    // }
}
void StaticSAssign()
{
    std::unordered_map<string, unordered_map<int, struct basic_block *>>::iterator it = g_bbL.glo_list.begin();

    if (g_bbL.glo_list.find(string("glo")) != g_bbL.glo_list.end())
    {
    }

    for (; it != g_bbL.glo_list.end(); it++) //遍历所有函数；
    {
        if (it->first != "glo")
        {
            g_sL.now_func = it->first; //置编号为已有表大小防止重名；
            no_tmp = g_sL.glo_ymT[it->first].func_t == NULL ? 0 : g_sL.glo_ymT[it->first].func_t->size();

            // printf("%s:\n", g_sL.now_func.c_str());
            blockSSAssign(it->first, 0);
        }
    }
}

// 4.phi翻译TODO

void TrsltPhiBlock(int ifromB, basic_block *toPhiB, string var)
{
    string toName = toPhiB->alive_VB[var], fromName = toPhiB->phi_nodes[var][ifromB].new_name;
    if (fromName == "void")
        return;
    basic_block *fromB = g_bbL.find(g_sL.now_func, toPhiB->phi_nodes[var][ifromB].index), *phiB = toPhiB;

    while (fromB->phi_nodes.find(var) == fromB->phi_nodes.end() && g_ssaS.find(g_sL.now_func, var)->alive_B.find(fromB->index) == g_ssaS.find(g_sL.now_func, var)->alive_B.end())
    {
        if (fromB->index == 0)
            break;
        toPhiB = fromB;
        fromB = g_bbL.find(g_sL.now_func, fromB->preTNode);
        // printf("%s前提phi语句：%d -> %d\n", var.c_str(), fromB->index, toPhiB->index);
    }
    // printf("\n");

    codenode *insNex;
    IR_op newOp;
    string newCont = "";
    struct codenode *cur = fromB->end, *Label = cur, *Goto, *Gotoe, *Jcmp;

    while (Label->op != IR_LABEL) //找到下一个的label，任何一个块都有；
        Label = Label->next;

    Goto = Label, Gotoe = Label, Jcmp = Label; //初始化goto，gotoe指针为Label；

    while (Goto->prior->op == IR_GOTO) //找出goto，若存在则必为Label前一条，若无则指针置为label；
        Goto = Goto->prior;
    // Goto = Goto->next;

    Gotoe = Goto->prior; //找出Gotoe，若存在，则在Goto指针的前几条ASSIGN前；
    while (Gotoe->op == IR_ASSIGN)
        Gotoe = Gotoe->prior;
    if ((Gotoe->op == IR_GOTO_EQ || Gotoe->op == IR_GOTO_NEQ))
    {
        Jcmp = Gotoe->prior;
        while ((Jcmp->op < IR_MOD || Jcmp->op > IR_EQ) && Jcmp->op != IR_NEQ && Jcmp->op != IR_NOT)
        {
            Jcmp = Jcmp->prior;
        }
    }

    //设定op,cont和位置；
    if ((Gotoe->op == IR_GOTO_EQ || Gotoe->op == IR_GOTO_NEQ) && Gotoe->result.id == toPhiB->begin->opn1.id)
    {
        insNex = Gotoe;
        newOp = ARM_MOVcont;
        switch (Jcmp->op)
        {
        case IR_JLT:
        {
            newCont = "lt";
            break;
        }
        case IR_JLE:
        {
            newCont = "le";
            break;
        }
        case IR_JGT:
        {
            newCont = "gt";

            break;
        }
        case IR_JGE:
        {
            newCont = "ge";

            break;
        }
        case IR_EQ:
        {
            newCont = "eq";

            break;
        }
        case IR_NEQ:
        {
            newCont = "ne";

            break;
        }
        case IR_NOT:
        {
            newCont = "eq";
            break;
        }
        default:
            break;
        }
    }
    else if (Goto->op == IR_GOTO && Goto->opn1.id == toPhiB->begin->opn1.id)
        insNex = Goto, newOp = IR_ASSIGN, newCont = "";
    else
        insNex = Label, newOp = IR_ASSIGN, newCont = "";

    //插入语句；
    if (insNex->prior->op == IR_ASSIGN && insNex->prior->opn1.id == "r0")
    {
        insNex = insNex->prior;
    }
    struct codenode *oneIr = mkIR(newOp);
    oneIr->level = fromB->level;
    oneIr->opn1.id = toName, oneIr->opn1.kind = 'H', oneIr->opn1.type = 'v';
    oneIr->opn2.id = fromName, oneIr->opn2.type = 'v', oneIr->opn2.kind = g_sL.find(oneIr->opn2.id)->flag;
    oneIr->opn2.cal_type = strcmp(g_sL.find(oneIr->opn2.id)->type, "int") == 0 ? 'i' : 'f';
    oneIr->cont = newCont;
    oneIr->localBB = fromB->index;
    oneIr->result.id = var;
    oneIr->result.const_int = phiB->index; // result为附加信息块；记录目标块号和变量原名；
    string tmpEdge = oneIr->opn1.id + oneIr->opn2.id + oneIr->cont;
    // cout << fromB->index << "\t" << tmpEdge << ":";
    // for (auto itc = fromB->PhiCodes.begin(); itc != fromB->PhiCodes.end(); itc++)
    // {
    //     cout << "\t" << *itc;
    // }
    // cout << endl;
    if (fromB->PhiCodes.find(tmpEdge) != fromB->PhiCodes.end())
        return;
    fromB->PhiCodes.emplace(tmpEdge);
    split(out_IR, insNex), merge(3, out_IR, oneIr, insNex);
    g_sL.find(fromName)->UseSites.emplace(&oneIr->opn2);

    if (fromB->end->op != IR_FUNC_END)
        fromB->end = Label->prior;
    g_ssaS.find(g_sL.now_func, var)->NName2PhiB[oneIr->opn1.id] = phiB->index; //维护由变量名到目标块；
    // cout << "\t " << phiB->index << ": " << var << "空" << endl;

    phiB->phi_nodes[var][ifromB].index = fromB->index;
    phiB->phi_nodes[var][ifromB].phiIRSite = oneIr;
}

void TrsltPhi()
{
    for (auto itF = g_ssaS.Flist.begin(); itF != g_ssaS.Flist.end(); itF++)
    {
        if (itF->first != "glo" && g_bbL.glo_list[itF->first].size() > 0)
        {
            g_sL.now_func = itF->first;
            for (auto itB = g_bbL.glo_list[itF->first].begin(); itB != g_bbL.glo_list[itF->first].end(); itB++)
            {
                if (itB->first != -1 && itB->second->phi_nodes.size() > 0) //判断基本块含phi函数；
                {
                    for (auto itV = itB->second->phi_nodes.begin(); itV != itB->second->phi_nodes.end(); itV++) //遍历变量；
                    {
                        // if (itB->first == 62 && itV->first == "i1_1")
                        // {
                        //     cout << "i1_1翻译：\n";
                        //     for (int itPB = 0; itPB < itB->second->phi_nodes[itV->first].size(); itPB++) //遍历前驱；
                        //     {
                        //         cout << "\t" << itPB << "\t" << itB->second->phi_nodes[itV->first][itPB].index << "\t" << itB->second->phi_nodes[itV->first][itPB].new_name << endl;
                        //     }
                        // }
                        for (int itPB = 0; itPB < itB->second->phi_nodes[itV->first].size(); itPB++) //遍历前驱；
                        {
                            // if去除同临时变量赋值代码；
                            if (itB->second->alive_VB[itV->first] != itB->second->phi_nodes[itV->first][itPB].new_name)
                            {
                                // cout << itB->second << "<=" << itB->second << endl;
                                TrsltPhiBlock(itPB, itB->second, itV->first);
                            }
                            // else
                            // {
                            //     itB->second->phi_nodes[itV->first].erase(itB->second->phi_nodes[itV->first].begin() + itPB);
                            // }
                        }
                    }
                }
            }
        }
    }
}

void RunSSA()
{
    // 1.维护活跃变量和活跃块的对应；
    findAlive();

    // // 2.插入phi函数；遍历一次符合要求基本块；
    insert_phi();

    InitPhiParams();

    // // // 3.静态单赋值；
    StaticSAssign();

    // // // // 4.phi翻译TODO
    TrsltPhi();
    // DisplayBBList(), DisplaySSAstruct();
    // DisplaySymbolTable();
}
