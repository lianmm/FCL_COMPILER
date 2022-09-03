#ifndef CF_H
#define CF_H
#include <unordered_set>
#include "bb.h"
#include <queue>

using namespace std;

struct tree_node
{
    int index;
    tree_node *prior;
    tree_node *dfs_next;
};

extern unordered_map<string, tree_node *> func_tree;

extern unordered_set<int> init_D;
void GenCFGTree();

void RunCFG();

#endif //