#ifndef SRA_H
#define SRA_H
#include "sscp.h"

class VStruct
{
public:
    string VarName;
    set<prSite> genSite;
    set<prSite> useSite;
    opn *lastUse;
    codenode *lastcode;
    int lastSite = 0;
    VStruct()
    {
        genSite.clear();
        useSite.clear();
        lastSite = 0;
        lastcode = NULL;
        lastUse = NULL;
    }
    void insUseSite(codenode *C, opn *O, int index)
    {
        struct prSite pr;
        pr.codePr = C, pr.opnPr = O;
        pr.Site = index;
        pr.localBB = pr.codePr->localBB;
        useSite.emplace(pr);
    }
    void insGenSite(codenode *C, opn *O, int index)
    {
        struct prSite pr;
        pr.codePr = C, pr.opnPr = O;
        pr.Site = index;
        pr.localBB = pr.codePr->localBB;
        genSite.emplace(pr);
    }
};

class BStruct
{
public:
    int index;
    unordered_set<string> gVNames;
    BStruct()
    {
        gVNames.clear();
    }
};

class FStruct
{
public:
    unordered_map<string, class VStruct> VList;
    unordered_map<int, class BStruct> BList;
};

class GloSRAStruct
{
public:
    string now_func;
    unordered_map<string, FStruct> FList;
    struct VStruct *find(string var);
    class BStruct *find(int BB);
    void insertg(struct codenode *C, struct opn *O, int index);
    void insertu(struct codenode *C, struct opn *O, int index);
    void Display();
};

extern GloSRAStruct g_sraS;

void add_ldrrS_IR(struct codenode *head, struct opn *O);

void add_strSr_IR(struct codenode *head, struct opn *O);

void add_movrd_IR(struct codenode *head, struct opn *O);

void add_movdr_IR(struct codenode *head, struct opn *O);

void StaticRisAlloc();
void DisplaySRAStruct();
#endif //
