#include "free_Memory.h"
using namespace std;

//遍历释放目标代码结点空间；
void clear_arm()
{
    struct arm_instruction *code = out_arm, *cp = code->prior, *cn = code->next;
    while (1)
    {
        cp = code->prior, cn = code->next;
        if (cp != cn)
        {
            cp->next = cn, cn->prior = cp;
            delete (code), code = cn;
        }
        else
        {
            if (cp != code)
                delete (code), code = NULL;
            delete (cp);
            cp = NULL;
            break;
        }
    }
}

//遍历释放中间代码结点空间；
void clear_IR()
{

    struct codenode *code = out_IR, *cp = code->prior, *cn = code->next;
    while (1)
    {
        cp = code->prior, cn = code->next;
        if (cp != cn)
        {
            cp->next = cn, cn->prior = cp;
            delete (code), code = cn;
        }
        else
        {
            if (cp != code)
                delete (code);
            delete (cp);
            break;
        }
    }
}

//遍历语法树释放结点空间；
void clear_ast(struct node *T)
{
    int i = 1;

    if (T)
    {
        clear_ast(T->ptr[0]);
        clear_ast(T->ptr[1]);
        clear_ast(T->ptr[2]);
        delete (T);
        T = NULL;
    }
}

//遍历释放符号表子表空间；
void clear_symlist()
{
    auto it = g_sL.glo_ymT.begin();
    for (; it != g_sL.glo_ymT.end(); it++)
    {
        if (it->second.func_v != NULL)
        {
            (*it->second.func_v).clear();
            delete it->second.func_v;
            it->second.func_v = NULL;
        }
        if (it->second.func_t != NULL)
        {
            (*it->second.func_t).clear();
            delete it->second.func_t;
            it->second.func_t = NULL;
        }
    }
}

//功能集成接口函数；
void free_Memory()
{
    clear_arm();
    clear_IR();
    clear_ast(out_ast);
    clear_symlist();
}