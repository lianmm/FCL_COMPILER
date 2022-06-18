 本关可以直接点击评测按钮，用上一关生成的parser评测全部6组测试用例 。
 
 AST输出参考：

 CompUnit
 `--FuncDef int main()
    `--Block
       |--Decl 
       |  |--VarDecl a int
       |  |--VarDecl b int
       |  `--VarDecl c int
       |--= int
       |  |--a int
       |  `--1 IntLiteral
       |--= int
       |  |--b int
       |  `--2 IntLiteral
       |--= int
       |  |--c int
       |  `--3 IntLiteral
       |--UnaryExp  void putint(int)
       |  `--+ int
       |     |--a int
       |     `--* int
       |        |--b int
       |        `--c int
       `--return 
          `--0 IntLiteral 
