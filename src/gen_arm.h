#include "optimization.h"
#include "stdio.h"

enum ARM_op
{
    ARM_ASSIGN,
    ARM_EXP_POINT,
    ARM_POINT_EXP,

    ARM_ADD,
    ARM_MINUS,
    ARM_MUL,
    ARM_DIV,
    ARM_MOD,
    ARM_JLT,
    ARM_JLE,
    ARM_JGT,
    ARM_JGE,
    ARM_EQ,
    ARM_NEQ,
    ARM_AND,
    ARM_OR,
    ARM_GOTO_JLT,
    ARM_GOTO_JLE,
    ARM_GOTO_JGT,
    ARM_GOTO_JGE,
    ARM_GOTO_EQ,
    ARM_GOTO_NEQ,
    ARM_GOTO_AND,
    ARM_GOTO_OR,
    ARM_EXP_ARROFF,
    ARM_ARROFF_EXP,

    ARM_GOTO_NOT,
    ARM_CALL,
    ARM_NOT,
    ARM_UMINUS,
    ARM_LOAD,
    ARM_ext_ALLOCA,

    ARM_FUNCTION,
    ARM_FUNC_END,
    ARM_PARAM,
    ARM_LABEL,
    ARM_GOTO,

    ARM_ARG,
    ARM_RETURN,
    ARM_CALL_VOID
};