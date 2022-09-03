#ifndef RA_H
#define RA_H
#include "../midend/glo_gen_IR.h"
using namespace std;

extern int tmp_allot[MAXLENGTH * 2];
extern int tmp_sp;
extern map<int, int, greater<int>> tmp_map;
extern int ris3_status[11];
extern struct arm_instruction *out_arm;

void glo_ris_allot();

#endif