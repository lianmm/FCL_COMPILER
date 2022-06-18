- [任务描述](https://www.educoder.net/tasks/73rmw9stnbfq#任务描述)
- [相关知识](https://www.educoder.net/tasks/73rmw9stnbfq#相关知识)
- [中间代码](https://www.educoder.net/tasks/73rmw9stnbfq#中间代码)
- [四元式的数据结构](https://www.educoder.net/tasks/73rmw9stnbfq#四元式的数据结构)
- 用翻译模式生成中间代码
  - [实用函数](https://www.educoder.net/tasks/73rmw9stnbfq#实用函数)
  - [继承属性与综合属性的计算](https://www.educoder.net/tasks/73rmw9stnbfq#继承属性与综合属性的计算)
  - [对数组引用的翻译](https://www.educoder.net/tasks/73rmw9stnbfq#对数组引用的翻译)
- [分析器项目文件](https://www.educoder.net/tasks/73rmw9stnbfq#分析器项目文件)
- [编程要求](https://www.educoder.net/tasks/73rmw9stnbfq#编程要求)
- [测试说明](https://www.educoder.net/tasks/73rmw9stnbfq#测试说明)

------

### 任务描述

将你在之前实训中完成的代码，直接复制到本实训，继续完善，实现从源程序到中间代码的翻译。

### 相关知识

为了完成本关任务，你需要掌握：
中间代码
四元式的数据结构
翻译模式

### 中间代码

中间代码又叫源程序的中间表达(Intermediate Representations, 简称IR)，中间代码有多种表达形式，如AST,TAC,SSA等，它们的层次和设计的目标也不尽相同。从层次上分，中间代码可以分为HIR,MIR,LIR，层次越高越接近于源程序，层级越低越接近于目标代码。一个实际的编译器可以同时采用三级甚至更多级的中间表达，以使每一步的工作简单明了。

本实训采用理论教学中使用的四元式(又叫三地址码TAC),例如以下程序片断(仅用于举例，本实训不涉及for语句,也没有+=运算)：  

```c
int a[20][10];  
...
for (int i = 0; i < n; i += di)  
    a[i][j+2] = j;
```

可以翻译成以下四元式(左)，并存储在某个数据结构中,输出时则用TAC形式（右）,这种IR比较接近HIR:

| 四元式                 | 三地址码          |
| ---------------------- | ----------------- |
| (COPY, 0, i)           | i := 0            |
| (LABEL, L1)            | L1:               |
| (JGE, i, n, L2)        | if i >= n goto L2 |
| (INDEX, a, i, t0)      | t0 := a[i]        |
| (ADD, j, 2, t1)        | t1 := j + 2       |
| (INDEX, t0, t1, t2)    | t2 := t0[t1]      |
| (COPY_TO_DEREF, j, t2) | *t2 := j          |
| (INCJUMP, i, di, L1)   | i += di, goto L1  |
| (LABEL, L2)            | L2:               |

它还可以翻译成如下所示的四元式（MIR）：

| 四元式                 | 三地址码          |
| ---------------------- | ----------------- |
| (COPY, 0, i)           | i := 0            |
| (LABEL, L1)            | L1:               |
| (JGE, i, n, L2)        | if i >= n goto L2 |
| (MUL, i, 80, t0)       | t0 := i * 80      |
| (ADD, a, t0, t1)       | t1 := a + t0      |
| (ADD, j, 2, t2)        | t2 := j + 2       |
| (MUL, t2, 8, t3)       | t3 := t2 * 8      |
| (ADD, t1, t3, t4)      | t4 := t1 + t3     |
| (COPY_TO_DEREF, j, t4) | *t4 := j          |
| (ADD, i, di, i)        | i := i + di       |
| (JUMP, L1)             | goto L1           |
| (LABEL, L2)            | L2:               |

还可以翻译成更低级别的LIR,它已经非常接近汇编代码了：

| 四元式             | 三地址码            |
| ------------------ | ------------------- |
| (LDC, 0, r0)       | r0 := 0             |
| (LOAD, j, r1)      | r1 := j             |
| (LOAD, n, r2)      | r2 := n             |
| (LOAD, di, r3)     | r3 := di            |
| (LOAD, a, r4)      | r4 := a             |
| (LABEL, L1)        | L1:                 |
| (JGE, r0, r2, L2)  | if r0 >= r2 goto L2 |
| (MUL, r0, 80, r5)  | r5 := r0 * 80       |
| (ADD, r4, r5, r6)  | r6 := r4 + r5       |
| (ADD, r1, 2, r7)   | r7 := r1 + 2        |
| (MUL, r7, 8, r8)   | r8 := r7 * 8        |
| (ADD, r6, r8, r9)  | r9 := r6 + r8       |
| (TOFLOAT, r1, f0)  | f0 := tofloat r1    |
| (STOREIND, f0, r9) | *r9 := f0           |
| (ADD, r0, r3, r0)  | r0 := r0 + r3       |
| (JUMP, L1)         | goto L1             |
| (LABEL, L2)        | L2:                 |

教材使用的三地址码有：

| 语法                  | 描述                               | Op        | Opn1 | Opn2 | Result |
| --------------------- | ---------------------------------- | --------- | ---- | ---- | ------ |
| x := y                | 赋值操作                           | ASSIGN    | y    | x    |        |
| x := y + z            | 加法操作                           | ADD       | y    | z    | x      |
| x := y - z            | 减法操作                           | MINUS     | y    | z    | x      |
| x := y * z            | 乘法操作                           | MUL       | y    | z    | x      |
| x := y / z            | 除法操作                           | DIV       | y    | z    | x      |
| x := * y              | 右部取地址运算                     | EXP_POINT | y    | x    |        |
| * x := y              | 左部取地址运算                     | POINT_EXP | y    | x    |        |
| FUNCTION f            | 定义函数f                          | FUNCTION  | f    |      |        |
| PARAM x               | 函数形参                           | PARAM     | x    |      |        |
| LABEL x               | 定义标号x                          | LABEL     | x    |      |        |
| GOTO x                | 无条件转移                         | GOTO      | x    |      |        |
| IF x [relop] y GOTO z | 条件转移                           | [relop]   | x    | y    | z      |
| ARG x                 | 传实参x                            | ARG       |      |      | x      |
| x:=CALL f             | 调用函数（有返回值）               | CALL      | f    |      | x      |
| RETURN x              | 返回语句                           | RETURN    |      |      | x      |
| x:=y[i]               | 将地址 y 起第i个存储单元的值赋给 x | =[]       | y[i] |      | x      |
| x[i]:=y               | 将y的值赋给x起第i个存储单元        | []=       | y    |      | x[i]   |

（注：未在上表列出的运算，可参照编写，如a := b % c, a := b && c , if a || b goto c 等) 

### 四元式的数据结构

四元式一般采用线性结构存储，比如静态数组，指针型数组，链表等。建议使用双向链表，如：  

```c
struct codenode  
{                                  
  int op;   //TAC代码的运算符种类  
  struct opn opn1, opn2, result; //2个操作数和运算结果  
  struct codenode *next, *prior; // 双向链表  
};    
```

四元式的运算符有多种，op可用于区别具体是哪种“运算”(函数定义、调用，goto labelx以及跳转语句的目标标号LABEL labelx 等都视为“运算”)，而四元组的中其它三元(即三地址：操作数及用于存储运算结果的单元，均是一种带有多种信息的结构体：  

```c
struct opn  
{  
  int kind; //标识操作的类型  
  int type; //标识操作数的类型  
  union  
  {  
    int const_int;     //整常数值，立即数  
    float const_float; //浮点常数值，立即数  
    char id[33];       //变量或临时变量的别名或标号字符串  
   };  
  int level;  //变量的层号，0表示是全局变量，数据保存在静态数据区  
  int offset; //变量单元偏移量，或函数在符号表的定义位置序号，目标代码生成时用  
  ...  
};   
```

### 用翻译模式生成中间代码

如果你采用flex+bison模式，可采用教材P210-P217介绍的L-翻译模式来生成中间代码，当然你需要注意教材所用的文法与实训使用的文法是不同的，但是，原理与实现方法是一样的。但你不需要像课本那样，在产生式右部中间插入翻译规则，产生式右部的规则一般仅用于构造AST，所有其它工作，均通过遍历AST来完成，中间代码的生成也不例外。

#### 实用函数

为生成中间代码，你可以定义以下函数：  

1. newtemp函数，生成一临时变量，登记到符号表中，以“temp+序号”的形式组成的符号串作为别名，符号名称用空串的形式登记到符号表中；
2. newLabel函数，以“label+序号”形式生成一个标号；
3. genLabel函数，生成标号语句；
4. genIR函数，生成一条TAC的中间代码语句，为方便最后阶段的目标代码生成，宜将其偏移量（offset）这个属性和数据类型同时带上；
5. merge函数，将多个TAC语句序列按顺序连接在一起。
6. genGOTO函数，生成一个GOTO语句。

注意别名的作用，事实上，变量也可以取别名，使用别名的好处是嵌套作用域的两个同名变量通过别名更容易区分，且不用担心变量在自己的作用域内被同名变量屏蔽。

上述函数的参考代码：  

```c
 char* strcat0(char* s1, char* s2) {  
    static char result[10];  
    strcpy(result, s1);  
    strcat(result, s2);  
    return result;  
}
char* newAlias() {  
    static int no = 1;  
    char s[10];  
    snprintf(s, 10, "%d", no++);  
    return strcat0("v", s);  
}
char* newLabel() {  
    static int no = 1;  
    char s[10];  
    snprintf(s, 10, "%d", no++);  
    return strcat0("label", s);  
}
char* newTemp() {  
    static int no = 1;  
    char s[10];  
    snprintf(s, 10, "%d", no++);  
    return strcat0("temp", s);  
}
//生成一条TAC代码的结点组成的双向循环链表，返回头指针  
struct codenode* genIR(int op, struct opn opn1, struct opn opn2, struct opn result) {  
    struct codenode* h = (struct codenode*)malloc(sizeof(struct codenode));  
    h->op = op;  
    h->opn1 = opn1;  
    h->opn2 = opn2;  
    h->result = result;  
    h->next = h->prior = h;  
    return h;  
}
//生成一条标号语句，返回头指针  
struct codenode* genLabel(char* label) {  
    struct codenode* h = (struct codenode*)malloc(sizeof(struct codenode));  
    h->op = LABEL;  
    strcpy(h->result.id, label);  
    h->next = h->prior = h;  
    return h;  
}
//生成GOTO语句，返回头指针  
struct codenode* genGoto(char* label) {  
    struct codenode* h = (struct codenode*)malloc(sizeof(struct codenode));  
    h->op = GOTO;  
    strcpy(h->result.id, label);  
    h->next = h->prior = h;  
    return h;  
}
//合并多个中间代码的双向循环链表，首尾相连  
struct codenode* merge(int num, ...) {  
    struct codenode* h1, * h2, * p, * t1, * t2;  
    va_list ap;  
    va_start(ap, num);  
    h1 = va_arg(ap, struct codenode*);  
    while (--num > 0) {  
        h2 = va_arg(ap, struct codenode*);  
        if (h1 == NULL) h1 = h2;  
        else if (h2) {  
            t1 = h1->prior;  
            t2 = h2->prior;  
            t1->next = h2;  
            t2->next = h1;  
            h1->prior = t2;  
            h2->prior = t1;  
        }  
    }  
    va_end(ap);  
    return h1;  
}
```

#### 继承属性与综合属性的计算

Bison的语法规则文件主要用于语法分析及构造抽象语法树，用于翻译的继承属性如S.next, S.break，S.continue, E,true, E.false，以及E.code, S.code等综合属性及其语义计算规则，不必写在产生式中，这些属性可定义在AST节点中，在遍历AST时，按规则计算即可。
比如，可以声明如下的ast节点：  

```c
struct node  
{                        
  enum node_kind kind; //结点类型  
  union  
  {  
    char type_id[33]; //由标识符生成的叶结点  
    int type_int;     //由整常数生成的叶结点  
    float type_float; //由浮点常数生成的叶结点  
  };  
  struct node *ptr[3]; /子树指针  
  int level;                  //层号  
  int place;    
  char Etrue[15], Efalse[15];   
  char Snext[15];           
  struct codenode *code;      
  char op[10];  
  int type;   //结点对应值的类型  
  int pos;    //语法单位所在位置行号  
  int offset; //偏移量  
  int width;  //各种数据占用的字节数  
};   
```

这个结构体虽有些浪费空间(因为不同节点属性不同，不是每个属性都有用）但能解决问题。你可能注意到这里没有break和coninue属性，你加上也行，不加也能找到替代方案。因为你比较容易判断是否在while语句中。且break语句的break属性一定与其父节点的next属性相同。

以while语句的产生式为例(构AST节点的规则略):
StmtWhile:    WHILE LP Cond RP Stmt {... }
  ;
它对应的AST子树的根结点是stmtWhile,并有两棵子树：Cond(条件表达式)和Stmt(语句)。

教材P216页给出了while语句的翻译模式：
S→ while {E.true = newlable; E.false=S.next} E do
   {S1.next = newlable; S1.break = S.next} S1
   {S1.code = gen(s1.next ':')|| E.code || gen(E.true ':') || S1.code || gen('goto' S1.next)}

 这里，while对应ast节点的类别stmtWhile，E和S1分别对应Cond和stmt。当遍历到stmtWhile类别节点时，先计算节点本身的继承属性(作为语句，它有next,break等继承属性，有code等综合属性），接下来依次访问其两个孩子节点Cond和Stmt。在访问Cond节点时，同样先计算其继承属性(true,false)，待访问完Cond节点的所有后代后，计算其综合属性code等，接着计算Stmt的继承属性(next,break等),然后递归访问其所有后代，待返回时计算其综合属性code等，最后处理stmtWhile的综合属性比如code :
它由一系列中间代码merge而成。继承属性自上向下传递，综合属性自下向上传递，所有属性都能顺利计算出来:  

```c
 case StmtWhile:  
     strcpy(T->ptr[0]->Etrue, newLabel());   
     strcpy(T->ptr[0]->Efalse, T->Snext);  
     ...  
   遍历 (T->ptr[0]);  // 条件表达式Cond对应的子树  
   ...  
   strcpy(T->ptr[1]->Snext, newLabel());  
   ...   
   strcpy(break_label, T->Snext);  
    trcpy(continue_label, T->ptr[1]->Snext);  
    遍历(T->ptr[1]);      //循环体Stmt对应的子树  
   ...  
   T->code = merge(5, genLabel(T->ptr[1]->Snext),   
               T->ptr[0]->code,  
                    genLabel(T->ptr[0]->Etrue),   
               T->ptr[1]->code,   
               genGoto(T->ptr[1]->Snext));  
   ...              
    break;  
```

上述示例数据结构定义在def.h中，相关代码需要你在某个文件中实现（ast.c或ir.c)。

由于每类ast节点的特性不同，你还可以针对不同类别节点，写不出同的遍历函数，在遍历节点的过程中完成不同的翻译，如：
translate_exp(...)
translate_Stmt(...)
translate_Cond(...)
translate_Call(...)
translate_Args(...)  

#### 对数组引用的翻译

示例:
int a\[3][5];

c=a\[i][j];
可翻译成如下三地址码:
temp1 = i\*20;
temp2 = j*4;
temp3 = temp1 + temp2;
temp4 = a[temp3];
c = temp4;

### 分析器项目文件

项目的程序文件在之前的基础上，添加了IR.c和IR.cpp空白文件，如果需要，可以在该文件中实现中间代码的生成。当然你也可以继续在之前的代码文件中添加新函数。 此外，请将你之前实现的代码复制到本实训的对应程序文件中，并在此基础上，增加中间代码的实现，必要时完善其它功能（比如丰富符号表的内容，或为AST节点添加新的属性）

如果词法和语法描述文件不再需要修改，可以直接复制由flex和bison生成的.c(lex.yy.c,sysy.tab.c)和.h文件，不再需要.l和.y文件. 修改Makefile文件，删除对.l和.y文件的依赖.

注:运行时库函数应当视为已定义的函数，参见sylib.c和sylib.h。

请根据需要选择文件，并正确make你选取的程序文件，不需要的文件可以置之不理。

### 编程要求

在右侧编辑器粘贴之前的代码、补充代码,,完成中间代码的生成。正确编写Makefile文件，测试程序将直接make，然后用make生成的程序parser来测试一系列测试用例。

### 测试说明

平台会make你编写的代码，并检查是否成功生成parser，若make成功，即运行parser，将测式用例翻译成三地址码，并输出。

输出结果不需要与预期结果完全一致，并且你可以选择性地将“:=”输出为“=”，将“LABEL labelx”输出为“labelx:”。另外，你还可以对教材中的翻译模式进行优化，或者对生成的中间代码作优化后再输出。



实验指导老师会复核输出结果，只要翻译出的三地址代码逻辑正确，即可视为通关。



------

开始你的任务吧，祝你成功！