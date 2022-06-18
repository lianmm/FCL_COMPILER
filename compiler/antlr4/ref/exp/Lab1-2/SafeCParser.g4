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