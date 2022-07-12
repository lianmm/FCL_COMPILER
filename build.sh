cd ./src
#删除可能影响编译的旧文件；
rm ../compiler ./frontend/sysy.tab.cpp ./frontend/lex.yy.cpp ./frontend/sysy.tab.c ./frontend/lex.yy.c ./frontend/sysy.tab.h 2>>../junk.txt
#词法分析&&语法分析自动生成；
cd frontend
bison -d sysy.y 
flex sysy.l
mv sysy.tab.c sysy.tab.cpp #改拓展名防止连接错误； 
mv lex.yy.c lex.yy.cpp
cd ../../
#项目整体编译，仿希冀评测机命令；使用正则避免加文件改指令的麻烦；
clang++ -std=c++17  -O2 -lm -L/extlibs -I/extlibs -lantlr4-runtime src/midend/*.cpp src/frontend/*.cpp src/backend/*.cpp  -I src/baskend -I src/frontend -I src/midend -o compiler 

rm junk.txt