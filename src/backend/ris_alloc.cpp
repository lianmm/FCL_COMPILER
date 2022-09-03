#include "../../include/backend/ris_alloc.h"

//临时变量分配数组。
int tmp_allot[MAXLENGTH * 2];
int block_num = 0;
//寄存器分配支持；
int ris[10] = {4, 5, 6, 7, 8, 9, 10}; //寄存器太少了，应考虑想办法将1，2，3用起来；TODO
int sris[32] = {21, 20, 19, 18, 17, 16};
map<int, int, greater<int>> tmp_map;
map<int, int, greater<int>> vtmp_map;
int tmp_sp;

void printris(set<int, greater<int>> *ris_pq)
{
    printf("ris_pq:");
    for (set<int>::iterator it = ris_pq->begin(); it != ris_pq->end(); it++)
    {
        printf("\t%d ", *it);
    }

    printf("\n");
}

void printmap(map<int, int, greater<int>> *tmp_map)
{
    // printf("tmp_map $%d:", tmp_map->size());
    if (tmp_map->size() != 0)
        for (map<int, int, greater<int>>::iterator it = tmp_map->begin(); it != tmp_map->end(); it++)
        {
            printf("\t[%d]:%d ", it->first, it->second);
        }

    printf("\n");
}

/*-------------------------------------------寄存器分配函数实现区---------------------------------*/

//维护临时变量下次调用信息；
void maintain_tmp_use(struct opn *O, int index)
{
    // printf("tmp_allot[a2i(O->id)]: %d", tmp_allot[a2i(O->id)]);
    O->next_use = tmp_allot[a2i(O->id)];
    tmp_allot[a2i(O->id)] = index;
}

//计算最大活跃变量数；
void cal_alive_num(struct opn *O, int &ans)
{
    if (tmp_allot[a2i(O->id)] == 0 && O->next_use != 0)
        ans++, tmp_allot[a2i(O->id)] = 1;
    else if (tmp_allot[a2i(O->id)] == 0 && O->next_use == 0)
        tmp_allot[a2i(O->id)] = 1;
    else if (O->next_use == 0)
        ans--;
}

//给临时变量分配寄存器或栈空间；
void tmp_ris_allot(struct opn *O, struct codenode *begin, struct codenode *glo_begin, struct codenode *head, set<int, greater<int>> *ris_pq, set<int, greater<int>> *vris_pq, int eind, int tmpRis)
{
    // cout << O->id << "\t" << O->kind << "\n";
    // if (O->id == "t201")
    //     printf("O->id:%s\tO->cal_type:%c\n", O->id.c_str(), O->cal_type);
    if (O->cal_type == 'i')
    {
        int dlt;
        // if (1)
        // {
        // printf("%s: %s,:%s $%d: 当前应分配的寄存器：%d,nextuse:%d\n", begin->opn1.id.c_str(), IR_op_strs[head->op], O->id.c_str(), eind, *ris_pq->begin(), O->next_use);
        // printris(ris_pq);
        // }

        int st_index = begin->opn1.offset;
        //该临时变量第一次出现，应该分配寄存器或栈空间存储；
        if (tmp_allot[a2i(O->id)] == 0)
        {
            if (O->next_use < 3)
            {

                // printf("特分配%d号寄存器\n",tmpRis);

                (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->status = 2;
                (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris = tmpRis;
                O->status = 2;
                O->no_ris = tmpRis;
            }
            else if (ris_pq->empty()) //寄存器已满，分配内存区；
            {
                // printf("分配栈空间！\n");

                tmp_map[O->next_use] = a2i(O->id); //插入到map里;
                // printmap(&tmp_map);
                int tmp_t = tmp_map.begin()->second;

                if (tmp_t == a2i(O->id)) //新变量在调用后为最晚调用的临时变量；直接入栈，分配12号寄存器并插入存语句；
                {

                    //分配12号寄存器；并把对应结点写入变量结点中；
                    //插入存入栈语句；

                    {
                        struct codenode *next_code = head->next;
                        glo_opn1.type = 'v', glo_opn1.kind = 'V', glo_opn1.id = O->id, glo_opn1.address = tmp_sp + 4, glo_opn1.status = 1, glo_opn1.flage = '0';
                        glo_opn2.type = 'v', glo_opn2.status = 2, glo_opn2.kind = 'T', glo_opn2.no_ris = tmpRis;
                        glo_opn2.id = "r12";
                        split(glo_begin, next_code), merge(3, glo_begin, mkIR(IR_ASSIGN), next_code);
                        next_code->prior->opn2.cal_type = 'i';

                        //分配空间并维护函数空间大小；
                        dlt = tmp_map.begin()->first;
                        tmp_map.erase(dlt);

                        (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->status = 1;
                        // (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris =tmpRis;
                        (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->address = tmp_sp + 4;

                        O->status = 2, O->no_ris = tmpRis;
                    }
                }
                else //新变量在调用后不是最晚的临时变量；
                {

                    {
                        int tmp_ris;
                        //插入存入栈语句；将最晚调用的临时变量存入栈；
                        struct codenode *next_code = head->next;
                        split(glo_begin, head); //换语句插入位置；
                        glo_opn1.type = 'v', glo_opn1.kind = 'V', glo_opn1.id = "->s:" + to_string(tmp_sp + 4), glo_opn1.address = tmp_sp + 4, glo_opn1.status = 1, glo_opn1.flage = '0';
                        glo_opn2.type = 'v', glo_opn2.status = 2, glo_opn2.kind = 'T';
                        glo_opn2.id = "s" + O->id;
                        glo_opn2.no_ris = (*g_sL.glo_ymT[begin->opn1.id].func_t)[i2s(tmp_t)]->no_ris;

                        tmp_ris = (*g_sL.glo_ymT[begin->opn1.id].func_t)[i2s(tmp_t)]->no_ris;
                        merge(3, glo_begin, mkIR(IR_ASSIGN), head);
                        head->prior->opn2.cal_type = 'i';

                        initOpn(&glo_opn1);
                        //修改符号表中的信息，将最晚调用的临时变量设为栈存储。
                        (*g_sL.glo_ymT[begin->opn1.id].func_t)[i2s(tmp_t)]->status = 1;
                        (*g_sL.glo_ymT[begin->opn1.id].func_t)[i2s(tmp_t)]->address = tmp_sp + 4;
                        //将这个临时变量的寄存器分配给新临时变量；改符号表；
                        dlt = tmp_map.begin()->first;
                        tmp_map.erase(dlt);
                        (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->status = 2;
                        (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris = tmp_ris;
                        ris3_status[tmp_ris] = a2i(O->id);
                        O->status = 2, O->no_ris = tmp_ris;
                    }
                }
                tmp_sp += 4;
                // DisplaySymbolTable();
            }
            else //寄存器有空，分配寄存器；
            {
                // printf("分配%d号寄存器\n", *ris_pq->begin());
                int a2ians = a2i(O->id);

                tmp_map.insert(std::map<int, int>::value_type(O->next_use, a2ians));

                (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->status = 2;
                (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris = *ris_pq->begin();
                ris3_status[(*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris] = a2i(O->id);

                O->status = 2;
                O->no_ris = *ris_pq->begin();
                ris_pq->erase(O->no_ris);
                // printf("aaaaaaaaaaa "), printOpn(*O), printf("\t%c", O->kind), printf(": %d\n", tmp_allot[a2i(O->id)]);
            }
            tmp_allot[a2i(O->id)] = 1;
        }
        //该临时变量非第一次出现，且不是最后一次出现；（调用了一个活跃的变量）；
        else if (O->next_use > 2)
        {
            struct symbol *tmp_Tsym = (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id];
            //当前临时变量分配到了寄存器里；
            if (tmp_Tsym->status == 2)
            {
                // printf("调用%d号寄存器的值；\n", tmp_Tsym->no_ris);
                O->status = 2, O->no_ris = tmp_Tsym->no_ris;
                tmp_map[O->next_use] = a2i(O->id);
            }
            //当前临时变量分配到了栈空间里；
            else if (tmp_Tsym->status == 1)
            {
                O->status = 2;
                tmp_map[O->next_use] = a2i(O->id);

                int tmp_t1 = tmp_map.begin()->second;
                //如果本次调用的变量下次调用的时间是所有存在寄存器中的变量中最晚的，则直接取到寄存器12中用完即删，仍放在栈中；
                if (tmp_t1 == a2i(O->id))
                {
                    // printf("调用栈中内容\n");

                    glo_opn1.type = 'v', glo_opn1.status = 1, glo_opn1.address = tmp_Tsym->address, glo_opn1.kind = 'V', glo_opn1.flage = '0';
                    glo_res.type = 'v', glo_res.status = 2, glo_res.no_ris = tmpRis, glo_res.kind = 'T';
                    glo_opn1.id = O->id;
                    split(glo_begin, head), merge(3, glo_begin, mkIR(IR_LOAD), head);
                    head->prior->result.cal_type = 'i';

                    tmp_Tsym->status = 1;
                    // tmp_TsymL->status = 1;
                    dlt = tmp_map.begin()->first;
                    tmp_map.erase(dlt);
                    O->status = 2, O->address = tmp_Tsym->address, O->no_ris = tmpRis;
                }
                //如果本次调用的变量下次调用的时间不是所有存在寄存器中的变量中最晚的，则进行寄存器与栈空间的变量交换。
                else if (tmp_t1 != a2i(O->id))
                {

                    {
                        // printf("置换栈中内容\n");
                        int tmp_ris1 = (*g_sL.glo_ymT[begin->opn1.id].func_t)[i2s(tmp_t1)]->no_ris;
                        //做一次move；
                        glo_opn1.status = 2, glo_opn1.no_ris = tmpRis, glo_opn1.kind = 'T';
                        glo_opn2.status = 2, glo_opn2.no_ris = tmp_ris1, glo_opn2.kind = 'T';
                        glo_opn1.type = 'v', glo_opn2.type = 'v';
                        split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);
                        head->prior->opn1.cal_type = 'i';
                        head->prior->opn2.cal_type = 'i';

                        //设定一节点地址为变量地址；二节点为寄存器；做一次load；
                        glo_opn1.status = 1, glo_opn1.id = tmp_Tsym->name, glo_opn1.kind = 'V', glo_opn1.flage = '0';
                        glo_opn1.address = (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->address;
                        glo_res.status = 2, glo_res.no_ris = tmp_ris1, glo_res.kind = 'T', glo_res.type = 'v';
                        glo_opn1.type = 'v', glo_opn2.type = 'v';

                        split(glo_begin, head), merge(3, glo_begin, mkIR(IR_LOAD), head);
                        head->prior->opn1.cal_type = 'i';

                        //设定一节点地址为变量地址，二结点为寄存器；做一次store；
                        glo_opn1.status = 1, glo_opn1.id = tmp_Tsym->name, glo_opn1.kind = 'V', glo_opn1.flage = '0';
                        glo_opn1.address = (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->address;
                        glo_opn1.type = 'v', glo_opn2.type = 'v';
                        glo_opn2.status = 2, glo_opn2.no_ris = tmpRis, glo_opn2.kind = 'T', glo_opn2.type = 'v';
                        split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);
                        head->prior->opn2.cal_type = 'i';

                        //改符号表项；
                        (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->status = 2, (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris = tmp_ris1;
                        (*g_sL.glo_ymT[begin->opn1.id].func_t)[i2s(tmp_t1)]->status = 1, (*g_sL.glo_ymT[begin->opn1.id].func_t)[i2s(tmp_t1)]->address = (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->address;

                        ris3_status[tmp_ris1] = a2i(O->id);
                        dlt = tmp_map.begin()->first;
                        tmp_map.erase(dlt);

                        //改下一条语句变量项；
                        O->status = 2, O->no_ris = tmp_ris1;
                        ris3_status[(*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris] = a2i(O->id);
                    }
                    // DisplaySymbolTable(begin->opn1.id);
                }
            }
        }
        //该寄存器是最后一次出现，调用后释放相关栈空间和寄存器（重新进入寄存器分配池队列）；
        else if (O->next_use < 3)
        {

            struct symbol *tmp_Tsym1 = (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id];
            //存在栈空间分配；不再使用此变量，此时还要调用一次，在栈中的变量要再取一次。
            if ((*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->status % 2 == 1)
            {
                // printf("调用并释放栈中内容！\n");
                glo_opn1.type = 'v', glo_opn1.status = 1, glo_opn1.address = tmp_Tsym1->address, glo_opn1.kind = 'V', glo_opn1.flage = '0';
                glo_res.type = 'v', glo_res.status = 2, glo_res.no_ris = tmpRis, glo_res.kind = 'T', glo_res.cal_type = 'i';
                split(glo_begin, head), merge(3, glo_begin, mkIR(IR_LOAD), head);
                head->prior->result.cal_type = 'i';
                tmp_Tsym1->status = 1;
                // tmp_Tsym1L->status = 1;
                // GSL中分配方式是1，而O中分配方式是2，即从本条命令从寄存器10中取用，下一次调用语句仍然访问栈空间；
                O->status = 2, O->address = tmp_Tsym1->address, O->no_ris = tmpRis;
                tmp_map.erase(O->next_use);
                //载入语句;
                // DisplaySymbolTable();
            }
            //只存在寄存器里；不再使用此变量，还要调用一次，但是不需要载入操作。
            else
            {
                O->status = 2;
                O->no_ris = (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris;

                if ((*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris != tmpRis && (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris != 0 && (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris < 100)
                    ris_pq->insert((*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris);
                // printf("当前最小号寄存器号数%d\n", *ris_pq->begin());
                tmp_map.erase(O->next_use);
                (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->status = 2;

                ris3_status[(*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris] = -1;
            }
        }

        // printmap(&tmp_map);
        // printris(ris_pq);
    }
    else if (O->cal_type == 'f')
    {

        int dlt;
        // if (1)
        // {
        // printf("%s: %s,:%s $%d: 当前应分配的寄存器：%d,nextuse:%d\n", begin->opn1.id.c_str(), IR_op_strs[head->op], O->id.c_str(), eind, *vris_pq->begin(), O->next_use);
        // printris(vris_pq);
        // }

        int st_index = begin->opn1.offset;
        //该临时变量第一次出现，应该分配寄存器或栈空间存储；
        if (tmp_allot[a2i(O->id)] == 0)
        {
            if (O->next_use < 3)
            {

                // printf("特分配s%d号寄存器\n", 4);

                (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->status = 2;
                (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris = 104;
                O->status = 2;
                O->no_ris = 104;
            }
            else if (vris_pq->empty()) //寄存器已满，分配内存区；
            {
                // printf("分配栈空间！\n");

                vtmp_map[O->next_use] = a2i(O->id); //插入到map里;
                // printmap(&vtmp_map);
                int tmp_t = vtmp_map.begin()->second;
                if (tmp_t == a2i(O->id)) //新变量在调用后为最晚调用的临时变量；直接入栈，分配104号寄存器并插入存语句；
                {

                    {
                        //分配104号寄存器；并把对应结点写入变量结点中；
                        //插入存入栈语句；
                        struct codenode *next_code = head->next;
                        glo_opn1.type = 'v', glo_opn1.kind = 'V', glo_opn1.id = O->id, glo_opn1.address = tmp_sp + 4, glo_opn1.status = 1, glo_opn1.flage = '0';
                        glo_opn2.type = 'v', glo_opn2.status = 2, glo_opn2.kind = 'T', glo_opn2.no_ris = 104;
                        glo_opn2.id = "s4";
                        split(glo_begin, next_code), merge(3, glo_begin, mkIR(IR_ASSIGN), next_code);
                        //分配空间并维护函数空间大小；
                        next_code->prior->cal_type = 'f';
                        next_code->prior->opn2.cal_type = 'f';
                        dlt = vtmp_map.begin()->first;
                        vtmp_map.erase(dlt);

                        (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->status = 1;
                        // (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris = 104;
                        (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->address = tmp_sp + 4;

                        O->status = 2, O->no_ris = 104;
                    }
                }
                else //新变量在调用后不是最晚的临时变量；
                {

                    {
                        int tmp_ris;
                        //插入存入栈语句；将最晚调用的临时变量存入栈；
                        struct codenode *next_code = head->next;
                        split(glo_begin, head); //换语句插入位置；
                        glo_opn1.type = 'v', glo_opn1.kind = 'V', glo_opn1.id = "->s:" + to_string(tmp_sp + 4), glo_opn1.address = tmp_sp + 4, glo_opn1.status = 1, glo_opn1.flage = '0';
                        glo_opn2.type = 'v', glo_opn2.status = 2, glo_opn2.kind = 'T';
                        glo_opn2.id = "s" + O->id;
                        glo_opn2.no_ris = (*g_sL.glo_ymT[begin->opn1.id].func_t)[i2s(tmp_t)]->no_ris;
                        glo_opn2.cal_type = 'f';

                        tmp_ris = (*g_sL.glo_ymT[begin->opn1.id].func_t)[i2s(tmp_t)]->no_ris;
                        merge(3, glo_begin, mkIR(IR_ASSIGN), head);
                        head->prior->cal_type = 'f';
                        head->prior->opn2.cal_type = 'f';
                        initOpn(&glo_opn1);
                        //修改符号表中的信息，将最晚调用的临时变量设为栈存储。
                        (*g_sL.glo_ymT[begin->opn1.id].func_t)[i2s(tmp_t)]->status = 1;
                        (*g_sL.glo_ymT[begin->opn1.id].func_t)[i2s(tmp_t)]->address = tmp_sp + 4;
                        //将这个临时变量的寄存器分配给新临时变量；改符号表；
                        dlt = vtmp_map.begin()->first;
                        vtmp_map.erase(dlt);
                        (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->status = 2;
                        (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris = tmp_ris;
                        // ris3_status[tmp_ris] = a2i(O->id);
                        O->status = 2, O->no_ris = tmp_ris;
                    }
                }
                tmp_sp += 4;
                // DisplaySymbolTable(g_sL.now_func);
            }
            else //寄存器有空，分配寄存器；
            {
                // printf("分配%d号寄存器\n", *vris_pq->begin());
                int a2ians = a2i(O->id);

                vtmp_map.insert(std::map<int, int>::value_type(O->next_use, a2ians));
                // printmap(&vtmp_map);

                (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->status = 2;
                (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris = *vris_pq->begin();
                // ris3_status[(*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris] = a2i(O->id);

                O->status = 2;
                O->no_ris = *vris_pq->begin();
                vris_pq->erase(O->no_ris);
                // printf("aaaaaaaaaaa "), printOpn(*O), printf("\t%c", O->kind), printf(": %d\n", tmp_allot[a2i(O->id)]);
            }
            tmp_allot[a2i(O->id)] = 1;
        }
        //该寄存器非第一次出现，且不是最后一次出现；（调用了一个活跃的变量）；
        else if (O->next_use > 2)
        {
            struct symbol *tmp_Tsym = (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id];
            //当前临时变量分配到了寄存器里；
            if (tmp_Tsym->status == 2)
            {
                // printf("调用%d号寄存器的值；\n", tmp_Tsym->no_ris);
                O->status = 2, O->no_ris = tmp_Tsym->no_ris;
                vtmp_map[O->next_use] = a2i(O->id);
            }
            //当前临时变量分配到了栈空间里；
            else if (tmp_Tsym->status == 1)
            {
                O->status = 2;
                vtmp_map[O->next_use] = a2i(O->id);
                // printmap(&vtmp_map);
                int tmp_t1 = vtmp_map.begin()->second;
                //如果本次调用的变量下次调用的时间是所有存在寄存器中的变量中最晚的，则直接取到寄存器104中用完即删，仍放在栈中；
                if (tmp_t1 == a2i(O->id))
                {
                    // printf("调用栈中内容\n");

                    glo_opn1.type = 'v', glo_opn1.status = 1, glo_opn1.address = tmp_Tsym->address, glo_opn1.kind = 'V', glo_opn1.flage = '0';
                    glo_res.type = 'v', glo_res.status = 2, glo_res.no_ris = 104, glo_res.kind = 'T';
                    glo_opn1.id = O->id;
                    glo_res.cal_type = 'f';
                    split(glo_begin, head), merge(3, glo_begin, mkIR(IR_LOAD), head);
                    head->prior->cal_type = 'f';
                    head->prior->result.cal_type = 'f';
                    tmp_Tsym->status = 1;
                    // tmp_TsymL->status = 1;
                    dlt = vtmp_map.begin()->first;
                    vtmp_map.erase(dlt);
                    O->status = 2, O->address = tmp_Tsym->address, O->no_ris = 104;
                }
                //如果本次调用的变量下次调用的时间不是所有存在寄存器中的变量中最晚的，则进行寄存器与栈空间的变量交换。
                else if (tmp_t1 != a2i(O->id))
                {

                    {
                        // printf("置换栈中内容\n");
                        int tmp_ris1 = (*g_sL.glo_ymT[begin->opn1.id].func_t)[i2s(tmp_t1)]->no_ris;
                        //做一次move；
                        glo_opn1.status = 2, glo_opn1.no_ris = 104, glo_opn1.kind = 'T';
                        glo_opn2.status = 2, glo_opn2.no_ris = tmp_ris1, glo_opn2.kind = 'T';
                        glo_opn1.type = 'v', glo_opn2.type = 'v';
                        glo_opn1.cal_type = 'f';
                        glo_opn2.cal_type = 'f';
                        split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);
                        head->prior->cal_type = 'f';
                        head->prior->opn1.cal_type = 'f';
                        head->prior->opn2.cal_type = 'f';
                        //设定一节点地址为变量地址；二节点为寄存器；做一次load；
                        glo_opn1.status = 1, glo_opn1.id = tmp_Tsym->name, glo_opn1.kind = 'V', glo_opn1.flage = '0';
                        glo_opn1.address = (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->address;
                        glo_res.status = 2, glo_res.no_ris = tmp_ris1, glo_res.kind = 'T', glo_res.type = 'v';
                        glo_opn1.type = 'v', glo_opn2.type = 'v';
                        glo_res.cal_type = 'f';
                        split(glo_begin, head), merge(3, glo_begin, mkIR(IR_LOAD), head);
                        head->prior->cal_type = 'f';
                        head->prior->result.cal_type = 'f';

                        //设定一节点地址为变量地址，二结点为寄存器；做一次store；
                        glo_opn1.status = 1, glo_opn1.id = tmp_Tsym->name, glo_opn1.kind = 'V', glo_opn1.flage = '0';
                        glo_opn1.address = (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->address;
                        glo_opn1.type = 'v', glo_opn2.type = 'v';
                        glo_opn2.status = 2, glo_opn2.no_ris = 104, glo_opn2.kind = 'T', glo_opn2.type = 'v';
                        glo_opn2.cal_type = 'f';
                        split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);
                        head->prior->cal_type = 'f';
                        head->prior->opn2.cal_type = 'f';

                        //改符号表项；
                        (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->status = 2, (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris = tmp_ris1;
                        (*g_sL.glo_ymT[begin->opn1.id].func_t)[i2s(tmp_t1)]->status = 1, (*g_sL.glo_ymT[begin->opn1.id].func_t)[i2s(tmp_t1)]->address = (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->address;

                        // ris3_status[tmp_ris1] = a2i(O->id);
                        dlt = vtmp_map.begin()->first;
                        vtmp_map.erase(dlt);

                        //改下一条语句变量项；
                        O->status = 2, O->no_ris = tmp_ris1;
                    }
                    // ris3_status[(*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris] = a2i(O->id);
                    // DisplaySymbolTable(begin->opn1.id);
                }
                // DisplaySymbolTable(g_sL.now_func);
            }
        }
        //该寄存器是最后一次出现，调用后释放相关栈空间和寄存器（重新进入寄存器分配池队列）；
        else if (O->next_use < 3)
        {
            struct symbol *tmp_Tsym1 = (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id];
            //存在栈空间分配；不再使用此变量，此时还要调用一次，在栈中的变量要再取一次。
            if ((*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->status % 2 == 1)
            {
                // printf("调用并释放栈中内容！\n");
                glo_opn1.type = 'v', glo_opn1.status = 1, glo_opn1.address = tmp_Tsym1->address, glo_opn1.kind = 'V', glo_opn1.flage = '0';
                glo_res.type = 'v', glo_res.status = 2, glo_res.no_ris = 104, glo_res.kind = 'T';
                glo_res.cal_type = 'f';
                split(glo_begin, head), merge(3, glo_begin, mkIR(IR_LOAD), head);
                head->prior->cal_type = 'f';
                head->prior->result.cal_type = 'f';

                tmp_Tsym1->status = 1;
                // tmp_Tsym1L->status = 1;
                // GSL中分配方式是1，而O中分配方式是2，即从本条命令从寄存器10中取用，下一次调用语句仍然访问栈空间；
                O->status = 2, O->address = tmp_Tsym1->address, O->no_ris = 104;
                vtmp_map.erase(O->next_use);
                //载入语句;
                // DisplaySymbolTable();
            }
            //只存在寄存器里；不再使用此变量，还要调用一次，但是不需要载入操作。
            else
            {
                O->status = 2;
                O->no_ris = (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris;

                if ((*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris != 104 && (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris != 105 && (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris < 190)
                    vris_pq->insert((*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris);
                // printf("最后一次调用%d号寄存器。\n", (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris);
                if (vtmp_map.find(O->next_use) != vtmp_map.end())
                    vtmp_map.erase(O->next_use);
                (*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->status = 2;

                // ris3_status[(*g_sL.glo_ymT[begin->opn1.id].func_t)[O->id]->no_ris] = -1;
            }
        }
    }

    if (vtmp_map.find(eind) != vtmp_map.end())
        vtmp_map.erase(eind);
    if (tmp_map.find(eind) != tmp_map.end())
        tmp_map.erase(eind);
}

//以一个函数为单位进行寄存器分配；
int func_ris_allot(struct codenode *begin, struct codenode *end, int end_index, struct codenode *glo_begin)
{
    // cout << begin->opn1.id << ":\n";
    int float_cal_sym = 0;
    //初始化寄存器状态数组;
    for (int rssi = 0; rssi < 10; rssi++)
        ris3_status[rssi] = -1;
    set<int, greater<int>> ris_pq = {4, 5, 6, 7, 8, 9, 10};
    set<int, greater<int>> vris_pq = {121, 120, 119, 118, 117, 116};
    int pre_func_size = g_sL.glo_ymT[begin->opn1.id].size;
    g_sL.now_func = begin->opn1.id;
    //反向循环计算临时变量的失效时间及维护每个语句的临时变量的下次使用信息；
    //维护用到的寄存器号最大值，方便函数进入保护现场，退出恢复现场；
    int used_ris_num = 0;
    struct codenode *cur_C; //当前语句；
    cur_C = end;
    int i;

    int tmp_num = g_sL.glo_ymT[begin->opn1.id].func_t != NULL ? (*g_sL.glo_ymT[begin->opn1.id].func_t).size() : 0;
    for (i = 0; cur_C != begin; cur_C = cur_C->prior, i++)
    {

        if (cur_C->opn1.type == 'v' && (cur_C->opn1.kind == 'T' || cur_C->opn1.kind == 'S'))
        {

            maintain_tmp_use(&cur_C->opn1, 3 * (end_index - i));
        }
        if (cur_C->opn2.type == 'v' && (cur_C->opn2.kind == 'T' || cur_C->opn2.kind == 'S'))
        {

            maintain_tmp_use(&cur_C->opn2, 3 * (end_index - i) + 1);
        }
        if (cur_C->result.type == 'v' && (cur_C->result.kind == 'T' || cur_C->result.kind == 'S'))
        {

            maintain_tmp_use(&cur_C->result, 3 * (end_index - i) + 2);
        }
    }

    int begin_index = end_index - i;
    int alive_tmp_num = 0, max_alive_tmp = 0;
    //正向循环完成寄存器分配；并在寄存器不足时插入合适的访存语句；同时维护寄存器号最大值；
    cur_C = begin;
    tmp_sp = pre_func_size;                  // printf("临时变量数：%d\n", tmp_num);
    memset(tmp_allot, 0, (tmp_num + 2) * 4); //清空数组中的值，复用此数组；
    tmp_map.clear(), vtmp_map.clear();
    // if (g_sL.now_func == "main")
    //     DisplaySymbolTable();
    g_sL.now_func = begin->opn1.id;

    for (i = 0; cur_C != end; cur_C = cur_C->next, i++)
    {
        if (cur_C->op == IR_ALLOCA || cur_C->op == IR_VOID)
            continue;
        int tmp_ris1 = 12, tmp_ris2 = 0;
        // if (cur_C->op > IR_ASSIGN && cur_C->op < 
        if (cur_C->opn1.kind == 'S' && g_sL.find(cur_C->opn1.id)->status != 0)
        {
            cur_C->opn1.status = g_sL.find(cur_C->opn1.id)->status;
            cur_C->opn1.address = g_sL.find(cur_C->opn1.id)->address;
            cur_C->opn1.no_ris = g_sL.find(cur_C->opn1.id)->no_ris;
            //补充固定分配释放，以便重复使用；
            if (cur_C->opn1.next_use < 3)
            {
            }
        }
        else if (cur_C->opn1.type == 'v' && cur_C->opn1.kind == 'T' && a2i(cur_C->opn1.id) > -1)
        {
            tmp_ris_allot(&cur_C->opn1, begin, glo_begin, cur_C, &ris_pq, &vris_pq, 3 * (begin_index + i), tmp_ris1);
            if (cur_C->opn1.no_ris > 99 && cur_C->opn1.no_ris < 199)
                float_cal_sym = 1;
        }
        else if (cur_C->opn1.type == 'v' && g_sL.find(cur_C->opn1.id)->flag == 'H')
        {
            cur_C->opn1.status = g_sL.find(cur_C->opn1.id)->status;
            cur_C->opn1.address = g_sL.find(cur_C->opn1.id)->address;
            cur_C->opn1.no_ris = g_sL.find(cur_C->opn1.id)->no_ris;
        }

        if (ris_pq.size() > 0)
            g_sL.find(g_sL.now_func)->maxRis = g_sL.find(g_sL.now_func)->maxRis < *ris_pq.begin() ? g_sL.find(g_sL.now_func)->maxRis : *ris_pq.begin();
        else
            g_sL.find(g_sL.now_func)->maxRis = 3;

        if (cur_C->opn2.kind == 'S' && g_sL.find(cur_C->opn2.id)->status != 0)
        {
            cur_C->opn2.status = g_sL.find(cur_C->opn2.id)->status;
            cur_C->opn2.address = g_sL.find(cur_C->opn2.id)->address;
            cur_C->opn2.no_ris = g_sL.find(cur_C->opn2.id)->no_ris;
            //补充固定分配释放，以便重复使用；
        }
        // else if (cur_C->opn2.kind == 'T' && cur_C->opn2.status == 2)
        // {
        // }
        else if (cur_C->opn2.type == 'v' && cur_C->opn2.kind == 'T' && a2i(cur_C->opn2.id) > -1)
        {
            // cout << "分配：" << cur_C->opn2.id << "查询状态" << a2i(cur_C->opn2.id.c_str()) << endl;
            tmp_ris_allot(&cur_C->opn2, begin, glo_begin, cur_C, &ris_pq, &vris_pq, 3 * (begin_index + i) + 1, tmp_ris2);

            if (cur_C->opn2.no_ris > 99 && cur_C->opn2.no_ris < 199)
                float_cal_sym = 1;
        }
        else if (cur_C->opn2.type == 'v' && g_sL.find(cur_C->opn2.id)->flag == 'H')
        {
            cur_C->opn2.status = g_sL.find(cur_C->opn2.id)->status;
            cur_C->opn2.address = g_sL.find(cur_C->opn2.id)->address;
            cur_C->opn2.no_ris = g_sL.find(cur_C->opn2.id)->no_ris;
        }

        if (ris_pq.size() > 0)
            g_sL.find(g_sL.now_func)->maxRis = g_sL.find(g_sL.now_func)->maxRis < *ris_pq.begin() ? g_sL.find(g_sL.now_func)->maxRis : *ris_pq.begin();
        else
            g_sL.find(g_sL.now_func)->maxRis = 3;

        if (cur_C->result.kind == 'S' && g_sL.find(cur_C->result.id)->status != 0)
        {
            cur_C->result.status = g_sL.find(cur_C->result.id)->status;
            cur_C->result.address = g_sL.find(cur_C->result.id)->address;
            cur_C->result.no_ris = g_sL.find(cur_C->result.id)->no_ris;
            //补充固定分配释放，以便重复使用；
            if (cur_C->result.next_use < 3)
            {
            }
        }
        else if (cur_C->result.type == 'v' && cur_C->result.kind == 'T' && a2i(cur_C->result.id) > -1)
        {
            // printf("分配%s\n", cur_C->result.id.c_str());
            tmp_ris_allot(&cur_C->result, begin, glo_begin, cur_C, &ris_pq, &vris_pq, 3 * (begin_index + i) + 2, tmp_ris1);
            if (cur_C->result.no_ris > 99 && cur_C->result.no_ris < 199)
                float_cal_sym = 1;
        }
        else if (cur_C->result.type == 'v' && g_sL.find(cur_C->result.id)->flag == 'H')
        {
            cur_C->result.status = g_sL.find(cur_C->result.id)->status;
            cur_C->result.address = g_sL.find(cur_C->result.id)->address;
            cur_C->result.no_ris = g_sL.find(cur_C->result.id)->no_ris;
        }

        if (ris_pq.size() > 0)
            g_sL.find(g_sL.now_func)->maxRis = g_sL.find(g_sL.now_func)->maxRis < *ris_pq.begin() ? g_sL.find(g_sL.now_func)->maxRis : *ris_pq.begin();
        else
            g_sL.find(g_sL.now_func)->maxRis = 3;

        // if (cur_C->opn1.id == "t111" && cur_C->opn2.id == "t50")
        // {
        //     cout << "t50分配寄存器：" << IR_op_strs[cur_C->op] << "\t" << cur_C->opn2.id << "\t" << cur_C->opn2.cal_type << "\t" << cur_C->opn2.no_ris << endl;
        // }
    }

    // printf("func:%s\tpsize:%d\tnsize:%d\ttmp_sp:%d\n", begin->opn1.id.c_str(), g_sL.glo_ymT[begin->opn1.id].size, g_sL.glo_ymT[begin->opn1.id].size + tmp_sp, tmp_sp);
    // printf("g_sL.glo_ymT[begin->opn1.id].size: %d,tmp_sp:%d\n", g_sL.glo_ymT[begin->opn1.id].size, tmp_sp);
    g_sL.glo_ymT[begin->opn1.id].size = tmp_sp;

    // DisplaySymbolTable();

    if (float_cal_sym == 1)
    {
        begin->cal_type = 'f';
        end->cal_type = 'f';
    }
    if (g_sL.find(g_sL.now_func)->maxRis % 2 == 0)
        g_sL.find(g_sL.now_func)->maxRis--;
    return max_alive_tmp * 4;
}

//全局寄存器分配；
void glo_ris_allot()
{
    // printf("glo_ris_alloting\n");

    struct codenode *hC, *now_C;
    if (out_IR == NULL || out_IR == &null_ir)
    {
        return;
    }
    hC = out_IR;
    now_C = hC;
    int i = 0;
    int now_begin_index, now_end_index;

    struct codenode *now_begin, *now_end; //当前的函数体的开始语句索引与终止语句索引；
    // 大循环,找出所有的func_end和function语句并按函数体分别分配寄存器；
    if (now_C->op == IR_FUNCTION)
    {
        g_sL.now_func = now_C->opn1.id;
        now_begin = now_C, now_begin_index = i;
    }
    if (now_C->next != NULL && now_C->next != &null_ir)
    {
        now_C = now_C->next;

        for (i = 1; now_C != hC; i++)
        {

            if (now_C->op == IR_FUNCTION)
            {
                now_begin = now_C, g_sL.now_func = now_C->opn1.id,
                now_begin_index = i;
            }
            else if (now_C->op == IR_FUNC_END)
            {

                now_end = now_C, now_end_index = i;

                func_ris_allot(now_begin, now_end, now_end_index, hC);

                // g_sL.glo_ymT[g_sL.now_func].size += add_size;

                // if (add_size < 41)
                // {
                //     now_begin->opn2.type = 'i', now_begin->opn2.const_int = add_size;
                //     now_end->opn2.type = 'i', now_end->opn2.const_int = add_size;
                // }
                // else if (add_size > 40)
                // {
                if (g_sL.glo_ymT.find(g_sL.now_func) == g_sL.glo_ymT.end())
                    return;
                now_begin->opn2.type = 'i', now_begin->opn2.const_int = 40;
                now_begin->result.type = 'i', now_begin->result.const_int = g_sL.glo_ymT[g_sL.now_func].size;
                // printf("%s: %d\n", g_sL.now_func.c_str(), g_sL.glo_ymT[g_sL.now_func].size);
                // DisplaySymbolTable();

                now_end->opn2.type = 'i', now_end->opn2.const_int = 40;
                now_end->result.type = 'i', now_end->result.const_int = g_sL.glo_ymT[g_sL.now_func].size;
                // }

                now_begin = NULL, now_end = NULL;
                g_sL.now_func = "glo";

                // printf("%d: now_begin:%d; now_end:%d", i, now_begin_index, now_end_index);
                // printf("\tOP: %s\n", IR_op_strs[int(now_C->op)]);
            }

            if (now_C->next != NULL || now_C->next != &null_ir)
                now_C = now_C->next;
            else
            {
                now_C->next = hC;
                break;
            }
        }
    }
}
