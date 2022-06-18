
// Generated from Sysy2022Parser.g4 by ANTLR 4.7.2

#pragma once


#include "antlr4-runtime.h"
#include "Sysy2022ParserVisitor.h"


/**
 * This class provides an empty implementation of Sysy2022ParserVisitor, which can be
 * extended to create a visitor which only needs to handle a subset of the available methods.
 */
class  Sysy2022ParserBaseVisitor : public Sysy2022ParserVisitor {
public:

  virtual antlrcpp::Any visitCompunit(Sysy2022Parser::CompunitContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitCompunitplus(Sysy2022Parser::CompunitplusContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitDecl(Sysy2022Parser::DeclContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitConstdecl(Sysy2022Parser::ConstdeclContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitBtype(Sysy2022Parser::BtypeContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitConstdef(Sysy2022Parser::ConstdefContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitConstinitval(Sysy2022Parser::ConstinitvalContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitVardecl(Sysy2022Parser::VardeclContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitVardef(Sysy2022Parser::VardefContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitInitval(Sysy2022Parser::InitvalContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitFuncdef(Sysy2022Parser::FuncdefContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitFunctype(Sysy2022Parser::FunctypeContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitFuncfparams(Sysy2022Parser::FuncfparamsContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitFuncfparam(Sysy2022Parser::FuncfparamContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitBlock(Sysy2022Parser::BlockContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitBlockitem(Sysy2022Parser::BlockitemContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitStmt(Sysy2022Parser::StmtContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitExp(Sysy2022Parser::ExpContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitCond(Sysy2022Parser::CondContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitLval(Sysy2022Parser::LvalContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitPrimaryexp(Sysy2022Parser::PrimaryexpContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitNumber(Sysy2022Parser::NumberContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitUnaryexp(Sysy2022Parser::UnaryexpContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitUnaryop(Sysy2022Parser::UnaryopContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitFuncrparams(Sysy2022Parser::FuncrparamsContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitMulexp(Sysy2022Parser::MulexpContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitAddexp(Sysy2022Parser::AddexpContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitRelexp(Sysy2022Parser::RelexpContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitEqexp(Sysy2022Parser::EqexpContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitLandexp(Sysy2022Parser::LandexpContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitLorexp(Sysy2022Parser::LorexpContext *ctx) override {
    return visitChildren(ctx);
  }

  virtual antlrcpp::Any visitConstexp(Sysy2022Parser::ConstexpContext *ctx) override {
    return visitChildren(ctx);
  }


};

