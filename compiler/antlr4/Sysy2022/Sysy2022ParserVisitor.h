
// Generated from Sysy2022Parser.g4 by ANTLR 4.7.2

#pragma once


#include "antlr4-runtime.h"
#include "Sysy2022Parser.h"



/**
 * This class defines an abstract visitor for a parse tree
 * produced by Sysy2022Parser.
 */
class  Sysy2022ParserVisitor : public antlr4::tree::AbstractParseTreeVisitor {
public:

  /**
   * Visit parse trees produced by Sysy2022Parser.
   */
    virtual antlrcpp::Any visitCompunit(Sysy2022Parser::CompunitContext *context) = 0;

    virtual antlrcpp::Any visitCompunitplus(Sysy2022Parser::CompunitplusContext *context) = 0;

    virtual antlrcpp::Any visitDecl(Sysy2022Parser::DeclContext *context) = 0;

    virtual antlrcpp::Any visitConstdecl(Sysy2022Parser::ConstdeclContext *context) = 0;

    virtual antlrcpp::Any visitBtype(Sysy2022Parser::BtypeContext *context) = 0;

    virtual antlrcpp::Any visitConstdef(Sysy2022Parser::ConstdefContext *context) = 0;

    virtual antlrcpp::Any visitConstinitval(Sysy2022Parser::ConstinitvalContext *context) = 0;

    virtual antlrcpp::Any visitVardecl(Sysy2022Parser::VardeclContext *context) = 0;

    virtual antlrcpp::Any visitVardef(Sysy2022Parser::VardefContext *context) = 0;

    virtual antlrcpp::Any visitInitval(Sysy2022Parser::InitvalContext *context) = 0;

    virtual antlrcpp::Any visitFuncdef(Sysy2022Parser::FuncdefContext *context) = 0;

    virtual antlrcpp::Any visitFunctype(Sysy2022Parser::FunctypeContext *context) = 0;

    virtual antlrcpp::Any visitFuncfparams(Sysy2022Parser::FuncfparamsContext *context) = 0;

    virtual antlrcpp::Any visitFuncfparam(Sysy2022Parser::FuncfparamContext *context) = 0;

    virtual antlrcpp::Any visitBlock(Sysy2022Parser::BlockContext *context) = 0;

    virtual antlrcpp::Any visitBlockitem(Sysy2022Parser::BlockitemContext *context) = 0;

    virtual antlrcpp::Any visitStmt(Sysy2022Parser::StmtContext *context) = 0;

    virtual antlrcpp::Any visitExp(Sysy2022Parser::ExpContext *context) = 0;

    virtual antlrcpp::Any visitCond(Sysy2022Parser::CondContext *context) = 0;

    virtual antlrcpp::Any visitLval(Sysy2022Parser::LvalContext *context) = 0;

    virtual antlrcpp::Any visitPrimaryexp(Sysy2022Parser::PrimaryexpContext *context) = 0;

    virtual antlrcpp::Any visitNumber(Sysy2022Parser::NumberContext *context) = 0;

    virtual antlrcpp::Any visitUnaryexp(Sysy2022Parser::UnaryexpContext *context) = 0;

    virtual antlrcpp::Any visitUnaryop(Sysy2022Parser::UnaryopContext *context) = 0;

    virtual antlrcpp::Any visitFuncrparams(Sysy2022Parser::FuncrparamsContext *context) = 0;

    virtual antlrcpp::Any visitMulexp(Sysy2022Parser::MulexpContext *context) = 0;

    virtual antlrcpp::Any visitAddexp(Sysy2022Parser::AddexpContext *context) = 0;

    virtual antlrcpp::Any visitRelexp(Sysy2022Parser::RelexpContext *context) = 0;

    virtual antlrcpp::Any visitEqexp(Sysy2022Parser::EqexpContext *context) = 0;

    virtual antlrcpp::Any visitLandexp(Sysy2022Parser::LandexpContext *context) = 0;

    virtual antlrcpp::Any visitLorexp(Sysy2022Parser::LorexpContext *context) = 0;

    virtual antlrcpp::Any visitConstexp(Sysy2022Parser::ConstexpContext *context) = 0;


};

