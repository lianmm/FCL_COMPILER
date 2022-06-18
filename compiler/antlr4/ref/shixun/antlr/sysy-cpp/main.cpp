#include <iostream>

#include "antlr4-runtime.h"
#include "generated/SysYLexer.h"

using namespace antlr4;

int main(int argc, const char* argv[]) {
    //std::ifstream infile(argv[1]);
    ANTLRInputStream input(std::cin);
    CommonLexer lexer(&input);
    CommonTokenStream tokens(&lexer);

    tokens.fill();
    for (auto token : tokens.getTokens()) {
        std::cout << token->toString() << std::endl;
    }

    TParser parser(&tokens);
    tree::ParseTree* tree = parser.main();

    std::cout << tree->toStringTree(&parser) << std::endl << std::endl;


    return 0;}
