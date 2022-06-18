#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "stdarg.h"
#include "sysy.tab.h"
#include "def.h"


void mksym(struct symboltable *sT, char *name, int level, char *type, int paramnum, char *alias, char flag, char offset);

void DisplaySymbolTable(struct symboltable sT);

void insert_symbol();

void new_scope();

void quit_scope();
