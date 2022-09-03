#include "../../include/optimization/control_flow.h"
using namespace std;

unordered_map<string, tree_node *> func_tree;

unordered_set<int> init_D;

void intersection(unordered_set<int> &a, unordered_set<int> &b)
{
    // cout << "求交集：";

    // for (auto it = a.begin(); it != a.end(); it++)
    // {
    //     cout << "\t" << *it;
    // }
    // cout << "\n";
    // for (auto it = b.begin(); it != b.end(); it++)
    // {
    //     cout << "\t" << *it;
    // }
    // cout << "\n";
    for (auto it = a.begin(); it != a.end();)
    {
        if (b.find(*it) == b.end())
        {
            int ti = *it;
            it++;
            a.erase(ti);
            continue;
        }
        it++;
    }
    // for (auto it = a.begin(); it != a.end(); it++)
    // {
    //     cout << "\t" << *it;
    // }
    // cout << "\n";
}

inline bool equal_uset(unordered_set<int> &a, unordered_set<int> &b)
{
    // cout << "比较集合：" << a.size() << "\t" << b.size() << endl;

    if (a.size() != b.size())
        return false;

    // for (auto it = a.begin(); it != a.end(); it++)
    // {
    //     cout << "\t" << *it;
    // }
    // cout << endl;
    // for (auto it = b.begin(); it != b.end(); it++)
    // {
    //     cout << "\t" << *it;
    // }
    // cout << endl;

    unordered_set<int>::iterator it;
    for (it = a.begin(); it != a.end(); it++)
    {
        if (b.find(*it) == b.end())
            return false;
    }
    return true;
}

bool S2USBelongr(string fid, set<int> *a, int X)
{
    for (auto it = a->begin(); it != a->end(); it++)
    {
        if (g_bbL.find(fid, *it)->dominators.find(X) == g_bbL.find(fid, *it)->dominators.end())
            return false;
    }
    return true;
}

// 1.图上遍历生成深度优先生成树；
void dfs(string fid, int cur, int p, unordered_set<int> *UTN)
{
    // //处理；
    if (UTN->find(cur) == UTN->end())
    {
        g_bbL.find(fid, cur)->preTNode = p;
        g_bbL.find(fid, g_bbL.last_block)->dfsNext = cur;
        g_bbL.last_block = cur;
        g_bbL.find(fid, cur)->dominators = g_bbL.find(fid, p)->dominators;
        g_bbL.find(fid, cur)->dominators.emplace(cur);
        UTN->emplace(cur);
        if (g_bbL.find(fid, cur)->next.size() > 0)
        {
            for (auto it = g_bbL.find(fid, cur)->next.begin(); it != g_bbL.find(fid, cur)->next.end(); it++)
            {
                dfs(fid, it->first, cur, UTN);
            }
        }
    }
}

void GenCFGTree()
{
    auto it = g_bbL.glo_list.begin();
    for (; it != g_bbL.glo_list.end(); it++)
    {
        if (it->first == "glo")
            continue;
        g_bbL.last_block = -1;
        unordered_set<int> unique_tnode;
        dfs(it->first, 0, -1, &unique_tnode);
        g_bbL.find(it->first, g_bbL.last_block)->dfsNext = 0;
    }
}

// 2.计算DOM支配结点；
void funcSetDom(string fid)
{
    basic_block *X = g_bbL.find(fid, 0);
    X = g_bbL.find(fid, X->dfsNext);
    for (; X->index != 0; X = g_bbL.find(fid, X->dfsNext))
    {
        if (X->index == 0)
            continue;
        auto P = g_bbL.find(fid, X->index)->preds.begin();
        for (; P != g_bbL.find(fid, X->index)->preds.end(); P++)
        {
            intersection(X->dominators, g_bbL.find(fid, *P)->dominators);
            if (*P == 0)
                break;
        }
        X->dominators.emplace(X->index);
    }
}

void SetDominators()
{
    auto it = g_bbL.glo_list.begin();
    for (; it != g_bbL.glo_list.end(); it++)
    {
        if (it->first != "glo")
        {
            funcSetDom(it->first);
        }
    }
}

// 3.计算idom直接支配结点；
void set_iDom()
{

    std::unordered_map<string, unordered_map<int, struct basic_block *>>::iterator it = g_bbL.glo_list.begin();
    for (; it != g_bbL.glo_list.end(); it++) //遍历所有函数；
    {
        if (it->first != "glo")
        {
            string fid = it->first;
            std::unordered_map<int, struct basic_block *>::iterator it2 = it->second.begin();
            for (; it2 != it->second.end(); it2++) //遍历所有结点；
            {
                if (it2->second->index == 0)
                    continue;

                it2->second->dominators.erase(it2->first);

                for (auto it3 = it2->second->dominators.begin(); it3 != it2->second->dominators.end(); it3++)
                {
                    // cout << it2->first << "\t" << *it3 << endl;
                    if (equal_uset(g_bbL.find(fid, *it3)->dominators, it2->second->dominators))
                    {
                        it2->second->idom.emplace(*it3);
                        g_bbL.find(fid, *it3)->idomS.emplace(it2->first);
                    }
                }
                it2->second->dominators.emplace(it2->first);
            }
        }
    }

} // l

// 4.计算df支配边界结点；
void funcSetDF(string fid, int curX)
{
    std::unordered_map<int, struct basic_block *>::iterator itY = g_bbL.glo_list[fid].begin();
    for (; itY != g_bbL.glo_list[fid].end(); itY++) //遍历所有结点；
    {
        int curY = itY->first;
        if (itY->second->idom.find(curX) != itY->second->idom.end())
        {
            funcSetDF(fid, curY);
        }
    }
    g_bbL.find(fid, curX)->df.clear();

    //广度优先图上遍历；
    unordered_set<int> uniqueB;
    queue<int> BQ;
    BQ.push(curX);

    int tmp_c = 0;

    while (BQ.size() != 0)
    {
        //当前出队；
        int curS = BQ.front();
        BQ.pop();

        //后继入队；
        auto itnexS = g_bbL.find(fid, curS)->next.begin();
        for (; itnexS != g_bbL.find(fid, curS)->next.end(); itnexS++)
        {
            if (uniqueB.find(itnexS->first) != uniqueB.end())
            {
                continue;
            }
            uniqueB.emplace(itnexS->first);
            BQ.push(itnexS->first);
        }

        //当前处理；
        if (tmp_c == 1)
        {
            if (g_bbL.find(fid, curS)->idom.find(curX) == g_bbL.find(fid, curS)->idom.end() && g_bbL.find(fid, curS)->preds.size() > 1 && !S2USBelongr(fid, &g_bbL.find(fid, curS)->preds, curX))
            {
                g_bbL.find(fid, curX)->df.emplace(curS);
            }
        }
        else
        {
            tmp_c = 1;
        }
    }
    itY = g_bbL.glo_list[fid].begin();

    for (; itY != g_bbL.glo_list[fid].end(); itY++) //遍历所有结点；
    {
        int curY = itY->first;
        if (itY->second->idom.find(curX) != itY->second->idom.end() && itY->second->df.size() > 0)
        {
            std::unordered_map<int, struct basic_block *>::iterator itZ = g_bbL.glo_list[fid].begin();
            for (; itZ != g_bbL.glo_list[fid].end(); itZ++)
            {
                if (itY->second->df.find(itZ->first) != itY->second->idom.end() && itZ->second->idom.find(curX) == itZ->second->idom.end() && itZ->second->preds.size() > 1 && !S2USBelongr(fid, &itZ->second->preds, curX))
                {
                    g_bbL.find(fid, curX)->df.emplace(itZ->first);
                }
            }
        }
    }
} // l

void GloSetDF()
{

    std::unordered_map<string, unordered_map<int, struct basic_block *>>::iterator it = g_bbL.glo_list.begin();
    for (; it != g_bbL.glo_list.end(); it++) //遍历所有函数；
    {
        if (it->first != "glo")
        {
            funcSetDF(it->first, 0); //递归函数模块化出来；
        }
    }

} // l

void RunCFG()
{
    GenCFGTree();
    SetDominators();
    set_iDom();
    GloSetDF();
}
