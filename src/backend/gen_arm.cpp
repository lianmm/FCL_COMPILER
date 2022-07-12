#include "gen_arm.h"

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
        fprintf(fp, "\n\t.global\t__aeabi_idiv\n");
        fprintf(fp, "\t.global\t__aeabi_idivmod\n");

        fprintf(fp, "\t.text\n");
        fprintf(fp, "\t.align\t2\n\t.global"), printOpn_arm2(h->opn1);
        fprintf(fp, "\n\t.type"), printOpn_arm2(h->opn1), fprintf(fp, ", %%function\n");
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
            if (sT.symbols[h->opn1.offset].size.const_int < 501)
                fprintf(fp, "\n\tsub\tsp, sp, #%d", sT.symbols[h->opn1.offset].size.const_int);
            else
            {
                fprintf(fp, "\n\tldr\tr12, =%d", sT.symbols[h->opn1.offset].size.const_int);
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
        if (sT.symbols[h->result.offset].flag == 'A' || sT.symbols[h->result.offset].flagca == 'A')
            fprintf(fp, "\n");
        else if (strcmp(sT.symbols[h->result.offset].type, "int") == 0)
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

void DisplayARM()
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

void Display_arm()
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
            fprintf(fp, "\n");
            if (h->next == out_arm || h->next == &null_ar)
                break;
            h = h->next;
        }

    fclose(fp);
}

void print_arm_IR(codenode *h)
{

    if (h->op == IR_FUNCTION)
    {
        fprintf(fp, "\n\t.global\t__aeabi_idiv\n");
        fprintf(fp, "\t.global\t__aeabi_idivmod\n");
        fprintf(fp, "\t.text\n");
        fprintf(fp, "\t.align\t2\n\t.global"), printOpn_arm2(h->opn1);
        fprintf(fp, "\n\t.type"), printOpn_arm2(h->opn1), fprintf(fp, ", %%function\n");
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
            if (sT.symbols[h->opn1.offset].size.const_int < 501)
                fprintf(fp, "\n\tsub\tsp, sp, #%d", sT.symbols[h->opn1.offset].size.const_int);
            else
            {
                fprintf(fp, "\n\tldr\tr12, =%d", sT.symbols[h->opn1.offset].size.const_int);
                fprintf(fp, "\n\tsub\tsp, sp, r12");
            }
        }
    }
    else if (h->op == IR_FUNC_END)
    {
        if (h->opn2.const_int / 4 > 0)
            fprintf(fp, "\tadd\tsp, fp, #%d\n\tldmfd\tsp!, {r4-r10,fp, pc}\n", 0);
        else if (h->opn2.const_int / 4 == 0)
            fprintf(fp, "\tadd\tsp, fp, #%d\n\tldmfd\tsp!, {r0,fp, pc}\n", 0);
        fprintf(fp, "\t.size\t%s, .-%s", h->opn1.id.c_str(), h->opn1.id.c_str());
    }
    else if (h->op == IR_LABEL)
    {
        fprintf(fp, "\n"), printOpn_arm1(h->opn1), fprintf(fp, ":"); //遇到标签或函数定义先加空行，增强可读性；
    }
    else if (h->op == IR_ASSIGN)
    {

        if (h->opn1.id == "r0")
        {
            fprintf(fp, "\tmov\tr0"), fprintf(fp, ", "), printOpn_arm1(h->opn2);
        }
        else if ((h->opn1.type == 'v' && h->opn1.kind == 'T') && (h->opn2.type == 'v' && h->opn2.kind == 'T'))
            fprintf(fp, "\tmov\t"), printOpn_arm1(h->opn1), fprintf(fp, ", "), printOpn_arm1(h->opn2);

        else if ((sT.symbols[h->opn2.offset].flag == 'A' || sT.symbols[h->opn2.offset].flagca == 'A') && sT.symbols[h->opn2.offset].flage == 'E')
        {
            fprintf(fp, "\tmovw\tr%d, #:lower16:%s\n", h->opn1.no_ris, h->opn2.id.c_str());
            fprintf(fp, "\tmovt\tr%d, #:upper16:%s", h->opn1.no_ris, h->opn2.id.c_str());
        }
        else if (h->opn2.type == 'i' || h->opn2.type == 'f')
            fprintf(fp, "\tldr\t"), printOpn_arm1(h->opn1), h->opn2.type == 'i' ? fprintf(fp, ", =%d", h->opn2.const_int) : fprintf(fp, ", =%f", h->opn2.const_float);
        else if (h->opn1.type == 'v' && h->opn1.flage == 'E')
        {
            fprintf(fp, "\tmovw\tr0, #:lower16:%s\n", h->opn1.id.c_str());
            fprintf(fp, "\tmovt\tr0, #:upper16:%s\n", h->opn1.id.c_str());
            fprintf(fp, "\tstr"), printOpn_arm2(h->opn2), fprintf(fp, ", [r0, #0]");
        }
        else if (h->opn1.type == 'v' && (h->opn1.kind == 'V' || h->opn1.kind == 'P'))
        {
            if (h->opn1.address < 4096)
                fprintf(fp, "\tstr\t"), printOpn_arm1(h->opn2), fprintf(fp, ", [fp, #%d", -h->opn1.address), fprintf(fp, "]");
            else
            {
                fprintf(fp, "\tldr\tr0, =%d\n", -h->opn1.address);
                fprintf(fp, "\tstr\t"), printOpn_arm1(h->opn2), fprintf(fp, ", [fp, r0]");
            }
        }

        else if (h->opn1.type == 'v' && (h->opn1.kind == 'R')) // R表示实参；
            fprintf(fp, "\tstr\t"), printOpn_arm1(h->opn2), fprintf(fp, ", [sp, #%d", -h->opn1.address), fprintf(fp, "]");
    }
    // else if (h->op == IR_ALLOCA)
    // {
    //     fprintf(fp, "\tstr\t"), printOpn_arm1(h->opn2), fprintf(fp, ", [sp, #%d", -h->opn1.address), fprintf(fp, "]");
    // }
    else if (h->op == IR_LOAD && h->opn1.type == 'v' && h->opn1.flage == 'E')
    {
        fprintf(fp, "\tmovw"), printOpn_arm2(h->result), fprintf(fp, ", #:lower16:%s\n", h->opn1.id.c_str());
        fprintf(fp, "\tmovt"), printOpn_arm2(h->result), fprintf(fp, ", #:upper16:%s\n", h->opn1.id.c_str());
        fprintf(fp, "\tldr"), printOpn_arm2(h->result), fprintf(fp, ", ["), printOpn_arm1(h->result), fprintf(fp, ", #0]");
    }
    else if (h->op == IR_ARG || h->op == IR_ALLOCA || h->op == IR_AND || h->op == IR_OR)
    {
    }
    else if (h->op == IR_PARAM)
    {
        fprintf(fp, "\tstr\t"), printOpn_arm1(h->opn1), fprintf(fp, ", [fp, #%d", h->opn2.address), fprintf(fp, "]\n");
    }
    else if (h->op == IR_LOAD)
    {
        if (h->opn1.address < 4096)
            fprintf(fp, "\tldr\t"), printOpn_arm1(h->result), fprintf(fp, ", [fp, #%d", -h->opn1.address), fprintf(fp, "]");
        else
        {
            fprintf(fp, "\tldr\tr0, =%d\n", -h->opn1.address);
            fprintf(fp, "\tldr\t"), printOpn_arm1(h->result), fprintf(fp, ", [fp, r0"), fprintf(fp, "]");
        }
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
    else if (h->op < IR_GOTO_AND && h->op > IR_OR)
    {
        fprintf(fp, "\t%s\t%s", arm_ir_op[(int)h->op], h->result.id.c_str());
    }
    else if (h->op == IR_VOID)
    {
    }
    else if (h->op == ARM_MOVEQ || h->op == ARM_MOVNE)
    {
        fprintf(fp, "\t%s", arm_ir_op[h->op]);
        printOpn_arm2(h->opn1);
        fprintf(fp, ", ");
        printOpn_arm1(h->opn2);
    }
    else if (h->op == IR_EXT_ALLOCA)
    {
        fprintf(fp, "\t.global\t%s\n", h->result.id.c_str());
        fprintf(fp, "\t.data\n");
        fprintf(fp, "\t.align\t2\n");
        fprintf(fp, "\t.type\t%s, %%object\n", h->result.id.c_str());
        fprintf(fp, "\t.size\t%s, %d\n", h->result.id.c_str(), h->opn1.const_int);
        fprintf(fp, "%s:", h->result.id.c_str());
        if (sT.symbols[h->result.offset].flag == 'A' || sT.symbols[h->result.offset].flagca == 'A')
            ;
        else if (strcmp(sT.symbols[h->result.offset].type, "int") == 0)
            fprintf(fp, "\n\t.word\t%d\n", h->opn2.const_int);
        else
            fprintf(fp, "\n\t.word\t%d\n", *(int *)(&h->opn2.const_float));
    }
    else if (h->op > IR_MOD && h->op < IR_EXP_ARROFF)
    {
        fprintf(fp, "\t%s\t", arm_ir_op[h->op]), printOpn_arm1(h->opn1), fprintf(fp, ", "), printOpn_arm1(h->opn2);
    }
    else if (h->op == IR_UMINUS)
    {
        fprintf(fp, "\trsb\t"), printOpn_arm1(h->result), fprintf(fp, ", "), printOpn_arm1(h->opn1), fprintf(fp, ", #0");
    }
    else if (h->op == IR_EXP_ARROFF || h->op == IR_ARROFF_EXP)
    {
        if (sT.symbols[h->opn1.offset].flage == 'E')
        {
            fprintf(fp, "\tmovw\tr0, #:lower16:%s\n", h->opn1.id.c_str());
            fprintf(fp, "\tmovt\tr0, #:upper16:%s\n", h->opn1.id.c_str());
        }
        else
        {
            if (h->prior->op == IR_LOAD && h->prior->opn1.kind == 'A') //形参数组，偏移量需要先load出来
            {
                fprintf(fp, "\t%s", arm_ir_op[h->op]);
                printOpn_arm2(h->result), fprintf(fp, ",\t[r%d, ", h->prior->result.no_ris), printOpn_arm1(h->opn2), fprintf(fp, ",LSL#2]\n");
                return;
            }
            else
            {
                fprintf(fp, "\tldr\tr0, =%d\n", -h->opn1.address);
                fprintf(fp, "\tadd\tr0, r0, fp\n");
            }
        }
        fprintf(fp, "\t%s", arm_ir_op[h->op]);
        printOpn_arm2(h->result), fprintf(fp, ",\t[r0, "), printOpn_arm1(h->opn2), fprintf(fp, ",LSL#2]");
    }
    else if (h->op == IR_EXP_ARROFFa)
    {
        if (sT.symbols[h->opn1.offset].flage == 'E') //外部变量取址；
        {
            fprintf(fp, "\tmovw\tr0, #:lower16:%s\n", h->opn1.id.c_str());
            fprintf(fp, "\tmovt\tr0, #:upper16:%s\n", h->opn1.id.c_str());
        }
        else
        {
            if (h->prior->op == IR_LOAD && h->prior->opn1.kind == 'A') //形参数组取址；
            {
                fprintf(fp, "\t%s", arm_ir_op[h->op]);
                printOpn_arm2(h->result), fprintf(fp, ", r%d, ", h->prior->result.no_ris), printOpn_arm1(h->opn2), fprintf(fp, ",LSL#2\n");
                return;
            }
            else
            {
                fprintf(fp, "\tldr\tr0, =%d\n", -h->opn1.address);
                fprintf(fp, "\tadd\tr0, r0, fp\n"); //局部数组取址；}
            }
        }
        fprintf(fp, "\t%s", arm_ir_op[h->op]);
        printOpn_arm2(h->result), fprintf(fp, ", r0, "), printOpn_arm1(h->opn2), fprintf(fp, ",LSL#2");
    }
    else if (h->op == IR_ARROFF_EXPi)
    {
        fprintf(fp, "\tldr\tr0, =%d\n", -h->opn1.address);
        fprintf(fp, "\tadd\tr0, r0, fp\n");
        fprintf(fp, "\t%s", arm_ir_op[h->op]);
        printOpn_arm2(h->result), fprintf(fp, ",\t[r0, "), printOpn_arm1(h->opn2), fprintf(fp, "]");
    }
    else if (h->op == IR_ARROFF_EXPie)
    {
        fprintf(fp, "%s\t%d", h->opn1.id.c_str(), h->result.const_int);
    }
    else if (h->op == IR_ARROFF_EXPi0)
    {
        int inde = h->result.const_int;
        for (; inde < h->opn2.const_int; inde += 4)
        {
            if (inde == h->result.const_int)
            {
                fprintf(fp, "\tldr\tr0, =%d\n", -h->opn1.address);
                fprintf(fp, "\tadd\tr0, r0, fp\n");
                fprintf(fp, "\tmov\tr12, #0\n");
            }
            fprintf(fp, "\tstr\tr12, [r0, #%d]\n", inde);
        }
    }
    else
    {
        fprintf(fp, "\t%s", arm_ir_op[h->op]);
        if (h->op < IR_ADD)
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
    if (h->op != IR_PARAM && h->op != IR_ALLOCA && h->op != IR_ARG && h->op != IR_VOID)
        fprintf(fp, "\n");
}

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

//遍历语法树释放空间；
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

/*----------------------------------------------功能主干-----------------------------------------*/

void gen_arm(int type)
{

    DisplayIR(out_IR);
    translation();
    // print_arm_IR(out_IR);
    DisplayARM();
    // Display_arm();
    clear_arm();
    clear_IR();
    clear_ast(out_ast);
}
