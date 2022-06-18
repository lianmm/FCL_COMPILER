
// Generated from SysYParser.g4 by ANTLR 4.9.3

#pragma once


#include "antlr4-runtime.h"
#include "SysYParserListener.h"


namespace antlrcpptest {

/**
 * This class provides an empty implementation of SysYParserListener,
 * which can be extended to create a listener which only needs to handle a subset
 * of the available methods.
 */
class  SysYParserBaseListener : public SysYParserListener {
public:

  virtual void enterCompUnit(SysYParserParser::CompUnitContext * /*ctx*/) override { }
  virtual void exitCompUnit(SysYParserParser::CompUnitContext * /*ctx*/) override { }

  virtual void enterDecl(SysYParserParser::DeclContext * /*ctx*/) override { }
  virtual void exitDecl(SysYParserParser::DeclContext * /*ctx*/) override { }

  virtual void enterConstDecl(SysYParserParser::ConstDeclContext * /*ctx*/) override { }
  virtual void exitConstDecl(SysYParserParser::ConstDeclContext * /*ctx*/) override { }

  virtual void enterBType(SysYParserParser::BTypeContext * /*ctx*/) override { }
  virtual void exitBType(SysYParserParser::BTypeContext * /*ctx*/) override { }

  virtual void enterConstDef(SysYParserParser::ConstDefContext * /*ctx*/) override { }
  virtual void exitConstDef(SysYParserParser::ConstDefContext * /*ctx*/) override { }

  virtual void enterScalarConstInitVal(SysYParserParser::ScalarConstInitValContext * /*ctx*/) override { }
  virtual void exitScalarConstInitVal(SysYParserParser::ScalarConstInitValContext * /*ctx*/) override { }

  virtual void enterListConstInitVal(SysYParserParser::ListConstInitValContext * /*ctx*/) override { }
  virtual void exitListConstInitVal(SysYParserParser::ListConstInitValContext * /*ctx*/) override { }

  virtual void enterVarDecl(SysYParserParser::VarDeclContext * /*ctx*/) override { }
  virtual void exitVarDecl(SysYParserParser::VarDeclContext * /*ctx*/) override { }

  virtual void enterUninitVarDef(SysYParserParser::UninitVarDefContext * /*ctx*/) override { }
  virtual void exitUninitVarDef(SysYParserParser::UninitVarDefContext * /*ctx*/) override { }

  virtual void enterInitVarDef(SysYParserParser::InitVarDefContext * /*ctx*/) override { }
  virtual void exitInitVarDef(SysYParserParser::InitVarDefContext * /*ctx*/) override { }

  virtual void enterScalarInitVal(SysYParserParser::ScalarInitValContext * /*ctx*/) override { }
  virtual void exitScalarInitVal(SysYParserParser::ScalarInitValContext * /*ctx*/) override { }

  virtual void enterListInitval(SysYParserParser::ListInitvalContext * /*ctx*/) override { }
  virtual void exitListInitval(SysYParserParser::ListInitvalContext * /*ctx*/) override { }

  virtual void enterFuncDef(SysYParserParser::FuncDefContext * /*ctx*/) override { }
  virtual void exitFuncDef(SysYParserParser::FuncDefContext * /*ctx*/) override { }

  virtual void enterFuncType(SysYParserParser::FuncTypeContext * /*ctx*/) override { }
  virtual void exitFuncType(SysYParserParser::FuncTypeContext * /*ctx*/) override { }

  virtual void enterFuncFParams(SysYParserParser::FuncFParamsContext * /*ctx*/) override { }
  virtual void exitFuncFParams(SysYParserParser::FuncFParamsContext * /*ctx*/) override { }

  virtual void enterFuncFParam(SysYParserParser::FuncFParamContext * /*ctx*/) override { }
  virtual void exitFuncFParam(SysYParserParser::FuncFParamContext * /*ctx*/) override { }

  virtual void enterBlock(SysYParserParser::BlockContext * /*ctx*/) override { }
  virtual void exitBlock(SysYParserParser::BlockContext * /*ctx*/) override { }

  virtual void enterBlockItem(SysYParserParser::BlockItemContext * /*ctx*/) override { }
  virtual void exitBlockItem(SysYParserParser::BlockItemContext * /*ctx*/) override { }

  virtual void enterAssignment(SysYParserParser::AssignmentContext * /*ctx*/) override { }
  virtual void exitAssignment(SysYParserParser::AssignmentContext * /*ctx*/) override { }

  virtual void enterExpStmt(SysYParserParser::ExpStmtContext * /*ctx*/) override { }
  virtual void exitExpStmt(SysYParserParser::ExpStmtContext * /*ctx*/) override { }

  virtual void enterBlockStmt(SysYParserParser::BlockStmtContext * /*ctx*/) override { }
  virtual void exitBlockStmt(SysYParserParser::BlockStmtContext * /*ctx*/) override { }

  virtual void enterIfStmt1(SysYParserParser::IfStmt1Context * /*ctx*/) override { }
  virtual void exitIfStmt1(SysYParserParser::IfStmt1Context * /*ctx*/) override { }

  virtual void enterIfStmt2(SysYParserParser::IfStmt2Context * /*ctx*/) override { }
  virtual void exitIfStmt2(SysYParserParser::IfStmt2Context * /*ctx*/) override { }

  virtual void enterWhileStmt(SysYParserParser::WhileStmtContext * /*ctx*/) override { }
  virtual void exitWhileStmt(SysYParserParser::WhileStmtContext * /*ctx*/) override { }

  virtual void enterBreakStmt(SysYParserParser::BreakStmtContext * /*ctx*/) override { }
  virtual void exitBreakStmt(SysYParserParser::BreakStmtContext * /*ctx*/) override { }

  virtual void enterContinueStmt(SysYParserParser::ContinueStmtContext * /*ctx*/) override { }
  virtual void exitContinueStmt(SysYParserParser::ContinueStmtContext * /*ctx*/) override { }

  virtual void enterReturnStmt(SysYParserParser::ReturnStmtContext * /*ctx*/) override { }
  virtual void exitReturnStmt(SysYParserParser::ReturnStmtContext * /*ctx*/) override { }

  virtual void enterExp(SysYParserParser::ExpContext * /*ctx*/) override { }
  virtual void exitExp(SysYParserParser::ExpContext * /*ctx*/) override { }

  virtual void enterCond(SysYParserParser::CondContext * /*ctx*/) override { }
  virtual void exitCond(SysYParserParser::CondContext * /*ctx*/) override { }

  virtual void enterLVal(SysYParserParser::LValContext * /*ctx*/) override { }
  virtual void exitLVal(SysYParserParser::LValContext * /*ctx*/) override { }

  virtual void enterPrimaryExp1(SysYParserParser::PrimaryExp1Context * /*ctx*/) override { }
  virtual void exitPrimaryExp1(SysYParserParser::PrimaryExp1Context * /*ctx*/) override { }

  virtual void enterPrimaryExp2(SysYParserParser::PrimaryExp2Context * /*ctx*/) override { }
  virtual void exitPrimaryExp2(SysYParserParser::PrimaryExp2Context * /*ctx*/) override { }

  virtual void enterPrimaryExp3(SysYParserParser::PrimaryExp3Context * /*ctx*/) override { }
  virtual void exitPrimaryExp3(SysYParserParser::PrimaryExp3Context * /*ctx*/) override { }

  virtual void enterNumber(SysYParserParser::NumberContext * /*ctx*/) override { }
  virtual void exitNumber(SysYParserParser::NumberContext * /*ctx*/) override { }

  virtual void enterUnary1(SysYParserParser::Unary1Context * /*ctx*/) override { }
  virtual void exitUnary1(SysYParserParser::Unary1Context * /*ctx*/) override { }

  virtual void enterUnary2(SysYParserParser::Unary2Context * /*ctx*/) override { }
  virtual void exitUnary2(SysYParserParser::Unary2Context * /*ctx*/) override { }

  virtual void enterUnary3(SysYParserParser::Unary3Context * /*ctx*/) override { }
  virtual void exitUnary3(SysYParserParser::Unary3Context * /*ctx*/) override { }

  virtual void enterUnaryOp(SysYParserParser::UnaryOpContext * /*ctx*/) override { }
  virtual void exitUnaryOp(SysYParserParser::UnaryOpContext * /*ctx*/) override { }

  virtual void enterFuncRParams(SysYParserParser::FuncRParamsContext * /*ctx*/) override { }
  virtual void exitFuncRParams(SysYParserParser::FuncRParamsContext * /*ctx*/) override { }

  virtual void enterExpAsRParam(SysYParserParser::ExpAsRParamContext * /*ctx*/) override { }
  virtual void exitExpAsRParam(SysYParserParser::ExpAsRParamContext * /*ctx*/) override { }

  virtual void enterStringAsRParam(SysYParserParser::StringAsRParamContext * /*ctx*/) override { }
  virtual void exitStringAsRParam(SysYParserParser::StringAsRParamContext * /*ctx*/) override { }

  virtual void enterMul2(SysYParserParser::Mul2Context * /*ctx*/) override { }
  virtual void exitMul2(SysYParserParser::Mul2Context * /*ctx*/) override { }

  virtual void enterMul1(SysYParserParser::Mul1Context * /*ctx*/) override { }
  virtual void exitMul1(SysYParserParser::Mul1Context * /*ctx*/) override { }

  virtual void enterAdd2(SysYParserParser::Add2Context * /*ctx*/) override { }
  virtual void exitAdd2(SysYParserParser::Add2Context * /*ctx*/) override { }

  virtual void enterAdd1(SysYParserParser::Add1Context * /*ctx*/) override { }
  virtual void exitAdd1(SysYParserParser::Add1Context * /*ctx*/) override { }

  virtual void enterRel2(SysYParserParser::Rel2Context * /*ctx*/) override { }
  virtual void exitRel2(SysYParserParser::Rel2Context * /*ctx*/) override { }

  virtual void enterRel1(SysYParserParser::Rel1Context * /*ctx*/) override { }
  virtual void exitRel1(SysYParserParser::Rel1Context * /*ctx*/) override { }

  virtual void enterEq1(SysYParserParser::Eq1Context * /*ctx*/) override { }
  virtual void exitEq1(SysYParserParser::Eq1Context * /*ctx*/) override { }

  virtual void enterEq2(SysYParserParser::Eq2Context * /*ctx*/) override { }
  virtual void exitEq2(SysYParserParser::Eq2Context * /*ctx*/) override { }

  virtual void enterLAnd2(SysYParserParser::LAnd2Context * /*ctx*/) override { }
  virtual void exitLAnd2(SysYParserParser::LAnd2Context * /*ctx*/) override { }

  virtual void enterLAnd1(SysYParserParser::LAnd1Context * /*ctx*/) override { }
  virtual void exitLAnd1(SysYParserParser::LAnd1Context * /*ctx*/) override { }

  virtual void enterLOr1(SysYParserParser::LOr1Context * /*ctx*/) override { }
  virtual void exitLOr1(SysYParserParser::LOr1Context * /*ctx*/) override { }

  virtual void enterLOr2(SysYParserParser::LOr2Context * /*ctx*/) override { }
  virtual void exitLOr2(SysYParserParser::LOr2Context * /*ctx*/) override { }

  virtual void enterConstExp(SysYParserParser::ConstExpContext * /*ctx*/) override { }
  virtual void exitConstExp(SysYParserParser::ConstExpContext * /*ctx*/) override { }


  virtual void enterEveryRule(antlr4::ParserRuleContext * /*ctx*/) override { }
  virtual void exitEveryRule(antlr4::ParserRuleContext * /*ctx*/) override { }
  virtual void visitTerminal(antlr4::tree::TerminalNode * /*node*/) override { }
  virtual void visitErrorNode(antlr4::tree::ErrorNode * /*node*/) override { }

};

}  // namespace antlrcpptest
