lexer grammar Sysy2022Lexer;
tokens{
INT, FLOAT, VOID, CONST, RETURN, IF, ELSE, FOR, WHILE, DO, BREAK, CONTINUE,
    LP, RP, LB, RB, LC, RC, COMMA, SEMICOLON, QUESTION, COLON,
    MINUS, NOT, TILDE, ASSIGN, ADD, MUL, DIV, MOD, AND, OR,
    EQ, NE, LT, LE, GT, GE,
    ID, INT_LIT, FLOAT_LIT,
    LEX_ERR

}

/*Keywords*/

INT     :    'int';
FLOAT   :    'float';
VOID    :    'void';
CONST   :    'const';
RETURN  :    'return';
IF      :    'if';
ELSE    :    'else';
FOR     :    'for';
WHILE   :    'while';
DO      :    'do';
BREAK    :   'break';
CONTINUE :   'continue';
LP	:	'(';
RP	:	')';
LB	:	'[';
RB	:     	']';
LC	:	'{';
RC	:	'}';
COMMA	:	',';
SEMICOLON 	:	';';
QUESTION  :  '?';
COLON	:	':'	;
NE     :     '!=';
NOT   :      '!';
EQ     :     '==';
ASSIGN	:	'=';
MINUS	:	'-';
ADD	:		'+';
MUL	:		'*';
DIV	:		'/';
MOD     :    '%';
AND   :      '&&';
OR    :      '||';
LE	:		'<=';
LT	:		'<';
GE	:		'>=';
GT	:		'>';

NUMS    :    [0-9]+;
ERROR   :    (    (([0-9]+([a-wA-w]|'y'|'z'|'Y'|'Z')+)|([1-9]+[A-Za-z]+))    [0-9]*)   |    ('0'[0-7]*[8-9]+[0-9]*);
ID		:	[_A-Za-z][A-Za-z0-9_]*;
INT_LIT	:	([1-9][0-9]*)|([0-7]+)|(('0x'|'0X')?[0-9a-f]+);
fragment EXP  :   ('E'|'e')('+'|'-')?[0-9]+;
FLOAT_LIT :  ([0-9]+EXP[fF]?)|([0-9]+'.'EXP?[Ff]?)|([0-9]*'.'[0-9]+EXP?[fF]?);
LEX_ERR	:	('~'|'!'|'@'|'#'|'$'|'%'|'^'|'&'|'\\') ;

Newline: ('\r' '\n'? | '\n') -> skip;
BlockComment: '/*' .*? '*/' -> skip;
LineComment: '//' ~ [\r\n]* -> skip;
Voidplase : ' ' ->skip;
/*Operators*/
