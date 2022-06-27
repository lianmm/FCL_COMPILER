parser:  *.cpp ./fronted_end/ast.cpp ./fronted_end/gen_IR.cpp ./fronted_end/semantic.cpp ./fronted_end/symtable.cpp lex.yy.o sysy.tab.o
	g++ -o $@ $^
lex.yy.o: lex.yy.c
	gcc -c lex.yy.c 
sysy.tab.o: sysy.tab.c 
	gcc -c sysy.tab.c 
lex.yy.c: fronted_end/sysy.l 
	flex fronted_end/sysy.l 
sysy.tab.c: fronted_end/sysy.y 
	bison -d fronted_end/sysy.y

.PHONY: clean
clean:
	rm parser sysy.tab.c lex.yy.c  *.o

.PHONY: test
test:
	./parser ../test/test_in/test.c
	arm-linux-gcc  -march=armv7-a -mtune=cortex-a9 -static ../test/test_in/test.c -S -o ../test/arm_out/test.s
	arm-linux-gcc  -march=armv7-a -mtune=cortex-a9 -static ../sysy_lib/lib.a ../test/arm_out/test.s -o ../test/out/test.out
	arm-linux-gcc  -march=armv7-a -mtune=cortex-a9 -static ../sysy_lib/lib.a ../test/fcl_arm_out/test.fcl.s -o ../test/out/test.fcl.out
	qemu-arm ../test/out/test.fcl.out

