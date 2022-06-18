parser: sysy.tab.c lex.yy.c gen_IR.o ast.o 
	gcc -o $@ $^
sysy.tab.c: sysy.y 
	bison -d sysy.y  
lex.yy.c: sysy.l 
	flex sysy.l
sym_sem.o:sym_sem.cpp def.h
	gcc -c $^
gen_IR.o:gen_IR.cpp gen_IR.h
	gcc -c $^
ast.o:ast.c def.h
	gcc -c $^

clean:
	rm parser sysy.tab.c lex.yy.c sysy.tab.h *.o *.h.gch

