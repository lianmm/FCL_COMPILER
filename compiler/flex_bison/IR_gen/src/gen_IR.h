
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "stdarg.h"
#include "sysy.tab.h"
#include <stdbool.h>
#include "def.h"

/*----------------------------------添加新符号用的暂存变量--------------------------------------*/

extern char glo_name[], glo_alias[], glo_flag;
extern int glo_offset;
extern char glo_type[];
extern int glo_int_val;
extern float glo_float_val;
extern int glo_level, glo_paramnum;
extern char *glo_tmp_type;
extern int glo_init_sym;
extern int glo_arr_lim[];
extern int glo_D;
extern int glo_size;

/*--------------------------------------静态语义检查标志-------------------------------------*/
//循环体位置检查：内为1，外为0。
extern bool loop_sym;
//运算变量检查：置0表示被初始化变量标识符，置1表示运算右值标识符，置-1表示运算左值标识符。
extern int assign_sym;
//函数状态检查：置0表示声明一个函数，置-1表示调用一个函数（检查实参），置int表示在某类型函数体内（检查返回类型）；实参个数标志。
extern int func_state, num_in_para;
//空函数内标志。
extern int void_func_sym;
//数组下标访问状态标志。
extern int array_in_sym;
