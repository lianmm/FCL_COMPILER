#include "../../include/optimization/func_inline.h"
using namespace std;
const int limit = 300;
class FIGStruct g_ffS;
void FIGStruct::display()
{
    cout << "------------------FIList-------------------------\n";

    for (auto itf = FList.begin(); itf != FList.end(); itf++)
    {
        cout << itf->first << ":\n";

        for (auto itl = itf->second.callList.begin(); itl != itf->second.callList.end(); itl++)
        {
            cout << "callFuc: " << itl->callFunc << endl;
            if (itl->callCode != NULL)
                cout << "callCode: " << IR_op_strs[itl->callCode->op] << endl;
            if (itl->retOpn != NULL)
                cout << "retOpn: " << itl->retOpn->id << endl;
            cout << "\targCode:" << endl;
            for (int i = 0; i < itl->argCode.size(); i++)
            {
                if (itl->argCode[i] != NULL)
                    cout << "\t" << IR_op_strs[itl->argCode[i]->op] << "\t" << itl->argCode[i]->opn1.id << endl;
            }

            cout << "pre2new:\n";
            for (auto itv = itl->pre2new.begin(); itv != itl->pre2new.end(); itv++)
            {
                cout << itv->first << ":" << itv->second.id << "\t";
            }
            cout << endl;
        }
    }
    cout << "-------------------------------------------------\n";
}

void FIFStruct::callInit()
{
    //代码扫描；
    codenode *begin = g_sL.find(Fid)->code_b, *end = g_sL.find(Fid)->code_e, *cur = begin;
    for (; cur != end; cur = cur->next)
    {
        switch (cur->op)
        {
        case IR_PARAM:
        {
            paraOpn.push_back(&cur->opn1);
            break;
        }
        case IR_CALL:
        {
            if (g_sL.glo_ymT[cur->opn1.id].code_b != NULL)
            {
                CallStuct CS;
                CS.callCode = cur;
                CS.callFunc = cur->opn1.id;
                CS.retOpn = &cur->result;

                if (g_sL.find(CS.callFunc)->paramnum > 0)
                {
                    //首参设置；
                    cur = cur->prior;
                    CS.argCode.push_back(cur);

                    //后继参数设置；
                    cur = cur->prior;
                    for (codenode *now = cur; now->op == IR_ARG; now = now->prior)
                    {
                        auto it = CS.argCode.begin();
                        it++;
                        CS.argCode.emplace(it, now);
                    }
                    cur = cur->next->next;
                }

                callList.emplace(CS);
                callIdList.emplace(CS.callFunc);
            }
            break;
        }
        case IR_CALL_VOID:
        {
            if (g_sL.glo_ymT[cur->opn1.id].code_b != NULL)
            {
                CallStuct CS;
                CS.callCode = cur;
                CS.callFunc = cur->opn1.id;
                CS.retOpn = &cur->result;
                CS.retOpn->type = '0', CS.retOpn->id = "void";

                if (g_sL.find(CS.callFunc)->paramnum > 0)
                {
                    cur = cur->prior;
                    CS.argCode.push_back(cur);

                    cur = cur->prior;
                    for (codenode *now = cur; now->op == IR_ARG; now = now->prior)
                    {
                        auto it = CS.argCode.begin();
                        it++;
                        CS.argCode.emplace(it, now);
                    }
                    cur = cur->next->next;
                }
                callIdList.emplace(CS.callFunc);
                callList.emplace(CS);
            }
            break;
        }
        case IR_ASSIGN:
        {
            if (cur->opn1.id == "r0")
            {
                rtnOpn.emplace(&cur->opn1);
            }
            if (cur->opn1.id == "s0")
            {
                rtnOpn.emplace(&cur->opn1);
            }
            else if (g_sL.find(cur->opn2.id)->flag == 'P')
            {
                paraOpn.push_back(&cur->opn2);
            }
            break;
        }
        case IR_LOAD:
        {
            if (g_sL.find(cur->opn1.id)->flag == 'P')
            {
                paraOpn.push_back(&cur->opn1);
            }
            break;
        }
        default:
            break;
        }
    }
    InlineFlag = 1;
    // if (callIdList.find(g_sL.now_func) != callIdList.end()) //递归不内联；
    //     InlineFlag = 0;
    if ((int)callList.size() > 0)
        InlineFlag = 0;
    if (g_sL.find(g_sL.now_func)->size > limit) //内联栈阈值；
        InlineFlag = 0;
}

void CallStuct::mapVal(opn *inO, opn *outO, codenode *cur)
{
    if (inO->type != 'v')
        ;
    else if (inO->id == "fp")
    {
        *outO = *inO;
        pre2new[string("fp")] = *inO;
    }
    else if (inO->id == ".s32.f32")
    {
        *outO = *inO;
        pre2new[string(".s32.f32")] = *inO;
    }
    else if (inO->id == ".f32.s32")
    {
        *outO = *inO;
        pre2new[string(".f32.s32")] = *inO;
    }
    else if (pre2new.find(inO->id) != pre2new.end())
    {
        *outO = pre2new[inO->id];
    }
    else if (inO->kind == 'L')
    {

        *outO = *inO;
        outO->id = newLabel();
        pre2new[inO->id] = *outO; //新块处理；块复制加信息映射
    }
    else if (inO->kind == 'T')
    {
        *outO = *inO;
        mksymt(), outO->id = g_sL.last_sym;
        pre2new[inO->id] = *outO;
    }
    else if (inO->kind == 'H')
    {
        *outO = *inO;
        mksymt(), outO->id = g_sL.last_sym;

        string nf = g_sL.now_func, tmp;
        g_sL.now_func = callFunc;
        tmp = callFunc + g_sL.find(inO->id)->alias; //维护别名，方便寄存器分配；
        g_sL.now_func = nf;
        g_sL.find(outO->id)->alias = tmp;

        g_sL.find(outO->id)->flag = 'H';
        pre2new[inO->id] = *outO;
    }
    else if (inO->kind == 'S')
    {

        *outO = *inO;
        mksymt(), outO->id = g_sL.last_sym;

        string nf = g_sL.now_func, tmp;
        g_sL.now_func = callFunc;
        tmp = callFunc + g_sL.find(inO->id)->alias; //维护别名，方便寄存器分配；
        g_sL.now_func = nf;
        g_sL.find(outO->id)->alias = tmp;

        g_sL.find(outO->id)->flag = 'S';
        pre2new[inO->id] = *outO;
    }
    else if (inO->kind == 'A' && inO->flage != 'P' && inO->flage != 'E')
    {
        *outO = *inO;
        cout << "函数内联size修改：" << inO->address << " -> " << outO->address << "\t" << g_sL.find(g_sL.now_func)->size << endl;
        outO->address += g_sL.find(g_sL.now_func)->size;
        outO->id = callFunc + outO->id;
        pre2new[inO->id] = *outO;
    }
}

void CallStuct::funcCopy()
{
    string nowfunc = g_sL.now_func;
    codenode *begin = g_sL.find(callFunc)->code_b, *end = g_sL.find(callFunc)->code_e, *cur = begin->next;
    codenode *funcCode = mkIR(IR_VOID);
    if (retOpn->id != "void")
    {
        mksymt();
        opn tmpO;
        tmpO.id = g_sL.last_sym, tmpO.kind = 'H', tmpO.type = 'v';
        g_sL.find(g_sL.last_sym)->flag = 'H', g_sL.find(g_sL.last_sym)->alias = callFunc + "r0";
        tmpO.cal_type = retOpn->cal_type;
        tmpO.status = 0, g_sL.find(g_sL.last_sym)->status = 0;
        if (retOpn->cal_type == 'i')
            pre2new[string("r0")] = tmpO;
        else if (retOpn->cal_type == 'f')
            pre2new[string("s0")] = tmpO;
    }

    if (begin == NULL || end == NULL)
    {
        printf("%s 空指针无法内联\n", callFunc.c_str());
        return;
    }
    for (; cur != end; cur = cur->next)
    {
        if (cur->op == IR_ALLOCA || cur->op == IR_VOID)
            continue;
        codenode *newir = new codenode;
        *newir = *cur;
        newir->next = newir->prior = newir;

        if (cur->opn1.kind != 'V')
            mapVal(&cur->opn1, &newir->opn1, cur);
        if (cur->opn2.kind != 'V')
            mapVal(&cur->opn2, &newir->opn2, cur);
        if (cur->result.kind != 'V')
            mapVal(&cur->result, &newir->result, cur);
        funcCode = merge(2, funcCode, newir);
        switch (cur->op)
        {
        case IR_ASSIGN:
        {
            if (cur->paraNo > -1)
            {
                newir->opn2 = argCode[cur->paraNo]->result;
                pre2new[cur->opn2.id] = newir->opn2;
            }
            break;
        }
        case IR_LOAD:
        {
            if (cur->paraNo > -1)
            {

                newir->opn2 = argCode[cur->paraNo]->result;
                newir->opn1 = newir->result;
                newir->op = IR_ASSIGN;
                pre2new[cur->opn1.id] = newir->opn2;
            }
            break;
        }
        case IR_PARAM:
        {
            if (cur->paraNo > -1)
            {
                if (cur->opn1.kind == 'A')
                {
                    newir->opn2 = argCode[cur->paraNo]->result;
                    mksymt();
                    g_sL.find(g_sL.last_sym)->flag = 'H';
                    g_sL.find(g_sL.last_sym)->alias = callFunc + cur->opn1.id;
                    newir->opn1.id = g_sL.last_sym;
                    newir->opn1.kind = 'H';
                    newir->op = IR_ASSIGN;
                    pre2new[cur->opn1.id] = newir->opn1;
                }
            }
            break;
        }
        default:
            break;
        }
        if (cur->opn2.type == 'i' && cur->opn1.id == "fp")
        {
            newir->opn2.const_int -= g_sL.find(g_sL.now_func)->size;
        }
        else if (cur->opn1.type == 'i' && cur->opn2.id == "fp")
        {
            newir->opn1.const_int -= g_sL.find(g_sL.now_func)->size;
        }
    }
    split(out_IR, callCode), out_IR = merge(3, out_IR, funcCode, callCode);
    callCode->op = IR_ASSIGN;
    callCode->opn1 = callCode->result;
    if (callCode->opn1.cal_type == 'i')
        callCode->opn2 = pre2new[string("r0")];
    else if (callCode->opn1.cal_type == 'f')
        callCode->opn2 = pre2new[string("s0")];
    callCode->result.kind = '0', callCode->result.type = '0', callCode->result.id = "";

    for (int i = 0; i < argCode.size(); i++)
    {
        argCode[i]->op = IR_VOID;
    }
    g_sL.find(g_sL.now_func)->size += g_sL.find(callFunc)->size;
}

void FIFStruct::callInline()
{
    for (auto itc = callList.begin(); itc != callList.end(); itc++)
    {
        if (g_ffS.FList.find(itc->callFunc) != g_ffS.FList.end() && g_ffS.FList[itc->callFunc].InlineFlag)
        {
            // g_ffS.FList[itc->callFunc].callInline();
            CallStuct *c = (CallStuct *)&(*itc);
            c->funcCopy();
        }
    }
}

void FuncInline()
{
    //调用关系初始化；
    for (auto itf = g_ssaS.Flist.begin(); itf != g_ssaS.Flist.end(); itf++)
    {
        FIFStruct tmpF;
        tmpF.Fid = itf->first;
        g_sL.now_func = itf->first;
        g_ffS.now_func = itf->first;
        g_ffS.FList[itf->first] = tmpF;
        g_ffS.FList[itf->first].callInit();
    }
    //调用内联;
    for (auto itf = g_ssaS.Flist.begin(); itf != g_ssaS.Flist.end(); itf++)
    {
        g_ffS.now_func = itf->first;
        g_sL.now_func = itf->first;
        no_tmp = g_sL.find(g_sL.now_func)->func_t->size();
        g_ffS.FList[itf->first].callInline();
    }
    // if (DeFlag)
    //     g_ffS.display();
}