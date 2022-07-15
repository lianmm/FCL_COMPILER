#include "putout_arm.h"

using namespace std;

// arm语句打印支持;有大写标志说明不一一对应arm语句；
char arm_ir_op[50][15] = {"store", "ext_alloca", "",
                          "add", "sub", "mul", "div", "mod", "jlt", "jle", "jgt", "jge", "cmp", "neq", "and", "orr", "blt", "ble", "bgt", "bge", "beq", "bne", "GOTO_AND", "GOTO_OR", "ldr", "str", "str", "AEIE", "add", "str",
                          "bne ", "bl", "not", "UMINUS", "load", "alloca",
                          "function: ", "func_end:", "param", "label:", "b",
                          "arg", "ret", "bl", "movne", "moveq"};

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
            fprintf(fp, "%s", topn.id.c_str());
        }
        else if (topn.kind == 'T')
        {
            if (topn.id == "fp")
                fprintf(fp, "fp");
            // fprintf(fp, "%s %d %d %d", topn.id, topn.status, topn.no_ris, topn.address);
            else if (topn.status == 2)
                fprintf(fp, "r%d", topn.no_ris);
            else if (topn.status < 2)
                fprintf(fp, "r%d", topn.no_ris);
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
    case '0':
        break;
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
            fprintf(fp, "\t%s", topn.id.c_str());
        }
        else if (topn.kind == 'T')
        {
            if (topn.id == "fp")
                fprintf(fp, "\tfp");
            else if (topn.status == 2)
                fprintf(fp, "\tr%d", topn.no_ris);
            else if (topn.status < 2)
                fprintf(fp, "\tr%d", topn.no_ris);
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
    case '0':
        break;
    }
}

void print_arm(arm_instruction *h)
{
    if (h == out_arm)
    {
        fprintf(fp, "\t.arch armv7-a\n\t.fpu vfpv4\n\t.arm\n");
    }
    switch ((int)h->op)
    {
    case arm_func:
    {
        g_sL.now_func = h->opn1.id;

        fprintf(fp, "\n\t.global\t__aeabi_idiv\n");
        fprintf(fp, "\t.global\t__aeabi_idivmod\n");

        fprintf(fp, "\t.text\n");
        fprintf(fp, "\t.align\t2\n\t.global"), printOpn_arm2(h->opn1);
        fprintf(fp, "\n\t.type"), printOpn_arm2(h->opn1), fprintf(fp, ", %%function\n");
        if (g_sL.find(h->opn1.id)->paramnum > 4)
            printOpn_arm1(h->opn1), fprintf(fp, ":\n\t@ args = %d, pretend = 0, frame = %d\n", 4 * (g_sL.find(h->opn1.id)->paramnum - 4), g_sL.find(h->opn1.id)->size.const_int - 4);
        else
            printOpn_arm1(h->opn1), fprintf(fp, ":\n\t@ args = %d, pretend = 0, frame = %d\n", 0, g_sL.find(h->opn1.id)->size.const_int - 4);

        fprintf(fp, "\t@ frame_needed = 1, uses_anonymous_args = 0\n\t@ link register save eliminated.\n");
        if (h->opn2.const_int / 4 > 0)
            fprintf(fp, "\tstmfd\tsp!, {r4-r10,fp, lr}\n");
        else if (h->opn2.const_int / 4 == 0)
            fprintf(fp, "\tstmfd\tsp!, {r0,fp, lr}\n");
        fprintf(fp, "\tadd\tfp, sp, #0"); //, h->result.const_int
        if (g_sL.find(h->opn1.id)->size.const_int > 12)
        {
            if (g_sL.find(h->opn1.id)->size.const_int < 501)
                fprintf(fp, "\n\tsub\tsp, sp, #%d", g_sL.find(h->opn1.id)->size.const_int);
            else
            {
                fprintf(fp, "\n\tldr\tr12, =%d", g_sL.find(h->opn1.id)->size.const_int);
                fprintf(fp, "\n\tsub\tsp, sp, r12");
            }
        }
        fprintf(fp, "\n");
        break;
    }
    case arm_func_end:
    {
        if (h->opn2.const_int / 4 > 0)
            fprintf(fp, "\tadd\tsp, fp, #%d\n\tldmfd\tsp!, {r4-r10,fp, pc}\n", 0);
        else if (h->opn2.const_int / 4 == 0)
            fprintf(fp, "\tadd\tsp, fp, #%d\n\tldmfd\tsp!, {r0,fp, pc}\n", 0);
        fprintf(fp, "\t.size\t%s, .-%s\n", h->opn1.id.c_str(), h->opn1.id.c_str());
        g_sL.now_func = "glo";
        break;
    }
    case arm_block:
    case arm_block_end:
    case arm_void:
    {
        break;
    }
    case arm_alloc_E:
    {
        fprintf(fp, "\t.global\t%s\n", h->result.id.c_str());
        fprintf(fp, "\t.data\n");
        fprintf(fp, "\t.align\t2\n");
        fprintf(fp, "\t.type\t%s, %%object\n", h->result.id.c_str());
        fprintf(fp, "\t.size\t%s, %d\n", h->result.id.c_str(), h->opn1.const_int);
        fprintf(fp, "%s:", h->result.id.c_str());
        if (g_sL.find(h->result.id)->flag == 'A' || g_sL.find(h->result.id)->flagca == 'A')
            fprintf(fp, "\n");
        else if (strcmp(g_sL.find(h->result.id)->type, "int") == 0)
            fprintf(fp, "\n\t.word\t%d\n", h->opn2.const_int);
        else
            fprintf(fp, "\n\t.word\t%d\n", *(int *)(&h->opn2.const_float));
        break;
    }

    case arm_mov_rE:
    {
        fprintf(fp, "\tmovw"), printOpn_arm2(h->opn1), fprintf(fp, ", #:lower16:%s\n", h->opn2.id.c_str());
        fprintf(fp, "\tmovt"), printOpn_arm2(h->opn1), fprintf(fp, ", #:upper16:%s\n", h->opn2.id.c_str());
        break;
    }

    case arm_ldr_ri:
    {
        fprintf(fp, "\tldr\t"), printOpn_arm1(h->opn1), h->opn2.type == 'i' ? fprintf(fp, ", =%d\n", h->opn2.const_int) : fprintf(fp, ", =%f\n", h->opn2.const_float);
        break;
    }
    case arm_ltorg:
    {
        fprintf(fp, "\t.ltorg\n");
        // TODO;
        break;
    }
    case arm_word:
    {
        fprintf(fp, "\t.word\t %d\n", h->opn1.const_int);
        break;
    }
    case arm_space:
    {
        fprintf(fp, "\t.space\t %d\n", h->opn1.const_int);
        break;
    }

    case arm_str_l2:
    case arm_ldr_l2:
    {
        fprintf(fp, "\t%s", arm_op_strs[(int)h->op]);
        printOpn_arm2(h->opn1), fprintf(fp, ", ["), printOpn_arm1(h->opn2), fprintf(fp, ", "), printOpn_arm1(h->result), fprintf(fp, ",LSL#2]\n");
        break;
    }

    case arm_add_l2:
    {
        fprintf(fp, "\t%s", arm_op_strs[(int)h->op]);
        printOpn_arm2(h->opn1), fprintf(fp, ", "), printOpn_arm1(h->opn2), fprintf(fp, ", "), printOpn_arm1(h->result), fprintf(fp, ",LSL#2\n");
        break;
    }

    case arm_label:
    {
        printOpn_arm1(h->opn1);
        fprintf(fp, ":\n");
        break;
    }
    case arm_str:

    case arm_ldr:
    {
        fprintf(fp, "\t%s", arm_op_strs[(int)h->op]);
        printOpn_arm2(h->opn1), fprintf(fp, ", ["), printOpn_arm1(h->opn2), fprintf(fp, ", "), printOpn_arm1(h->result), fprintf(fp, "]\n");
        break;
    }
    case arm_mov_r0:

    case arm_mov_rr:

    case arm_add:

    case arm_rsb:

    case arm_sub:

    case arm_mul:

    case arm_cmp:

    case arm_b:

    case arm_bl:

    case arm_blt:

    case arm_ble:

    case arm_bgt:

    case arm_bge:

    case arm_beq:

    case arm_bne:

    case arm_moveq:

    case arm_movne:
    {
        fprintf(fp, "\t%s", arm_op_strs[(int)h->op]);
        if (h->opn1.type != '0')
            printOpn_arm2(h->opn1);
        if (h->opn2.type != '0')
            fprintf(fp, ", "), printOpn_arm1(h->opn2);
        if (h->result.type != '0')
            fprintf(fp, ", "), printOpn_arm1(h->result);
        fprintf(fp, "\n");
        break;
    }

    default:
    {
        break;
    }
    }
}

/*------------------------输出arm代码-------------------------------*/

//生成可运行的目标代码；
void putout_arm()
{

    fp = fopen(out_file, "w");
    int i = 0;
    struct arm_instruction *arm = out_arm, *head = arm;

    if (arm->next != &null_ar)
        for (i = 0; 1; i++)
        {
            // fprintf(fp, "\t%d", i);
            print_arm(arm);
            if (arm->next == head || arm->next == &null_ar)
                break;
            arm = arm->next;
        }

    fclose(fp);
}

//以内存中目标代码结构的形式输出，方便调试，无法运行；
void print_arm()
{
    fp = fopen(out_file, "w");
    int i = 0;
    struct arm_instruction *arm = out_arm, *h = arm;

    if (arm->next != &null_ar)
        for (i = 0; 1; i++)
        {
            fprintf(fp, "\t%d\t%s", i, arm_op_strs[(int)h->op]);
            if (h->opn1.type != '0')
                printOpn_arm2(h->opn1);
            if (h->opn2.type != '0')
                fprintf(fp, ", "), printOpn_arm1(h->opn2);
            if (h->result.type != '0')
                fprintf(fp, ", "), printOpn_arm1(h->result);
            // if (h->opn1.type != '0')
            //     cout << "\t" << h->opn1.id;
            // if (h->opn2.type != '0')
            //     fprintf(fp, ", "), cout << h->opn2.id;
            // if (h->result.type != '0')
            //     fprintf(fp, ", "), cout << h->result.id;

            fprintf(fp, "\n");
            if (h->next == out_arm || h->next == &null_ar)
                break;
            h = h->next;
        }

    fclose(fp);
}
