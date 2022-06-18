parser grammar Sysy2022Parser;
options {
	tokenVocab = Sysy2022Lexer;
}


compunit:( decl | funcdef )  compunitplus EOF 
			| ( decl | funcdef )  EOF;

compunitplus:( decl | funcdef )  compunitplus
			|	;
            

decl	:	constdecl| vardecl;

constdecl:'const' btype constdef ( ',' constdef )* ';';

btype	:	'int' 	| 'float';

constdef	:	ID ( '[' constexp ']' )* '=' constinitval;

constinitval	:	constexp
	| '{' ( constinitval ( ',' constinitval )* )? '}';

vardecl	:	btype vardef ( ',' vardef )* ';';

vardef	:	ID ( '[' constexp ']' )*
	| ID ('[' constexp ']')* '=' initval;

initval	:	exp 	| '{' ( initval ( ',' initval )* )? '}';

funcdef	:	functype ID '(' (funcfparams)? ')' block;

functype	:	'void' 	| 'int' 	| 'float';

funcfparams	:	funcfparam ( ',' funcfparam )*;

funcfparam	:	btype ID ('[' ']' ( '[' exp ']' )*)?;

block	:	'{' ( blockitem )* '}';

blockitem	:	decl 	| stmt;

stmt	:	lval '=' exp ';' 	| (exp)? ';' 	| block
	| 'if' '(' cond ')' stmt ( 'else' stmt )?
	| 'while' '(' cond ')' stmt
	| 'break' ';' 	| 'continue' ';'
	| 'return' (exp)? ';';

exp	:	addexp ;//注： sysY表达式是 int/float型;

cond	:	lorexp;

lval	:	ID ('[' exp ']')*;

primaryexp	:	'(' exp ')' 	| lval 	| number;

number	:	INT_LIT 	| FLOAT_LIT;

unaryexp	:	primaryexp 	| ID '(' (funcrparams)? ')' 	| unaryop unaryexp;

unaryop	:	'+' 	| '-' 	| '!' ;//注：'!'仅出现在 仅出现在 条件表达式中;

funcrparams	:	exp ( ',' exp )*;

mulexp	:	unaryexp 	| mulexp ('*' 	| '/' 	| '%') unaryexp;

addexp	:	mulexp 	| addexp ('+' 	| '-') mulexp;

relexp	:	addexp 	| relexp ('<' 	| '>' 	| '<=' 	| '>=') addexp;

eqexp	:	relexp 	| eqexp ('==' 	| '!=') relexp;

landexp	:	eqexp 	| landexp '&&' eqexp;

lorexp	:	landexp 	| lorexp '||' landexp;

constexp	:	addexp;// 注：使用的 Ident 必须是常量;
