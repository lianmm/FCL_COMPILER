parser: sysy.tab.c lex.yy.c semantic.o ast.o
	gcc -o $@ $^
sysy.tab.c: sysy.y 
	bison -d sysy.y  
lex.yy.c: sysy.l 
	flex sysy.l
semantic.o:semantic.cpp semantic.h
	gcc -c $^
ast.o:ast.c def.h
	gcc -c $^

clean:
	rm parser sysy.tab.c lex.yy.c sysy.tab.h *.o *.h.gch

