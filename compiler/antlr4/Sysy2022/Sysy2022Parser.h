
// Generated from Sysy2022Parser.g4 by ANTLR 4.7.2

#pragma once


#include "antlr4-runtime.h"




class  Sysy2022Parser : public antlr4::Parser {
public:
  enum {
    INT = 1, FLOAT = 2, VOID = 3, CONST = 4, RETURN = 5, IF = 6, ELSE = 7, 
    FOR = 8, WHILE = 9, DO = 10, BREAK = 11, CONTINUE = 12, LP = 13, RP = 14, 
    LB = 15, RB = 16, LC = 17, RC = 18, COMMA = 19, SEMICOLON = 20, QUESTION = 21, 
    COLON = 22, MINUS = 23, NOT = 24, TILDE = 25, ASSIGN = 26, ADD = 27, 
    MUL = 28, DIV = 29, MOD = 30, AND = 31, OR = 32, EQ = 33, NE = 34, LT = 35, 
    LE = 36, GT = 37, GE = 38, ID = 39, INT_LIT = 40, FLOAT_LIT = 41, LEX_ERR = 42, 
    NUMS = 43, ERROR = 44, Newline = 45, BlockComment = 46, LineComment = 47, 
    Voidplase = 48
  };

  enum {
    RuleCompunit = 0, RuleCompunitplus = 1, RuleDecl = 2, RuleConstdecl = 3, 
    RuleBtype = 4, RuleConstdef = 5, RuleConstinitval = 6, RuleVardecl = 7, 
    RuleVardef = 8, RuleInitval = 9, RuleFuncdef = 10, RuleFunctype = 11, 
    RuleFuncfparams = 12, RuleFuncfparam = 13, RuleBlock = 14, RuleBlockitem = 15, 
    RuleStmt = 16, RuleExp = 17, RuleCond = 18, RuleLval = 19, RulePrimaryexp = 20, 
    RuleNumber = 21, RuleUnaryexp = 22, RuleUnaryop = 23, RuleFuncrparams = 24, 
    RuleMulexp = 25, RuleAddexp = 26, RuleRelexp = 27, RuleEqexp = 28, RuleLandexp = 29, 
    RuleLorexp = 30, RuleConstexp = 31
  };

  Sysy2022Parser(antlr4::TokenStream *input);
  ~Sysy2022Parser();

  virtual std::string getGrammarFileName() const override;
  virtual const antlr4::atn::ATN& getATN() const override { return _atn; };
  virtual const std::vector<std::string>& getTokenNames() const override { return _tokenNames; }; // deprecated: use vocabulary instead.
  virtual const std::vector<std::string>& getRuleNames() const override;
  virtual antlr4::dfa::Vocabulary& getVocabulary() const override;


  class CompunitContext;
  class CompunitplusContext;
  class DeclContext;
  class ConstdeclContext;
  class BtypeContext;
  class ConstdefContext;
  class ConstinitvalContext;
  class VardeclContext;
  class VardefContext;
  class InitvalContext;
  class FuncdefContext;
  class FunctypeContext;
  class FuncfparamsContext;
  class FuncfparamContext;
  class BlockContext;
  class BlockitemContext;
  class StmtContext;
  class ExpContext;
  class CondContext;
  class LvalContext;
  class PrimaryexpContext;
  class NumberContext;
  class UnaryexpContext;
  class UnaryopContext;
  class FuncrparamsContext;
  class MulexpContext;
  class AddexpContext;
  class RelexpContext;
  class EqexpContext;
  class LandexpContext;
  class LorexpContext;
  class ConstexpContext; 

  class  CompunitContext : public antlr4::ParserRuleContext {
  public:
    CompunitContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    CompunitplusContext *compunitplus();
    antlr4::tree::TerminalNode *EOF();
    DeclContext *decl();
    FuncdefContext *funcdef();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  CompunitContext* compunit();

  class  CompunitplusContext : public antlr4::ParserRuleContext {
  public:
    CompunitplusContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    CompunitplusContext *compunitplus();
    DeclContext *decl();
    FuncdefContext *funcdef();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  CompunitplusContext* compunitplus();

  class  DeclContext : public antlr4::ParserRuleContext {
  public:
    DeclContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    ConstdeclContext *constdecl();
    VardeclContext *vardecl();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  DeclContext* decl();

  class  ConstdeclContext : public antlr4::ParserRuleContext {
  public:
    ConstdeclContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    antlr4::tree::TerminalNode *CONST();
    BtypeContext *btype();
    std::vector<ConstdefContext *> constdef();
    ConstdefContext* constdef(size_t i);
    antlr4::tree::TerminalNode *SEMICOLON();
    std::vector<antlr4::tree::TerminalNode *> COMMA();
    antlr4::tree::TerminalNode* COMMA(size_t i);

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  ConstdeclContext* constdecl();

  class  BtypeContext : public antlr4::ParserRuleContext {
  public:
    BtypeContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    antlr4::tree::TerminalNode *INT();
    antlr4::tree::TerminalNode *FLOAT();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  BtypeContext* btype();

  class  ConstdefContext : public antlr4::ParserRuleContext {
  public:
    ConstdefContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    antlr4::tree::TerminalNode *ID();
    antlr4::tree::TerminalNode *ASSIGN();
    ConstinitvalContext *constinitval();
    std::vector<antlr4::tree::TerminalNode *> LB();
    antlr4::tree::TerminalNode* LB(size_t i);
    std::vector<ConstexpContext *> constexp();
    ConstexpContext* constexp(size_t i);
    std::vector<antlr4::tree::TerminalNode *> RB();
    antlr4::tree::TerminalNode* RB(size_t i);

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  ConstdefContext* constdef();

  class  ConstinitvalContext : public antlr4::ParserRuleContext {
  public:
    ConstinitvalContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    ConstexpContext *constexp();
    antlr4::tree::TerminalNode *LC();
    antlr4::tree::TerminalNode *RC();
    std::vector<ConstinitvalContext *> constinitval();
    ConstinitvalContext* constinitval(size_t i);
    std::vector<antlr4::tree::TerminalNode *> COMMA();
    antlr4::tree::TerminalNode* COMMA(size_t i);

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  ConstinitvalContext* constinitval();

  class  VardeclContext : public antlr4::ParserRuleContext {
  public:
    VardeclContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    BtypeContext *btype();
    std::vector<VardefContext *> vardef();
    VardefContext* vardef(size_t i);
    antlr4::tree::TerminalNode *SEMICOLON();
    std::vector<antlr4::tree::TerminalNode *> COMMA();
    antlr4::tree::TerminalNode* COMMA(size_t i);

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  VardeclContext* vardecl();

  class  VardefContext : public antlr4::ParserRuleContext {
  public:
    VardefContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    antlr4::tree::TerminalNode *ID();
    std::vector<antlr4::tree::TerminalNode *> LB();
    antlr4::tree::TerminalNode* LB(size_t i);
    std::vector<ConstexpContext *> constexp();
    ConstexpContext* constexp(size_t i);
    std::vector<antlr4::tree::TerminalNode *> RB();
    antlr4::tree::TerminalNode* RB(size_t i);
    antlr4::tree::TerminalNode *ASSIGN();
    InitvalContext *initval();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  VardefContext* vardef();

  class  InitvalContext : public antlr4::ParserRuleContext {
  public:
    InitvalContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    ExpContext *exp();
    antlr4::tree::TerminalNode *LC();
    antlr4::tree::TerminalNode *RC();
    std::vector<InitvalContext *> initval();
    InitvalContext* initval(size_t i);
    std::vector<antlr4::tree::TerminalNode *> COMMA();
    antlr4::tree::TerminalNode* COMMA(size_t i);

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  InitvalContext* initval();

  class  FuncdefContext : public antlr4::ParserRuleContext {
  public:
    FuncdefContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    FunctypeContext *functype();
    antlr4::tree::TerminalNode *ID();
    antlr4::tree::TerminalNode *LP();
    antlr4::tree::TerminalNode *RP();
    BlockContext *block();
    FuncfparamsContext *funcfparams();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  FuncdefContext* funcdef();

  class  FunctypeContext : public antlr4::ParserRuleContext {
  public:
    FunctypeContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    antlr4::tree::TerminalNode *VOID();
    antlr4::tree::TerminalNode *INT();
    antlr4::tree::TerminalNode *FLOAT();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  FunctypeContext* functype();

  class  FuncfparamsContext : public antlr4::ParserRuleContext {
  public:
    FuncfparamsContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    std::vector<FuncfparamContext *> funcfparam();
    FuncfparamContext* funcfparam(size_t i);
    std::vector<antlr4::tree::TerminalNode *> COMMA();
    antlr4::tree::TerminalNode* COMMA(size_t i);

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  FuncfparamsContext* funcfparams();

  class  FuncfparamContext : public antlr4::ParserRuleContext {
  public:
    FuncfparamContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    BtypeContext *btype();
    antlr4::tree::TerminalNode *ID();
    std::vector<antlr4::tree::TerminalNode *> LB();
    antlr4::tree::TerminalNode* LB(size_t i);
    std::vector<antlr4::tree::TerminalNode *> RB();
    antlr4::tree::TerminalNode* RB(size_t i);
    std::vector<ExpContext *> exp();
    ExpContext* exp(size_t i);

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  FuncfparamContext* funcfparam();

  class  BlockContext : public antlr4::ParserRuleContext {
  public:
    BlockContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    antlr4::tree::TerminalNode *LC();
    antlr4::tree::TerminalNode *RC();
    std::vector<BlockitemContext *> blockitem();
    BlockitemContext* blockitem(size_t i);

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  BlockContext* block();

  class  BlockitemContext : public antlr4::ParserRuleContext {
  public:
    BlockitemContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    DeclContext *decl();
    StmtContext *stmt();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  BlockitemContext* blockitem();

  class  StmtContext : public antlr4::ParserRuleContext {
  public:
    StmtContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    LvalContext *lval();
    antlr4::tree::TerminalNode *ASSIGN();
    ExpContext *exp();
    antlr4::tree::TerminalNode *SEMICOLON();
    BlockContext *block();
    antlr4::tree::TerminalNode *IF();
    antlr4::tree::TerminalNode *LP();
    CondContext *cond();
    antlr4::tree::TerminalNode *RP();
    std::vector<StmtContext *> stmt();
    StmtContext* stmt(size_t i);
    antlr4::tree::TerminalNode *ELSE();
    antlr4::tree::TerminalNode *WHILE();
    antlr4::tree::TerminalNode *BREAK();
    antlr4::tree::TerminalNode *CONTINUE();
    antlr4::tree::TerminalNode *RETURN();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  StmtContext* stmt();

  class  ExpContext : public antlr4::ParserRuleContext {
  public:
    ExpContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    AddexpContext *addexp();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  ExpContext* exp();

  class  CondContext : public antlr4::ParserRuleContext {
  public:
    CondContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    LorexpContext *lorexp();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  CondContext* cond();

  class  LvalContext : public antlr4::ParserRuleContext {
  public:
    LvalContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    antlr4::tree::TerminalNode *ID();
    std::vector<antlr4::tree::TerminalNode *> LB();
    antlr4::tree::TerminalNode* LB(size_t i);
    std::vector<ExpContext *> exp();
    ExpContext* exp(size_t i);
    std::vector<antlr4::tree::TerminalNode *> RB();
    antlr4::tree::TerminalNode* RB(size_t i);

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  LvalContext* lval();

  class  PrimaryexpContext : public antlr4::ParserRuleContext {
  public:
    PrimaryexpContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    antlr4::tree::TerminalNode *LP();
    ExpContext *exp();
    antlr4::tree::TerminalNode *RP();
    LvalContext *lval();
    NumberContext *number();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  PrimaryexpContext* primaryexp();

  class  NumberContext : public antlr4::ParserRuleContext {
  public:
    NumberContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    antlr4::tree::TerminalNode *INT_LIT();
    antlr4::tree::TerminalNode *FLOAT_LIT();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  NumberContext* number();

  class  UnaryexpContext : public antlr4::ParserRuleContext {
  public:
    UnaryexpContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    PrimaryexpContext *primaryexp();
    antlr4::tree::TerminalNode *ID();
    antlr4::tree::TerminalNode *LP();
    antlr4::tree::TerminalNode *RP();
    FuncrparamsContext *funcrparams();
    UnaryopContext *unaryop();
    UnaryexpContext *unaryexp();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  UnaryexpContext* unaryexp();

  class  UnaryopContext : public antlr4::ParserRuleContext {
  public:
    UnaryopContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    antlr4::tree::TerminalNode *ADD();
    antlr4::tree::TerminalNode *MINUS();
    antlr4::tree::TerminalNode *NOT();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  UnaryopContext* unaryop();

  class  FuncrparamsContext : public antlr4::ParserRuleContext {
  public:
    FuncrparamsContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    std::vector<ExpContext *> exp();
    ExpContext* exp(size_t i);
    std::vector<antlr4::tree::TerminalNode *> COMMA();
    antlr4::tree::TerminalNode* COMMA(size_t i);

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  FuncrparamsContext* funcrparams();

  class  MulexpContext : public antlr4::ParserRuleContext {
  public:
    MulexpContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    UnaryexpContext *unaryexp();
    MulexpContext *mulexp();
    antlr4::tree::TerminalNode *MUL();
    antlr4::tree::TerminalNode *DIV();
    antlr4::tree::TerminalNode *MOD();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  MulexpContext* mulexp();
  MulexpContext* mulexp(int precedence);
  class  AddexpContext : public antlr4::ParserRuleContext {
  public:
    AddexpContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    MulexpContext *mulexp();
    AddexpContext *addexp();
    antlr4::tree::TerminalNode *ADD();
    antlr4::tree::TerminalNode *MINUS();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  AddexpContext* addexp();
  AddexpContext* addexp(int precedence);
  class  RelexpContext : public antlr4::ParserRuleContext {
  public:
    RelexpContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    AddexpContext *addexp();
    RelexpContext *relexp();
    antlr4::tree::TerminalNode *LT();
    antlr4::tree::TerminalNode *GT();
    antlr4::tree::TerminalNode *LE();
    antlr4::tree::TerminalNode *GE();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  RelexpContext* relexp();
  RelexpContext* relexp(int precedence);
  class  EqexpContext : public antlr4::ParserRuleContext {
  public:
    EqexpContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    RelexpContext *relexp();
    EqexpContext *eqexp();
    antlr4::tree::TerminalNode *EQ();
    antlr4::tree::TerminalNode *NE();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  EqexpContext* eqexp();
  EqexpContext* eqexp(int precedence);
  class  LandexpContext : public antlr4::ParserRuleContext {
  public:
    LandexpContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    EqexpContext *eqexp();
    LandexpContext *landexp();
    antlr4::tree::TerminalNode *AND();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  LandexpContext* landexp();
  LandexpContext* landexp(int precedence);
  class  LorexpContext : public antlr4::ParserRuleContext {
  public:
    LorexpContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    LandexpContext *landexp();
    LorexpContext *lorexp();
    antlr4::tree::TerminalNode *OR();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  LorexpContext* lorexp();
  LorexpContext* lorexp(int precedence);
  class  ConstexpContext : public antlr4::ParserRuleContext {
  public:
    ConstexpContext(antlr4::ParserRuleContext *parent, size_t invokingState);
    virtual size_t getRuleIndex() const override;
    AddexpContext *addexp();

    virtual antlrcpp::Any accept(antlr4::tree::ParseTreeVisitor *visitor) override;
   
  };

  ConstexpContext* constexp();


  virtual bool sempred(antlr4::RuleContext *_localctx, size_t ruleIndex, size_t predicateIndex) override;
  bool mulexpSempred(MulexpContext *_localctx, size_t predicateIndex);
  bool addexpSempred(AddexpContext *_localctx, size_t predicateIndex);
  bool relexpSempred(RelexpContext *_localctx, size_t predicateIndex);
  bool eqexpSempred(EqexpContext *_localctx, size_t predicateIndex);
  bool landexpSempred(LandexpContext *_localctx, size_t predicateIndex);
  bool lorexpSempred(LorexpContext *_localctx, size_t predicateIndex);

private:
  static std::vector<antlr4::dfa::DFA> _decisionToDFA;
  static antlr4::atn::PredictionContextCache _sharedContextCache;
  static std::vector<std::string> _ruleNames;
  static std::vector<std::string> _tokenNames;

  static std::vector<std::string> _literalNames;
  static std::vector<std::string> _symbolicNames;
  static antlr4::dfa::Vocabulary _vocabulary;
  static antlr4::atn::ATN _atn;
  static std::vector<uint16_t> _serializedATN;


  struct Initializer {
    Initializer();
  };
  static Initializer _init;
};

