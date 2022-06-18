## 实验任务

1. 熟悉ANTLR4 语法描述
2. 完善Safe C语言的ANTLR4词法(SafeCLexer.g4)和语法文件(SafeCParser.g4)
3. 基于语法理解，编写正确样例和错误样例对语法进行测试

## SafeC 词法文件

词法文件主要用于解析语言的token流，为后续语法分析做准备，比如变量，算数符号，内置关键字等等。

在实验时，以下知识可能会有所帮助：

1. 普通 token 使用单引号包裹；
2. 对注释的要求与C语言一致，在最后使用 `-> skip`表示跳过分析
3. 对变量的要求与C一致，即字母、下划线开头，由字母、下划线、数字组成，暂时不考虑与关键字冲突的问题
4. 对常量数字的要求是，支持16进制和10进制表示
5. 和正则表达式写法类似`[a-z]`表示字母a-z的集合，?、+、*的使用也和正则表达式一样

完整的token撰写规则可以查看官方文档 [lexer rules](https://github.com/ANTLR/antlr4/blob/master/doc/lexer-rules.md)

```
lexer grammar SafeCLexer;
tokens {
    Comma,
    SemiColon,
    Assign,

    LeftBracket,
    RightBracket,
    LeftBrace,
    RightBrace,
    LeftParen,
    RightParen,

    If,
    Else,
    While,

    Equal,
    NonEqual,
    Less,
    Greater,
    LessEqual,
    GreaterEqual,

    Plus,
    Minus,
    Multiply,
    Divide,
    Modulo,

    Int,
    Void,
    Obc,
    Const,

    Identifier,
    IntConst
}

Comma: 
SemiColon: 
Assign: 

LeftBracket: 
RightBracket: 
LeftBrace: 
RightBrace: 
LeftParen: 
RightParen: 

If: 
Else: 
While: 

Equal: 
NonEqual: 
Less: 
Greater: 
LessEqual: 
GreaterEqual: 

Plus: 
Minus: 
Multiply: 
Divide: 
Modulo: 

Int: 'int';
Void: 'void';
Obc: 'obc';
Const: 'const';

Identifier: [_a-zA-Z][a-zA-Z0-9_]*;
IntConst:

BlockComment : 
LineComment : 
WhiteSpace: [ \t\r\n]+ -> skip;
```

当实现完词法文件后，ANTLR4允许我们对自己的测试集进行测试

```
// 编译 .g4文件得到相应的java代码
antlr *.g4
// 编译生成的java文件
javac *.java
// 查看token流
grun SafeCLexer tokens -tokens filepath
```

## SafeC 语法文件‌

语法文件建立在词法文件的基础之上，具有更加严谨的语法条件约束

```
parser grammar SafeCParser;
options { tokenVocab = SafeCLexer; }

compUnit: (decl | funcDef) + EOF;

decl: constDecl | varDecl;

funcDef: Void Identifier LeftParen RightParen block;

constDecl:

constDef:

varDecl:

bType: Int;

varDef:

array:

obcArray:

unobcArray:

block:

blockItem: decl | stmt;

stmt:

cond: exp (Equal | NonEqual | LessEqual | GreaterEqual | Less | Greater) exp;

lval:

number: IntConst;

exp:
```

可以看到，ANTLR4 语法文件的描述十分接近语言的EBNF描述，因此写起来十分简洁易懂，具体语法可参考 [parser rules](https://github.com/ANTLR/antlr4/blob/master/doc/parser-rules.md) 

ANTLR4也允许我们查看最后生成的抽象语法树

```
// 编译 .g4文件得到相应的java代码
antlr4 *.g4
// 编译生成的java文件
javac *.java
// 查看token流
grun SafeCLexer tokens -tokens filepath
// 以图片方式查看语法树
grun SafeC CompUnit -gui filepath
// 命令行方式输出语法树
grun SafeC CompUnit -tree filepath
```

## 实验提交要求

提交时，仅提交`grammar`文件夹

## 其他

给的文件目录如下

```
Lab1-1
├── diff.sh
├── go.sh
├── grammar
│   ├── SafeCLexer.g4
│   └── SafeCParser.g4
└── tests
    ├── 0.c
    ├── ...
```

+ `go.sh` ：对于编译后的`SafeCLexer`进行批量测试得到结果的脚本
+ `diff.sh`：可以对于两个目录下的得到的结果进行比较
+ `tests`：全部的测试样例

## 参考资料

- [antlr4 grammars](https://github.com/antlr/grammars-v4) ：包含了大量常用语言(C/C++/Java等)的ANTLR语法文件，在实验时可以进行参考
- [LL(*): The Foundation of the ANTLR Parser Generator](https://www.antlr.org/papers/LL-star-PLDI11.pdf) ：ANTLR4所使用的LL(*)算法
- [The Definitive ANTLR 4 Reference](https://pragprog.com/titles/tpantlr2/the-definitive-antlr-4-reference/)：ANTLR4官方参考手册，国内也有一本《ANTLR权威指南》，可参照着阅读