
// Generated from hello.g4 by ANTLR 4.9.3

#pragma once


#include "antlr4-runtime.h"
#include "helloParser.h"



/**
 * This class defines an abstract visitor for a parse tree
 * produced by helloParser.
 */
class  helloVisitor : public antlr4::tree::AbstractParseTreeVisitor {
public:

  /**
   * Visit parse trees produced by helloParser.
   */
    virtual antlrcpp::Any visitR(helloParser::RContext *context) = 0;


};

