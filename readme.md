# FCL_COMPILER  

2022年全国大学生计算机系统能力培养大赛编译系统设计赛项目
团队学校：华中科技大学
团队名称：编得不坏，译的也快
团队成员：童彦铭 李成志 阳益吉
指导教师：徐丽萍 杨茂林

## 项目简介

该项目为支持Sysy2022语言的简单编译器，基本实现了符合Sysy2022文法的代码的正确编译，并生成arm7a架构的汇编语言。

该项目由前端，中端，后端，中端优化层四个部分构成；基于Flex，bason进行词法语法分析，可将Sysy2022代码依次转化为AST抽象语法树，扩展TAC格式中间代码，语法不严格的arm汇编（体现在寄存器使用不合规范，但不影响正确性）。

## 项目构建

### 依赖：

开发系统平台：ubuntu 20.04；目标平台：树莓派4B

依赖库：flex，bison，clang++，g++，arm-linux-gnueabihf-gcc，qemu-arm

依赖使用情况：

- *flex + bison：词法语法分析自动生成代码；*
- *clang++ || g++：项目主体编译；*
- *arm-linux-gnueabihf-gcc：仅用于完成arm代码的链接与可执行文件生成；*
- *qemu-arm：提供ubuntu平台上的arm模拟虚拟运行环境。*

### 项目文件组织：

```shell
compiler_fcl
├── create_test		#方便debug自己创的用例
│   └── ......
├── f2022			#功能用例，文件过多已删除
│   └── ......
├── fuzz			#模糊测试文件夹，未成功应用
│   └── ......
├── p2022			#预赛性能用例，文件过多已删除
│   └── ......
├── pp2022			#决赛性能用例，文件过多已删除
│   └── ......
├── src				#源文件
│   ├── application.cpp
│   ├── backend
│   │   ├── free_Memory.cpp
│   │   ├── putout_arm.cpp
│   │   ├── ris_alloc.cpp
│   │   └── translation.cpp
│   ├── frontend
│   │   ├── ast.cpp
│   │   ├── lex.yy.cpp
│   │   ├── semantic.cpp
│   │   ├── symtable.cpp
│   │   ├── sysy.l
│   │   ├── sysy.tab.cpp
│   │   └── sysy.y
│   ├── midend
│   │   ├── glo_gen_IR.cpp
│   │   ├── mkIR.cpp
│   │   └── node_gen_IR.cpp
│   └── optimization
│       ├── AF_IC.cpp
│       ├── bb.cpp
│       ├── control_flow.cpp
│       ├── func_inline.cpp
│       ├── lcm.cpp
│       ├── loop_unroll.cpp
│       ├── LVN.cpp
│       ├── mid_optimization.cpp
│       ├── ssa.cpp
│       ├── sscp.cpp
│       └── StaticRisAlloc.cpp
├── include			#头文件
│   ├── backend
│   │   ├── free_Memory.h
│   │   ├── putout_arm.h
│   │   ├── ris_alloc.h
│   │   └── translation.h
│   ├── frontend
│   │   ├── ast.h
│   │   ├── semantic.h
│   │   ├── symtable.h
│   │   └── sysy.tab.h
│   ├── midend
│   │   ├── glo_gen_IR.h
│   │   ├── mkIR.h
│   │   └── node_gen_IR.h
│   └── optimization
│       ├── AF_IC.h
│       ├── bb.h
│       ├── control_flow.h
│       ├── func_inline.h
│       ├── lcm.h
│       ├── loop_unroll.h
│       ├── LVN.h
│       ├── mid_optimization.h
│       ├── ssa.h
│       ├── sscp.h
│       └── StaticRisAlloc.h
├── script			#脚本文件
│   ├── afl_fuzz.sh
│   ├── build_g++.sh
│   ├── build.sh
│   ├── diff_pf.sh
│   ├── submit.sh
│   ├── test_fone.sh
│   ├── test_func.sh
│   ├── test_per.sh
│   ├── test_pone.sh
│   ├── test_tmp.sh
│   └── test_ts.sh
├── ref				#参考文件
│   ├── ARM 汇编语言官方手册（中文）.pdf
│   ├── arm_op表.docx
│   ├── ASCII.md
│   ├── compiler2022
│   │   ├── 编译系统设计赛通知.pdf
│   │   ├── 编译系统设计赛章程.pdf
│   │   ├── 公开样例与运行时库
│   │   │   ├── functional
│   │   │   ├── performance
│   │   │   ├── sylib.c
│   │   │   └── sylib.h
│   │   ├── README.md
│   │   ├── SysY2022语言定义-V1.pdf
│   │   └── SysY2022运行时库-V1.pdf
│   ├── flex与bison 中文版 第二版 高清.pdf
│   ├── IR_op表.doc
│   └── n1124.pdf
├── ref_compiler	#参照编译器
│   └── compiler
├── sysy_lib		#sysy库文件
│   ├── libsysy.a
│   ├── sylib.c
│   └── sylib.h
├── test*			#debug文件夹
│   ├── test.c*
│   ├── test.fcl.s*
│   ├── test.fcl.target*
│   ├── test.irafic*
│   ├── test.irfi*
│   ├── test.irlur*
│   ├── testirlur2*
│   ├── test.irlvn1*
│   ├── test.irlvn2*
│   ├── test.irr*
│   ├── test.irra*
│   ├── test.irsra*
│   ├── test.irssa*
│   ├── test.irsscp1*
│   ├── test.irsscp2*
│   ├── test.irt*
│   ├── test.right.s*
│   └── test.right.target*
#irxxx表示在中端优化运行中生成的中间代码；
├── compiler*		#可执行文件
├── readme.md
├── pcompiler*		#debug额外生成的可执行文件
├── f16tof10		#debug用的浮点16位转化10位的辅助小程序;
└── test_out.txt	#debug用输出文件；

#其中星号指可能不存在或在运行中产生的文件项；
```

## 项目运行

0、命令参数：-ir 生成中间代码（1）；-o指定输出文件名（2，3，4）；-O2开启中端优化（5）； -de输出优化不同阶段的中间代码（6）；

1、第一种方式：编译编译器主体+使用编译器编译单个源文件；

```shell
1.编译构建项目；
./script/build.sh # 使用 clang++ 编译
或 
./script/build_g++.sh #  使用 g++ 编译

2.运行项目编译sy源文件；
./compiler -S -o {outfile} {infile}  # 只生成汇编；
或
./compiler -ir -o {outfile} {infile} # 生成汇编； 同时生成以.ir为拓展名的同名中间代码文件；

 # {infile} 替换为输入文件路径及名称；{outfile} 替换为输出文件路径及名称；
 
3.链接运行...
可使用arm-linux-gnueabihf-gcc，qemu-arm工具链在ubuntu上模拟运行；
或
上开发板运行；
```

2、脚本批量自动运行全部用例并与参考正确输出相对比；

```shell
./script/test_func.sh  
或
./script/test_per.sh  
# 自动编译并运行位于./f2022或./p2022 的所有.sy文件，并将结果输出到./test_out.txt中；
# 统计通过数目打印到终端；
```

3、脚本自动编译运行f2022或p2022中指定编号的源文件并与参考正确输出对比；同时将用例源文件和输入输出内容复制到test中方便debug；

```shell
./script/test_fone.sh  
或
./script/test_pone.sh  
# 自动编译并运行位于./f2022或./p2022 的指定前缀的一个.sy文件，并将结果输出到./test_out.txt中；

```

4、脚本自动编译运行./test/test.c并与参考编译器输出对比，生成对应ir文件，方便调试；

```shell
./script/test_tmp.sh  
# 编译并运行位于./test/test_in/ 的test.c文件，并将结果输出到test_out.txt；
# 需在运行过 test_fone.sh 或 test_pone.sh之后运行；
```

(注：)

5、优化导致的正确性问题没有彻底解决，故-O2会几个测试点会出错，无此参数则没有问题。

6、已有的代码文件做优化需要用的部分已写好注释。

7、arm，ir的op，opn的含义与对应关系见ref的几个word文档，及ARM手册。

8、用例由于过大github中不方便上传，需要从官方的包中直接分别复制到f2022，p2022文件夹中。

## 项目描述

### 编译基本框架

#### 前端

- flex，bason词法语法分析；

- 三叉树链表结构的抽象语法树；
- 基于stl_map+stl_stack的符号表；

#### 中端

- 基于双向循环链表的拓展TAC形式IR；
- 深度遍历语法树实现IR生成；
- 生成IR时通过维护标志位实现块内赋值折叠；
- 源码中常量表达式直接得出结果；

#### 后端

- 简单的全局线性方法实现朴素的寄存器分配；
- 贪心策略一定程度上优化了寄存器分配性能；
- 扫描IR进行ARM的转译；（多次扫描）
- 对于乘除指令进行了指令强度削弱（转化为移位）；

### 中间代码优化

基于基本块划分，控制流分析，静态单赋值（对于局部变量和形参）进行了以下优化：

- 赋值折叠与同类同变量指令合并：
  - 已完成：
    - 对于不跨块变量，临时变量的赋值折叠；
    - 对于同变量连续的加，乘常数的指令合并为一条；
  - 未实现：
    - 对于跨块的部分可折叠变量进行折叠；
    - 对于无依赖的同类型指令进行向量化指令合并；
- 常量传播：稀疏简单常量传播sscp（弱化版）
  - 已完成：
    - 对于非phi函数返回值的变量进行常量传播；
    - 基于传播优化控制流；
  - 未实现：
    - 正确处理phi返回值变量的传播；
- 块内公共子表达式消除：局部值编号LVN
  - 已完成：
    - 块内局部在一定的指令范围内发现公共子表达式并消除；
  - 未实现&&疑问：
    - 在长块内进行不限范围的公共子表达式消除时会导致变量生存期过长的问题，并进一步导致变量大量从寄存器溢出到栈，从而负优化。是否应该限定指令范围（错失优化机会），或是通过指令调度优化摆脱这个问题。由于指令调度优化未实现，只能通过设定指令范围进行改善。
- 函数内联：
  - 已完成：
    - 在函数栈较小（小于预设阈值）且函数不嵌套的情况下对函数进行内联；
  - 疑问&&改进空间：
    - 如何能更准确的预估一个函数内联的优化效果；
- 循环不变量外提：LCM
  - 已完成：
    - 对于非条件块内的，非函数调用的，非数组访存？的简单语句中符合外提条件的指令进行外提；
  - 未实现&&疑惑：
    - 更广泛的指令外提；
    - 外提带来的变量生存期延长问题；
    - 如何更好的发掘或通过其他优化创造外提机会；
- 循环展开：
  - 已完成：
    - 对于偶常数次循环进行至多不超过五次的展开；
  - 局限性：
    - 由于常量传播对于phi返回形式名变量的处理缺失，错失了将非常次循环转化为常次循环进行展开的机会；

### 目标代码优化

- 对于乘除指令进行了指令强度削弱（转化为移位）；

### 总结：

- 由于SSA形式不完善（缺乏数组SSA，全局变量SSA），导致常量传播受限；
- 由于对SSCP理解失当导致phi返回形式名变量没有很好处理，进而错失了其他优化执行机会；
- 由于对于优化算法的理解不足加之以简陋的TAC_IR结构设计和朴素的寄存器分配策略的限制导致中端优化未能起到其应有的效果，最终导致成绩的落后。

## 收获与反思：

- ”三思而行”。科学合理的代码与结构全局设计规划可节省下大量重构与debug时间，提高代码质量和增强可拓展性。
- 先学后做。在资料与前人经验的基础上进行创新，而不是自己闭门造车（过于朴素的IR结构与寄存器分配策略）。
- 团队存在沟通效率，分工不明确问题。
