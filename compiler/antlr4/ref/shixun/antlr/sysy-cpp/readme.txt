java -cp $CLASSPATH org.antlr.v4.Tool -Dlanguage=Cpp -listener -visitor -o generated/ -package antlrcpptest *.g4 

g++ ./*.cpp -lantlr4-runtime



