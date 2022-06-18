%option noyywrap
%option yylineno

%{
#include <stdio.h>

enum Token {
    INT=258, FLOAT, VOID, CONST, RETURN, IF, ELSE, FOR, WHILE, DO, BREAK, CONTINUE,
    LP, RP, LB, RB, LC, RC, COMMA, SEMICOLON, QUESTION, COLON,
    MINUS, NOT, TILDE, ASSIGN, ADD, MUL, DIV, MOD, AND, OR,
    EQ, NE, LT, LE, GT, GE,
    ID, INT_LIT, FLOAT_LIT,
    LEX_ERR
};

%}
NULL        [/][/].*\n
INT         int
FLOAT       float
VOID        void
CONST       const
RETURN      return
IF          if
ELSE        else
FOR         for
WHILE       while
DO          do
BREAK       break
CONTINUE    continue
LP			\(
RP			\)
LB  		\[
RB          \]
LC          \{
RC          \}
COMMA		,
SEMICOLON	;
QUESTION    \?
COLON		:
NE          !=
NOT         !
EQ          ==
ASSIGN		=
MINUS		\-
ADD			\+
MUL			\*
DIV			[/]
MOD         %
AND         &&
OR          \|\|
LE			<=
LT			<
GE			>=
GT			>
NUMS        [0-9]+
ID			[A-Za-z][A-Za-z0-9]*
INT_LIT		([1-9][0-9]*)|([0-7]+)|((0x|0X)?[0-9a-f]+)
EXP         [Ee][+-]?[0-9]+
FLOAT_LIT   ([0-9]+{EXP}[fF]?)|([0-9]+\.{EXP}?[Ff]?)|([0-9]*\.[0-9]+{EXP}?[fF]?)
LEX_ERR		(~|!|@|#|$|%|^|&|_|\\)


%%

"int" {printf("%s : INT\n", yytext); return INT; }
"float" {printf("%s : FLOAT\n", yytext); return FLOAT; }
"void" {printf("%s : VOID\n", yytext); return VOID; }
"const" {printf("%s : CONST\n", yytext); return CONST; }
"return" {printf("%s : RETURN\n", yytext); ; return RETURN; }
"if" {printf("%s : IF\n", yytext); return IF; }
"else" {printf("%s : ELSE\n", yytext); return ELSE; }
"for" {printf("%s : FOR\n", yytext); return FOR; }
"while" {printf("%s : WHILE\n", yytext); return WHILE; }
"do" {printf("%s : DO\n", yytext); return DO; }
"break" {printf("%s : BREAK\n", yytext); return BREAK; }
"continue" {printf("%s : CONTINUE\n", yytext); return CONTINUE; }
{LP} {printf("%s : LP\n", yytext); return LP; }
{RP} {printf("%s : RP\n", yytext); return RP; }
{LB} {printf("%s : LB\n", yytext); return LB; }
{RB} {printf("%s : RB\n", yytext); return RB; }
{LC} {printf("%s : LC\n", yytext); return LC; }
{RC} {printf("%s : RC\n", yytext); return RC; }
{COMMA} {printf("%s : COMMA\n", yytext); return COMMA; }
{SEMICOLON} {printf("%s : SEMICOLON\n", yytext); return SEMICOLON; }
{QUESTION} {printf("%s : QUESTION\n", yytext); return QUESTION; }
{COLON} {printf("%s : COLON\n", yytext); return COLON; }
{NOT} {printf("%s : NOT\n", yytext); return NOT; }
{ASSIGN} {printf("%s : ASSIGN\n", yytext); return ASSIGN; }
{MINUS} {printf("%s : MINUS\n", yytext); return MINUS; }
{ADD} {printf("%s : ADD\n", yytext); return ADD; }
{MUL} {printf("%s : MUL\n", yytext); return MUL; }
{DIV} {printf("%s : DIV\n", yytext); return DIV; }
{MOD} {printf("%s : MOD\n", yytext); return MOD; }
{AND} {printf("%s : AND\n", yytext); return AND; }
{OR} {printf("%s : OR\n", yytext); return OR; }
{EQ} {printf("%s : EQ\n", yytext); return EQ; }
{NE} {printf("%s : NE\n", yytext); return NE; }
{LT} {printf("%s : LT\n", yytext); return LT; }
{LE} {printf("%s : LE\n", yytext); return LE; }
{GT} {printf("%s : GT\n", yytext); return GT; }
{GE} {printf("%s : GE\n", yytext); return GE; }
{ID} {printf("%s : ID\n", yytext); return ID; }
{INT_LIT} {printf("%s : INT_LIT\n", yytext); return INT_LIT; }
{FLOAT_LIT} {printf("%s : FLOAT_LIT\n", yytext); return FLOAT_LIT; }
{LEX_ERR} {printf("%s : LEX_ERR\n", yytext); return LEX_ERR; }
{NULL} {}
\n {}
. {}


%%


int main(int argc, char** argv) {
    if(argc > 1) {
        if(!(yyin = fopen(argv[1], "r"))) {
           perror(argv[1]); 
           return  1; 
        }       

while (yylex());




        fclose(yyin);
    } else printf("No source file given!\n"); 

    return 0; 
}
