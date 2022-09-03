#include "../../include/optimization/lcm.h"
using namespace std;

vector<loop_struct> loops;
map<int, loop_struct> find_loop;

// 是否在循环中定值
bool if_defoutloop(opn o, loop_struct &x, set<string> &def_out_opn, set<string> &cannot_out)
{
    if (cannot_out.find(o.id) != cannot_out.end())
    {
        return false;
    }
    else
    {
        // 1.const
        if (o.type == 'i' || o.type == 'f')
        {
            return true;
        }
        if (o.kind == 'V')
        {
            cannot_out.insert(o.id);
            return false;
        }
        // if (o.kind == 'A')
        // {
        //     cout << "opn is array" << endl;
        //     return true;
        // }
        // 2.定值在外部
        if (o.kind == 'S')
        {
            int index = g_sL.find(o.id)->gencode->localBB;
            if (x.loop_bb.find(g_bbL.find(x.func_name, index)) == x.loop_bb.end())
            {
                return true;
            }
        }
        else if (o.kind == 'H')
        {
            // for (auto i = x.loop_bb.begin(); i != x.loop_bb.end(); i++)
            // {
            //     int index;
            //     basic_block *temp_bb = g_bbL.find(x.func_name, index);
            //     if (x.loop_bb.find(temp_bb) != x.loop_bb.end())
            //     {
            //         for (codenode *tn = temp_bb->begin; tn != temp_bb->end->next; tn = tn->next)
            //         {
            //             if (tn->op == IR_ASSIGN && tn->opn1.id == o.id)
            //             {
            //                 cannot_out.insert(o.id);
            //                 return false;
            //             }
            //         }
            //     }
            // }
            string pname = g_sL.find(o.id)->alias;
            for (int i = 0; i < g_bbL.find(g_sL.now_func, g_ssaS.find(g_sL.now_func, pname)->NName2PhiB[o.id])->phi_nodes[pname].size(); i++)
            {
                int index = g_bbL.find(g_sL.now_func, g_ssaS.find(g_sL.now_func, pname)->NName2PhiB[o.id])->phi_nodes[pname][i].index;
                basic_block *temp_bb = g_bbL.find(x.func_name, index);
                if (x.loop_bb.find(temp_bb) != x.loop_bb.end())
                {
                    for (codenode *tn = temp_bb->begin; tn != temp_bb->end->next; tn = tn->next)
                    {
                        if ((tn->op == IR_ASSIGN || tn->op == ARM_MOVcont) && tn->opn1.id == o.id)
                        {
                            cannot_out.insert(o.id);
                            return false;
                        }
                    }
                }
            }

            return true;
        }
        // 3.定值在内部,但是在def_out_opn里
        if (def_out_opn.find(o.id) != def_out_opn.end())
        {

            return true;
        }

        cannot_out.insert(o.id);
        return false;
    }
}

bool phi_def_out(codenode *n, loop_struct &x)
{
    for (int i = 0; i < g_bbL.find(g_sL.now_func, n->result.const_int)->phi_nodes[n->result.id].size(); i++)
    {
        int index = g_bbL.find(g_sL.now_func, n->result.const_int)->phi_nodes[n->result.id][i].index;
        codenode *sn = g_bbL.find(g_sL.now_func, n->result.const_int)->phi_nodes[n->result.id][i].phiIRSite;
        if (sn == n)
            continue;
        basic_block *temp_bb = g_bbL.find(x.func_name, index);
        if (x.loop_bb.find(temp_bb) != x.loop_bb.end())
        {
            for (codenode *tn = temp_bb->begin; tn != temp_bb->end->next; tn = tn->next)
            {
                if (tn == n)
                    continue;
                if (tn->op == IR_ASSIGN && tn->opn1.id == n->opn1.id)
                {

                    return false;
                }
            }
        }
    }
    return true;
}

string if_motion(codenode *n, loop_struct &x, set<string> &def_out_opn, set<string> &cannot_out)
{
    // 1.先看结果是否是s型变量,是则继续
    // 2.如果是h型变量，判断此循环内是否还有此h变量的定值点（即判断phi函数的另一些赋值是否在循环内
    // 3.再判断操作数是否定值在内部,在外部则外提
    // 4.如果定值在循环内部，则判断操作数的定值语句是否是不变量且已经外提

    // 操作数是否定值在外部,是否是不变量且已经外提
    if (n->op == IR_ASSIGN || n->op == ARM_MOVcont)
    {
        if (n->opn1.kind == 'H' && (cannot_out.find(n->opn1.id) != cannot_out.end()))
            return "";
        else if (n->opn1.kind == 'H' && !phi_def_out(n, x))
        {
            cannot_out.insert(n->opn1.id);
            return "";
        }
        if (if_defoutloop(n->opn2, x, def_out_opn, cannot_out))
        {
            return n->opn1.id;
        }
        cannot_out.insert(n->opn1.id);
        return "";
    }
    else if (n->op == IR_LOAD || n->op == IR_NOT || n->op == IR_UMINUS)
    {
        if (n->op == IR_LOAD && n->opn1.kind == 'A' && (n->next->op == IR_EXP_ARROFF || n->next->op == IR_ARROFF_EXP || n->next->op == IR_ARROFF_EXPi))
        {
            if (n->next->op == IR_EXP_ARROFF)
            {
                if (n->next->opn1.id == n->result.id && if_defoutloop(n->next->opn2, x, def_out_opn, cannot_out))
                    return n->result.id;
            }
            if (n->next->op == IR_ARROFF_EXP || n->next->op == IR_ARROFF_EXPi)
            {
                if (n->next->opn1.id == n->result.id && if_defoutloop(n->next->result, x, def_out_opn, cannot_out) && if_defoutloop(n->next->opn2, x, def_out_opn, cannot_out))
                    return n->result.id;
            }
            return "";
            // for (auto y = n; y->op != IR_CALL && y->op != IR_CALL_VOID && y != g_bbL.find(x.func_name, n->localBB)->end; y = y->next)
            // {
            //     // 并且此处其他的调用都必须为不变量
            //
            // }
        }
        else if (if_defoutloop(n->opn1, x, def_out_opn, cannot_out))
        {
            for (auto y = n; y->op != IR_CALL && y->op != IR_CALL_VOID && y != g_bbL.find(x.func_name, n->localBB)->end; y = y->next)
            {
                if (y->op == IR_ARG && y->result.id == n->result.id)
                {
                    cannot_out.insert(n->result.id);
                    return "";
                }
            }
            return n->result.id;
        }
        cannot_out.insert(n->result.id);
        return "";
    }
    else if (n->op == IR_EXP_ARROFF)
    {
        if (if_defoutloop(n->opn2, x, def_out_opn, cannot_out))
            return n->result.id;
        cannot_out.insert(n->result.id);
        return "";
    }
    else if (n->op == IR_ARROFF_EXP || n->op == IR_ARROFF_EXPi)
    {
        if (if_defoutloop(n->result, x, def_out_opn, cannot_out) && if_defoutloop(n->opn2, x, def_out_opn, cannot_out))
            return n->opn1.id;
        return "";
    }
    else if (n->op == IR_VCVT)
    {
        if (if_defoutloop(n->opn2, x, def_out_opn, cannot_out))
            return n->result.id;
        cannot_out.insert(n->result.id);
        return "";
    }
    else if (n->op >= IR_ADD && n->op <= IR_MOD)
    {
        if (if_defoutloop(n->opn1, x, def_out_opn, cannot_out) && if_defoutloop(n->opn2, x, def_out_opn, cannot_out))
            return n->result.id;
        cannot_out.insert(n->result.id);
        return "";
    }
    else if (n->op >= IR_JLT && n->op <= IR_OR)
    {
        cannot_out.insert(n->result.id);
        return "";
    }
    // else if (n->op == IR_ARG)
    // {
    //     // if (if_defoutloop(n->result, x, def_out_opn, cannot_out))
    //     // {
    //     //     func_arg.push_back(n);
    //     //     // 这里先不插入lcm_nodes，merge到call一起插入
    //     //     return "";
    //     // }
    //     // func_arg.push_back(nullptr);

    //     for (auto y = n; y != g_bbL.find(x.func_name, n->localBB)->begin; y = y->prior)
    //     {
    //         if (y->op == IR_LOAD && y->result.id == n->result.id)
    //         {
    //             if (x.find_lcmcodes.find(y) != x.find_lcmcodes.end())
    //                 x.lcm_codes.erase(y);

    //             break;
    //         }
    //     }

    //     cannot_out.insert(n->result.id);
    //     return "";
    // }
    // else if (n->op == IR_CALL)
    // {
    //     for (auto y = func_arg.begin(); y != func_arg.end(); y++)
    //     {
    //         if (*y == nullptr)
    //         {
    //             break;
    //         }
    //     }
    //     func_arg.clear();
    //     cannot_out.insert(n->result.id);
    //     return " ";
    // }
    return "";
}

void DisplayLoopsList()
{
    cout << "-------------------loopsList:\n";
    for (auto itw = loops.begin(); itw != loops.end(); itw++)
    {
        cout << "\tbegin:" << itw->begin->index << "\tend:" << itw->end->index << endl;
        cout << "循环的所有节点 ";
        for (auto x : itw->loop_bb)
        {
            cout << x->index << " ";
        }
        cout << endl;
        cout << "循环的出口 ";
        for (auto x : itw->exit)
        {
            cout << x->index << " ";
        }
        cout << endl;
        cout << "循环入口的回边前驱块 ";
        for (auto x : itw->pres)
        {
            cout << x->index << " ";
        }
        cout << endl;
        cout << "循环入口的前驱块 ";
        for (auto x : itw->begin->preds)
        {
            cout << x << " ";
        }
        cout << endl;
        cout << "需要外提的表达式数量: " << itw->lcm_codes.size() << endl;
    }
    cout << "---------end looplist-----------" << endl;
    //......
}

// 让新的前置节点成为其他节点的支配节点
void add_dom(basic_block *bb, basic_block *rk)
{
    for (auto x = g_bbL.glo_list[g_sL.now_func].begin(); x != g_bbL.glo_list[g_sL.now_func].end(); x++)
    {
        if (x->second->dominators.find(rk->index) != x->second->dominators.end())
        {
            x->second->dominators.insert(bb->index);
        }
    }
}

// 初始化最基础的begin和end还有name
void loopsInit()
{
    for (auto itf = wL.begin(); itf != wL.end(); itf++)
    {
        for (auto itw = wL[itf->first].begin(); itw != wL[itf->first].end(); itw++)
        {
            loop_struct nlop;
            nlop.begin = g_bbL.find(itf->first, (itw->first));
            nlop.end = g_bbL.find(itf->first, (itw->second));
            nlop.func_name = itf->first;
            find_loop[nlop.begin->index] = nlop;
            loops.push_back(nlop);
        }
    }
    for (auto nlop = loops.begin(); nlop != loops.end(); nlop++)
    {
        codenode *node = (*nlop).begin->begin;
        string s = (*nlop).begin->begin->opn1.id;
        // 判断内层循环的出口的下一个是否就是外层循环的入口
        if (find_loop.find((*nlop).end->index) == find_loop.end())
        {
            while (node != (*nlop).end->begin)
            {
                if (node->localBB == 0)
                {
                    node = node->next;
                    continue;
                }
                basic_block *temp_bb = g_bbL.find((*nlop).func_name, node->localBB);
                if ((*nlop).loop_bb.find(temp_bb) == (*nlop).loop_bb.end())
                    (*nlop).loop_bb.insert(temp_bb);
                if (temp_bb->next.find((*nlop).begin->index) != temp_bb->next.end())
                    (*nlop).pres.insert(temp_bb);
                node = node->next;
            }
        }
        else
        {

            loop_struct outloop = find_loop[(*nlop).end->index];

            while (node != outloop.end->begin)
            {
                if (node->localBB == 0)
                {
                    node = node->next;
                    continue;
                }
                basic_block *temp_bb = g_bbL.find((*nlop).func_name, node->localBB);
                if ((*nlop).loop_bb.find(temp_bb) == (*nlop).loop_bb.end())
                    (*nlop).loop_bb.insert(temp_bb);
                if (temp_bb->next.find((*nlop).begin->index) != temp_bb->next.end())
                    (*nlop).pres.insert(temp_bb);
                node = node->next;
            }
        }
        for (auto z : (*nlop).loop_bb)
        {
            for (auto k : z->next)
            {
                basic_block *temp_bb = g_bbL.find((*nlop).func_name, k.first);
                if ((*nlop).loop_bb.find(temp_bb) == (*nlop).loop_bb.end())
                {
                    if (z->index == (*nlop).begin->index)
                    {
                        (*nlop).exit.insert((*nlop).pres.begin(), (*nlop).pres.end());
                    }
                    else
                        (*nlop).exit.insert(z);
                }
            }
        }
    }
}

void code_motion()
{
    for (auto x = loops.begin(); x != loops.end(); x++)
    {
        int mark = 0;
        g_sL.now_func = (*x).func_name;
        // 符合外提条件的操作数
        set<string> def_out_opn;
        set<string> cannot_out;

        set<basic_block *> work_bb;

        for (auto y : (*x).loop_bb)
        {
            int w = 0;
            for (auto a : (*x).exit)
            {
                if (a->dominators.find(y->index) == a->dominators.end())
                {
                    w = 1;
                    break;
                }
            }
            if (w == 1)
            {
                continue;
            }

            work_bb.insert(y);
        }

        do
        {
            mark = 0;
            for (auto z : work_bb)
            {

                codenode *code = z->begin;
                while (code != z->end->next)
                {
                    string result = if_motion(code, *x, def_out_opn, cannot_out);
                    if (result != "" && z->next.size() == 1)
                    {
                        codenode *copy_node = new codenode();
                        *copy_node = *code;
                        copy_node->prior = copy_node->next = copy_node;
                        (*x).lcm_codes.push_back(copy_node);
                        if (code->op != IR_ARROFF_EXP && code->op != IR_ARROFF_EXPi)
                            def_out_opn.insert(result);
                        mark = 1;
                        code->op = IR_VOID;
                        if ((copy_node->op == IR_ASSIGN || copy_node->op == ARM_MOVcont) && copy_node->opn1.kind == 'H')
                        {
                            (*x).phi_define.insert(make_pair(copy_node->opn1.id, copy_node));
                        }
                    }
                    code = code->next;
                }
            }
        } while (mark == 1);
        def_out_opn.clear();
        cannot_out.clear();
        work_bb.clear();
        insert_prebb(x);
    }
}

void insert_prebb(vector<loop_struct>::iterator x)
{
    if ((*x).lcm_codes.size() > 0)
    {
        basic_block *new_bb = new basic_block();

        string new_label = newLabel();
        int new_index = L2i(new_label.c_str());
        new_bb->index = new_index;

        codenode *newlabelnode = mkIR(IR_LABEL), *t;
        newlabelnode->opn1.id = new_label;
        newlabelnode->opn1.kind = 'L';
        newlabelnode->opn1.type = 'v';
        new_bb->begin = newlabelnode;

        new_bb->dominators.insert((*x).begin->dominators.begin(), (*x).begin->dominators.end());

        for (set<int>::iterator z = (*x).begin->preds.begin(); z != (*x).begin->preds.end(); z++)
        {
            basic_block *temp_bb = g_bbL.find((*x).func_name, *z);
            if ((*x).pres.find(temp_bb) == (*x).pres.end())
            {
                new_bb->preds.insert(*z);
                temp_bb->next.erase((*x).begin->index);
                nextEdge nn;
                nn.index = new_index;
                temp_bb->next[new_index] = nn;

                for (auto qqq = temp_bb->end; qqq != temp_bb->begin; qqq = qqq->prior)
                {
                    if (qqq->op == IR_GOTO && qqq->opn1.id == (*x).begin->begin->opn1.id)
                    {

                        qqq->opn1.id = new_label;
                        break;
                    }
                    if ((qqq->op == IR_GOTO_EQ || qqq->op == IR_GOTO_NEQ) && qqq->result.id == (*x).begin->begin->opn1.id)
                    {

                        qqq->result.id = new_label;
                        break;
                    }
                }
            }
        }
        (*x).begin->preds.clear();
        for (auto j : (*x).pres)
        {
            (*x).begin->preds.insert(j->index);
        }
        (*x).begin->preds.insert(new_index);
        nextEdge nn;
        nn.index = (*x).begin->index;
        new_bb->next[(*x).begin->index] = nn;

        add_dom(new_bb, (*x).begin);
        // add_loop
        for (auto it = loops.begin(); it != loops.end(); it++)
        {
            if ((*it).loop_bb.find((*x).begin) != (*it).loop_bb.end() && (*it).begin->index != (*x).begin->index)
            {
                (*it).loop_bb.insert(new_bb);
            }
        }
        //
        for (auto ns : (*x).phi_define)
        {
            string s = ns.first;
            string pname = g_sL.find(s)->alias;
            for (int i = 0; i < g_bbL.find(g_sL.now_func, g_ssaS.find(g_sL.now_func, pname)->NName2PhiB[s])->phi_nodes[pname].size(); i++)
            {
                int index = g_bbL.find(g_sL.now_func, g_ssaS.find(g_sL.now_func, pname)->NName2PhiB[s])->phi_nodes[pname][i].index;
                if (index == (*x).begin->index)
                {
                    g_bbL.find(g_sL.now_func, g_ssaS.find(g_sL.now_func, pname)->NName2PhiB[s])->phi_nodes[pname][i].index = new_bb->index;
                    g_bbL.find(g_sL.now_func, g_ssaS.find(g_sL.now_func, pname)->NName2PhiB[s])->phi_nodes[pname][i].new_name = s;
                    g_bbL.find(g_sL.now_func, g_ssaS.find(g_sL.now_func, pname)->NName2PhiB[s])->phi_nodes[pname][i].phiIRSite = ns.second;
                }
            }
        }

        for (auto u = (*x).lcm_codes.begin(); u != (*x).lcm_codes.end(); u++)
        {
            newlabelnode = merge(2, newlabelnode, (*u));
        }

        t = (*x).begin->begin->prior;
        split(t, (*x).begin->begin);
        t = merge(3, t, newlabelnode, (*x).begin->begin);
        new_bb->end = (*x).lcm_codes[(*x).lcm_codes.size() - 1];

        g_bbL.glo_list[(*x).func_name].insert(make_pair(new_bb->index, new_bb));
    }
}

void lcm()
{
    loopsInit();
    code_motion();
    // DisplayLoopsList();
    //   DisplayBBList();
}