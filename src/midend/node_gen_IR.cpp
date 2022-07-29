//从glo_gen_IR中模块化出的部分；某些结点生成对应中间代码的函数；

#include "node_gen_IR.h"
using namespace std;
extern class codenode *oneir;

void EXP_STMT_gen_ir_1(struct node *T)
{
    // printf("表达式语句：%s\n", T->Etrue);

    transfer_label(T, T->ptr[0]);
    assign_sym = 1;
}
void EXP_STMT_gen_ir_2(struct node *T)
{
    if (T->ptr[0])
    {
        T->code = merge(2, T->code, T->ptr[0]->code);
        // check_load(T, &T->ptr[0]->out);
    }
    assign_sym = 0;
}

void COMP_STM_gen_ir_1(struct node *T)
{
    int old_index = sT.index;

    // printf("复合语句: \n");
    glo_level++;

    symbol_scope_TX.TX[symbol_scope_TX.top] = sT.index;
    symbol_scope_TX.top++;

    transfer_label(T, T->ptr[0]);
}
void COMP_STM_gen_ir_2(struct node *T)
{
    if (T->ptr[0])
        T->code = merge(2, T->code, T->ptr[0]->code);
    // printf("comp_stm_type: %d\n", comp_stm_type);
    // DisplaySymbolTable(sT), DisplaySymbolTable();

    glo_level--;
    // printf("当前层循环的位置：%d：\n", T->pos);
    // if (fT.funcs[fT.top - 1] == 16 && comp_stm_type > 0)
    //     printf("当前符号表项数：%d\n", sT.index - 1);

    if (glo_level > 0)
    {
        // printf("symbol_scope_TX.TX[symbol_scope_TX.top-1]:%d -> sT.index:%d\n", symbol_scope_TX.TX[symbol_scope_TX.top - 1], sT.index);
        // DisplaySymbolTable(sT); // DisplaySymbolTable();
        struct symbol tmp_sym1;
        bool erase_sym = 0;
        int i;
        for (i = symbol_scope_TX.TX[symbol_scope_TX.top - 1]; i < sT.index; i++)
        {
            // printf("\t%s", sT.symbols[i].name.c_str());
            if (1)
            {
                if (g_sL.glo_ymT[g_sL.now_func].func_v != NULL && (*g_sL.glo_ymT[g_sL.now_func].func_v).find(sT.symbols[i].name) != (*g_sL.glo_ymT[g_sL.now_func].func_v).end() && (*g_sL.glo_ymT[g_sL.now_func].func_v)[sT.symbols[i].name] != NULL)
                {
                    // printf("\t1");
                    // printf("(*g_sL.glo_ymT[g_sL.now_func].func_v)[sT.symbols[i].name]->size():%lu\n", (*g_sL.glo_ymT[g_sL.now_func].func_v)[sT.symbols[i].name]->size());
                    stack<class symbol> tmp_stk = (*(*g_sL.glo_ymT[g_sL.now_func].func_v)[sT.symbols[i].name]);
                    int func_v_stack_size = tmp_stk.size();
                    if (func_v_stack_size > 1)
                    {
                        (*g_sL.glo_ymT[g_sL.now_func].func_v)[sT.symbols[i].name]->pop();
                        erase_sym = 1;
                    }
                    else if (func_v_stack_size == 1 && g_sL.glo_ymT.find(sT.symbols[i].name) != g_sL.glo_ymT.end())
                    {
                        (*g_sL.glo_ymT[g_sL.now_func].func_v)[sT.symbols[i].name]->pop();
                        auto itt = (*g_sL.glo_ymT[g_sL.now_func].func_v).find(sT.symbols[i].name);
                        if (itt != (*g_sL.glo_ymT[g_sL.now_func].func_v).end())
                        {
                            erase_sym = 1;
                            delete itt->second;
                            itt->second = NULL;
                            (*g_sL.glo_ymT[g_sL.now_func].func_v).erase(itt->first);
                            // printf("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\n");
                        }
                    }
                    // DisplaySymbolTable();
                    // g_sL.last_v = sT.symbols[i].name;
                }
            }
        }
        // printf("\t\n");
        if (erase_sym == 1)
        {
            i = symbol_scope_TX.TX[symbol_scope_TX.top - 1] - 1;
            g_sL.last_v = sT.symbols[i].name;
            // printf("g_sL.last_v:%s\n", g_sL.last_v.c_str());
        }
        // DisplaySymbolTable();
    }

    symbol_scope_TX.top--;
    sT.index = symbol_scope_TX.TX[symbol_scope_TX.top];
    // DisplaySymbolTable(sT);
}

void MOD_gen_ir_1(struct node *T, string *next_label, string *last_label, string *tmp_label)
{
    if ((int)T->kind == (int)EQOP || (int)T->kind == (int)RELOP || (int)T->kind == (int)AND || (int)T->kind == (int)OR)
        T->place = 2; //关系型表达式标识；

    *next_label = newLabel(), *last_label = newLabel(), *tmp_label = newLabel();

    transfer_label(T, T->ptr[0]), transfer_label(T, T->ptr[1]);

    // printf("%s\n", T->type_id);
}
void MOD_gen_ir_2(struct node *T, string next_label, string last_label, string tmp_label, int lint)
{
}

void TERM_gen_ir_if(struct node *T, int tmp_assign_sym)
{
    int i, aTindex;
    struct opn tmp_out, tmp_size;
    node *T0 = T->ptr[0];
    if (T->ptr[0])
        T->code = merge(2, T->code, T->ptr[0]->code);
    //数组调用时生成代码；
    if (tmp_assign_sym != 0)
    {
        // printf("\t%s:\n", T->type_id), displayiT();
        struct opn tmp_opn2;
        check_process(4, NULL, *T);                //使用流程检查检查数组下标超限问题；
        aTindex = g_sL.find(T->type_id)->paramnum; //参数个数复用为数组的内情表索引；

        if (iT.top < aT.arrs[aTindex].D)
        {
            int k = iT.top;
            for (; k < aT.arrs[aTindex].D; k++)
            {
                iT.indexs[k].type = 'i', iT.indexs[k].const_int = 0;
                iT.top++, glo_D++;
            }
        }
        int itiSym = 1;
        for (int iti = 0; iti < iT.top; iti++)
        {
            if (iT.indexs[iti].type != 'i')
            {
                itiSym = 0;
                break;
            }
        }
        if (itiSym == 1)
        {
            arroffset_cal(aTindex);
            add_cal_IR(2, T, NULL, glo_res, glo_res.const_int), glo_res = glo_opn1;
        }
        else
        {
            initOpn(&glo_opn1), initOpn(&glo_opn2);
            if (iT.indexs[iT.top - 1].type != 'v')
                add_cal_IR(1, T, NULL, (iT.indexs[iT.top - 1]), 0);
            else
            {
                check_load(T, &iT.indexs[iT.top - 1], 0);
                if (strcmp(g_sL.find((iT.indexs[iT.top - 1]).id)->type, "float") == 0)
                {
                    add_vcvt_IR(T, &iT.indexs[iT.top - 1], (string) ".s32.f32");
                    // DisplaySymbolTable();
                }
                glo_opn1 = iT.indexs[iT.top - 1];
            }
            iT.top--;
            tmp_out = glo_opn1;
            tmp_size.const_int = aT.arrs[aTindex].lim[glo_D - 1];
            tmp_size.type = 'i';
            if (glo_D == 1)
                glo_res = glo_opn1;
            else
                for (i = glo_D - 2; i > -1; i--)
                {
                    add_cal_IR(1, T, NULL, tmp_size, -1);
                    tmp_opn2 = glo_opn1;
                    check_load(T, &(iT.indexs[iT.top - 1]), 0);
                    if (strcmp(g_sL.find((iT.indexs[iT.top - 1]).id)->type, "float") == 0)
                    {
                        add_vcvt_IR(T, &iT.indexs[iT.top - 1], (string) ".s32.f32");
                        // DisplaySymbolTable();
                    }
                    glo_opn1 = tmp_opn2;
                    add_cal_IR(3, T, NULL, (iT.indexs[iT.top - 1]), 0);

                    add_cal_IR(4, T, &tmp_out, glo_res, 0);
                    tmp_out = glo_res;
                    if (i > 0)
                        glo_res.const_int = tmp_size.const_int * aT.arrs[aTindex].lim[i], glo_res.type = 'i';
                    tmp_size = glo_res;
                    iT.top--;
                }
        }
    }

    //数组定义时生成代码；
    if (tmp_assign_sym == 0)
    {
        char tmp_name[36];
        char tmp_flag = glo_flag;

        strcpy(tmp_name, glo_name.c_str());

        initOpn(&glo_opn1), initOpn(&glo_opn2);

        glo_opn1 = iT.indexs[iT.top - 1];

        tmp_out = glo_opn1;
        glo_arr_lim[iT.top - 1] = tmp_out;

        for (i = glo_D - 2; i > -1; i--)
        {
            glo_arr_lim[i] = iT.indexs[i];
            if (i < glo_D - 2)
                glo_opn1 = glo_res;
            tmp_out.const_int = iT.indexs[i].const_int * glo_res.const_int;
        }
        iT.top = 0;
        T->out = tmp_out;
        glo_name = tmp_name;
        glo_flag = tmp_flag;
        glo_name = T->type_id;

        if (strcmp(glo_type, "int") == 0 || strcmp(glo_type, "float") == 0)
        {
            glo_tmp_type = strcat(glo_type, "");
            glo_flag = 'A';
        }
    }
    array_in_sym = 0;
    if (tmp_assign_sym == -1)
    {
        T->out = glo_res;
        //左值表达式返回索引值。
    }
    else if (tmp_assign_sym == 1)
    {
        // printf("aaaaaaa：%s\n", T->type_id);

        if (g_sL.find(T->type_id)->flage == 'P')
        {

            glo_opn2 = glo_res;
            glo_opn1.type = 'v', glo_opn1.kind = 'A';
            glo_opn1.id = T->type_id;
            glo_opn1.status = 1;

            glo_opn1.status = 1, glo_opn1.address = g_sL.find(T->type_id)->offset;
            glo_opn1.flage = g_sL.find(T->type_id)->flage;
            glo_opn1.flaga = g_sL.find(T->type_id)->flagca;
            mksymt();
            glo_res.id = glo_name, glo_res.type = 'v', glo_res.level = glo_level, glo_res.offset = sT.index - 1;

            glo_res.flage = g_sL.find(glo_res.id)->flage;
            glo_res.address = g_sL.find(glo_res.id)->offset;
            glo_res.kind = g_sL.find(glo_res.id)->flag;
            oneir = mkIR(IR_LOAD);
            T->code = merge(2, T->code, oneir);
            if (strcmp(g_sL.find(T->type_id)->type, "float") == 0)
            {
                T->code->prior->result.cal_type = 'i';
                T->code->prior->opn1.cal_type = 'i';
            }
            glo_opn1 = glo_res;
            //插入临时变量。
            mksymt();
            initOpn(&glo_res);
            glo_res.id = glo_name, glo_res.type = 'v', glo_res.level = glo_level, glo_res.offset = sT.index - 1;

            glo_res.flage = g_sL.find(glo_res.id)->flage;
            glo_res.address = g_sL.find(glo_res.id)->offset;
            glo_res.kind = g_sL.find(glo_res.id)->flag;
        }
        else
        {
            glo_opn2 = glo_res;

            glo_opn1.type = 'v', glo_opn1.offset = find(T->type_id), glo_opn1.level = glo_level, glo_opn1.id = T->type_id;

            glo_opn1.address = g_sL.find(glo_opn1.id)->offset + g_sL.find(glo_opn1.id)->size - 4;
            glo_opn1.kind = g_sL.find(glo_opn1.id)->flag;
            glo_opn1.flage = g_sL.find(glo_opn1.id)->flage;

            //插入临时变量。
            mksymt();
            initOpn(&glo_res);
            glo_res.kind = 'T';
            glo_res.type = 'v', glo_res.level = glo_level, glo_res.offset = sT.index - 1;
            glo_res.id = g_sL.find(g_sL.last_sym)->name;
            glo_res.flage = g_sL.find(glo_res.id)->flage;
            glo_res.address = g_sL.find(glo_res.id)->offset;

            //构造结果变量代码结点。
        }
        oneir = mkIR(IR_EXP_ARROFF);
        T->code = merge(2, T->code, oneir);
        if (g_sL.find(T->type_id)->flage == 'P' && strcmp(g_sL.find(T->type_id)->type, "float") == 0)
        {
            T->code->prior->result.cal_type = 'i';
            T->code->prior->opn1.cal_type = 'i';
            T->code->prior->opn2.cal_type = 'i';
            glo_res = T->code->prior->result;
            add_cal_IR(1, T, NULL, glo_res, 0);
            strcpy(g_sL.find(g_sL.last_sym)->type, "float");
            T->code->prior->opn1.cal_type = 'f';
            T->code->prior->opn2.cal_type = 'i';

            glo_res = T->code->prior->opn1;
        }
        T->out = glo_res;
        glo_flag = 'A';
    }
    assign_sym = tmp_assign_sym;

    // DisplayIR(T->code);
}
void TERM_gen_ir_else(struct node *T, int tmp_assign_sym)
{
    int i, aTindex;
    struct opn tmp_out, tmp_size;
    node *T0 = T->ptr[0];
    // printf("ID: "), printf("%s\n", T->type_id);

    if (tmp_assign_sym == 0)
    {
        glo_flag = 'V';
        glo_tmp_type = strcat(glo_type, "");
        glo_name = T->type_id;
    }

    initOpn(&glo_res);
    glo_res.type = 'v', glo_res.id = T->type_id, glo_res.level = glo_level, glo_res.offset = find(T->type_id);

    glo_res.flage = g_sL.find(glo_res.id)->flage;
    glo_res.address = g_sL.find(glo_res.id)->offset;
    glo_res.kind = g_sL.find(glo_res.id)->flag;

    T->out = glo_res;

    if (g_sL.find(T->type_id)->flag == 'C')
    {
        if (strcmp(g_sL.find(T->type_id)->type, "int") == 0)
            T->out.type = 'i', T->out.const_int = g_sL.find(T->type_id)->int_val;
        else
            T->out.type = 'f', T->out.const_float = g_sL.find(T->type_id)->float_val;
    }
    // cout << "常量:" << T->type_id << ": " << T->out.const_int << endl;
    // DisplaySymbolTable();
    assign_sym = tmp_assign_sym;
}

void ARGS_gen_ir_3(struct node *T, struct node *T0, struct node *hT)
{


    T0 = hT->ptr[0];
    if (T0)
    {
        hT->code = merge(2, hT->code, T0->code);
    }
    T = hT->ptr[1];
    int para_no = 1;
    while (T)
    {
        T0 = T->ptr[0];
        if (T0)
        {
            if (g_sL.find(hT->call_name)->paras[para_no] == 1 && (strcmp(g_sL.find(T0->out.id)->type, "float") == 0))
            {
                add_vcvt_IR(hT, &T0->out, ".s32.f32");
            }
            else if (g_sL.find(hT->call_name)->paras[para_no] == 2 && (strcmp(g_sL.find(T0->out.id)->type, "int") == 0))
            {
                add_vcvt_IR(hT, &T0->out, ".f32.s32");
            }
            
            initOpn(&glo_res);
            glo_res = T0->out;
            oneir = mkIR(IR_ARG);
            hT->code = merge(2, hT->code, oneir);
            if (g_sL.find(hT->call_name)->paras[para_no] == 4)
            {
                hT->code->prior->cal_type = 'i';
                hT->code->prior->result.cal_type = 'i';
            }
        }
        T = T->ptr[1];
        para_no++;
    }
    para_no = 0;
    T0 = hT->ptr[0];
    if (T0)
    {
        if (g_sL.find(hT->call_name)->paras[para_no] == 1 && (strcmp(g_sL.find(T0->out.id)->type, "float") == 0))
        {
            add_vcvt_IR(hT, &T0->out, ".s32.f32");
        }
        else if (g_sL.find(hT->call_name)->paras[para_no] == 2 && (strcmp(g_sL.find(T0->out.id)->type, "int") == 0))
        {
            add_vcvt_IR(hT, &T0->out, ".f32.s32");
        }
        initOpn(&glo_res);
        glo_res = T0->out;
        oneir = mkIR(IR_ARG);
        hT->code = merge(2, hT->code, oneir);
        if (g_sL.find(hT->call_name)->paras[para_no] == 4)
        {
            hT->code->prior->cal_type = 'i';
            hT->code->prior->result.cal_type = 'i';
        }
    }
}

void node::EXT_DEF_LIST_ir() {}
void node::EXT_VAR_DEF_ir() {}
void node::CONST_VAR_DEF_ir() {}
void node::FUNC_DEF_ir() {}
void node::FUNC_DEC_ir() {}
void node::EXT_DEC_LIST_ir() {}
void node::PARAM_LIST_ir() {}
void node::PARAM_DEC_ir() {}
void node::VAR_DEF_ir() {}
void node::VAR_DEC_ir() {}
void node::DEC_LIST_ir() {}
void node::COMP_STM_ir() {}
void node::STM_DEF_LIST_ir() {}
void node::EXP_STMT_ir() {}
void node::IF_THEN_ir() {}
void node::IF_THEN_ELSE_ir() {}
void node::FUNC_CALL_ir() {}
void node::ARGS_ir() {}
void node::CONTINUE_STMT_ir() {}
void node::BREAK_STMT_ir() {}
void node::FOR_STMT_ir() {}
void node::FOR_ARGS_ir() {}
void node::FUNCTION_ir() {}
void node::PARAM_ir() {}
void node::ARG_ir() {}
void node::CALL_ir() {}
void node::LABEL_ir() {}
void node::GOTO_ir() {}
void node::JLT_ir() {}
void node::JLE_ir() {}
void node::JGT_ir() {}
void node::JGE_ir() {}
void node::EQ_ir() {}
void node::NEQ_ir() {}
void node::TERM_ir() {}
void node::ARRAYS_ir() {}
void node::EXP_LIST_ir() {}
void node::EXP_DES_ir() {}
void node::CONST_VAR_DEC_ir() {}
void node::CONST_DEC_LIST_ir() {}
void node::CONST_TERM_ir() {}
void node::VOID_STMT_ir() {}