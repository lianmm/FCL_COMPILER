#include "../../include/optimization/AF_IC.h"

class GloCPStruct g_aficS;
unordered_set<string> AFICworkList; // 赋值折叠指令融合工作薄；

void ifAFIC(string var)
{
    //判定是否可以赋值折叠；
    CTStruct *varS = g_aficS.find(var);
    if (var == "r0" || var == "s0" || g_sL.find(var)->flag == 'H' || g_sL.find(var)->flag == 'S')
        return;
    if ((int)varS->genSite.size() == 1 && (varS->genSite.begin()->codePr->op == IR_ASSIGN))
    {
        int flag = 1;

        if (varS->genSite.begin()->codePr->opn2.type != 'v')
            flag = 0;
        if (varS->genSite.begin()->codePr->opn2.cal_type != varS->genSite.begin()->codePr->opn1.cal_type)
            flag = 0;
        if (g_sL.find(varS->genSite.begin()->codePr->opn2.id)->flag == 'P')
            flag = 0;
        if ((varS->genSite.begin()->codePr->opn2.kind != 'S' && varS->genSite.begin()->codePr->opn2.kind != 'H' && varS->genSite.begin()->codePr->opn2.kind != 'T'))
            flag = 0;
        if (g_sL.find(varS->genSite.begin()->codePr->opn2.id)->flag == 'H')
            flag = 0;
        if (flag)
            AFICworkList.emplace(var);
    }
    else if ((int)varS->genSite.size() == 1 && (varS->genSite.begin()->codePr->op == IR_LOAD))
    {
        int flag = 1;

        if (varS->genSite.begin()->codePr->opn1.type != 'v')
            flag = 0;
        if ((varS->genSite.begin()->codePr->opn1.kind != 'S' && varS->genSite.begin()->codePr->opn1.kind != 'H' && varS->genSite.begin()->codePr->opn1.kind != 'T'))
            flag = 0;
        if (g_sL.find(varS->genSite.begin()->codePr->opn1.id)->flag == 'H')
            flag = 0;
        if (flag)
            AFICworkList.emplace(var);
    }
    //判定是否可以指令融合；
    else if ((int)varS->genSite.size() == 1 && (int)varS->useSite.size() == 1)
    {
        int flag = 1;

        //必须是ADD,MUL
        if (varS->genSite.begin()->codePr->op != IR_MUL && varS->genSite.begin()->codePr->op != IR_ADD)
            flag = 0;

        //必须是同类型
        if (varS->genSite.begin()->codePr->op != varS->useSite.begin()->codePr->op)
            flag = 0;

        //必须含常操作数
        if (varS->genSite.begin()->codePr->opn1.type == 'v' && varS->genSite.begin()->codePr->opn2.type == 'v')
            flag = 0;
        opn *other = varS->useSite.begin()->opnPr == &varS->useSite.begin()->codePr->opn1 ? &varS->useSite.begin()->codePr->opn2 : &varS->useSite.begin()->codePr->opn1;
        if (other->type == 'v')
            flag = 0;

        if (flag == 1)
            AFICworkList.emplace(var);
    }
}

void CodeScan()
{
    string fid = g_aficS.now_func;
    codenode *begin = g_sL.find(g_aficS.now_func)->code_b, *end = g_sL.find(g_aficS.now_func)->code_e, *cur = begin->next;
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
                g_aficS.insCTStop(cur, &cur->opn1);
            }
            else if (cur->opn1.type == 'v' && (cur->opn1.kind == 'T' || cur->opn1.kind == 'S'))
            {
                if (cur->opn2.type == 'i' && cur->opn1.id != "r0" && cur->opn1.id != "s0")
                {
                    g_aficS.insCTSval(cur, &cur->opn1, cur->opn2.const_int);
                    SSAworkList[cur->opn1.id] = nullssaedge;
                }
                else if (cur->opn2.type == 'f' && cur->opn1.id != "r0" && cur->opn1.id != "s0")
                {
                    g_aficS.insCTSval(cur, &cur->opn1, cur->opn2.const_float);
                    SSAworkList[cur->opn1.id] = nullssaedge;
                }
                else if (cur->opn2.type == 'v' && cur->opn1.id != "r0" && cur->opn1.id != "s0")
                    g_aficS.insCTStop(cur, &cur->opn1);
            }
            //调用统计；
            if (cur->opn2.type == 'v' && (cur->opn2.kind == 'T' || cur->opn2.kind == 'S' || cur->opn2.kind == 'H'))
            {
                g_aficS.find(cur->opn2.id)->insUseSite(cur, &cur->opn2);
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
                g_aficS.find(cur->opn2.id)->insUseSite(cur, &cur->opn2);
            if (cur->opn1.type == 'v')
                g_aficS.find(cur->opn1.id)->insUseSite(cur, &cur->opn1);
            g_aficS.insCTStop(cur, &cur->result);
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
                g_aficS.find(cur->opn2.id)->insUseSite(cur, &cur->opn2);
            if (cur->opn1.type == 'v')
                g_aficS.find(cur->opn1.id)->insUseSite(cur, &cur->opn1);
            g_aficS.insCTStop(cur, &cur->result);
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
                g_aficS.find(cur->opn1.id)->insUseSite(cur, &cur->opn1);
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
                g_aficS.find(cur->opn1.id)->insUseSite(cur, &cur->opn1);
            if (cur->opn2.type == 'v')
                g_aficS.find(cur->opn2.id)->insUseSite(cur, &cur->opn2);
            g_aficS.insCTSbottom(cur, &cur->result);
            SSAEdge tmpssaedge(cur->opn2.id, "x", cur);
            SSAworkList[cur->result.id].emplace(tmpssaedge);

            break;
        }
        case IR_ARROFF_EXP:
        {
            if (cur->opn1.type == 'v' && cur->opn1.type == 'T')
                g_aficS.find(cur->opn1.id)->insUseSite(cur, &cur->opn1);
            if (cur->opn2.type == 'v')
                g_aficS.find(cur->opn2.id)->insUseSite(cur, &cur->opn2);
            if (cur->result.type == 'v')
                g_aficS.find(cur->result.id)->insUseSite(cur, &cur->result);

            break;
        }
        case IR_ARROFF_EXPi:
        {
            if (cur->opn1.type == 'v' && cur->opn1.type == 'T')
                g_aficS.find(cur->opn1.id)->insUseSite(cur, &cur->opn1);
            if (cur->opn2.type == 'v')
                g_aficS.find(cur->opn2.id)->insUseSite(cur, &cur->opn2);
            if (cur->result.type == 'v')
                g_aficS.find(cur->result.id)->insUseSite(cur, &cur->result);
            break;
        }
        case IR_EXP_ARROFFa:
        {
            if (cur->opn2.type == 'v')
                g_aficS.find(cur->opn2.id)->insUseSite(cur, &cur->opn2);
            if (cur->result.type == 'v')
                g_aficS.find(cur->result.id)->insUseSite(cur, &cur->result);

            break;
        }
        case IR_ARROFF_EXPi0:
        {
            break;
        }
        case IR_VCVT:
        {
            if (cur->result.type == 'v')
                g_aficS.find(cur->result.id)->insUseSite(cur, &cur->result);
            g_aficS.insCTStop(cur, &cur->opn2);
            break;
        }

        case IR_CALL:
        {
            g_aficS.insCTSbottom(cur, &cur->result);
            SSAEdge tmpe("", "x", cur);
            SSAworkList[cur->result.id].emplace(tmpe);
            break;
        }
        case IR_NOT:
        {
            if (cur->opn1.type == 'v')
                g_aficS.find(cur->opn1.id)->insUseSite(cur, &cur->opn1);
            g_aficS.insCTStop(cur, &cur->result);
            break;
        }
        case IR_UMINUS:
        {
            if (cur->opn1.type == 'v')
            {
                g_aficS.find(cur->opn1.id)->insUseSite(cur, &cur->opn1);
            }
            g_aficS.insCTStop(cur, &cur->result);
            break;
        }
        case IR_LOAD:
        {
            //生成统计；
            if (cur->opn1.kind == 'V')
                g_aficS.insCTSbottom(cur, &cur->result);
            else if (cur->opn1.kind == 'S' || cur->opn1.kind == 'T' || cur->opn1.kind == 'H' || cur->opn1.kind == 'P')
                g_aficS.insCTStop(cur, &cur->result);
            //调用统计；
            if (cur->opn1.kind == 'S' || cur->opn1.kind == 'T' || cur->opn1.kind == 'H')
                g_aficS.find(cur->opn1.id)->insUseSite(cur, &cur->opn1);

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
                g_aficS.find(cur->result.id)->insUseSite(cur, &cur->result);
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
                    g_aficS.insCTSval(cur, &cur->opn1, cur->opn2.const_int);
                    SSAworkList[cur->opn1.id] = nullssaedge;
                }
                else if (cur->opn2.type == 'f')
                {
                    g_aficS.insCTSval(cur, &cur->opn1, cur->opn2.const_float);
                    SSAworkList[cur->opn1.id] = nullssaedge;
                }
            }
            if (cur->opn2.type == 'v')
            {
                g_aficS.insCTStop(cur, &cur->opn1);
                if (g_aficS.find(cur->opn2.id) == &nullcfts)
                {
                    struct CTStruct tmpS;
                    g_aficS.FList[g_aficS.now_func].CTList[cur->opn2.id] = (tmpS);
                }
                g_aficS.find(cur->opn2.id)->insUseSite(cur, &cur->opn2);
            }
            break;
        }
        default:
            break;
        }
    }
}

//维护出所有的单定值变量到AFworkList里；同时转化部分H为S型；
void AF_ICInit()
{
    for (auto itv = g_aficS.FList[g_aficS.now_func].CTList.begin(); itv != g_aficS.FList[g_aficS.now_func].CTList.end(); itv++)
    {
        ifAFIC(itv->first);
    }
}

void AF_IC()
{
    while (!AFICworkList.empty())
    {
        //取出一个可折叠的变量；
        string curv = *AFICworkList.begin(), fromv;
        // cout << "折叠：" << curv << ":" << g_sL.find(curv)->alias << "flag:" << g_sL.find(curv)->flag << endl;
        AFICworkList.erase(curv);
        CTStruct *curS = g_aficS.find(curv);
        // if (runtimes == 1)
        {
            //处理：& 向前传播；
            switch (curS->genSite.begin()->codePr->op)
            {
            case IR_ASSIGN:
            {
                fromv = curS->genSite.begin()->codePr->opn2.id;
                // cout << "折叠" << curv << "." << g_sL.find(curv)->flag << " <- " << fromv << "." << g_sL.find(fromv)->flag << endl;

                //删除from中的对应调用；
                prSite eratmp = *curS->genSite.begin();
                eratmp.opnPr = &curS->genSite.begin()->codePr->opn2;
                eratmp.Site = 0;
                if (g_aficS.find(fromv)->useSite.find(eratmp) != g_aficS.find(fromv)->useSite.end())
                    g_aficS.find(fromv)->useSite.erase(eratmp);

                for (auto itu = curS->useSite.begin(); itu != curS->useSite.end(); itu++)
                {
                    //改调用；
                    *itu->opnPr = curS->genSite.begin()->codePr->opn2;

                    //添加use到from中的use去;
                    g_aficS.find(fromv)->useSite.emplace(*itu);
                }

                //删除定值语句；
                curS->genSite.begin()->codePr->op = IR_VOID;

                //删除结构体；
                g_aficS.FList[g_aficS.now_func].CTList.erase(curv);

                ifAFIC(curS->genSite.begin()->codePr->opn2.id);

                break;
            }
            case IR_LOAD:
            {

                fromv = curS->genSite.begin()->codePr->opn1.id;

                // cout << "折叠" << curv << "." << g_sL.find(curv)->flag << " <- " << fromv << "." << g_sL.find(fromv)->flag << endl;

                //删除from中的对应调用；
                prSite eratmp = *curS->genSite.begin();
                eratmp.opnPr = &curS->genSite.begin()->codePr->opn1;
                eratmp.Site = 0;
                if (g_aficS.find(fromv)->useSite.find(eratmp) != g_aficS.find(fromv)->useSite.end())
                    g_aficS.find(fromv)->useSite.erase(eratmp);
                for (auto itu = curS->useSite.begin(); itu != curS->useSite.end(); itu++)
                {
                    //改调用；
                    *itu->opnPr = curS->genSite.begin()->codePr->opn1;
                    //添加use到from中的use去;
                    g_aficS.find(fromv)->useSite.emplace(*itu);
                }
                //删除定值语句；
                curS->genSite.begin()->codePr->op = IR_VOID;
                //删除结构体；
                g_aficS.FList[g_aficS.now_func].CTList.erase(curv);
                ifAFIC(curS->genSite.begin()->codePr->opn1.id);

                break;
            }
            case IR_ADD:
            {
                opn *other = curS->useSite.begin()->opnPr == &curS->useSite.begin()->codePr->opn1 ? &curS->useSite.begin()->codePr->opn2 : &curS->useSite.begin()->codePr->opn1;
                string fromv = curS->genSite.begin()->codePr->opn1.type == 'v' ? curS->genSite.begin()->codePr->opn1.id : curS->genSite.begin()->codePr->opn2.id;
                opn *const1, *const2;
                const1 = &curS->useSite.begin()->codePr->opn1 == curS->useSite.begin()->opnPr ? &curS->useSite.begin()->codePr->opn2 : &curS->useSite.begin()->codePr->opn1;
                const2 = curS->genSite.begin()->codePr->opn1.type == 'v' ? &curS->genSite.begin()->codePr->opn2 : &curS->genSite.begin()->codePr->opn1;
                if (const1->type != const2->type)
                {
                    printf("触发强制转换！\n");
                    exit(1);
                }
                //改定值语句；
                const2->const_int += const1->const_int, const2->const_float += const1->const_float;
                curS->genSite.begin()->codePr->result = curS->useSite.begin()->codePr->result;
                //改调用语句；
                curS->useSite.begin()->codePr->op = IR_VOID;
                //改调用结果变量的结构；
                for (auto itu = g_aficS.find(curS->useSite.begin()->codePr->result.id)->useSite.begin(); itu != g_aficS.find(curS->useSite.begin()->codePr->result.id)->useSite.end(); itu++)
                {
                    if (itu->codePr == curS->useSite.begin()->codePr)
                    {
                        prSite *cu = (prSite *)&(*itu);
                        cu->codePr = curS->genSite.begin()->codePr;
                        cu->opnPr = &curS->genSite.begin()->codePr->result;
                        cu->localBB = curS->genSite.begin()->codePr->localBB;
                    }
                }
                if (curS->genSite.begin()->codePr->opn2.type == 'v')
                    ifAFIC(curS->genSite.begin()->codePr->opn2.id);
                if (curS->genSite.begin()->codePr->opn1.type == 'v')
                    ifAFIC(curS->genSite.begin()->codePr->opn1.id);
                break;
            }
            case IR_MUL:
            {
                opn *other = curS->useSite.begin()->opnPr == &curS->useSite.begin()->codePr->opn1 ? &curS->useSite.begin()->codePr->opn2 : &curS->useSite.begin()->codePr->opn1;
                string fromv = curS->genSite.begin()->codePr->opn1.type == 'v' ? curS->genSite.begin()->codePr->opn1.id : curS->genSite.begin()->codePr->opn2.id;
                opn *const1, *const2;
                const1 = &curS->useSite.begin()->codePr->opn1 == curS->useSite.begin()->opnPr ? &curS->useSite.begin()->codePr->opn2 : &curS->useSite.begin()->codePr->opn1;
                const2 = curS->genSite.begin()->codePr->opn1.type == 'v' ? &curS->genSite.begin()->codePr->opn2 : &curS->genSite.begin()->codePr->opn1;
                if (const1->type != const2->type)
                {
                    printf("触发强制转换！\n");
                    exit(1);
                }
                //改定值语句；
                const2->const_int *= const1->const_int, const2->const_float *= const1->const_float;
                curS->genSite.begin()->codePr->result = curS->useSite.begin()->codePr->result;
                //改调用语句；
                curS->useSite.begin()->codePr->op = IR_VOID;
                //改调用结果变量的结构；
                for (auto itu = g_aficS.find(curS->useSite.begin()->codePr->result.id)->useSite.begin(); itu != g_aficS.find(curS->useSite.begin()->codePr->result.id)->useSite.end(); itu++)
                {
                    if (itu->codePr == curS->useSite.begin()->codePr)
                    {
                        prSite *cu = (prSite *)&(*itu);
                        cu->codePr = curS->genSite.begin()->codePr;
                        cu->opnPr = &curS->genSite.begin()->codePr->result;
                        cu->localBB = curS->genSite.begin()->codePr->localBB;
                    }
                }
                if (curS->genSite.begin()->codePr->opn2.type == 'v')
                    ifAFIC(curS->genSite.begin()->codePr->opn2.id);
                if (curS->genSite.begin()->codePr->opn1.type == 'v')
                    ifAFIC(curS->genSite.begin()->codePr->opn1.id);
                break;
            }

            default:
                break;
            }
        }
    }
}

void GloAF_IC()
{
    std::unordered_map<string, unordered_map<int, struct basic_block *>>::iterator it = g_bbL.glo_list.begin();

    for (; it != g_bbL.glo_list.end(); it++) //遍历所有函数；
    {
        if (it->first != "glo")
        {
            AFICworkList.clear();

            g_aficS.now_func = it->first, g_sL.now_func = it->first;

            CodeScan();

            AF_ICInit();

            AF_IC();
        }
    }

    g_aficS.now_func = "glo";
}