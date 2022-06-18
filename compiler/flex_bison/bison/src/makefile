parser: y.tab.c lex.yy.c driver.o ast.o
	gcc -o $@ $^
y.tab.h y.tab.c y.output: sysy.y
	bison -vdty $< -d
lex.yy.c:sysy.l
	flex $<
driver.o:driver.cpp driver.h
	g++ -c $^
ast.o:ast.c def.h
	gcc -c $^
clean:
	rm parser y.tab.c lex.yy.c driver.o y.tab.h y.output ast.o *.h.gch
