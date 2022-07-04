fcl_parser:  *.cpp ./fronted_end/ast.cpp ./fronted_end/gen_IR.cpp ./fronted_end/semantic.cpp ./fronted_end/symtable.cpp lex.yy.o sysy.tab.o 
	g++  -o  $@ $^ -g
lex.yy.o: lex.yy.c
	gcc -c lex.yy.c -g
sysy.tab.o: sysy.tab.c 
	gcc -c sysy.tab.c  -g
sysy.tab.c: fronted_end/sysy.y 
	bison -d fronted_end/sysy.y
lex.yy.c: fronted_end/sysy.l 
	flex fronted_end/sysy.l 


.PHONY: clean
clean:
	rm sysy.tab.c lex.yy.c  *.o fcl_parser

