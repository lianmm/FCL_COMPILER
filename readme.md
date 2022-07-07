# FCL_compiler  V1.0

### 描述：

fcl编译器 v1.0版。

当前支持简单的sysy语言到arm语言的编译；

支持全局&局部，常，单数值型&数组型，浮点&整型的变量的声明定义与使用，循环&分支流程控制，函数声明定义与调用几类基本语法；

此版本目标是作为无优化初版跑通全部功能测试用例。

已完成：84/100。TODO

代码覆盖率测试TODO；

### 依赖：

开发系统平台：ubuntu 20.04；目标平台：树莓派XXXXXX（版本系统名没记住TODO）

依赖库：flex，bison，clang++，g++，arm-linux-gnueabihf-gcc，qemu-arm

依赖使用情况：

- *flex + bison：词法语法分析自动生成代码；*
- *clang++ || g++：项目主体编译；*
- *arm-linux-gnueabihf-gcc：仅用于完成arm代码的链接与可执行文件生成；*
- *qemu-arm：提供ubuntu平台上的arm模拟虚拟运行环境。*

### 使用：

1、第一种方式：编译编译器主体+使用编译器编译单个源文件；

```shell
1.编译构建项目；
./build.sh # 使用 clang++ 编译
或 
./gcc_gdb.sh #  使用 g++ 编译

2.运行项目编译sy源文件；
./fcl_parser -S -o {outfile} {infile}  # 只生成汇编；
或
./fcl_parser -ir -o {outfile} {infile} # 生成汇编； 同时生成以.ir为拓展名的同名中间代码文件；

 # {infile} 替换为输入文件路径及名称；{outfile} 替换为输出文件路径及名称；
 # infile 如果是路径可能会有段错误？ TODO；
 
3.链接运行...
可使用arm-linux-gnueabihf-gcc，qemu-arm工具链在ubuntu上模拟运行；
或
上开发板运行；
```

2、脚本批量自动运行全部用例并与参考正确输出相对比；

```shell
./func_test.sh  
# 自动编译并运行位于./f2022 的所有.c文件，并将结果输出到./test_out.txt中；
# 统计通过数目打印到终端；
```

3、脚本自动编译运行f2022中指定编号的源文件并与参考正确输出对比；同时将用例源文件内容复制到test/test.c中方便debug；

```shell
./test_one.sh  
# 编译并运行位于./test/test_in/ 的test.c文件，并将结果输出到test_out.txt；
```

4、脚本自动编译运行./test/test.c并与arm-linux-gnueabihf-gcc输出对比，生成对应ir文件，方便调试；

```shell
./test_tmp.sh  
# 同时编译并运行位于./test/test_in/ 的test.c文件，并将结果输出到test_out.txt；
# 需在运行过test_one.sh之后运行；
```

### 项目文件组织：

```shell
compiler_fcl
├── f2022 # 功能测试用例；
|   └── ......
├── p2022 # 性能测试用例；
|   └── ......
├── ref
│   └── compiler2022
|   │   └── ......
|   ├── 已完成&未完成.docx
|   ├── IR_op表.docx
|   ├── readme.md
|   └── TODO.txt
├── src 
│   ├── frontend # 编译器前端：词法，语法，ast生成，符号表，语义检查;
|   │   ├── ast.cpp
|   │   ├── ast.h
|   │   ├── lex.yy.cpp* # 通过重命名回避C++和C混译在评测机上的链接错误；
|   │   ├── semantic.cpp
|   │   ├── semantic.h
|   │   ├── symtable.cpp
|   │   ├── symtable.h
|   │   ├── sysy.l
|   │   ├── sysy.tab.cpp* # 通过重命名回避C++和C混译在评测机上的链接错误；
│   |   ├── sysy.tab.h*
|   │   └── sysy.y
│   ├── midend # 编译器中端：中间代码生成；中端优化TODO；
|   │   ├── gen_IR.cpp 
|   │   ├── gen_IR.h
│   |   ├── optimization.cpp 
│   |   └── optimization.h
│   └── backend # 编译器后端：生成汇编代码；后端优化；
|       ├── gen_arm.cpp 
│       └── gen_arm.h
├── sysy_lib # sysy运行时库支持，已预编译为.a静态库文件（来自官方）；
│   ├── libsysy.a 
│   ├── sylib.c
│   └── sylib.h
├── test # 测试文件和测试生成文件；
│   ├── test.c*
│   ├── test.fcl.s*
│   ├── test.fcl.target*
│   ├── test.ir*
│   ├── test.out*
│   ├── test.right.s*
│   └── test.right.target*
├── build.sh 
├── compiler* # 主体编译输出可执行文件；
├── func_test.sh 
├── gcc_gdb.sh 
├── readme.md 
├── test_one.sh 
├── test_out.txt* # 测试结果文件；
└── test_tmp.sh 

#其中星号指可能不存在或在运行中产生的文件项；
```

