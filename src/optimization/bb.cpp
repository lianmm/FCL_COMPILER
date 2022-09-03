#include "../../include/optimization/bb.h"
using namespace std;

class glo_bb_list g_bbL;

struct basic_block nullblock;

struct basic_block *glo_bb_list::find(string funcid, int bindex)
{

    nullblock.begin = NULL, nullblock.end = NULL;
    nullblock.preds.clear(), nullblock.next.clear();
    nullblock.dominators.clear(), nullblock.df.clear();
    nullblock.index = -2;
    nullblock.size = 0;
    if (bindex == -1 && g_bbL.glo_list.find("glo") == g_bbL.glo_list.end())
    {
        // printf("此函数不存在全局变量！\n");
        return &nullblock;
    }
    else if (bindex == -1 && g_bbL.glo_list["glo"][-1] != NULL)
    {
        return g_bbL.glo_list["glo"][-1];
    }
    if (g_bbL.glo_list.size() == 0)
    {
        // cout << funcid << "\t" << bindex << "\t全局表是空的！\n";
        return &nullblock;
    }
    else if (g_bbL.glo_list.find(funcid) == g_bbL.glo_list.end())
    {
        // cout << funcid << "\t" << bindex << "\t无此函数！\n";
        return &nullblock;
    }
    else if (g_bbL.glo_list[funcid].find(bindex) == g_bbL.glo_list[funcid].end())
    {
        // cout << funcid << "\t" << bindex << "\t函数中无此块！\n";
        return &nullblock;
    }
    else if (g_bbL.glo_list[funcid][bindex] == NULL)
    {
        cout << funcid << "\t" << bindex << "\t此块是空块！\n";
        return &nullblock;
    }
    else
    {
        return g_bbL.glo_list[funcid][bindex];
    }
}

void DisplayBBList()
{
    printf("\n--------------------bblist--------------------\n");
    if (g_bbL.glo_list.size() > 0)
    { // auto效率比较低，但打印函数最终代码中不执行。

        for (auto it = g_bbL.glo_list.begin(); it != g_bbL.glo_list.end(); it++)
        {
            cout << it->first << "\n-------------------------------------\n";
            if (it->second.size() > 0)
            {
                //广度优先图上遍历；
                unordered_set<int> uniqueB;
                queue<int> BQ;
                BQ.push(0);
                while (BQ.size() != 0)
                {
                    //当前出队；
                    int curS = BQ.front();
                    BQ.pop();

                    //后继入队；
                    auto itnexS = g_bbL.find(it->first, curS)->next.begin();
                    for (; itnexS != g_bbL.find(it->first, curS)->next.end(); itnexS++)
                    {
                        if (uniqueB.find(itnexS->first) != uniqueB.end())
                        {
                            continue;
                        }
                        uniqueB.emplace(itnexS->first);
                        BQ.push(itnexS->first);
                    }
                    basic_block *curB = g_bbL.find(it->first, curS);
                    //当前处理；
                    if (curB == NULL)
                    {
                        printf("error!空块！！\n");
                        continue;
                    }
                    cout << curS << "\t.L" << curB->index << "\t" << curB->size << "\t";
                    if (curB->begin == NULL || curB->end == NULL)
                    {
                        printf("error!空块！！\n");
                        continue;
                    }

                    cout << "b:" << IR_op_strs[curB->begin->op] << "\te:" << IR_op_strs[curB->end->op] << "\t";
                    cout << "\nlevel: " << curB->level << "\tCflag:" << curB->ConditionFlag << endl;
                    if (curB->preds.size() > 0)
                    {
                        cout << "\n\tpreds:";
                        for (auto it3 = curB->preds.begin(); it3 != curB->preds.end(); it3++)
                        {
                            cout << "\t" << *it3;
                        }
                    }
                    if (curB->next.size() > 0)
                    {
                        cout << "\n\tnext:";
                        for (auto it3 = curB->next.begin(); it3 != curB->next.end(); it3++)
                        {
                            cout << "\t" << it3->first;
                        }
                    }

                    cout << "\nCFG:";
                    cout << "\n\tpreTNode:" << curB->preTNode << "\tgfs_next:" << curB->dfsNext;
                    if (curB->dominators.size() > 0)
                    {
                        cout << "\n\tdominators:";
                        for (auto it3 = curB->dominators.begin(); it3 != curB->dominators.end(); it3++)
                        {
                            cout << "\t" << *it3;
                        }
                    }

                    if (curB->idom.size() > 0)
                    {
                        cout << "\n\tidom:";
                        for (auto it3 = curB->idom.begin(); it3 != curB->idom.end(); it3++)
                        {
                            cout << "\t" << *it3;
                        }
                    }

                    if (curB->idomS.size() > 0)
                    {
                        cout << "\n\tidomS:";
                        for (auto it3 = curB->idomS.begin(); it3 != curB->idomS.end(); it3++)
                        {
                            cout << "\t" << *it3;
                        }
                    }

                    if (curB->df.size() > 0)
                    {
                        cout << "\n\tdf:";
                        for (auto it3 = curB->df.begin(); it3 != curB->df.end(); it3++)
                        {
                            cout << "\t" << *it3;
                        }
                    }

                    cout << "\nSSA:";
                    if (curB->alive_V.size() > 0)
                    {
                        cout << "\n\talive_V:";
                        for (auto it3 = curB->alive_V.begin(); it3 != curB->alive_V.end(); it3++)
                        {
                            cout << "\t" << it3->first << ":" << it3->second;
                        }
                    }

                    if (curB->alive_VB.size() > 0)
                    {
                        cout << "\n\talive_VB:";
                        for (auto it3 = curB->alive_VB.begin(); it3 != curB->alive_VB.end(); it3++)
                        {
                            cout << "\t" << it3->first << ":" << it3->second;
                        }
                    }

                    if (curB->phi_nodes.size() > 0)
                    {
                        cout << "\n\tphi_func:\n";
                        for (auto it3 = curB->phi_nodes.begin(); it3 != curB->phi_nodes.end(); it3++)
                        {
                            cout << "\t" << it3->first << ":" << endl;
                            for (auto it4 = it3->second.begin(); it4 != it3->second.end(); it4++)
                            {
                                cout << "\t\tbindex:" << it4->index << " new_name:" << it4->new_name;
                            }
                            cout << endl;
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

void funcDBBlock(codenode *begin, codenode *end)
{
    codenode *cur = begin->next;
    int i;
    string funcid = begin->opn1.id;
    bool boom_flag = 0;
    for (i = 0; cur != end; cur = cur->next, i++)
    {

        if (cur == begin->next && cur->op != IR_LABEL)
        {
            struct basic_block *tmpb = new basic_block();
            tmpb->index = 0;
            tmpb->begin = cur;
            if (out_IR->op != IR_FUNCTION)
            {
                tmpb->preds.insert(-1);
            }
            g_bbL.last_block = 0;
            g_bbL.glo_list[funcid][0] = tmpb; //注意只有到全局的前驱指针，而全局块无后继。
        }
        else if (cur == begin->next && cur->op == IR_LABEL && boom_flag == 0)
        {
            struct basic_block *tmpb = new basic_block();
            nextEdge tmpE;
            tmpE.index = L2i(cur->opn1.id.c_str());
            tmpE.gotoCode = begin;
            tmpb->index = 0;
            tmpb->begin = cur->prior;
            if (out_IR->op != IR_FUNCTION)
            {
                tmpb->preds.insert(-1);
            }
            g_bbL.last_block = 0;
            g_bbL.glo_list[funcid][0] = tmpb; //注意只有到全局的前驱指针，而全局块无后继。
            g_bbL.glo_list[funcid][0]->next[L2i(cur->opn1.id.c_str())] = tmpE;
            cur = cur->prior;
            boom_flag = 1;
        }

        else if (cur->op == IR_LABEL && cur->prior->op == IR_LABEL)
        {
            // g_bbL.glo_list[funcid][L2i(cur->opn1.id.c_str())] = g_bbL.glo_list[funcid][g_bbL.last_block]; //多个label，则块指针指向第一个的基本块。
        }

        else if (cur->op == IR_LABEL)
        {

            codenode *now = cur->next;
            while (now->op == IR_LABEL) //如果多label，则生效，否则自动跳过。
            {

                now = now->next;
            }
            now = now->prior; //最后一个标签；
            struct basic_block *tmpb = new basic_block();
            tmpb->index = L2i(now->opn1.id.c_str());

            if (tmpb->index > g_bbL.max_index[funcid])
                g_bbL.max_index[funcid] = tmpb->index;

            tmpb->begin = now;

            // goto只维护后继，不维护前驱。如果第一次遍历是正向，则顺便维护，否则再遍历一次基本块。
            if (cur->prior->op == IR_GOTO)
            {
                codenode *tmp = cur->prior;
                // cout << cur->prior->opn1.id << L2i(cur->prior->opn1.id.c_str()) << endl;
                while (tmp->op == IR_GOTO)
                    tmp = tmp->prior;
                tmp = tmp->next;
                nextEdge tmpNe;
                tmpNe.gotoCode = tmp, tmpNe.index = L2i(tmp->opn1.id.c_str());
                g_bbL.glo_list[funcid][g_bbL.last_block]->next[tmpNe.index] = tmpNe;
                g_bbL.glo_list[funcid][g_bbL.last_block]->end = tmp;
                codenode *gotoe = tmp->prior;

                while (gotoe->op != IR_GOTO_EQ && gotoe->op != IR_GOTO_NEQ && gotoe->op != IR_LABEL)
                {
                    gotoe = gotoe->prior;
                }

                if (gotoe->op == IR_GOTO_EQ || gotoe->op == IR_GOTO_NEQ)
                {
                    tmpNe.gotoCode = gotoe, tmpNe.index = L2i(gotoe->result.id.c_str());

                    g_bbL.glo_list[funcid][g_bbL.last_block]->next[tmpNe.index] = tmpNe;
                }
            }
            else if (cur->prior->op == IR_GOTO_EQ || cur->prior->op == IR_GOTO_NEQ)
            {
                nextEdge tmpNe;

                tmpNe.gotoCode = cur->prior, tmpNe.index = L2i(cur->prior->result.id.c_str());

                g_bbL.glo_list[funcid][g_bbL.last_block]->next[tmpNe.index] = tmpNe;
                g_bbL.glo_list[funcid][g_bbL.last_block]->end = cur->prior;
            }
            else
            { //上一个块是顺序延伸。维护前驱和后继。
                nextEdge tmpNe;
                // codenode *oneir = mkIR(IR_GOTO);
                // oneir->opn1 = now->opn1;
                // split(out_IR, now), merge(3, out_IR, oneir, now);
                tmpNe.gotoCode = NULL;
                tmpNe.index = L2i(now->opn1.id.c_str());

                g_bbL.glo_list[funcid][g_bbL.last_block]->next[tmpNe.index] = tmpNe;
                tmpb->preds.insert(g_bbL.last_block);
                g_bbL.glo_list[funcid][g_bbL.last_block]->end = cur->prior;
            }

            g_bbL.glo_list[funcid][L2i(now->opn1.id.c_str())] = tmpb;
            // g_bbL.glo_list[funcid][L2i(now->opn1.id.c_str())]->preds.emplace(g_bbL.last_block);

            g_bbL.last_block = tmpb->index;

            codenode *last = now->prior;
            while (last->op == IR_LABEL) //如果多label，则生效，否则自动跳过。
            {
                g_bbL.glo_list[funcid][L2i(last->opn1.id.c_str())] = g_bbL.glo_list[funcid][g_bbL.last_block]; //多个label，则块指针指向第一个的基本块。
                last = last->prior;
            }
        }
    }
    g_bbL.glo_list[funcid][g_bbL.last_block]->end = end; //最后的基本块直接指到函数终止。
}

// label从1开始，0是当前函数首块，-1是全局变量块。
void DivideBasicBlock()
{
    class codenode *h = out_IR, *cur = h;

    if (h->op != IR_FUNCTION)
    {
        struct basic_block *tmpb = new basic_block;
        tmpb->begin = h;
        tmpb->index = -1;
        // tmpb->next.emplace(0);
        g_bbL.glo_list[(string) "glo"][-1] = tmpb;
        cur = cur->next;
        while (1)
        {
            if (cur->op == IR_FUNCTION)
            {
                g_bbL.glo_list[(string) "glo"][-1]->end = cur->prior;
                break;
            }
            cur = cur->next;
        }
    }

    auto it = g_sL.glo_ymT.begin();
    for (; it != g_sL.glo_ymT.end(); it++)
    {
        if (it->second.flag != 'F')
            continue;
        if (it->second.code_b == NULL || it->second.code_e == NULL)
            continue;
        if (h->op != IR_FUNCTION)
        {
            // g_bbL.glo_list[(string)"glo"][-1]->next.emplace(0);

            g_bbL.glo_list[it->first][-1] = g_bbL.glo_list[(string) "glo"][-1]; //局部加一个块指针指向全局的全局变量块，防止局部查不到出错。
            g_bbL.last_block = -1;
        }
        funcDBBlock(it->second.code_b, it->second.code_e);
    }
}

//块折叠：删除无效块，删除无效标签代码。
void BBFold(int rtime)
{
    std::unordered_map<string, unordered_map<int, struct basic_block *>>::iterator it = g_bbL.glo_list.begin();
    for (; it != g_bbL.glo_list.end(); it++)
    {
        string funcid = it->first;
        std::unordered_map<int, struct basic_block *>::iterator it2 = it->second.begin();
        for (; it2 != it->second.end(); it2++)
        {
            if (it2->second->next.size() > 0)
            {
                auto it3 = it2->second->next.begin();
                for (; it3 != it2->second->next.end();)
                {

                    if (it3->first != g_bbL.glo_list[funcid][it3->first]->index) //无效标签；
                    {
                        int toB = g_bbL.glo_list[funcid][it3->first]->index;
                        while (g_bbL.find(funcid, toB)->begin->next->op == IR_GOTO || toB != g_bbL.find(funcid, toB)->index)
                        {
                            if (g_bbL.find(funcid, toB)->begin->next->op == IR_GOTO)
                            {
                                toB = (g_bbL.find(funcid, toB)->next.begin())->first;
                            }
                            else if (toB != g_bbL.find(funcid, toB)->index)
                            {
                                toB = g_bbL.find(funcid, toB)->index;
                            }
                        }
                        //指令修改；
                        codenode *cur = it2->second->end;
                        struct nextEdge tmpE;
                        tmpE.index = toB;
                        if (cur->op == IR_GOTO)
                        {
                            if (L2i(cur->opn1.id.c_str()) == it3->first)
                            {

                                cur->opn1.id = ".L" + to_string(toB);
                                tmpE.gotoCode = cur;
                            }

                            if (cur->prior->op == IR_GOTO_EQ || cur->prior->op == IR_GOTO_NEQ)
                            {
                                if (L2i(cur->prior->result.id.c_str()) == it3->first)
                                {
                                    cur->prior->result.id = ".L" + to_string(toB);
                                    tmpE.gotoCode = cur->prior;
                                }
                            }
                        }
                        else if (cur->op == IR_GOTO_EQ || cur->op == IR_GOTO_NEQ)
                        {
                            if (L2i(cur->result.id.c_str()) == it3->first)
                            {
                                cur->result.id = ".L" + to_string(toB);
                                tmpE.gotoCode = cur;
                            }
                        }
                        else
                        {
                            codenode *oneIR = mkIR(IR_GOTO);
                            oneIR->opn1.id = ".L" + to_string(toB);
                            oneIR->opn1.type = 'v', oneIR->opn1.kind = 'L';
                            split(out_IR, cur->next), merge(3, out_IR, oneIR, cur->next);
                            tmpE.gotoCode = oneIR;
                            it2->second->end = oneIR;
                        }

                        //前驱后继维护；
                        g_bbL.glo_list[funcid][toB]->preds.emplace(it2->second->index);
                        int ti = (it3->first);
                        // if (ti == 1161)
                        // {
                        //     cout << it2->first << endl;
                        //     for (auto nit = it2->second->next.begin(); nit != it2->second->next.end(); nit++)
                        //     {
                        //         cout << "\t" << *nit;
                        //     }
                        //     cout << endl;
                        // }

                        it2->second->next[toB] = tmpE;

                        it3++;
                        it2->second->next.erase(ti);
                        // if (ti == 1161)
                        // {
                        //     cout << it2->first << endl;
                        //     for (auto nit = it2->second->next.begin(); nit != it2->second->next.end(); nit++)
                        //     {
                        //         cout << "\t" << *nit;
                        //     }
                        //     cout << endl;
                        // }
                        continue;
                    }

                    if (g_bbL.glo_list[funcid][it3->first]->begin->next->op == IR_GOTO) //只有跳转语句的无效块；
                    {
                        //指令修改；
                        codenode *cur = it2->second->end;
                        nextEdge tmpE;
                        int toB = g_bbL.glo_list[funcid][it3->first]->index;

                        while (g_bbL.find(funcid, toB)->begin->next->op == IR_GOTO || toB != g_bbL.find(funcid, toB)->index)
                        {
                            if (g_bbL.find(funcid, toB)->begin->next->op == IR_GOTO)
                            {
                                toB = (g_bbL.find(funcid, toB)->next.begin())->first;
                            }
                            else if (toB != g_bbL.find(funcid, toB)->index)
                            {
                                toB = g_bbL.find(funcid, toB)->index;
                            }
                        }
                        tmpE.index = toB;

                        if (cur->op == IR_GOTO)
                        {
                            if (L2i(cur->opn1.id.c_str()) == it3->first)
                            {
                                cur->opn1.id = g_bbL.find(funcid, toB)->begin->opn1.id;
                                tmpE.gotoCode = cur;
                            }

                            if (cur->prior->op == IR_GOTO_EQ || cur->prior->op == IR_GOTO_NEQ)
                            {
                                if (L2i(cur->prior->result.id.c_str()) == it3->first)
                                {
                                    cur->prior->result.id = g_bbL.find(funcid, toB)->begin->opn1.id;
                                    tmpE.gotoCode = cur->prior;
                                }
                            }
                        }
                        else if (cur->op == IR_GOTO_EQ || cur->op == IR_GOTO_NEQ)
                        {
                            if (L2i(cur->result.id.c_str()) == it3->first)
                            {
                                cur->result.id = g_bbL.find(funcid, toB)->begin->opn1.id;
                                tmpE.gotoCode = cur;
                            }
                        }
                        // else
                        // {
                        //     codenode *oneIR = mkIR(IR_GOTO);
                        //     oneIR->opn1.id = ".L" + to_string(toB);
                        //     oneIR->opn1.type = 'v', oneIR->opn1.kind = 'L';
                        //     split(out_IR, cur->next), merge(3, out_IR, oneIR, cur->next);
                        //     tmpE.gotoCode = oneIR;
                        //     it2->second->end = oneIR;
                        // }

                        //前驱后继维护；
                        g_bbL.glo_list[funcid][L2i(g_bbL.find(funcid, toB)->begin->opn1.id.c_str())]->preds.emplace(it2->second->index);
                        int ti = (it3->first);
                        it2->second->next[L2i(g_bbL.find(funcid, toB)->begin->opn1.id.c_str())] = tmpE;
                        it3++;
                        it2->second->next.erase(ti);
                        continue;
                    }

                    //正常跳转维护前驱；
                    if (g_bbL.find(funcid, it3->first)->index != -2)
                        g_bbL.find(funcid, it3->first)->preds.emplace(it2->second->index);
                    it3++;
                }
                // if (it2->second->end->op != IR_GOTO && it2->second->end->op != IR_GOTO_EQ && it2->second->end->op != IR_GOTO_NEQ && it2->second->end->op != IR_FUNC_END && it2->second->begin != it2->second->end)
                // {
                //     if (it2->second->next.size() == 0)
                //     {
                //         cout << "存在无后继块！" << endl;
                //         return;
                //     }
                //     int toB = it2->second->next.begin()->first;
                //     codenode *oneIR = mkIR(IR_GOTO);
                //     oneIR->opn1.id = ".L" + to_string(toB);
                //     oneIR->opn1.type = 'v', oneIR->opn1.kind = 'L';
                //     split(out_IR, it2->second->end->next), merge(3, out_IR, oneIR, it2->second->end->next);
                //     it2->second->next[toB].gotoCode = oneIR;
                //     it2->second->end = oneIR;
                // }
            }
        }
        it2 = it->second.begin();

        for (; it2 != it->second.end();)
        {
            it2->second->level = it2->second->begin->level + 1;

            if (it2->first != it2->second->index) //删除多标签块指针；
            {
                //删指令；
                // codenode *pre = it2->second->begin->prior;
                // while (pre->op == IR_LABEL)
                // {
                //     pre->op = IR_VOID;
                //     pre = pre->prior;
                // }

                //删除块；
                it2->second = NULL;
                int ts = it2->first;
                it2++;
                g_bbL.glo_list[funcid].erase(ts);
                continue;
            }
            if (it2->second->begin->next->op == IR_GOTO && it2->second->index != 0) //删除无效块；
            {
                // it2->second->begin->op = IR_VOID;
                // it2->second->begin->next->op = IR_VOID;

                //维护循环表；
                if (wL[funcid].find((it2->first) - 2) != wL[funcid].end())
                {
                    wL[funcid][(it2->first) - 2] = L2i(it2->second->begin->next->opn1.id.c_str());
                }

                g_bbL.find(funcid, (it2->second->next.begin())->first)->preds.erase(it2->first);
                it2->second->begin = NULL;
                it2->second->end = NULL;
                delete it2->second;
                it2->second = NULL;
                int ts = it2->first;
                it2++;
                g_bbL.glo_list[funcid].erase(ts);
                continue;
            }
            it2++;
        }
    }
}

//预先删除块间无条件跳转之后的无效代码；
void BBClean()
{
    codenode *Goto = out_IR, *Label = out_IR, *cur = out_IR->next;
    for (; cur != out_IR; cur = cur->next)
    {
        if (cur->op == IR_GOTO)
        {
            Goto = cur;
            codenode *now = cur->next;
            while (now->op != IR_LABEL && now != out_IR)
                now = now->next;
            Label = now;
            if (Goto->op == IR_GOTO && Label->op == IR_LABEL)
            {
                split(out_IR, Label), split(out_IR, Goto->next);
                merge(2, out_IR, Label);
            }
            cur = now;
        }
        if (cur->op == IR_LABEL && cur->prior->op != IR_GOTO && cur->next->op != IR_LABEL)
        {
            codenode *oneIR = mkIR(IR_GOTO);
            oneIR->opn1.id = cur->opn1.id;
            oneIR->opn1.type = 'v', oneIR->opn1.kind = 'L';
            split(out_IR, cur), merge(3, out_IR, oneIR, cur);
        }
    }
}

//维护whileList表
void makeWhileList()
{
    for (auto itf = wL.begin(); itf != wL.end(); itf++)
    {
        for (auto itw = wL[itf->first].begin(); itw != wL[itf->first].end(); itw++)
        {
            itw->second = (g_bbL.find(itf->first, itw->second))->index;
        }
    }
}

void BBInit(int runtime)
{
    if (runtime == 1) //只第一次运行时代码清理；
    {
        BBClean();
    }
    DivideBasicBlock();
    if (runtime == 1) //只第一次运行时代码清理；
        BBFold(runtime);
}