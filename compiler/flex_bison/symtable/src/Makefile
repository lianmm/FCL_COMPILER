parser: sysy.tab.c lex.yy.c symtable.o ast.o
	gcc -o $@ $^
sysy.tab.c: sysy.y 
	bison -d sysy.y  
lex.yy.c: sysy.l 
	flex sysy.l
symtable.o:symtable.cpp symtable.h
	gcc -c $^
ast.o:ast.c def.h
	gcc -c $^

clean:
	rm parser sysy.tab.c lex.yy.c sysy.tab.h *.o *.h.gch

