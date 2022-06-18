 /* PL词法分析器 */
 /* 功能：能够识别出PL支持的所有单词符号并给出种别值 */
 /* 说明：在下面的begin和end之间添加代码，已经实现了标识符和整常量的识别，你需要完成剩下的部分，加油吧！ */
 /* 提示：因为是顺序匹配，即从上至下依次匹配规则，所以需要合理安排顺序～ */

%{
#include <stdio.h>

%}
 /* begin */
LETTER		[a-zA-Z]
PROCSYM			procedure
CONSTSYM		const
BEGINSYM		begin
WHILESYM		while
THENSYM			then
ELSESYM			else
TYPESYM			type
CALLSYM			call
ENDSYM			end
IFSYM			if
DOSYM			do
VARSYM			var
OFSYM			of
ARRAYSYM		array
PROGRAMSYM		program
MODSYM			mod
ANDSYM			and
ORSYM			or
NOTSYM			not
NEQ			<>
LEQ			<=
LSS			<
GEQ			>=
GTR			>
BECOME			:=
COLON			:
PLUS			\+
MINUS			\-
TIMES			\*
DIVSYM			[/]
EQL			=
LBRACK		\[
LPAREN			\(
RPAREN			\)
COMMA			,
SEMICOLON		;
PERIOD			\.
INTCON			([\-]?[1-9][0-9]*|0)
IDENT			[A-Za-z][A-Za-z0-9]*
CHARCON			(\')[^\']*(\')
ERROR			(~|!|@|#|$|%|^|&|_|\\)
 
 /* end */
%%
 /* begin */
{PROCSYM}			{printf("%s: PROCSYM\n", yytext);}
{CONSTSYM}			{printf("%s: CONSTSYM\n", yytext);}
{BEGINSYM}			{printf("%s: BEGINSYM\n", yytext);}
{WHILESYM}			{printf("%s: WHILESYM\n", yytext);}
{THENSYM}			{printf("%s: THENSYM\n", yytext);}
{ELSESYM}			{printf("%s: ELSESYM\n", yytext);}
{TYPESYM}			{printf("%s: TYPESYM\n", yytext);}
{CALLSYM}			{printf("%s: CALLSYM\n", yytext);}
{ENDSYM}			{printf("%s: ENDSYM\n", yytext);}
{IFSYM}			{printf("%s: IFSYM\n", yytext);}
{DOSYM}			{printf("%s: DOSYM\n", yytext);}
{VARSYM}			{printf("%s: VARSYM\n", yytext);}
{OFSYM}			{printf("%s: OFSYM\n", yytext);}
{ARRAYSYM}			{printf("%s: ARRAYSYM\n", yytext);}
{PROGRAMSYM}			{printf("%s: PROGRAMSYM\n", yytext);}
{MODSYM}			{printf("%s: MODSYM\n", yytext);}
{ANDSYM}			{printf("%s: ANDSYM\n", yytext);}
{ORSYM}			{printf("%s: ORSYM\n", yytext);}
{NOTSYM}			{printf("%s: NOTSYM\n", yytext);}
{NEQ}			{printf("%s: NEQ\n", yytext);}
{LEQ}			{printf("%s: LEQ\n", yytext);}
{LSS}			{printf("%s: LSS\n", yytext);} 
{GEQ}			{printf("%s: GEQ\n", yytext);}
{GTR}			{printf("%s: GTR\n", yytext);}
{BECOME}			{printf("%s: BECOME\n", yytext);}
{COLON}			{printf("%s: COLON\n", yytext);}
{PLUS}			{printf("%s: PLUS\n", yytext);}
{MINUS}			{printf("%s: MINUS\n", yytext);}
{TIMES}			{printf("%s: TIMES\n", yytext);}
{DIVSYM}			{printf("%s: DIVSYM\n", yytext);}
"="		{printf("%s: EQL\n", yytext);}
"["		{printf("%s: LBRACK\n",yytext);}
"]"		{printf("%s: RBRACK\n", yytext);}
{LPAREN}			{printf("%s: LPAREN\n", yytext);}
{RPAREN}			{printf("%s: RPAREN\n", yytext);}
{COMMA}			{printf("%s: COMMA\n", yytext);}
{SEMICOLON}			{printf("%s: SEMICOLON\n", yytext);}
{PERIOD}			{printf("%s: PERIOD\n", yytext);}
{ERROR}			{printf("%s: ERROR\n", yytext);}
{INTCON}		{printf("%s: INTCON\n", yytext);}
{IDENT}			{printf("%s: IDENT\n", yytext);}
{CHARCON}			{printf("%s: CHARCON\n", yytext);}
\n	{}
. { }
%%
int yywrap() { return 1; }
int main(int argc, char **argv)
{
	if (argc > 1) {
		if (!(yyin = fopen(argv[1], "r"))) {
			perror(argv[1]);
			return 1;
		}
	}
	while (yylex());
	return 0;
}
 
