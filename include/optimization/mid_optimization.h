#ifndef MID_OPT_H
#define MID_OPT_H

#include "bb.h"
#include "control_flow.h"
#include "ssa.h"
#include "sscp.h"
#include "loop_unroll.h"
#include "StaticRisAlloc.h"
#include "func_inline.h"
#include "AF_IC.h"
#include "LVN.h"
#include "lcm.h"
void mid_optimization();

#endif //