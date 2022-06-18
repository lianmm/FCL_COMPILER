
// Generated from SysYParser.g4 by ANTLR 4.9.3

#pragma once


#include "antlr4-runtime.h"
#include "SysYParserParser.h"


namespace antlrcpptest {

/**
 * This interface defines an abstract listener for a parse tree produced by SysYParserParser.
 */
class  SysYParserListener : public antlr4::tree::ParseTreeListener {
public:

  virtual void enterCompUnit(SysYParserParser::CompUnitContext *ctx) = 0;
  virtual void exitCompUnit(SysYParserParser::CompUnitContext *ctx) = 0;

  virtual void enterDecl(SysYParserParser::DeclContext *ctx) = 0;
  virtual void exitDecl(SysYParserParser::DeclContext *ctx) = 0;

  virtual void enterConstDecl(SysYParserParser::ConstDeclContext *ctx) = 0;
  virtual void exitConstDecl(SysYParserParser::ConstDeclContext *ctx) = 0;

  virtual void enterBType(SysYParserParser::BTypeContext *ctx) = 0;
  virtual void exitBType(SysYParserParser::BTypeContext *ctx) = 0;

  virtual void enterConstDef(SysYParserParser::ConstDefContext *ctx) = 0;
  virtual void exitConstDef(SysYParserParser::ConstDefContext *ctx) = 0;

  virtual void enterScalarConstInitVal(SysYParserParser::ScalarConstInitValContext *ctx) = 0;
  virtual void exitScalarConstInitVal(SysYParserParser::ScalarConstInitValContext *ctx) = 0;

  virtual void enterListConstInitVal(SysYParserParser::ListConstInitValContext *ctx) = 0;
  virtual void exitListConstInitVal(SysYParserParser::ListConstInitValContext *ctx) = 0;

  virtual void enterVarDecl(SysYParserParser::VarDeclContext *ctx) = 0;
  virtual void exitVarDecl(SysYParserParser::VarDeclContext *ctx) = 0;

  virtual void enterUninitVarDef(SysYParserParser::UninitVarDefContext *ctx) = 0;
  virtual void exitUninitVarDef(SysYParserParser::UninitVarDefContext *ctx) = 0;

  virtual void enterInitVarDef(SysYParserParser::InitVarDefContext *ctx) = 0;
  virtual void exitInitVarDef(SysYParserParser::InitVarDefContext *ctx) = 0;

  virtual void enterScalarInitVal(SysYParserParser::ScalarInitValContext *ctx) = 0;
  virtual void exitScalarInitVal(SysYParserParser::ScalarInitValContext *ctx) = 0;

  virtual void enterListInitval(SysYParserParser::ListInitvalContext *ctx) = 0;
  virtual void exitListInitval(SysYParserParser::ListInitvalContext *ctx) = 0;

  virtual void enterFuncDef(SysYParserParser::FuncDefContext *ctx) = 0;
  virtual void exitFuncDef(SysYParserParser::FuncDefContext *ctx) = 0;

  virtual void enterFuncType(SysYParserParser::FuncTypeContext *ctx) = 0;
  virtual void exitFuncType(SysYParserParser::FuncTypeContext *ctx) = 0;

  virtual void enterFuncFParams(SysYParserParser::FuncFParamsContext *ctx) = 0;
  virtual void exitFuncFParams(SysYParserParser::FuncFParamsContext *ctx) = 0;

  virtual void enterFuncFParam(SysYParserParser::FuncFParamContext *ctx) = 0;
  virtual void exitFuncFParam(SysYParserParser::FuncFParamContext *ctx) = 0;

  virtual void enterBlock(SysYParserParser::BlockContext *ctx) = 0;
  virtual void exitBlock(SysYParserParser::BlockContext *ctx) = 0;

  virtual void enterBlockItem(SysYParserParser::BlockItemContext *ctx) = 0;
  virtual void exitBlockItem(SysYParserParser::BlockItemContext *ctx) = 0;

  virtual void enterAssignment(SysYParserParser::AssignmentContext *ctx) = 0;
  virtual void exitAssignment(SysYParserParser::AssignmentContext *ctx) = 0;

  virtual void enterExpStmt(SysYParserParser::ExpStmtContext *ctx) = 0;
  virtual void exitExpStmt(SysYParserParser::ExpStmtContext *ctx) = 0;

  virtual void enterBlockStmt(SysYParserParser::BlockStmtContext *ctx) = 0;
  virtual void exitBlockStmt(SysYParserParser::BlockStmtContext *ctx) = 0;

  virtual void enterIfStmt1(SysYParserParser::IfStmt1Context *ctx) = 0;
  virtual void exitIfStmt1(SysYParserParser::IfStmt1Context *ctx) = 0;

  virtual void enterIfStmt2(SysYParserParser::IfStmt2Context *ctx) = 0;
  virtual void exitIfStmt2(SysYParserParser::IfStmt2Context *ctx) = 0;

  virtual void enterWhileStmt(SysYParserParser::WhileStmtContext *ctx) = 0;
  virtual void exitWhileStmt(SysYParserParser::WhileStmtContext *ctx) = 0;

  virtual void enterBreakStmt(SysYParserParser::BreakStmtContext *ctx) = 0;
  virtual void exitBreakStmt(SysYParserParser::BreakStmtContext *ctx) = 0;

  virtual void enterContinueStmt(SysYParserParser::ContinueStmtContext *ctx) = 0;
  virtual void exitContinueStmt(SysYParserParser::ContinueStmtContext *ctx) = 0;

  virtual void enterReturnStmt(SysYParserParser::ReturnStmtContext *ctx) = 0;
  virtual void exitReturnStmt(SysYParserParser::ReturnStmtContext *ctx) = 0;

  virtual void enterExp(SysYParserParser::ExpContext *ctx) = 0;
  virtual void exitExp(SysYParserParser::ExpContext *ctx) = 0;

  virtual void enterCond(SysYParserParser::CondContext *ctx) = 0;
  virtual void exitCond(SysYParserParser::CondContext *ctx) = 0;

  virtual void enterLVal(SysYParserParser::LValContext *ctx) = 0;
  virtual void exitLVal(SysYParserParser::LValContext *ctx) = 0;

  virtual void enterPrimaryExp1(SysYParserParser::PrimaryExp1Context *ctx) = 0;
  virtual void exitPrimaryExp1(SysYParserParser::PrimaryExp1Context *ctx) = 0;

  virtual void enterPrimaryExp2(SysYParserParser::PrimaryExp2Context *ctx) = 0;
  virtual void exitPrimaryExp2(SysYParserParser::PrimaryExp2Context *ctx) = 0;

  virtual void enterPrimaryExp3(SysYParserParser::PrimaryExp3Context *ctx) = 0;
  virtual void exitPrimaryExp3(SysYParserParser::PrimaryExp3Context *ctx) = 0;

  virtual void enterNumber(SysYParserParser::NumberContext *ctx) = 0;
  virtual void exitNumber(SysYParserParser::NumberContext *ctx) = 0;

  virtual void enterUnary1(SysYParserParser::Unary1Context *ctx) = 0;
  virtual void exitUnary1(SysYParserParser::Unary1Context *ctx) = 0;

  virtual void enterUnary2(SysYParserParser::Unary2Context *ctx) = 0;
  virtual void exitUnary2(SysYParserParser::Unary2Context *ctx) = 0;

  virtual void enterUnary3(SysYParserParser::Unary3Context *ctx) = 0;
  virtual void exitUnary3(SysYParserParser::Unary3Context *ctx) = 0;

  virtual void enterUnaryOp(SysYParserParser::UnaryOpContext *ctx) = 0;
  virtual void exitUnaryOp(SysYParserParser::UnaryOpContext *ctx) = 0;

  virtual void enterFuncRParams(SysYParserParser::FuncRParamsContext *ctx) = 0;
  virtual void exitFuncRParams(SysYParserParser::FuncRParamsContext *ctx) = 0;

  virtual void enterExpAsRParam(SysYParserParser::ExpAsRParamContext *ctx) = 0;
  virtual void exitExpAsRParam(SysYParserParser::ExpAsRParamContext *ctx) = 0;

  virtual void enterStringAsRParam(SysYParserParser::StringAsRParamContext *ctx) = 0;
  virtual void exitStringAsRParam(SysYParserParser::StringAsRParamContext *ctx) = 0;

  virtual void enterMul2(SysYParserParser::Mul2Context *ctx) = 0;
  virtual void exitMul2(SysYParserParser::Mul2Context *ctx) = 0;

  virtual void enterMul1(SysYParserParser::Mul1Context *ctx) = 0;
  virtual void exitMul1(SysYParserParser::Mul1Context *ctx) = 0;

  virtual void enterAdd2(SysYParserParser::Add2Context *ctx) = 0;
  virtual void exitAdd2(SysYParserParser::Add2Context *ctx) = 0;

  virtual void enterAdd1(SysYParserParser::Add1Context *ctx) = 0;
  virtual void exitAdd1(SysYParserParser::Add1Context *ctx) = 0;

  virtual void enterRel2(SysYParserParser::Rel2Context *ctx) = 0;
  virtual void exitRel2(SysYParserParser::Rel2Context *ctx) = 0;

  virtual void enterRel1(SysYParserParser::Rel1Context *ctx) = 0;
  virtual void exitRel1(SysYParserParser::Rel1Context *ctx) = 0;

  virtual void enterEq1(SysYParserParser::Eq1Context *ctx) = 0;
  virtual void exitEq1(SysYParserParser::Eq1Context *ctx) = 0;

  virtual void enterEq2(SysYParserParser::Eq2Context *ctx) = 0;
  virtual void exitEq2(SysYParserParser::Eq2Context *ctx) = 0;

  virtual void enterLAnd2(SysYParserParser::LAnd2Context *ctx) = 0;
  virtual void exitLAnd2(SysYParserParser::LAnd2Context *ctx) = 0;

  virtual void enterLAnd1(SysYParserParser::LAnd1Context *ctx) = 0;
  virtual void exitLAnd1(SysYParserParser::LAnd1Context *ctx) = 0;

  virtual void enterLOr1(SysYParserParser::LOr1Context *ctx) = 0;
  virtual void exitLOr1(SysYParserParser::LOr1Context *ctx) = 0;

  virtual void enterLOr2(SysYParserParser::LOr2Context *ctx) = 0;
  virtual void exitLOr2(SysYParserParser::LOr2Context *ctx) = 0;

  virtual void enterConstExp(SysYParserParser::ConstExpContext *ctx) = 0;
  virtual void exitConstExp(SysYParserParser::ConstExpContext *ctx) = 0;


};

}  // namespace antlrcpptest
