#include "gen_arm.h"
#include <queue>
#include <map>
using namespace std;
/*--------------------------------------------相关全局变量-------------------------------------*/
//临时变量分配数组。
int tmp_allot[500];
int tmp_sp;
// arm语句打印支持;
char arm_op_strs[39][12] = {
    "store", "EXP_POINT", "POINT_EXP",

    "add", "sub", "mul", "div", "mod", "jlt", "jle", "jgt", "jge", "eq", "neq", "and", "or", "GOTO_JLT", "GOTO_JLE", "GOTO_JGT", "GOTO_JGE", "beq", "GOTO_NEQ", "GOTO_AND", "GOTO_OR", "ldr", "str",

    "bne ", "bl", "not", "load", "alloca",

    "function: ", "func_end:", "param", "label:", "b",

    "arg", "ret", "bl"};
//寄存器分配支持；
int ris[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
priority_queue<int, vector<int>> ois_pq(ris, ris + 10);
map<int, int, greater<int>> tmp_map;
//实参设置的支持；
int ris3_status[10];

/*--------------------------------------------支持函数实现区------------------------------------*/

//字符串转化成数字；
inline int
a2i(char *in)
{

    int x = 0, f = 1;
    int i = 0;
    char ch = in[i];
    i++;
    while (ch < '0' || ch > '9')
    {
        if (ch == '-')
            f = -1;
        ch = in[i], i++;
    }
    while (ch >= '0' && ch <= '9')
    {
        x = x * 10 + ch - 48;
        ch = in[i], i++;
    }
    return x * f;
}

//双向链表的分割；
void split(struct codenode *head1, struct codenode *head2)
{
    struct codenode *tail2 = head1->prior, *tail1 = head2->prior;
    head1->prior = tail1, tail1->next = head1;
    head2->prior = tail2, tail2->next = head2;
}

void printOpn_arm1(struct opn topn)
{
    switch (topn.type)
    {
    case 'v':
        // fprintf(fp, "%s", topn.id);
        // fprintf(fp, "\t此变量kind：%c", topn.kind);
        // if (topn.kind == 'T')
        //     fprintf(fp, "\t此变量nextuse：%d", topn.next_use);
        if (topn.kind == 'V' || topn.kind == 'P' || topn.kind == 'L' || topn.kind == 'F')
        {
            fprintf(fp, "%s", topn.id);
        }
        else if (topn.kind == 'T')
        {
            // fprintf(fp, "%s %d %d %d", topn.id, topn.status, topn.no_ris, topn.address);
            if (topn.status == 2)
                fprintf(fp, "r%d", topn.no_ris);
            else if (topn.status < 2)
                fprintf(fp, "%s出错", topn.id);
        }
        break;
    case 'i':
        fprintf(fp, "#%d", topn.const_int);
        break;
    case 'f':
        fprintf(fp, "#%f", topn.const_float);
        break;
    case 'c':
        fprintf(fp, "%c", topn.const_char);
        break;
    default:
        fprintf(fp, "空变量");
    }
}

void printOpn_arm2(struct opn topn)
{
    switch (topn.type)
    {
    case 'v':
        // fprintf(fp, "\t%s", topn.id);
        //  fprintf(fp, "\t此变量kind:%c", topn.kind);
        //  if (topn.kind == 'V' || topn.kind == 'P')
        //      fprintf(fp, "\%d", topn.address);
        //  if (topn.kind == 'T')
        //      fprintf(fp, "\t此变量nextuse：%d", topn.next_use);
        if (topn.kind == 'V' || topn.kind == 'P' || topn.kind == 'L' || topn.kind == 'F')
        {
            fprintf(fp, "\t%s", topn.id);
        }
        else if (topn.kind == 'T')
        {
            // fprintf(fp, "\t%s %d %d %d", topn.id, topn.status, topn.no_ris, topn.address);
            if (topn.status == 2)
                fprintf(fp, "\tr%d", topn.no_ris);
            else if (topn.status < 2)
                fprintf(fp, "\t%s出错", topn.id);
        }
        break;
    case 'i':
        fprintf(fp, "\t#%d", topn.const_int);
        break;
    case 'f':
        fprintf(fp, "\t#%f", topn.const_float);
        break;
    case 'c':
        fprintf(fp, "\t%c", topn.const_char);
        break;
    default:
        fprintf(fp, "\t空变量");
    }
}

void print_arm_IR(codenode *h)
{
    if (h->op == IR_FUNCTION)
    {
        fprintf(fp, "\n\t.global\t__aeabi_idiv\n");
        fprintf(fp, "\t.global\t__aeabi_idivmod\n");
        fprintf(fp, "\t.align\t2\n\t.global"), printOpn_arm2(h->opn1), fprintf(fp, "\n\t.type"), printOpn_arm2(h->opn1), fprintf(fp, ", %%function\n");
        if (sT.symbols[h->opn1.offset].paramnum > 4)
            printOpn_arm1(h->opn1), fprintf(fp, ":\n\t@ args = %d, pretend = 0, frame = %d\n", 4 * (sT.symbols[h->opn1.offset].paramnum - 4), sT.symbols[h->opn1.offset].size.const_int - 4);
        else
            printOpn_arm1(h->opn1), fprintf(fp, ":\n\t@ args = %d, pretend = 0, frame = %d\n", 0, sT.symbols[h->opn1.offset].size.const_int - 4);

        fprintf(fp, "\t@ frame_needed = 1, uses_anonymous_args = 0\n\t@ link register save eliminated.\n");
        if (h->opn2.const_int / 4 > 0)
            fprintf(fp, "\tstmfd\tsp!, {r4-r10,fp, lr}\n");
        else if (h->opn2.const_int / 4 == 0)
            fprintf(fp, "\tstmfd\tsp!, {r0,fp, lr}\n");
        fprintf(fp, "\tadd\tfp, sp, #0"); //, h->result.const_int
        if (sT.symbols[h->opn1.offset].size.const_int > 12)
        {
            fprintf(fp, "\n\tsub\tsp, sp, #%d", sT.symbols[h->opn1.offset].size.const_int);
        }
    }
    else if (h->op == IR_FUNC_END)
    {
        if (h->opn2.const_int / 4 > 0)
            fprintf(fp, "\tadd\tsp, fp, #%d\n\tldmfd\tsp!, {r4-r10,fp, pc}\n", 0);
        else if (h->opn2.const_int / 4 == 0)
            fprintf(fp, "\tadd\tsp, fp, #%d\n\tldmfd\tsp!, {r0,fp, pc}\n", 0);
        fprintf(fp, "\t.size\t%s, .-%s", h->opn1.id, h->opn1.id);
    }
    else if (h->op == IR_LABEL)
    {
        fprintf(fp, "\n"), printOpn_arm1(h->opn1), fprintf(fp, ":"); //遇到标签或函数定义先加空行，增强可读性；
    }
    else if (h->op == IR_ASSIGN)
    {
        //分成变量装入和常数移动两种；其他的实参形参返回值的赋值特判打印；
        if (strcmp(h->opn1.id, "r0") == 0)
        {
            fprintf(fp, "\tmov\tr0"), fprintf(fp, ", "), printOpn_arm1(h->opn2);
        }
        else if ((h->opn1.type == 'v' && h->opn1.kind == 'T') && (h->opn2.type == 'v' && h->opn2.kind == 'T'))
            fprintf(fp, "\tmov\t"), printOpn_arm1(h->opn1), fprintf(fp, ", "), printOpn_arm1(h->opn2);
        else if (h->opn1.type == 'v' && (h->opn1.kind == 'V' || h->opn1.kind == 'P'))
            fprintf(fp, "\tstr\t"), printOpn_arm1(h->opn2), fprintf(fp, ", [fp, #%d", -h->opn1.address), fprintf(fp, "]");
        else if (h->opn1.type == 'v' && (h->opn1.kind == 'R')) // R表示实参；
            fprintf(fp, "\tstr\t"), printOpn_arm1(h->opn2), fprintf(fp, ", [sp, #%d", -h->opn1.address), fprintf(fp, "]");
        else if (h->opn2.type == 'i' || h->opn2.type == 'f')
            fprintf(fp, "\tldr\t"), printOpn_arm1(h->opn1), h->opn2.type == 'i' ? fprintf(fp, ", =%d", h->opn2.const_int) : fprintf(fp, ", =%f", h->opn2.const_float);
    }
    // else if (h->op == IR_ALLOCA)
    // {
    //     fprintf(fp, "\tstr\t"), printOpn_arm1(h->opn2), fprintf(fp, ", [sp, #%d", -h->opn1.address), fprintf(fp, "]");
    // }
    else if (h->op == IR_ARG || h->op == IR_ALLOCA)
    {
    }
    else if (h->op == IR_PARAM)
    {
        fprintf(fp, "\tstr\t"), printOpn_arm1(h->opn1), fprintf(fp, ", [fp, #%d", h->opn2.address), fprintf(fp, "]\n");
    }
    else if (h->op == IR_LOAD)
    {
        fprintf(fp, "\tldr\t"), printOpn_arm1(h->result), fprintf(fp, ", [fp, #%d", -h->opn1.address), fprintf(fp, "]");
    }
    else if (h->op == IR_MINUS)
    {
        if (h->opn1.type != 'v')
        {
            fprintf(fp, "\trsb\t"), printOpn_arm1(h->result), fprintf(fp, ", "), printOpn_arm1(h->opn2), fprintf(fp, ", "), printOpn_arm1(h->opn1);
        }
        else
        {
            fprintf(fp, "\tsub\t"), printOpn_arm1(h->result), fprintf(fp, ", "), printOpn_arm1(h->opn1), fprintf(fp, ", "), printOpn_arm1(h->opn2);
        }
    }
    else if (h->op == IR_CALL)
    {
        fprintf(fp, "\tbl\t"), printOpn_arm1(h->opn1), fprintf(fp, "\n\tmov\t"), printOpn_arm1(h->result), fprintf(fp, ", r0");
    }
    else
    {
        fprintf(fp, "\t%s", arm_op_strs[h->op]);
        if (h->op == IR_EXP_ARROFF)
        {
            printOpn_arm2(h->result), fprintf(fp, ",\t["), printOpn_arm1(h->opn1), fprintf(fp, ", "), printOpn_arm1(h->opn2), fprintf(fp, "]");
        }
        else if (h->op == IR_ARROFF_EXP)
        {
            printOpn_arm2(h->result), fprintf(fp, ",\t["), printOpn_arm1(h->opn1), fprintf(fp, ", "), printOpn_arm1(h->opn2), fprintf(fp, "]");
        }
        else if (h->op < IR_ADD)
        {
            printOpn_arm2(h->opn1), printOpn_arm2(h->opn2);
        }
        else if (h->op < IR_GOTO_NOT)
        {
            printOpn_arm2(h->result), fprintf(fp, ", "), printOpn_arm1(h->opn2), fprintf(fp, ", "), printOpn_arm1(h->opn1);
        }
        else if (h->op < IR_FUNCTION)
        {
            printOpn_arm2(h->opn1), printOpn_arm2(h->result);
        }
        else if (h->op < IR_ARG)
        {

            printOpn_arm2(h->opn1);
        }
        else
        {
            printOpn_arm2(h->result);
        }
    }
    if (h->op != IR_PARAM && h->op != IR_ALLOCA && h->op != IR_ARG)
        fprintf(fp, "\n");
}

void DisplayARM()
{
    strcpy(tmp_name, strtok(filename, "."));
    char tmp_name2[] = "../test/fcl_arm_out/";
    char tmp_name3[36];
    strcpy(tmp_name3, strcat(tmp_name, ".fcl.s"));
    strcpy(out_file, strcat(tmp_name2, tmp_name3));
    fp = fopen(out_file, "w");
    int i = 0;
    codenode *ir = out_IR, *head = ir;

    if (ir != &null_ir)
        for (i = 0; 1; i++)
        {
            // fprintf(fp, "\t%d", i);
            print_arm_IR(ir);
            if (ir->next == head)
                break;
            ir = ir->next;
        }

    fclose(fp);
}

/*-------------------------------------------IR翻译函数实现区---------------------------------*/

void trslt_arg(int a_index, struct codenode *glo_begin, struct codenode *head, int st_index)
{
    int tmp_ris1 = head->result.no_ris, tmp_ris2 = a_index;
    int tmp_t1 = ris3_status[a_index], tmp_t2 = a2i(head->result.id);
    if (a_index < 4)
    {
        if (ris3_status[a_index] == tmp_t2)
            ;
        else if (ris3_status[a_index] == -1)
        {
            printf("\t%d %s:%d\n", a_index, head->result.id, ris3_status[a_index]);
            head->op = IR_ASSIGN;
            copyOpn(&head->opn2, head->result);
            head->opn1.type = 'v', head->opn1.kind = 'T', head->opn1.status = 2, head->opn1.no_ris = a_index;
            // ris3_status[a_index] = a2i(head->result.id);
            printf("\t%d\t%d\n", head->opn1.no_ris, head->result.no_ris);
        }
        else
        {
            printf("\t%d:%d\n", a_index, ris3_status[a_index]);
            initOpn(&glo_opn1), initOpn(&glo_opn2);
            glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = 10;
            glo_opn2.type = 'v', glo_opn2.kind = 'T', glo_opn2.status = 2, glo_opn2.no_ris = tmp_ris2;
            split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);
            initOpn(&glo_opn1), initOpn(&glo_opn2);
            glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = tmp_ris2;
            glo_opn2.type = 'v', glo_opn2.kind = 'T', glo_opn2.status = 2, glo_opn2.no_ris = tmp_ris1;
            split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);
            head->opn1.type = 'v', head->opn1.kind = 'T', head->opn1.status = 2, head->opn1.no_ris = tmp_ris1;
            head->opn2.type = 'v', head->opn2.kind = 'T', head->opn2.status = 2, head->opn2.no_ris = 10;
            head->op = IR_ASSIGN;
            //改符号表
            printf("符号表：%d, %d, %d, %d\n", tmp_t1, tmp_ris1, tmp_t2, tmp_ris2);
            fsT.st[st_index + 1].Tsyms[tmp_t1].no_ris = tmp_ris1, fsT.st[st_index + 1].Tsyms[tmp_t2].no_ris = tmp_ris2;
            ris3_status[tmp_ris1] = tmp_t1, ris3_status[tmp_ris2] = tmp_t2;
            display_fsT();
        }
    }
    else
    {
        head->op = IR_ASSIGN;
        copyOpn(&head->opn2, head->result);
        head->opn1.type = 'v', head->opn1.kind = 'R', head->opn1.status = 1, head->opn1.address = -4 * (a_index - 4);
        // ris3_status[a_index] = a2i(head->result.id);
    }
}

void trslt_para(int a_index, struct codenode *glo_begin, struct codenode *head, int st_index)
{
    int tmp_ris1 = head->result.no_ris, tmp_ris2 = a_index;
    int tmp_t1 = ris3_status[a_index], tmp_t2 = a2i(head->result.id);
    if (a_index < 4)
    {
        head->opn1.type = 'v', head->opn1.status = 2, head->opn1.kind = 'T', head->opn1.no_ris = a_index;
        head->opn2.type = 'v', head->opn2.status = 1, head->opn2.kind = 'V', head->opn2.address = -(16 + 4 * a_index);
    }
    else
    {
        head->op = IR_ALLOCA;
        // struct codenode *hnext = head->next;
        // split(glo_begin, head), split(head, hnext);
        // merge(2, glo_begin, hnext);
        // head = hnext->prior;
    }
}

void trslt_div(struct codenode *glo_begin, struct codenode *head, int st_index, int type)
{
    int a_index = 0;
    int tmp_ris1, tmp_ris2, tmp_t1, tmp_t2;
    for (a_index = 0; a_index < 2; a_index++)
    {

        tmp_t1 = ris3_status[a_index], tmp_ris2 = a_index;
        if (a_index == 0)
            tmp_ris1 = head->opn1.no_ris, tmp_t2 = a2i(head->opn1.id);
        else
            tmp_ris1 = head->opn2.no_ris, tmp_t2 = a2i(head->opn2.id);
        printf("div:%d; %d\n", tmp_ris1, tmp_t2);
        if (ris3_status[a_index] == tmp_t2)
            ;
        else if (ris3_status[a_index] == -1)
        {
            a_index == 0 ? copyOpn(&glo_opn2, head->opn1) : copyOpn(&glo_opn2, head->opn2);
            glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = a_index;
            // ris3_status[a_index] = a2i(head->result.id);
            split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);
        }
        else
        {
            initOpn(&glo_opn1), initOpn(&glo_opn2);
            glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = 10;
            glo_opn2.type = 'v', glo_opn2.kind = 'T', glo_opn2.status = 2, glo_opn2.no_ris = tmp_ris2;
            split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);
            initOpn(&glo_opn1), initOpn(&glo_opn2);
            glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = tmp_ris2;
            glo_opn2.type = 'v', glo_opn2.kind = 'T', glo_opn2.status = 2, glo_opn2.no_ris = tmp_ris1;
            split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);
            glo_opn1.type = 'v', glo_opn1.kind = 'T', glo_opn1.status = 2, glo_opn1.no_ris = tmp_ris1;
            glo_opn2.type = 'v', glo_opn2.kind = 'T', glo_opn2.status = 2, glo_opn2.no_ris = 10;
            split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);

            //改符号表
            fsT.st[st_index + 1].Tsyms[tmp_t1].no_ris = tmp_ris1, fsT.st[st_index + 1].Tsyms[tmp_t2].no_ris = tmp_ris2;
            ris3_status[tmp_ris1] = tmp_t1, ris3_status[tmp_ris2] = tmp_t2;
            display_fsT();
        }
    }
    glo_res.type = 'v', glo_res.kind = 'F', strcpy(glo_res.id, type == 0 ? "__aeabi_idiv" : "__aeabi_idivmod");
    split(glo_begin, head), merge(3, glo_begin, mkIR(IR_CALL_VOID), head);
    head->op = IR_ASSIGN;
    copyOpn(&head->opn1, head->result);
    head->opn2.type = 'v', head->opn2.kind = 'T', head->opn2.status = 2, head->opn2.no_ris = type == 0 ? 0 : 1;
    // ris3_status[a_index] = a2i(head->result.id);
}


/*-------------------------------------------寄存器分配函数实现区---------------------------------*/
//模块化维护临时变量下次调用信息；
void maintain_tmp_use(struct opn *O, int index)
{
    // printf("tmp_allot[a2i(O->id)]: %d", tmp_allot[a2i(O->id)]);
    O->next_use = tmp_allot[a2i(O->id)];
    tmp_allot[a2i(O->id)] = index;
}

void cal_alive_num(struct opn *O, int &ans)
{
    if (tmp_allot[a2i(O->id)] == 0)
        ans++, tmp_allot[a2i(O->id)] = 1;
    else if (O->next_use == 0)
        ans--;
}

void tmp_ris_allot(struct opn *O, struct codenode *begin, struct codenode *glo_begin, struct codenode *head, priority_queue<int, vector<int>> *ris_pq)
{
    printf("%s: %s : %d,%d\n", begin->opn1.id, O->id, ris_pq->top(), O->next_use);
    int st_index = begin->opn1.offset;
    //该临时变量第一次出现，应该分配寄存器或栈空间存储；
    if (tmp_allot[a2i(O->id)] == 0)
    {

        if (ris_pq->empty()) //寄存器已满，分配内存区；
        {
            tmp_map[O->next_use] = a2i(O->id); //插入到map里;
            int tmp_t = tmp_map.begin()->second;
            if (tmp_t == a2i(O->id)) //新变量在调用后为最晚调用的临时变量；直接入栈，分配十号寄存器并插入存语句；
            {
                //分配十号寄存器；并把对应结点写入变量结点中；
                fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].status = 2;

                fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris = 10;
                O->status = 2, O->no_ris = 10;
                //插入存入栈语句；
                struct codenode *next_code = head->next;
                split(glo_begin, next_code);
                glo_opn1.type = 'v', glo_opn1.kind = 'V', strcpy(glo_opn1.id, O->id), glo_opn1.address = tmp_sp + 4, glo_opn1.status = 1;
                glo_opn2.type = 'v', glo_opn2.status = 2, glo_opn2.no_ris = 10;
                merge(3, glo_begin, mkIR(IR_ASSIGN), next_code);
                //分配空间并维护函数空间大小；
                fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].status = 1;
                fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].address = tmp_sp + 4;
                O->status = 1, O->address = fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].address;
                tmp_sp += 4;
            }
            else //新变量在调用后不是最晚的临时变量；
            {
                int tmp_ris;
                //插入存入栈语句；将最晚调用的临时变量存入栈；
                struct codenode *next_code = head->next;
                split(glo_begin, head); //换语句插入位置；
                glo_opn1.type = 'v', glo_opn1.kind = 'V', strcpy(glo_opn1.id, O->id), glo_opn1.address = tmp_sp + 4, glo_opn1.status = 1;
                glo_opn2.type = 'v', glo_opn2.status = 2, glo_opn2.no_ris = fsT.st[sT.symbols[st_index].val_index].Tsyms[tmp_t].no_ris;
                tmp_ris = fsT.st[sT.symbols[st_index].val_index].Tsyms[tmp_t].no_ris;

                merge(3, glo_begin, mkIR(IR_ASSIGN), next_code);
                //修改符号表中的信息，将最晚调用的临时变量设为栈存储。
                fsT.st[sT.symbols[st_index].val_index].Tsyms[tmp_t].status = 1;
                fsT.st[sT.symbols[st_index].val_index].Tsyms[tmp_t].address = tmp_sp + 4;
                //将这个临时变量的寄存器分配给新临时变量；改符号表；
                fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].status = 2;
                fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris = tmp_ris;
                ris3_status[fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris] = a2i(O->id);
                O->status = 2, O->no_ris = tmp_ris;
                tmp_sp += 4;
            }
        }
        else //寄存器有空，分配寄存器；
        {
            // printf("分配%d号寄存器\n", ris_pq->top());
            tmp_map[O->next_use] = a2i(O->id);
            fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].status = 2;
            fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris = ris_pq->top();
            ris3_status[fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris] = a2i(O->id);
            O->status = 2;
            O->no_ris = ris_pq->top();
            ris_pq->pop();
            // printf("aaaaaaaaaaa "), printOpn(*O), printf("\t%c", O->kind), printf(": %d\n", tmp_allot[a2i(O->id)]);
        }
        tmp_allot[a2i(O->id)] = 1;
    }
    //该寄存器非第一次出现，且不是最后一次出现；（调用了一个活跃的变量）；
    else if (O->next_use > 2)
    {
        struct T_symbol *tmp_Tsym = &fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)];
        //当前临时变量分配到了寄存器里；
        if (tmp_Tsym->status == 2)
        {
            O->status = 2, O->no_ris = tmp_Tsym->no_ris;
        }
        //当前临时变量分配到了栈空间里；
        else if (tmp_Tsym->status == 1)
        {
            O->status = 2;
            tmp_map[O->next_use] = a2i(O->id);

            int tmp_t1 = tmp_map.begin()->second;
            //如果本次调用的变量下次调用的时间是所有存在寄存器中的变量中最晚的，则直接取到寄存器十中用完即删，仍放在栈中；
            if (tmp_t1 == a2i(O->id))
            {

                glo_opn1.type = 'v', glo_opn1.status = 1, glo_opn1.address = tmp_Tsym->address, glo_opn1.kind = 'V';
                glo_opn2.type = 'v', glo_opn2.status = 2, glo_opn2.no_ris = 10;
                split(glo_begin, head), merge(3, glo_begin, mkIR(IR_LOAD), head);
                tmp_Tsym->status = 1;
                // FST中分配方式是1，而O中分配方式是2，即从本条命令从寄存器10中取用，下一次调用语句仍然访问栈空间；
                O->status = 2, O->address = tmp_Tsym->address, O->no_ris = 10;
            }
            //如果本次调用的变量下次调用的时间不是所有存在寄存器中的变量中最晚的，则进行寄存器与栈空间的变量交换。
            else if (tmp_t1 != a2i(O->id))
            {
                int tmp_ris1 = fsT.st[sT.symbols[st_index].val_index].Tsyms[tmp_t1].no_ris;
                //做一次move；
                glo_opn1.status = 2, glo_opn1.no_ris = 10, glo_opn1.kind = 'T';
                glo_opn2.status = 2, glo_opn2.no_ris = tmp_ris1, glo_opn2.kind = 'T';
                split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);

                //设定一节点地址为变量地址；二节点为寄存器；做一次load；
                glo_opn1.status = 1, glo_opn1.address = fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].address, strcpy(glo_opn1.id, tmp_Tsym->name), glo_opn1.kind = 'V';
                glo_opn2.status = 2, glo_opn2.no_ris = tmp_ris1, glo_opn2.kind = 'T';
                split(glo_begin, head), merge(3, glo_begin, mkIR(IR_LOAD), head);

                //设定一节点地址为变量地址，二结点为寄存器；做一次store；
                glo_opn1.status = 1, glo_opn1.address = fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].address, strcpy(glo_opn1.id, tmp_Tsym->name), glo_opn1.kind = 'V';
                glo_opn2.status = 2, glo_opn2.no_ris = 10, glo_opn2.kind = 'T';
                split(glo_begin, head), merge(3, glo_begin, mkIR(IR_ASSIGN), head);

                //改符号表项；
                fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].status = 2, fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris = tmp_ris1;
                fsT.st[sT.symbols[st_index].val_index].Tsyms[tmp_t1].status = 1, fsT.st[sT.symbols[st_index].val_index].Tsyms[tmp_t1].address = fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].address;

                //改下一条语句变量项；
                O->status = 2, O->no_ris = tmp_ris1;
                ris3_status[fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris] = a2i(O->id);
            }
        }
    }
    //该寄存器是最后一次出现，调用后释放相关栈空间和寄存器（重新进入寄存器分配池队列）；
    else if (O->next_use < 3)
    {
        struct T_symbol *tmp_Tsym1 = &fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)];
        //存在栈空间分配；不再使用此变量，此时还要调用一次，在栈中的变量要再取一次。
        if (fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].status % 2 == 1)
        {
            glo_opn1.type = 'v', glo_opn1.status = 1, glo_opn1.address = tmp_Tsym1->address, glo_opn1.kind = 'V';
            glo_opn2.type = 'v', glo_opn2.status = 2, glo_opn2.no_ris = 10;
            split(glo_begin, head), merge(3, glo_begin, mkIR(IR_LOAD), head);
            tmp_Tsym1->status = 1;
            // FST中分配方式是1，而O中分配方式是2，即从本条命令从寄存器10中取用，下一次调用语句仍然访问栈空间；
            O->status = 2, O->address = tmp_Tsym1->address, O->no_ris = 10;
            //载入语句;
        }
        //只存在寄存器里；不再使用此变量，还要调用一次，但是不需要载入操作。
        else
        {
            // printf("释放%d号寄存器\n", fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris);
            O->status = 2, O->no_ris = fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris;
            ris_pq->push(fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris);
            // printf("当前最小号寄存器号数%d\n", ris_pq->top());

            fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].status = 2;
            // fsT.st[sT.symbols[st_index].val_index].Tsyms[a2i(O->id)].no_ris = 0;
        }
    }
}

int func_ris_allot(struct codenode *begin, struct codenode *end, int end_index, struct codenode *glo_begin)
{
    //初始化寄存器状态数组;
    for (int rssi = 0; rssi < 10; rssi++)
        ris3_status[rssi] = -1;
    priority_queue<int, vector<int>> ris_pq(ois_pq);

    //维护用到的寄存器号最大值，方便函数进入保护现场，退出恢复现场；
    int used_ris_num = 0;
    struct codenode *cur_C; //当前语句；
    cur_C = end;
    int i;
    int tmp_num = fsT.st[sT.symbols[begin->opn1.offset].val_index].top;
    int argi = 0, parai = 0;
    //反向循环计算临时变量的失效时间及维护每个语句的临时变量的下次使用信息；
    for (i = 0; cur_C != begin; cur_C = cur_C->prior, i++)
    {

        if (cur_C->opn1.type == 'v' && cur_C->opn1.kind == 'T')
        {
            maintain_tmp_use(&cur_C->opn1, 3 * (end_index - i));
        }
        if (cur_C->opn2.type == 'v' && cur_C->opn2.kind == 'T')
        {
            maintain_tmp_use(&cur_C->opn2, 3 * (end_index - i) + 1);
        }
        if (cur_C->result.type == 'v' && cur_C->result.kind == 'T')
        {
            maintain_tmp_use(&cur_C->result, 3 * (end_index - i) + 2);
        }
    }
    int begin_index = end_index - i;
    int alive_tmp_num = 0, max_alive_tmp = 0;
    memset(tmp_allot, 0, (tmp_num + 2) * 4); //清空数组中的值，复用此数组；

    //正向循环计算最大活动临时变量数目，以分配相应栈空间；
    for (i = 0; cur_C != end; cur_C = cur_C->next, i++)
    {
        if (cur_C->opn1.type == 'v' && cur_C->opn1.kind == 'T')
        {
            // printf("aaaaaaaaaaa "), printOpn(cur_C->opn1), printf("\t%c", cur_C->opn1.kind), printf(": %d\n", tmp_allot[a2i(cur_C->opn1.id)]);

            cal_alive_num(&cur_C->opn1, alive_tmp_num);
        }
        if (cur_C->opn2.type == 'v' && cur_C->opn2.kind == 'T')
        {
            cal_alive_num(&cur_C->opn2, alive_tmp_num);
        }
        if (cur_C->result.type == 'v' && cur_C->result.kind == 'T')
        {
            cal_alive_num(&cur_C->result, alive_tmp_num);
        }
        // printf("当前索引：%d\t当前临时变量数：%d\n", (int)cur_C->op, alive_tmp_num);
        max_alive_tmp = alive_tmp_num > max_alive_tmp ? alive_tmp_num : max_alive_tmp;
    }
    cur_C = begin;
    int pre_func_size = sT.symbols[begin->opn1.offset].size.const_int;
    tmp_sp = pre_func_size;
    // printf("临时变量数：%d\n", tmp_num);
    memset(tmp_allot, 0, (tmp_num + 2) * 4); //清空数组中的值，复用此数组；

    //正向循环完成寄存器分配；并在寄存器不足时插入合适的访存语句；同时维护寄存器号最大值；
    for (i = 0; cur_C != end; cur_C = cur_C->next, i++)
    {
        if (cur_C->opn1.type == 'v' && cur_C->opn1.kind == 'T')
        {
            tmp_ris_allot(&cur_C->opn1, begin, cur_C, glo_begin, &ris_pq);
        }
        if (cur_C->opn2.type == 'v' && cur_C->opn2.kind == 'T')
        {
            tmp_ris_allot(&cur_C->opn2, begin, cur_C, glo_begin, &ris_pq);
        }
        if (cur_C->result.type == 'v' && cur_C->result.kind == 'T')
        {
            tmp_ris_allot(&cur_C->result, begin, cur_C, glo_begin, &ris_pq);
        }
        if (cur_C->op == IR_ARG)
        {
            trslt_arg(argi, glo_begin, cur_C, sT.symbols[begin->result.offset].val_index);
            argi++;
        }
        if (cur_C->op == IR_PARAM)
        {
            trslt_para(parai, glo_begin, cur_C, sT.symbols[begin->result.offset].val_index);
            parai++;
        }
        if (cur_C->op == IR_CALL || cur_C->op == IR_CALL_VOID)
        {
            argi = 0;
        }
        if (cur_C->op == IR_DIV)
        {
            trslt_div(glo_begin, cur_C, sT.symbols[begin->result.offset].val_index, 0);
        }
        if (cur_C->op == IR_MOD)
        {
            trslt_div(glo_begin, cur_C, sT.symbols[begin->result.offset].val_index, 1);
        }
    }
    // display_fsT();
    return max_alive_tmp * 4;
}

//全局寄存器分配；
void glo_ris_allot()
{

    struct codenode *hC, *now_C;
    hC = out_IR;
    now_C = hC;
    int i = 0;
    int now_begin_index, now_end_index;
    struct codenode *now_begin, *now_end; //当前的函数体的开始语句索引与终止语句索引；

    //大循环,找出所有的func_end和function语句并按函数体分别分配寄存器；
    if (now_C->op == IR_FUNCTION)
        now_begin = now_C, now_begin_index = i;
    now_C = now_C->next;
    for (i = 1; now_C != hC; now_C = now_C->next, i++)
    {

        if (now_C->op == IR_FUNCTION)
            now_begin = now_C, now_begin_index = i;
        else if (now_C->op == IR_FUNC_END)
        {
            now_end = now_C, now_end_index = i;
            tmp_map.clear();
            int add_size = func_ris_allot(now_begin, now_end, now_end_index, hC);
            sT.symbols[now_begin->opn1.offset].size.const_int += add_size;
            if (add_size < 41)
            {
                now_begin->opn2.type = 'i', now_begin->opn2.const_int = add_size;
                now_end->opn2.type = 'i', now_end->opn2.const_int = add_size;
            }
            else if (add_size > 40)
            {
                now_begin->opn2.type = 'i', now_begin->opn2.const_int = 40;
                now_begin->result.type = 'i', now_begin->result.const_int = add_size;
                now_end->opn2.type = 'i', now_end->opn2.const_int = 40;
                now_end->result.type = 'i', now_end->result.const_int = add_size;
            }
            //按照使用的寄存器个数与额外内存大小扩大函数栈帧大小；
            // TODO；
            now_begin = now_end = NULL;
        }
        // printf("%d: now_begin:%d; now_end:%d", i, now_begin_index, now_end_index);
        // printf("\tOP: %s\n", IR_op_strs[int(now_C->op)]);
    }
}

/*----------------------------------------------功能主干-----------------------------------------*/
void translation()
{
    glo_ris_allot();
}

extern "C" void gen_arm(int type)
{
    switch (type)
    {

    //生成并打印中间代码；
    case 0:
    {

        DisplayIR(out_IR);
        break;
    }

    //生成并打印无优化的目标代码；
    case 1:
    {
        translation();
        DisplayARM();
        break;
    }

    //生成并打印优化后的目标代码；
    case 2:
    {
        optimization();
        DisplayARM();
        break;
    }
    }
}
