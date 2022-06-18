- [任务描述](https://www.educoder.net/tasks/nhvatuiwl8kf?coursesId=ti9p76o3#任务描述)
- [相关知识](https://www.educoder.net/tasks/nhvatuiwl8kf?coursesId=ti9p76o3#相关知识)
- 静态语义分析的主要任务
  - [控制流检查](https://www.educoder.net/tasks/nhvatuiwl8kf?coursesId=ti9p76o3#控制流检查)
  - [唯一性检查](https://www.educoder.net/tasks/nhvatuiwl8kf?coursesId=ti9p76o3#唯一性检查)
  - [类型检查](https://www.educoder.net/tasks/nhvatuiwl8kf?coursesId=ti9p76o3#类型检查)
  - [名字的上下文相关性检查](https://www.educoder.net/tasks/nhvatuiwl8kf?coursesId=ti9p76o3#名字的上下文相关性检查)
- [常见的语义错误](https://www.educoder.net/tasks/nhvatuiwl8kf?coursesId=ti9p76o3#常见的语义错误)
- [静态语义分析的实现](https://www.educoder.net/tasks/nhvatuiwl8kf?coursesId=ti9p76o3#静态语义分析的实现)
- [分析器框架](https://www.educoder.net/tasks/nhvatuiwl8kf?coursesId=ti9p76o3#分析器框架)
- [编程要求](https://www.educoder.net/tasks/nhvatuiwl8kf?coursesId=ti9p76o3#编程要求)
- [测试说明](https://www.educoder.net/tasks/nhvatuiwl8kf?coursesId=ti9p76o3#测试说明)

------

### 任务描述

在此前一系列实训的基础上，添加SysY语言的静态语义分析模板，实现：  

- 类型检查；
- 名字的上下文相关性检查；
- 唯一性检查；
- 控制流检查。

### 相关知识

为了完成本关任务，你需要掌握：
静态语义分析的任务

### 静态语义分析的主要任务

#### 控制流检查

break，continue语句必须在while语句内。  

#### 唯一性检查

同一定义域内的变量和函数不能重复定义。
注意标准C语言是允许变量重复声明的，只要声明的类型相同，但两次声明时不能给变量赋不同的初值。比如以下语句序列在标准C语言中是允许的:
int a;
int a = 1;
但:
int a = 2;
int a = 1;
被认为是重复定义。

SysY2022语法单位CompUnit(即顶层或全局)变量/常量声明/函数定义都不可以重复定义同名标识符。

#### 类型检查

操作数上施加的运算必须与操作符兼容，注意C语言是弱类型语言，支持兼容类型之间的隐式类型转换，一个float型的表达式中允许出现int型变量，同样，一个int型表达式中，也允许出现float型变量。在函数调明时，亦遵循此规则，例如，下列声明的函数：
int foo(int a, int b);
在调用时，形参为float型不会认为有语义错误:
float m,n;
int n = foo(m, n);

但SysY2022语言声明：函数调用时，实际参数的类型和个数必须与对应函数定义的形参完全匹配. 但该语言的定义文件中，同时也表明:SysY支持int和float之间的隐式类型转换.

故，本实验依标准C语言的规则进行类型检查。

#### 名字的上下文相关性检查

名字的出现，在遵循作用域和可见性前堤下，应该满足一定的相关性，如果不满足应该报告语义错误。  

- 变量在引用前必须声明；
- 函数在引用前如果没有声明，通常不是语义错误，但可能收到警告信息。如果该函数在库文件中有定义，且其形参或返回值为int型，能正确连接成可执行的程序。但如果涉及其它类型，则连接的可执行程序不能正确处理形参和返回值 。如果该函数在库文件中没有定义，则在连接时报错。
- 对于同名标识符，全局变量和局部变量的作用域可以重叠，重叠部分局部变量优先；变量名可以与函数名同名(在不同的作用域)。

注：SysY2022的运行时函数应该视为有定义的。编译器应当正确处理每个运行时函数的形参个数、类型和返回值类型。参见sylib.c和sylib.h。

### 常见的语义错误

当分析程序发现语义错误时，必须输出相应的错误信息，包括程序文件名，出错的行号，以及错误说明，其格式为：
程序文件名:行号 错误说明
注意行号与错误说明间有一个空格，每输出一个错误信息需换行。一个程序可能会有多个语义错误，每个错误信息均需照上述格式输出。

下表列出了本实验必须处理的语义错误，及对应的错误信息示例：

|      | 错误类型                                                | 代码示例                                   | 错误信息                                          |
| ---- | ------------------------------------------------------- | ------------------------------------------ | ------------------------------------------------- |
| √    | 变量未声明                                              | int a = b;                                 | 'b' undeclared                                    |
| √    | 变量重复声明1                                           | int a;float a;                             | conflicting types for ‘a’                         |
| √    | 变量重复声明2                                           | int d = 1; int d = 2;                      | redefinition of ‘d’                               |
| √    | 函数重复定义1                                           | int fun(int a){}；int fun(int b){}         | redefinition of ‘fun’                             |
| √    | 函数重复定义1                                           | int foo(){};float foo()                    | conflicting types for ‘foo’                       |
| √    | 变量与函数同名定义                                      | int foo;int foo(void){}                    | ‘foo’ redeclared as different kind of symbol      |
| √    | 把变量当函数调用                                        | int foo;int i = foo(3);                    | ‘foo’ is not a function                           |
| √    | 对函数名的不当引用                                      | int foo(int n);int n = 2 * foo;            | invalid operands to binary operator *             |
| √    |                                                         | foo = 20;                                  | lvalue required as left operand of assignment     |
| √    | 对数组的不当引用                                        | int arr[2]; arr = 1;                       | assignment to expression with array type          |
| √    | 函数调用时参数个数不匹配                                | int mymax(int m, int n);int n = mymax(20); | too few arguments to function ‘mymax’             |
| √    |                                                         | int n = mymax(10,20,30);                   | too many arguments to function ‘mymax’            |
| √    | 当返回值类型为 void时，函数内出现带返回值 的 return语句 | void foo(int f){return 1}                  | ‘return’ with a value, in function returning void |
| √    | 数组变量的下标不是整型表达式                            |                                            | array subscript is not an integer                 |
| √    | 赋值号左边不是左值表达式                                |                                            | lvalue required as left operand of assignment     |
| √    | break语句不在循环体内                                   |                                            | break statement not within a loop                 |
| √    | continue语句不在循环体内                                |                                            | continue statement not within a loop              |
| √    | 对非数组变量采用下标变量的形式访问                      | float r = 3.14;float s = r[0];             | subscripted value is not an array                 |

变量相关：全局变量定义，局部变量定义，变量引用。



### 静态语义分析的实现

如果你采用flex+bison模式，则用采用翻译模式，在bison的语法描述文件中添加语义分析代码，实现静态语义的分析。静态语义分析模块应另取名字。def.h文件已经定义了语义分析函数，你只需取消注释，并根据你的需要适当调整参数，并将该函数在ast.c文件中实现即可。

如果你采用其它方式，可以在实训为你提供的其它文件中实现(这些文件大多是空文件)，比如semantic.cpp。

### 分析器框架

为方便同学们完成编译器的构造，实训为同学们提供了部分代码的框架，包括：  

- flex词法描述文件sysy.l
- bison语法描述文件sysy.y
- 抽象语法树构造文件ast.c
- 相关头文件def.h
- 一个空的Makefile文件
- 一个空的driver.cpp，如果需要可用它来构造你的C++语法分析器。
- 一个空的driver.h文件，需要时使用。
- lexer.cpp，你的词法分析程序(相当于lex.yy.c)。
- lexer.h
- parser.cpp,你的语法分析程序(相当于parser.tab.c)。
- parser.h
- ast.cpp
- ast.h
- symtable.cpp
- symtable.h
- semantic.cpp
- semantic.h

请根据需要选择文件，并正确make你选取的程序文件，不需要的文件可以置之不理。  

### 编程要求

本实验假定测试用例没有语法错误(即使有也不输出语法错误信息)

在右侧编辑器修改、补充代码,,完成静态语义分析器。正确编写Makefile文件，测试程序将直接make，然后用make生成的程序parser来测试一系列测试用例。  

### 测试说明

平台会make你编写的代码，并检查是否成功生成parser，若make成功，即运行parser，通过全部测试集即可过关。  

------

开始你的任务吧，祝你成功！