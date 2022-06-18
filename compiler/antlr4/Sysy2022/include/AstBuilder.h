// Generated from Sysy2022Parser.g4 by ANTLR 4.9.1
#ifndef _ASTBUILDER_
#define _ASTBUILDER_

#include <memory.h>
#include "antlr4-runtime.h"
#include "Sysy2022ParserBaseVisitor.h"
#include "AstNode.h"

using namespace std;

namespace antlrcpp
{

    /**
     * This class provides an empty implementation of Sysy2022ParserVisitor, which can be
     * extended to create a visitor which only needs to handle a subset of the available methods.
     */
    class AstBuilder : public Sysy2022ParserBaseVisitor
    {
    public:
        bool debug = false;
        void log(string info)
        {
            if (debug)
            {
                cerr << info << endl;
            }
        }
        AstBuilder() {}
        ~AstBuilder() {}
virtual antlrcpp::Any visitCompUnit(Sysy2022Parser::CompUnitContext *ctx) override;
virtual antlrcpp::Any visitcompunitplus(Sysy2022Parser::compunitplusContext *ctx) override;
virtual antlrcpp::Any visitDecl(Sysy2022Parser::DeclContext *ctx) override;
virtual antlrcpp::Any visitConstDecl(Sysy2022Parser::ConstDeclContext *ctx) override;
virtual antlrcpp::Any visitBType(Sysy2022Parser::BTypeContext *ctx) override;
virtual antlrcpp::Any visitConstDef(Sysy2022Parser::ConstDefContext *ctx) override;
virtual antlrcpp::Any visitConstInitVal(Sysy2022Parser::ConstInitValContext *ctx) override;
virtual antlrcpp::Any visitVarDecl(Sysy2022Parser::VarDeclContext *ctx) override;
virtual antlrcpp::Any visitVarDef(Sysy2022Parser::VarDefContext *ctx) override;
virtual antlrcpp::Any visitInitVal(Sysy2022Parser::InitValContext *ctx) override;
virtual antlrcpp::Any visitFuncDef(Sysy2022Parser::FuncDefContext *ctx) override;
virtual antlrcpp::Any visitFuncType(Sysy2022Parser::FuncTypeContext *ctx) override;
virtual antlrcpp::Any visitFuncFParams(Sysy2022Parser::FuncFParamsContext *ctx) override;
virtual antlrcpp::Any visitFuncFParam(Sysy2022Parser::FuncFParamContext *ctx) override;
virtual antlrcpp::Any visitBlock(Sysy2022Parser::BlockContext *ctx) override;
virtual antlrcpp::Any visitBlockItem(Sysy2022Parser::BlockItemContext *ctx) override;
virtual antlrcpp::Any visitStmt(Sysy2022Parser::StmtContext *ctx) override;
virtual antlrcpp::Any visitExp(Sysy2022Parser::ExpContext *ctx) override;
virtual antlrcpp::Any visitCond(Sysy2022Parser::CondContext *ctx) override;
virtual antlrcpp::Any visitLVal(Sysy2022Parser::LValContext *ctx) override;
virtual antlrcpp::Any visitPrimaryExp(Sysy2022Parser::PrimaryExpContext *ctx) override;
virtual antlrcpp::Any visitNumber(Sysy2022Parser::NumberContext *ctx) override;
virtual antlrcpp::Any visitUnaryExp(Sysy2022Parser::UnaryExpContext *ctx) override;
virtual antlrcpp::Any visitUnaryOp(Sysy2022Parser::UnaryOpContext *ctx) override;
virtual antlrcpp::Any visitFuncRParams(Sysy2022Parser::FuncRParamsContext *ctx) override;
virtual antlrcpp::Any visitMulExp(Sysy2022Parser::MulExpContext *ctx) override;
virtual antlrcpp::Any visitAddExp(Sysy2022Parser::AddExpContext *ctx) override;
virtual antlrcpp::Any visitRelExp(Sysy2022Parser::RelExpContext *ctx) override;
virtual antlrcpp::Any visitEqExp(Sysy2022Parser::EqExpContext *ctx) override;
virtual antlrcpp::Any visitLAndExp(Sysy2022Parser::LAndExpContext *ctx) override;
virtual antlrcpp::Any visitLOrExp(Sysy2022Parser::LOrExpContext *ctx) override;
virtual antlrcpp::Any visitConstExp(Sysy2022Parser::ConstExpContext *ctx) override;


    };
} // namespace antlrcpp

#endif
