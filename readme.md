# FCL_compiler  V1.1

### 描述：

fcl编译器 v1.0版。

当前支持简单的sysy语言到arm语言的编译；

支持全局&局部，常，单数值型&数组型，浮点&整型的变量的声明定义与使用，循环&分支流程控制，函数声明定义与调用几类基本语法；

此版本目标是作为无优化初版跑通全部功能测试用例。

已完成：78/100。TODO

### 依赖：

开发系统平台：ubuntu 20.04

依赖库：flex，bison，gcc，g++，arm-linux-gcc，qemu-arm

依赖使用情况：

- *flex + bison：词法语法分析自动生成代码；*
- *gcc & g++：项目主体编译（C语言与C++混译）；*
- *arm-linux-gcc：仅用于完成arm代码的链接与可执行文件生成；*
- *qemu-arm：提供ubuntu平台上的arm模拟虚拟运行环境。*

### 使用：

1、第一种方式：编译编译器主体+使用编译器编译单个源文件；

```shell
cd ./src
make
./fcl_parser {file}  # {file} 替换为输入文件路径及名称；默认输出文件扩展名：xxx.fcl.s;
arm-linux-gcc  -march=armv7-a -mtune=cortex-a9 -static ../sysy_lib/lib.a {in_file} -o {out_file}           #使用arm-linux-gcc链接运行时库；
qemu-arm {exfile}    #使用qemu-arm在ubuntu上运行已链接的可执行文件；

```

2、脚本自动编译运行指定test文件并与arm-linux-gcc输出结果对比；

```shell
cd ./src
./test.sh  #同时编译并运行位于./test/test_in/ 的test.c文件，并将结果输出到终端；
```

3、脚本批量自动运行全部用例并与参考正确输出相对比；

```shell
cd ./src
./test_all.sh  #自动编译并运行位于./test/func_test/ 的所有.c文件，并将结果输出到./src/test_out.txt中；
```

#以上运行方式均会同时生成arm汇编文件（ xxx.fcl.s ）和中间代码文件（基于三地址码，xxx.fcl）。

#之后通过命令行选项控制中间代码文件的生成；TODO；

### 项目文件组织：

```shell
compiler_fcl
├── ref
│   └── compiler2022
|   └──......
├── src
│   ├── fronted_end #编译器前端：词法，语法，ast生成，符号表，语义检查，IR生成
|   |  ├──ast.cpp
|   |  ├──ast.h
|   |  ├──gen_IR.cpp
|   |  ├──gen_IR.h
|   |  ├──semantic.cpp
|   |  ├──semantic.h
|   |  ├──symtable.cpp
|   |  ├──symtable.h
|   |  ├──sysy.l
|   |  └──sysy.y
│   ├── fcl_parser* #编译器可执行文件；
│   ├── gen_arm.cpp #编译器后端生成汇编代码；
│   ├── gen_arm.h
│   ├── lex.yy.c*
│   ├── lex.yy.o*
│   ├── Makefile
│   ├── optimization.cpp #编译器中后端优化；TODO
│   ├── optimization.h
│   ├── sysy.tab.c*
│   ├── sysy.tab.h*
│   ├── sysy.tab.o*
│   ├── test_all.sh
│   ├── test_out.txt*
│   └── test.sh
├── sysy_lib #sysy运行时库支持，已预编译为lib.a静态库文件；
│   ├── lib.a
│   ├── sylib.c
│   └── sylib.h
├── test #测试文件和测试生成文件；
│   ├── arm_out
│   ├── fcl_arm_out
│   ├── fcl_out
│   ├── func_test
│   ├── llvm_out
│   ├── out
│   └── test_in
├── 已完成&未完成.docx
├── IR_op表.docx
├── readme.md
└── TODO.txt
#其中星号指可能不存在或在运行中产生的文件项；
```

