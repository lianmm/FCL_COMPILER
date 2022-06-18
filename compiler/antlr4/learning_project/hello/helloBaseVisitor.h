
// Generated from hello.g4 by ANTLR 4.9.3

#pragma once


#include "antlr4-runtime.h"
#include "helloVisitor.h"


/**
 * This class provides an empty implementation of helloVisitor, which can be
 * extended to create a visitor which only needs to handle a subset of the available methods.
 */
class  helloBaseVisitor : public helloVisitor {
public:

  virtual antlrcpp::Any visitR(helloParser::RContext *ctx) override {
    return visitChildren(ctx);
  }


};

