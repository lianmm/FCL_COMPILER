#include "../../include/optimization/mid_optimization.h"
using namespace std;

void mid_optimization()
{
    //中端优化初始化；
    BBInit(1);
    RunCFG();

    //数据流与静态单赋值；
    RunSSA();
    if (DeFlag)
        putout_IR(out_IR, ".irssa");

    //基于单赋值形式的折叠（赋值折叠和同类指令融合）；
    GloAF_IC();
    if (DeFlag)
        putout_IR(out_IR, ".irafic");

    //第一次SSCP常量传播；
    SSConstantPropagation(1);
    if (DeFlag)
        putout_IR(out_IR, ".irsscp1");
    g_lvnH.Glo_LVN();
    if (DeFlag)
        putout_IR(out_IR, ".irlvn1");
    // lcm();

    FuncInline();
    if (DeFlag)
        putout_IR(out_IR, ".irfi");
    // LoopUnroll();
    // if (DeFlag)
    //     putout_IR(out_IR, ".irlur");
    g_lvnH.Glo_LVN();
    if (DeFlag)
        putout_IR(out_IR, ".irlvn2");
    //函数内联；当前函数内联判定为栈空间不超过50且不嵌套；
    //第二次SSCP常量传播；
    SSConstantPropagation(2);
    if (DeFlag)
        putout_IR(out_IR, ".irsscp2");

    // // //循环展开，常循环按2的幂数展开至奇数次；复杂循环展开一次；

    //基于单赋值形式的折叠（赋值折叠和同类指令融合）；
    // GloAF_IC();
    // if (DeFlag)
    //     putout_IR(out_IR, ".irsafic2");

    // //部分变量寄存器固定分配；
    StaticRisAlloc();
    if (DeFlag)
        putout_IR(out_IR, ".irsra");
}