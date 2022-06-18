
// Generated from Sysy2022Parser.g4 by ANTLR 4.7.2


#include "Sysy2022ParserVisitor.h"

#include "Sysy2022Parser.h"


using namespace antlrcpp;
using namespace antlr4;

Sysy2022Parser::Sysy2022Parser(TokenStream *input) : Parser(input) {
  _interpreter = new atn::ParserATNSimulator(this, _atn, _decisionToDFA, _sharedContextCache);
}

Sysy2022Parser::~Sysy2022Parser() {
  delete _interpreter;
}

std::string Sysy2022Parser::getGrammarFileName() const {
  return "Sysy2022Parser.g4";
}

const std::vector<std::string>& Sysy2022Parser::getRuleNames() const {
  return _ruleNames;
}

dfa::Vocabulary& Sysy2022Parser::getVocabulary() const {
  return _vocabulary;
}


//----------------- CompunitContext ------------------------------------------------------------------

Sysy2022Parser::CompunitContext::CompunitContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::CompunitplusContext* Sysy2022Parser::CompunitContext::compunitplus() {
  return getRuleContext<Sysy2022Parser::CompunitplusContext>(0);
}

tree::TerminalNode* Sysy2022Parser::CompunitContext::EOF() {
  return getToken(Sysy2022Parser::EOF, 0);
}

Sysy2022Parser::DeclContext* Sysy2022Parser::CompunitContext::decl() {
  return getRuleContext<Sysy2022Parser::DeclContext>(0);
}

Sysy2022Parser::FuncdefContext* Sysy2022Parser::CompunitContext::funcdef() {
  return getRuleContext<Sysy2022Parser::FuncdefContext>(0);
}


size_t Sysy2022Parser::CompunitContext::getRuleIndex() const {
  return Sysy2022Parser::RuleCompunit;
}

antlrcpp::Any Sysy2022Parser::CompunitContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitCompunit(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::CompunitContext* Sysy2022Parser::compunit() {
  CompunitContext *_localctx = _tracker.createInstance<CompunitContext>(_ctx, getState());
  enterRule(_localctx, 0, Sysy2022Parser::RuleCompunit);

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    setState(77);
    _errHandler->sync(this);
    switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 2, _ctx)) {
    case 1: {
      enterOuterAlt(_localctx, 1);
      setState(66);
      _errHandler->sync(this);
      switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 0, _ctx)) {
      case 1: {
        setState(64);
        decl();
        break;
      }

      case 2: {
        setState(65);
        funcdef();
        break;
      }

      }
      setState(68);
      compunitplus();
      setState(69);
      match(Sysy2022Parser::EOF);
      break;
    }

    case 2: {
      enterOuterAlt(_localctx, 2);
      setState(73);
      _errHandler->sync(this);
      switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 1, _ctx)) {
      case 1: {
        setState(71);
        decl();
        break;
      }

      case 2: {
        setState(72);
        funcdef();
        break;
      }

      }
      setState(75);
      match(Sysy2022Parser::EOF);
      break;
    }

    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- CompunitplusContext ------------------------------------------------------------------

Sysy2022Parser::CompunitplusContext::CompunitplusContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::CompunitplusContext* Sysy2022Parser::CompunitplusContext::compunitplus() {
  return getRuleContext<Sysy2022Parser::CompunitplusContext>(0);
}

Sysy2022Parser::DeclContext* Sysy2022Parser::CompunitplusContext::decl() {
  return getRuleContext<Sysy2022Parser::DeclContext>(0);
}

Sysy2022Parser::FuncdefContext* Sysy2022Parser::CompunitplusContext::funcdef() {
  return getRuleContext<Sysy2022Parser::FuncdefContext>(0);
}


size_t Sysy2022Parser::CompunitplusContext::getRuleIndex() const {
  return Sysy2022Parser::RuleCompunitplus;
}

antlrcpp::Any Sysy2022Parser::CompunitplusContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitCompunitplus(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::CompunitplusContext* Sysy2022Parser::compunitplus() {
  CompunitplusContext *_localctx = _tracker.createInstance<CompunitplusContext>(_ctx, getState());
  enterRule(_localctx, 2, Sysy2022Parser::RuleCompunitplus);

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    setState(86);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy2022Parser::INT:
      case Sysy2022Parser::FLOAT:
      case Sysy2022Parser::VOID:
      case Sysy2022Parser::CONST: {
        enterOuterAlt(_localctx, 1);
        setState(81);
        _errHandler->sync(this);
        switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 3, _ctx)) {
        case 1: {
          setState(79);
          decl();
          break;
        }

        case 2: {
          setState(80);
          funcdef();
          break;
        }

        }
        setState(83);
        compunitplus();
        break;
      }

      case Sysy2022Parser::EOF: {
        enterOuterAlt(_localctx, 2);

        break;
      }

    default:
      throw NoViableAltException(this);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- DeclContext ------------------------------------------------------------------

Sysy2022Parser::DeclContext::DeclContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::ConstdeclContext* Sysy2022Parser::DeclContext::constdecl() {
  return getRuleContext<Sysy2022Parser::ConstdeclContext>(0);
}

Sysy2022Parser::VardeclContext* Sysy2022Parser::DeclContext::vardecl() {
  return getRuleContext<Sysy2022Parser::VardeclContext>(0);
}


size_t Sysy2022Parser::DeclContext::getRuleIndex() const {
  return Sysy2022Parser::RuleDecl;
}

antlrcpp::Any Sysy2022Parser::DeclContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitDecl(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::DeclContext* Sysy2022Parser::decl() {
  DeclContext *_localctx = _tracker.createInstance<DeclContext>(_ctx, getState());
  enterRule(_localctx, 4, Sysy2022Parser::RuleDecl);

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    setState(90);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy2022Parser::CONST: {
        enterOuterAlt(_localctx, 1);
        setState(88);
        constdecl();
        break;
      }

      case Sysy2022Parser::INT:
      case Sysy2022Parser::FLOAT: {
        enterOuterAlt(_localctx, 2);
        setState(89);
        vardecl();
        break;
      }

    default:
      throw NoViableAltException(this);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- ConstdeclContext ------------------------------------------------------------------

Sysy2022Parser::ConstdeclContext::ConstdeclContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy2022Parser::ConstdeclContext::CONST() {
  return getToken(Sysy2022Parser::CONST, 0);
}

Sysy2022Parser::BtypeContext* Sysy2022Parser::ConstdeclContext::btype() {
  return getRuleContext<Sysy2022Parser::BtypeContext>(0);
}

std::vector<Sysy2022Parser::ConstdefContext *> Sysy2022Parser::ConstdeclContext::constdef() {
  return getRuleContexts<Sysy2022Parser::ConstdefContext>();
}

Sysy2022Parser::ConstdefContext* Sysy2022Parser::ConstdeclContext::constdef(size_t i) {
  return getRuleContext<Sysy2022Parser::ConstdefContext>(i);
}

tree::TerminalNode* Sysy2022Parser::ConstdeclContext::SEMICOLON() {
  return getToken(Sysy2022Parser::SEMICOLON, 0);
}

std::vector<tree::TerminalNode *> Sysy2022Parser::ConstdeclContext::COMMA() {
  return getTokens(Sysy2022Parser::COMMA);
}

tree::TerminalNode* Sysy2022Parser::ConstdeclContext::COMMA(size_t i) {
  return getToken(Sysy2022Parser::COMMA, i);
}


size_t Sysy2022Parser::ConstdeclContext::getRuleIndex() const {
  return Sysy2022Parser::RuleConstdecl;
}

antlrcpp::Any Sysy2022Parser::ConstdeclContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitConstdecl(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::ConstdeclContext* Sysy2022Parser::constdecl() {
  ConstdeclContext *_localctx = _tracker.createInstance<ConstdeclContext>(_ctx, getState());
  enterRule(_localctx, 6, Sysy2022Parser::RuleConstdecl);
  size_t _la = 0;

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(92);
    match(Sysy2022Parser::CONST);
    setState(93);
    btype();
    setState(94);
    constdef();
    setState(99);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == Sysy2022Parser::COMMA) {
      setState(95);
      match(Sysy2022Parser::COMMA);
      setState(96);
      constdef();
      setState(101);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(102);
    match(Sysy2022Parser::SEMICOLON);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- BtypeContext ------------------------------------------------------------------

Sysy2022Parser::BtypeContext::BtypeContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy2022Parser::BtypeContext::INT() {
  return getToken(Sysy2022Parser::INT, 0);
}

tree::TerminalNode* Sysy2022Parser::BtypeContext::FLOAT() {
  return getToken(Sysy2022Parser::FLOAT, 0);
}


size_t Sysy2022Parser::BtypeContext::getRuleIndex() const {
  return Sysy2022Parser::RuleBtype;
}

antlrcpp::Any Sysy2022Parser::BtypeContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitBtype(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::BtypeContext* Sysy2022Parser::btype() {
  BtypeContext *_localctx = _tracker.createInstance<BtypeContext>(_ctx, getState());
  enterRule(_localctx, 8, Sysy2022Parser::RuleBtype);
  size_t _la = 0;

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(104);
    _la = _input->LA(1);
    if (!(_la == Sysy2022Parser::INT

    || _la == Sysy2022Parser::FLOAT)) {
    _errHandler->recoverInline(this);
    }
    else {
      _errHandler->reportMatch(this);
      consume();
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- ConstdefContext ------------------------------------------------------------------

Sysy2022Parser::ConstdefContext::ConstdefContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy2022Parser::ConstdefContext::ID() {
  return getToken(Sysy2022Parser::ID, 0);
}

tree::TerminalNode* Sysy2022Parser::ConstdefContext::ASSIGN() {
  return getToken(Sysy2022Parser::ASSIGN, 0);
}

Sysy2022Parser::ConstinitvalContext* Sysy2022Parser::ConstdefContext::constinitval() {
  return getRuleContext<Sysy2022Parser::ConstinitvalContext>(0);
}

std::vector<tree::TerminalNode *> Sysy2022Parser::ConstdefContext::LB() {
  return getTokens(Sysy2022Parser::LB);
}

tree::TerminalNode* Sysy2022Parser::ConstdefContext::LB(size_t i) {
  return getToken(Sysy2022Parser::LB, i);
}

std::vector<Sysy2022Parser::ConstexpContext *> Sysy2022Parser::ConstdefContext::constexp() {
  return getRuleContexts<Sysy2022Parser::ConstexpContext>();
}

Sysy2022Parser::ConstexpContext* Sysy2022Parser::ConstdefContext::constexp(size_t i) {
  return getRuleContext<Sysy2022Parser::ConstexpContext>(i);
}

std::vector<tree::TerminalNode *> Sysy2022Parser::ConstdefContext::RB() {
  return getTokens(Sysy2022Parser::RB);
}

tree::TerminalNode* Sysy2022Parser::ConstdefContext::RB(size_t i) {
  return getToken(Sysy2022Parser::RB, i);
}


size_t Sysy2022Parser::ConstdefContext::getRuleIndex() const {
  return Sysy2022Parser::RuleConstdef;
}

antlrcpp::Any Sysy2022Parser::ConstdefContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitConstdef(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::ConstdefContext* Sysy2022Parser::constdef() {
  ConstdefContext *_localctx = _tracker.createInstance<ConstdefContext>(_ctx, getState());
  enterRule(_localctx, 10, Sysy2022Parser::RuleConstdef);
  size_t _la = 0;

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(106);
    match(Sysy2022Parser::ID);
    setState(113);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == Sysy2022Parser::LB) {
      setState(107);
      match(Sysy2022Parser::LB);
      setState(108);
      constexp();
      setState(109);
      match(Sysy2022Parser::RB);
      setState(115);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(116);
    match(Sysy2022Parser::ASSIGN);
    setState(117);
    constinitval();
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- ConstinitvalContext ------------------------------------------------------------------

Sysy2022Parser::ConstinitvalContext::ConstinitvalContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::ConstexpContext* Sysy2022Parser::ConstinitvalContext::constexp() {
  return getRuleContext<Sysy2022Parser::ConstexpContext>(0);
}

tree::TerminalNode* Sysy2022Parser::ConstinitvalContext::LC() {
  return getToken(Sysy2022Parser::LC, 0);
}

tree::TerminalNode* Sysy2022Parser::ConstinitvalContext::RC() {
  return getToken(Sysy2022Parser::RC, 0);
}

std::vector<Sysy2022Parser::ConstinitvalContext *> Sysy2022Parser::ConstinitvalContext::constinitval() {
  return getRuleContexts<Sysy2022Parser::ConstinitvalContext>();
}

Sysy2022Parser::ConstinitvalContext* Sysy2022Parser::ConstinitvalContext::constinitval(size_t i) {
  return getRuleContext<Sysy2022Parser::ConstinitvalContext>(i);
}

std::vector<tree::TerminalNode *> Sysy2022Parser::ConstinitvalContext::COMMA() {
  return getTokens(Sysy2022Parser::COMMA);
}

tree::TerminalNode* Sysy2022Parser::ConstinitvalContext::COMMA(size_t i) {
  return getToken(Sysy2022Parser::COMMA, i);
}


size_t Sysy2022Parser::ConstinitvalContext::getRuleIndex() const {
  return Sysy2022Parser::RuleConstinitval;
}

antlrcpp::Any Sysy2022Parser::ConstinitvalContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitConstinitval(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::ConstinitvalContext* Sysy2022Parser::constinitval() {
  ConstinitvalContext *_localctx = _tracker.createInstance<ConstinitvalContext>(_ctx, getState());
  enterRule(_localctx, 12, Sysy2022Parser::RuleConstinitval);
  size_t _la = 0;

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    setState(132);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy2022Parser::LP:
      case Sysy2022Parser::MINUS:
      case Sysy2022Parser::NOT:
      case Sysy2022Parser::ADD:
      case Sysy2022Parser::ID:
      case Sysy2022Parser::INT_LIT:
      case Sysy2022Parser::FLOAT_LIT: {
        enterOuterAlt(_localctx, 1);
        setState(119);
        constexp();
        break;
      }

      case Sysy2022Parser::LC: {
        enterOuterAlt(_localctx, 2);
        setState(120);
        match(Sysy2022Parser::LC);
        setState(129);
        _errHandler->sync(this);

        _la = _input->LA(1);
        if ((((_la & ~ 0x3fULL) == 0) &&
          ((1ULL << _la) & ((1ULL << Sysy2022Parser::LP)
          | (1ULL << Sysy2022Parser::LC)
          | (1ULL << Sysy2022Parser::MINUS)
          | (1ULL << Sysy2022Parser::NOT)
          | (1ULL << Sysy2022Parser::ADD)
          | (1ULL << Sysy2022Parser::ID)
          | (1ULL << Sysy2022Parser::INT_LIT)
          | (1ULL << Sysy2022Parser::FLOAT_LIT))) != 0)) {
          setState(121);
          constinitval();
          setState(126);
          _errHandler->sync(this);
          _la = _input->LA(1);
          while (_la == Sysy2022Parser::COMMA) {
            setState(122);
            match(Sysy2022Parser::COMMA);
            setState(123);
            constinitval();
            setState(128);
            _errHandler->sync(this);
            _la = _input->LA(1);
          }
        }
        setState(131);
        match(Sysy2022Parser::RC);
        break;
      }

    default:
      throw NoViableAltException(this);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- VardeclContext ------------------------------------------------------------------

Sysy2022Parser::VardeclContext::VardeclContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::BtypeContext* Sysy2022Parser::VardeclContext::btype() {
  return getRuleContext<Sysy2022Parser::BtypeContext>(0);
}

std::vector<Sysy2022Parser::VardefContext *> Sysy2022Parser::VardeclContext::vardef() {
  return getRuleContexts<Sysy2022Parser::VardefContext>();
}

Sysy2022Parser::VardefContext* Sysy2022Parser::VardeclContext::vardef(size_t i) {
  return getRuleContext<Sysy2022Parser::VardefContext>(i);
}

tree::TerminalNode* Sysy2022Parser::VardeclContext::SEMICOLON() {
  return getToken(Sysy2022Parser::SEMICOLON, 0);
}

std::vector<tree::TerminalNode *> Sysy2022Parser::VardeclContext::COMMA() {
  return getTokens(Sysy2022Parser::COMMA);
}

tree::TerminalNode* Sysy2022Parser::VardeclContext::COMMA(size_t i) {
  return getToken(Sysy2022Parser::COMMA, i);
}


size_t Sysy2022Parser::VardeclContext::getRuleIndex() const {
  return Sysy2022Parser::RuleVardecl;
}

antlrcpp::Any Sysy2022Parser::VardeclContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitVardecl(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::VardeclContext* Sysy2022Parser::vardecl() {
  VardeclContext *_localctx = _tracker.createInstance<VardeclContext>(_ctx, getState());
  enterRule(_localctx, 14, Sysy2022Parser::RuleVardecl);
  size_t _la = 0;

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(134);
    btype();
    setState(135);
    vardef();
    setState(140);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == Sysy2022Parser::COMMA) {
      setState(136);
      match(Sysy2022Parser::COMMA);
      setState(137);
      vardef();
      setState(142);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(143);
    match(Sysy2022Parser::SEMICOLON);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- VardefContext ------------------------------------------------------------------

Sysy2022Parser::VardefContext::VardefContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy2022Parser::VardefContext::ID() {
  return getToken(Sysy2022Parser::ID, 0);
}

std::vector<tree::TerminalNode *> Sysy2022Parser::VardefContext::LB() {
  return getTokens(Sysy2022Parser::LB);
}

tree::TerminalNode* Sysy2022Parser::VardefContext::LB(size_t i) {
  return getToken(Sysy2022Parser::LB, i);
}

std::vector<Sysy2022Parser::ConstexpContext *> Sysy2022Parser::VardefContext::constexp() {
  return getRuleContexts<Sysy2022Parser::ConstexpContext>();
}

Sysy2022Parser::ConstexpContext* Sysy2022Parser::VardefContext::constexp(size_t i) {
  return getRuleContext<Sysy2022Parser::ConstexpContext>(i);
}

std::vector<tree::TerminalNode *> Sysy2022Parser::VardefContext::RB() {
  return getTokens(Sysy2022Parser::RB);
}

tree::TerminalNode* Sysy2022Parser::VardefContext::RB(size_t i) {
  return getToken(Sysy2022Parser::RB, i);
}

tree::TerminalNode* Sysy2022Parser::VardefContext::ASSIGN() {
  return getToken(Sysy2022Parser::ASSIGN, 0);
}

Sysy2022Parser::InitvalContext* Sysy2022Parser::VardefContext::initval() {
  return getRuleContext<Sysy2022Parser::InitvalContext>(0);
}


size_t Sysy2022Parser::VardefContext::getRuleIndex() const {
  return Sysy2022Parser::RuleVardef;
}

antlrcpp::Any Sysy2022Parser::VardefContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitVardef(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::VardefContext* Sysy2022Parser::vardef() {
  VardefContext *_localctx = _tracker.createInstance<VardefContext>(_ctx, getState());
  enterRule(_localctx, 16, Sysy2022Parser::RuleVardef);
  size_t _la = 0;

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    setState(167);
    _errHandler->sync(this);
    switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 14, _ctx)) {
    case 1: {
      enterOuterAlt(_localctx, 1);
      setState(145);
      match(Sysy2022Parser::ID);
      setState(152);
      _errHandler->sync(this);
      _la = _input->LA(1);
      while (_la == Sysy2022Parser::LB) {
        setState(146);
        match(Sysy2022Parser::LB);
        setState(147);
        constexp();
        setState(148);
        match(Sysy2022Parser::RB);
        setState(154);
        _errHandler->sync(this);
        _la = _input->LA(1);
      }
      break;
    }

    case 2: {
      enterOuterAlt(_localctx, 2);
      setState(155);
      match(Sysy2022Parser::ID);
      setState(162);
      _errHandler->sync(this);
      _la = _input->LA(1);
      while (_la == Sysy2022Parser::LB) {
        setState(156);
        match(Sysy2022Parser::LB);
        setState(157);
        constexp();
        setState(158);
        match(Sysy2022Parser::RB);
        setState(164);
        _errHandler->sync(this);
        _la = _input->LA(1);
      }
      setState(165);
      match(Sysy2022Parser::ASSIGN);
      setState(166);
      initval();
      break;
    }

    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- InitvalContext ------------------------------------------------------------------

Sysy2022Parser::InitvalContext::InitvalContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::ExpContext* Sysy2022Parser::InitvalContext::exp() {
  return getRuleContext<Sysy2022Parser::ExpContext>(0);
}

tree::TerminalNode* Sysy2022Parser::InitvalContext::LC() {
  return getToken(Sysy2022Parser::LC, 0);
}

tree::TerminalNode* Sysy2022Parser::InitvalContext::RC() {
  return getToken(Sysy2022Parser::RC, 0);
}

std::vector<Sysy2022Parser::InitvalContext *> Sysy2022Parser::InitvalContext::initval() {
  return getRuleContexts<Sysy2022Parser::InitvalContext>();
}

Sysy2022Parser::InitvalContext* Sysy2022Parser::InitvalContext::initval(size_t i) {
  return getRuleContext<Sysy2022Parser::InitvalContext>(i);
}

std::vector<tree::TerminalNode *> Sysy2022Parser::InitvalContext::COMMA() {
  return getTokens(Sysy2022Parser::COMMA);
}

tree::TerminalNode* Sysy2022Parser::InitvalContext::COMMA(size_t i) {
  return getToken(Sysy2022Parser::COMMA, i);
}


size_t Sysy2022Parser::InitvalContext::getRuleIndex() const {
  return Sysy2022Parser::RuleInitval;
}

antlrcpp::Any Sysy2022Parser::InitvalContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitInitval(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::InitvalContext* Sysy2022Parser::initval() {
  InitvalContext *_localctx = _tracker.createInstance<InitvalContext>(_ctx, getState());
  enterRule(_localctx, 18, Sysy2022Parser::RuleInitval);
  size_t _la = 0;

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    setState(182);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy2022Parser::LP:
      case Sysy2022Parser::MINUS:
      case Sysy2022Parser::NOT:
      case Sysy2022Parser::ADD:
      case Sysy2022Parser::ID:
      case Sysy2022Parser::INT_LIT:
      case Sysy2022Parser::FLOAT_LIT: {
        enterOuterAlt(_localctx, 1);
        setState(169);
        exp();
        break;
      }

      case Sysy2022Parser::LC: {
        enterOuterAlt(_localctx, 2);
        setState(170);
        match(Sysy2022Parser::LC);
        setState(179);
        _errHandler->sync(this);

        _la = _input->LA(1);
        if ((((_la & ~ 0x3fULL) == 0) &&
          ((1ULL << _la) & ((1ULL << Sysy2022Parser::LP)
          | (1ULL << Sysy2022Parser::LC)
          | (1ULL << Sysy2022Parser::MINUS)
          | (1ULL << Sysy2022Parser::NOT)
          | (1ULL << Sysy2022Parser::ADD)
          | (1ULL << Sysy2022Parser::ID)
          | (1ULL << Sysy2022Parser::INT_LIT)
          | (1ULL << Sysy2022Parser::FLOAT_LIT))) != 0)) {
          setState(171);
          initval();
          setState(176);
          _errHandler->sync(this);
          _la = _input->LA(1);
          while (_la == Sysy2022Parser::COMMA) {
            setState(172);
            match(Sysy2022Parser::COMMA);
            setState(173);
            initval();
            setState(178);
            _errHandler->sync(this);
            _la = _input->LA(1);
          }
        }
        setState(181);
        match(Sysy2022Parser::RC);
        break;
      }

    default:
      throw NoViableAltException(this);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- FuncdefContext ------------------------------------------------------------------

Sysy2022Parser::FuncdefContext::FuncdefContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::FunctypeContext* Sysy2022Parser::FuncdefContext::functype() {
  return getRuleContext<Sysy2022Parser::FunctypeContext>(0);
}

tree::TerminalNode* Sysy2022Parser::FuncdefContext::ID() {
  return getToken(Sysy2022Parser::ID, 0);
}

tree::TerminalNode* Sysy2022Parser::FuncdefContext::LP() {
  return getToken(Sysy2022Parser::LP, 0);
}

tree::TerminalNode* Sysy2022Parser::FuncdefContext::RP() {
  return getToken(Sysy2022Parser::RP, 0);
}

Sysy2022Parser::BlockContext* Sysy2022Parser::FuncdefContext::block() {
  return getRuleContext<Sysy2022Parser::BlockContext>(0);
}

Sysy2022Parser::FuncfparamsContext* Sysy2022Parser::FuncdefContext::funcfparams() {
  return getRuleContext<Sysy2022Parser::FuncfparamsContext>(0);
}


size_t Sysy2022Parser::FuncdefContext::getRuleIndex() const {
  return Sysy2022Parser::RuleFuncdef;
}

antlrcpp::Any Sysy2022Parser::FuncdefContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitFuncdef(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::FuncdefContext* Sysy2022Parser::funcdef() {
  FuncdefContext *_localctx = _tracker.createInstance<FuncdefContext>(_ctx, getState());
  enterRule(_localctx, 20, Sysy2022Parser::RuleFuncdef);
  size_t _la = 0;

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(184);
    functype();
    setState(185);
    match(Sysy2022Parser::ID);
    setState(186);
    match(Sysy2022Parser::LP);
    setState(188);
    _errHandler->sync(this);

    _la = _input->LA(1);
    if (_la == Sysy2022Parser::INT

    || _la == Sysy2022Parser::FLOAT) {
      setState(187);
      funcfparams();
    }
    setState(190);
    match(Sysy2022Parser::RP);
    setState(191);
    block();
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- FunctypeContext ------------------------------------------------------------------

Sysy2022Parser::FunctypeContext::FunctypeContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy2022Parser::FunctypeContext::VOID() {
  return getToken(Sysy2022Parser::VOID, 0);
}

tree::TerminalNode* Sysy2022Parser::FunctypeContext::INT() {
  return getToken(Sysy2022Parser::INT, 0);
}

tree::TerminalNode* Sysy2022Parser::FunctypeContext::FLOAT() {
  return getToken(Sysy2022Parser::FLOAT, 0);
}


size_t Sysy2022Parser::FunctypeContext::getRuleIndex() const {
  return Sysy2022Parser::RuleFunctype;
}

antlrcpp::Any Sysy2022Parser::FunctypeContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitFunctype(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::FunctypeContext* Sysy2022Parser::functype() {
  FunctypeContext *_localctx = _tracker.createInstance<FunctypeContext>(_ctx, getState());
  enterRule(_localctx, 22, Sysy2022Parser::RuleFunctype);
  size_t _la = 0;

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(193);
    _la = _input->LA(1);
    if (!((((_la & ~ 0x3fULL) == 0) &&
      ((1ULL << _la) & ((1ULL << Sysy2022Parser::INT)
      | (1ULL << Sysy2022Parser::FLOAT)
      | (1ULL << Sysy2022Parser::VOID))) != 0))) {
    _errHandler->recoverInline(this);
    }
    else {
      _errHandler->reportMatch(this);
      consume();
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- FuncfparamsContext ------------------------------------------------------------------

Sysy2022Parser::FuncfparamsContext::FuncfparamsContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

std::vector<Sysy2022Parser::FuncfparamContext *> Sysy2022Parser::FuncfparamsContext::funcfparam() {
  return getRuleContexts<Sysy2022Parser::FuncfparamContext>();
}

Sysy2022Parser::FuncfparamContext* Sysy2022Parser::FuncfparamsContext::funcfparam(size_t i) {
  return getRuleContext<Sysy2022Parser::FuncfparamContext>(i);
}

std::vector<tree::TerminalNode *> Sysy2022Parser::FuncfparamsContext::COMMA() {
  return getTokens(Sysy2022Parser::COMMA);
}

tree::TerminalNode* Sysy2022Parser::FuncfparamsContext::COMMA(size_t i) {
  return getToken(Sysy2022Parser::COMMA, i);
}


size_t Sysy2022Parser::FuncfparamsContext::getRuleIndex() const {
  return Sysy2022Parser::RuleFuncfparams;
}

antlrcpp::Any Sysy2022Parser::FuncfparamsContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitFuncfparams(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::FuncfparamsContext* Sysy2022Parser::funcfparams() {
  FuncfparamsContext *_localctx = _tracker.createInstance<FuncfparamsContext>(_ctx, getState());
  enterRule(_localctx, 24, Sysy2022Parser::RuleFuncfparams);
  size_t _la = 0;

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(195);
    funcfparam();
    setState(200);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == Sysy2022Parser::COMMA) {
      setState(196);
      match(Sysy2022Parser::COMMA);
      setState(197);
      funcfparam();
      setState(202);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- FuncfparamContext ------------------------------------------------------------------

Sysy2022Parser::FuncfparamContext::FuncfparamContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::BtypeContext* Sysy2022Parser::FuncfparamContext::btype() {
  return getRuleContext<Sysy2022Parser::BtypeContext>(0);
}

tree::TerminalNode* Sysy2022Parser::FuncfparamContext::ID() {
  return getToken(Sysy2022Parser::ID, 0);
}

std::vector<tree::TerminalNode *> Sysy2022Parser::FuncfparamContext::LB() {
  return getTokens(Sysy2022Parser::LB);
}

tree::TerminalNode* Sysy2022Parser::FuncfparamContext::LB(size_t i) {
  return getToken(Sysy2022Parser::LB, i);
}

std::vector<tree::TerminalNode *> Sysy2022Parser::FuncfparamContext::RB() {
  return getTokens(Sysy2022Parser::RB);
}

tree::TerminalNode* Sysy2022Parser::FuncfparamContext::RB(size_t i) {
  return getToken(Sysy2022Parser::RB, i);
}

std::vector<Sysy2022Parser::ExpContext *> Sysy2022Parser::FuncfparamContext::exp() {
  return getRuleContexts<Sysy2022Parser::ExpContext>();
}

Sysy2022Parser::ExpContext* Sysy2022Parser::FuncfparamContext::exp(size_t i) {
  return getRuleContext<Sysy2022Parser::ExpContext>(i);
}


size_t Sysy2022Parser::FuncfparamContext::getRuleIndex() const {
  return Sysy2022Parser::RuleFuncfparam;
}

antlrcpp::Any Sysy2022Parser::FuncfparamContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitFuncfparam(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::FuncfparamContext* Sysy2022Parser::funcfparam() {
  FuncfparamContext *_localctx = _tracker.createInstance<FuncfparamContext>(_ctx, getState());
  enterRule(_localctx, 26, Sysy2022Parser::RuleFuncfparam);
  size_t _la = 0;

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(203);
    btype();
    setState(204);
    match(Sysy2022Parser::ID);
    setState(216);
    _errHandler->sync(this);

    _la = _input->LA(1);
    if (_la == Sysy2022Parser::LB) {
      setState(205);
      match(Sysy2022Parser::LB);
      setState(206);
      match(Sysy2022Parser::RB);
      setState(213);
      _errHandler->sync(this);
      _la = _input->LA(1);
      while (_la == Sysy2022Parser::LB) {
        setState(207);
        match(Sysy2022Parser::LB);
        setState(208);
        exp();
        setState(209);
        match(Sysy2022Parser::RB);
        setState(215);
        _errHandler->sync(this);
        _la = _input->LA(1);
      }
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- BlockContext ------------------------------------------------------------------

Sysy2022Parser::BlockContext::BlockContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy2022Parser::BlockContext::LC() {
  return getToken(Sysy2022Parser::LC, 0);
}

tree::TerminalNode* Sysy2022Parser::BlockContext::RC() {
  return getToken(Sysy2022Parser::RC, 0);
}

std::vector<Sysy2022Parser::BlockitemContext *> Sysy2022Parser::BlockContext::blockitem() {
  return getRuleContexts<Sysy2022Parser::BlockitemContext>();
}

Sysy2022Parser::BlockitemContext* Sysy2022Parser::BlockContext::blockitem(size_t i) {
  return getRuleContext<Sysy2022Parser::BlockitemContext>(i);
}


size_t Sysy2022Parser::BlockContext::getRuleIndex() const {
  return Sysy2022Parser::RuleBlock;
}

antlrcpp::Any Sysy2022Parser::BlockContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitBlock(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::BlockContext* Sysy2022Parser::block() {
  BlockContext *_localctx = _tracker.createInstance<BlockContext>(_ctx, getState());
  enterRule(_localctx, 28, Sysy2022Parser::RuleBlock);
  size_t _la = 0;

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(218);
    match(Sysy2022Parser::LC);
    setState(222);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while ((((_la & ~ 0x3fULL) == 0) &&
      ((1ULL << _la) & ((1ULL << Sysy2022Parser::INT)
      | (1ULL << Sysy2022Parser::FLOAT)
      | (1ULL << Sysy2022Parser::CONST)
      | (1ULL << Sysy2022Parser::RETURN)
      | (1ULL << Sysy2022Parser::IF)
      | (1ULL << Sysy2022Parser::WHILE)
      | (1ULL << Sysy2022Parser::BREAK)
      | (1ULL << Sysy2022Parser::CONTINUE)
      | (1ULL << Sysy2022Parser::LP)
      | (1ULL << Sysy2022Parser::LC)
      | (1ULL << Sysy2022Parser::SEMICOLON)
      | (1ULL << Sysy2022Parser::MINUS)
      | (1ULL << Sysy2022Parser::NOT)
      | (1ULL << Sysy2022Parser::ADD)
      | (1ULL << Sysy2022Parser::ID)
      | (1ULL << Sysy2022Parser::INT_LIT)
      | (1ULL << Sysy2022Parser::FLOAT_LIT))) != 0)) {
      setState(219);
      blockitem();
      setState(224);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
    setState(225);
    match(Sysy2022Parser::RC);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- BlockitemContext ------------------------------------------------------------------

Sysy2022Parser::BlockitemContext::BlockitemContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::DeclContext* Sysy2022Parser::BlockitemContext::decl() {
  return getRuleContext<Sysy2022Parser::DeclContext>(0);
}

Sysy2022Parser::StmtContext* Sysy2022Parser::BlockitemContext::stmt() {
  return getRuleContext<Sysy2022Parser::StmtContext>(0);
}


size_t Sysy2022Parser::BlockitemContext::getRuleIndex() const {
  return Sysy2022Parser::RuleBlockitem;
}

antlrcpp::Any Sysy2022Parser::BlockitemContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitBlockitem(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::BlockitemContext* Sysy2022Parser::blockitem() {
  BlockitemContext *_localctx = _tracker.createInstance<BlockitemContext>(_ctx, getState());
  enterRule(_localctx, 30, Sysy2022Parser::RuleBlockitem);

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    setState(229);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy2022Parser::INT:
      case Sysy2022Parser::FLOAT:
      case Sysy2022Parser::CONST: {
        enterOuterAlt(_localctx, 1);
        setState(227);
        decl();
        break;
      }

      case Sysy2022Parser::RETURN:
      case Sysy2022Parser::IF:
      case Sysy2022Parser::WHILE:
      case Sysy2022Parser::BREAK:
      case Sysy2022Parser::CONTINUE:
      case Sysy2022Parser::LP:
      case Sysy2022Parser::LC:
      case Sysy2022Parser::SEMICOLON:
      case Sysy2022Parser::MINUS:
      case Sysy2022Parser::NOT:
      case Sysy2022Parser::ADD:
      case Sysy2022Parser::ID:
      case Sysy2022Parser::INT_LIT:
      case Sysy2022Parser::FLOAT_LIT: {
        enterOuterAlt(_localctx, 2);
        setState(228);
        stmt();
        break;
      }

    default:
      throw NoViableAltException(this);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- StmtContext ------------------------------------------------------------------

Sysy2022Parser::StmtContext::StmtContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::LvalContext* Sysy2022Parser::StmtContext::lval() {
  return getRuleContext<Sysy2022Parser::LvalContext>(0);
}

tree::TerminalNode* Sysy2022Parser::StmtContext::ASSIGN() {
  return getToken(Sysy2022Parser::ASSIGN, 0);
}

Sysy2022Parser::ExpContext* Sysy2022Parser::StmtContext::exp() {
  return getRuleContext<Sysy2022Parser::ExpContext>(0);
}

tree::TerminalNode* Sysy2022Parser::StmtContext::SEMICOLON() {
  return getToken(Sysy2022Parser::SEMICOLON, 0);
}

Sysy2022Parser::BlockContext* Sysy2022Parser::StmtContext::block() {
  return getRuleContext<Sysy2022Parser::BlockContext>(0);
}

tree::TerminalNode* Sysy2022Parser::StmtContext::IF() {
  return getToken(Sysy2022Parser::IF, 0);
}

tree::TerminalNode* Sysy2022Parser::StmtContext::LP() {
  return getToken(Sysy2022Parser::LP, 0);
}

Sysy2022Parser::CondContext* Sysy2022Parser::StmtContext::cond() {
  return getRuleContext<Sysy2022Parser::CondContext>(0);
}

tree::TerminalNode* Sysy2022Parser::StmtContext::RP() {
  return getToken(Sysy2022Parser::RP, 0);
}

std::vector<Sysy2022Parser::StmtContext *> Sysy2022Parser::StmtContext::stmt() {
  return getRuleContexts<Sysy2022Parser::StmtContext>();
}

Sysy2022Parser::StmtContext* Sysy2022Parser::StmtContext::stmt(size_t i) {
  return getRuleContext<Sysy2022Parser::StmtContext>(i);
}

tree::TerminalNode* Sysy2022Parser::StmtContext::ELSE() {
  return getToken(Sysy2022Parser::ELSE, 0);
}

tree::TerminalNode* Sysy2022Parser::StmtContext::WHILE() {
  return getToken(Sysy2022Parser::WHILE, 0);
}

tree::TerminalNode* Sysy2022Parser::StmtContext::BREAK() {
  return getToken(Sysy2022Parser::BREAK, 0);
}

tree::TerminalNode* Sysy2022Parser::StmtContext::CONTINUE() {
  return getToken(Sysy2022Parser::CONTINUE, 0);
}

tree::TerminalNode* Sysy2022Parser::StmtContext::RETURN() {
  return getToken(Sysy2022Parser::RETURN, 0);
}


size_t Sysy2022Parser::StmtContext::getRuleIndex() const {
  return Sysy2022Parser::RuleStmt;
}

antlrcpp::Any Sysy2022Parser::StmtContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitStmt(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::StmtContext* Sysy2022Parser::stmt() {
  StmtContext *_localctx = _tracker.createInstance<StmtContext>(_ctx, getState());
  enterRule(_localctx, 32, Sysy2022Parser::RuleStmt);
  size_t _la = 0;

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    setState(265);
    _errHandler->sync(this);
    switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 27, _ctx)) {
    case 1: {
      enterOuterAlt(_localctx, 1);
      setState(231);
      lval();
      setState(232);
      match(Sysy2022Parser::ASSIGN);
      setState(233);
      exp();
      setState(234);
      match(Sysy2022Parser::SEMICOLON);
      break;
    }

    case 2: {
      enterOuterAlt(_localctx, 2);
      setState(237);
      _errHandler->sync(this);

      _la = _input->LA(1);
      if ((((_la & ~ 0x3fULL) == 0) &&
        ((1ULL << _la) & ((1ULL << Sysy2022Parser::LP)
        | (1ULL << Sysy2022Parser::MINUS)
        | (1ULL << Sysy2022Parser::NOT)
        | (1ULL << Sysy2022Parser::ADD)
        | (1ULL << Sysy2022Parser::ID)
        | (1ULL << Sysy2022Parser::INT_LIT)
        | (1ULL << Sysy2022Parser::FLOAT_LIT))) != 0)) {
        setState(236);
        exp();
      }
      setState(239);
      match(Sysy2022Parser::SEMICOLON);
      break;
    }

    case 3: {
      enterOuterAlt(_localctx, 3);
      setState(240);
      block();
      break;
    }

    case 4: {
      enterOuterAlt(_localctx, 4);
      setState(241);
      match(Sysy2022Parser::IF);
      setState(242);
      match(Sysy2022Parser::LP);
      setState(243);
      cond();
      setState(244);
      match(Sysy2022Parser::RP);
      setState(245);
      stmt();
      setState(248);
      _errHandler->sync(this);

      switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 25, _ctx)) {
      case 1: {
        setState(246);
        match(Sysy2022Parser::ELSE);
        setState(247);
        stmt();
        break;
      }

      }
      break;
    }

    case 5: {
      enterOuterAlt(_localctx, 5);
      setState(250);
      match(Sysy2022Parser::WHILE);
      setState(251);
      match(Sysy2022Parser::LP);
      setState(252);
      cond();
      setState(253);
      match(Sysy2022Parser::RP);
      setState(254);
      stmt();
      break;
    }

    case 6: {
      enterOuterAlt(_localctx, 6);
      setState(256);
      match(Sysy2022Parser::BREAK);
      setState(257);
      match(Sysy2022Parser::SEMICOLON);
      break;
    }

    case 7: {
      enterOuterAlt(_localctx, 7);
      setState(258);
      match(Sysy2022Parser::CONTINUE);
      setState(259);
      match(Sysy2022Parser::SEMICOLON);
      break;
    }

    case 8: {
      enterOuterAlt(_localctx, 8);
      setState(260);
      match(Sysy2022Parser::RETURN);
      setState(262);
      _errHandler->sync(this);

      _la = _input->LA(1);
      if ((((_la & ~ 0x3fULL) == 0) &&
        ((1ULL << _la) & ((1ULL << Sysy2022Parser::LP)
        | (1ULL << Sysy2022Parser::MINUS)
        | (1ULL << Sysy2022Parser::NOT)
        | (1ULL << Sysy2022Parser::ADD)
        | (1ULL << Sysy2022Parser::ID)
        | (1ULL << Sysy2022Parser::INT_LIT)
        | (1ULL << Sysy2022Parser::FLOAT_LIT))) != 0)) {
        setState(261);
        exp();
      }
      setState(264);
      match(Sysy2022Parser::SEMICOLON);
      break;
    }

    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- ExpContext ------------------------------------------------------------------

Sysy2022Parser::ExpContext::ExpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::AddexpContext* Sysy2022Parser::ExpContext::addexp() {
  return getRuleContext<Sysy2022Parser::AddexpContext>(0);
}


size_t Sysy2022Parser::ExpContext::getRuleIndex() const {
  return Sysy2022Parser::RuleExp;
}

antlrcpp::Any Sysy2022Parser::ExpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitExp(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::ExpContext* Sysy2022Parser::exp() {
  ExpContext *_localctx = _tracker.createInstance<ExpContext>(_ctx, getState());
  enterRule(_localctx, 34, Sysy2022Parser::RuleExp);

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(267);
    addexp(0);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- CondContext ------------------------------------------------------------------

Sysy2022Parser::CondContext::CondContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::LorexpContext* Sysy2022Parser::CondContext::lorexp() {
  return getRuleContext<Sysy2022Parser::LorexpContext>(0);
}


size_t Sysy2022Parser::CondContext::getRuleIndex() const {
  return Sysy2022Parser::RuleCond;
}

antlrcpp::Any Sysy2022Parser::CondContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitCond(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::CondContext* Sysy2022Parser::cond() {
  CondContext *_localctx = _tracker.createInstance<CondContext>(_ctx, getState());
  enterRule(_localctx, 36, Sysy2022Parser::RuleCond);

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(269);
    lorexp(0);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- LvalContext ------------------------------------------------------------------

Sysy2022Parser::LvalContext::LvalContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy2022Parser::LvalContext::ID() {
  return getToken(Sysy2022Parser::ID, 0);
}

std::vector<tree::TerminalNode *> Sysy2022Parser::LvalContext::LB() {
  return getTokens(Sysy2022Parser::LB);
}

tree::TerminalNode* Sysy2022Parser::LvalContext::LB(size_t i) {
  return getToken(Sysy2022Parser::LB, i);
}

std::vector<Sysy2022Parser::ExpContext *> Sysy2022Parser::LvalContext::exp() {
  return getRuleContexts<Sysy2022Parser::ExpContext>();
}

Sysy2022Parser::ExpContext* Sysy2022Parser::LvalContext::exp(size_t i) {
  return getRuleContext<Sysy2022Parser::ExpContext>(i);
}

std::vector<tree::TerminalNode *> Sysy2022Parser::LvalContext::RB() {
  return getTokens(Sysy2022Parser::RB);
}

tree::TerminalNode* Sysy2022Parser::LvalContext::RB(size_t i) {
  return getToken(Sysy2022Parser::RB, i);
}


size_t Sysy2022Parser::LvalContext::getRuleIndex() const {
  return Sysy2022Parser::RuleLval;
}

antlrcpp::Any Sysy2022Parser::LvalContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitLval(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::LvalContext* Sysy2022Parser::lval() {
  LvalContext *_localctx = _tracker.createInstance<LvalContext>(_ctx, getState());
  enterRule(_localctx, 38, Sysy2022Parser::RuleLval);

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    size_t alt;
    enterOuterAlt(_localctx, 1);
    setState(271);
    match(Sysy2022Parser::ID);
    setState(278);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 28, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        setState(272);
        match(Sysy2022Parser::LB);
        setState(273);
        exp();
        setState(274);
        match(Sysy2022Parser::RB); 
      }
      setState(280);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 28, _ctx);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- PrimaryexpContext ------------------------------------------------------------------

Sysy2022Parser::PrimaryexpContext::PrimaryexpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy2022Parser::PrimaryexpContext::LP() {
  return getToken(Sysy2022Parser::LP, 0);
}

Sysy2022Parser::ExpContext* Sysy2022Parser::PrimaryexpContext::exp() {
  return getRuleContext<Sysy2022Parser::ExpContext>(0);
}

tree::TerminalNode* Sysy2022Parser::PrimaryexpContext::RP() {
  return getToken(Sysy2022Parser::RP, 0);
}

Sysy2022Parser::LvalContext* Sysy2022Parser::PrimaryexpContext::lval() {
  return getRuleContext<Sysy2022Parser::LvalContext>(0);
}

Sysy2022Parser::NumberContext* Sysy2022Parser::PrimaryexpContext::number() {
  return getRuleContext<Sysy2022Parser::NumberContext>(0);
}


size_t Sysy2022Parser::PrimaryexpContext::getRuleIndex() const {
  return Sysy2022Parser::RulePrimaryexp;
}

antlrcpp::Any Sysy2022Parser::PrimaryexpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitPrimaryexp(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::PrimaryexpContext* Sysy2022Parser::primaryexp() {
  PrimaryexpContext *_localctx = _tracker.createInstance<PrimaryexpContext>(_ctx, getState());
  enterRule(_localctx, 40, Sysy2022Parser::RulePrimaryexp);

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    setState(287);
    _errHandler->sync(this);
    switch (_input->LA(1)) {
      case Sysy2022Parser::LP: {
        enterOuterAlt(_localctx, 1);
        setState(281);
        match(Sysy2022Parser::LP);
        setState(282);
        exp();
        setState(283);
        match(Sysy2022Parser::RP);
        break;
      }

      case Sysy2022Parser::ID: {
        enterOuterAlt(_localctx, 2);
        setState(285);
        lval();
        break;
      }

      case Sysy2022Parser::INT_LIT:
      case Sysy2022Parser::FLOAT_LIT: {
        enterOuterAlt(_localctx, 3);
        setState(286);
        number();
        break;
      }

    default:
      throw NoViableAltException(this);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- NumberContext ------------------------------------------------------------------

Sysy2022Parser::NumberContext::NumberContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy2022Parser::NumberContext::INT_LIT() {
  return getToken(Sysy2022Parser::INT_LIT, 0);
}

tree::TerminalNode* Sysy2022Parser::NumberContext::FLOAT_LIT() {
  return getToken(Sysy2022Parser::FLOAT_LIT, 0);
}


size_t Sysy2022Parser::NumberContext::getRuleIndex() const {
  return Sysy2022Parser::RuleNumber;
}

antlrcpp::Any Sysy2022Parser::NumberContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitNumber(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::NumberContext* Sysy2022Parser::number() {
  NumberContext *_localctx = _tracker.createInstance<NumberContext>(_ctx, getState());
  enterRule(_localctx, 42, Sysy2022Parser::RuleNumber);
  size_t _la = 0;

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(289);
    _la = _input->LA(1);
    if (!(_la == Sysy2022Parser::INT_LIT

    || _la == Sysy2022Parser::FLOAT_LIT)) {
    _errHandler->recoverInline(this);
    }
    else {
      _errHandler->reportMatch(this);
      consume();
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- UnaryexpContext ------------------------------------------------------------------

Sysy2022Parser::UnaryexpContext::UnaryexpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::PrimaryexpContext* Sysy2022Parser::UnaryexpContext::primaryexp() {
  return getRuleContext<Sysy2022Parser::PrimaryexpContext>(0);
}

tree::TerminalNode* Sysy2022Parser::UnaryexpContext::ID() {
  return getToken(Sysy2022Parser::ID, 0);
}

tree::TerminalNode* Sysy2022Parser::UnaryexpContext::LP() {
  return getToken(Sysy2022Parser::LP, 0);
}

tree::TerminalNode* Sysy2022Parser::UnaryexpContext::RP() {
  return getToken(Sysy2022Parser::RP, 0);
}

Sysy2022Parser::FuncrparamsContext* Sysy2022Parser::UnaryexpContext::funcrparams() {
  return getRuleContext<Sysy2022Parser::FuncrparamsContext>(0);
}

Sysy2022Parser::UnaryopContext* Sysy2022Parser::UnaryexpContext::unaryop() {
  return getRuleContext<Sysy2022Parser::UnaryopContext>(0);
}

Sysy2022Parser::UnaryexpContext* Sysy2022Parser::UnaryexpContext::unaryexp() {
  return getRuleContext<Sysy2022Parser::UnaryexpContext>(0);
}


size_t Sysy2022Parser::UnaryexpContext::getRuleIndex() const {
  return Sysy2022Parser::RuleUnaryexp;
}

antlrcpp::Any Sysy2022Parser::UnaryexpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitUnaryexp(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::UnaryexpContext* Sysy2022Parser::unaryexp() {
  UnaryexpContext *_localctx = _tracker.createInstance<UnaryexpContext>(_ctx, getState());
  enterRule(_localctx, 44, Sysy2022Parser::RuleUnaryexp);
  size_t _la = 0;

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    setState(301);
    _errHandler->sync(this);
    switch (getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 31, _ctx)) {
    case 1: {
      enterOuterAlt(_localctx, 1);
      setState(291);
      primaryexp();
      break;
    }

    case 2: {
      enterOuterAlt(_localctx, 2);
      setState(292);
      match(Sysy2022Parser::ID);
      setState(293);
      match(Sysy2022Parser::LP);
      setState(295);
      _errHandler->sync(this);

      _la = _input->LA(1);
      if ((((_la & ~ 0x3fULL) == 0) &&
        ((1ULL << _la) & ((1ULL << Sysy2022Parser::LP)
        | (1ULL << Sysy2022Parser::MINUS)
        | (1ULL << Sysy2022Parser::NOT)
        | (1ULL << Sysy2022Parser::ADD)
        | (1ULL << Sysy2022Parser::ID)
        | (1ULL << Sysy2022Parser::INT_LIT)
        | (1ULL << Sysy2022Parser::FLOAT_LIT))) != 0)) {
        setState(294);
        funcrparams();
      }
      setState(297);
      match(Sysy2022Parser::RP);
      break;
    }

    case 3: {
      enterOuterAlt(_localctx, 3);
      setState(298);
      unaryop();
      setState(299);
      unaryexp();
      break;
    }

    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- UnaryopContext ------------------------------------------------------------------

Sysy2022Parser::UnaryopContext::UnaryopContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* Sysy2022Parser::UnaryopContext::ADD() {
  return getToken(Sysy2022Parser::ADD, 0);
}

tree::TerminalNode* Sysy2022Parser::UnaryopContext::MINUS() {
  return getToken(Sysy2022Parser::MINUS, 0);
}

tree::TerminalNode* Sysy2022Parser::UnaryopContext::NOT() {
  return getToken(Sysy2022Parser::NOT, 0);
}


size_t Sysy2022Parser::UnaryopContext::getRuleIndex() const {
  return Sysy2022Parser::RuleUnaryop;
}

antlrcpp::Any Sysy2022Parser::UnaryopContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitUnaryop(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::UnaryopContext* Sysy2022Parser::unaryop() {
  UnaryopContext *_localctx = _tracker.createInstance<UnaryopContext>(_ctx, getState());
  enterRule(_localctx, 46, Sysy2022Parser::RuleUnaryop);
  size_t _la = 0;

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(303);
    _la = _input->LA(1);
    if (!((((_la & ~ 0x3fULL) == 0) &&
      ((1ULL << _la) & ((1ULL << Sysy2022Parser::MINUS)
      | (1ULL << Sysy2022Parser::NOT)
      | (1ULL << Sysy2022Parser::ADD))) != 0))) {
    _errHandler->recoverInline(this);
    }
    else {
      _errHandler->reportMatch(this);
      consume();
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- FuncrparamsContext ------------------------------------------------------------------

Sysy2022Parser::FuncrparamsContext::FuncrparamsContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

std::vector<Sysy2022Parser::ExpContext *> Sysy2022Parser::FuncrparamsContext::exp() {
  return getRuleContexts<Sysy2022Parser::ExpContext>();
}

Sysy2022Parser::ExpContext* Sysy2022Parser::FuncrparamsContext::exp(size_t i) {
  return getRuleContext<Sysy2022Parser::ExpContext>(i);
}

std::vector<tree::TerminalNode *> Sysy2022Parser::FuncrparamsContext::COMMA() {
  return getTokens(Sysy2022Parser::COMMA);
}

tree::TerminalNode* Sysy2022Parser::FuncrparamsContext::COMMA(size_t i) {
  return getToken(Sysy2022Parser::COMMA, i);
}


size_t Sysy2022Parser::FuncrparamsContext::getRuleIndex() const {
  return Sysy2022Parser::RuleFuncrparams;
}

antlrcpp::Any Sysy2022Parser::FuncrparamsContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitFuncrparams(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::FuncrparamsContext* Sysy2022Parser::funcrparams() {
  FuncrparamsContext *_localctx = _tracker.createInstance<FuncrparamsContext>(_ctx, getState());
  enterRule(_localctx, 48, Sysy2022Parser::RuleFuncrparams);
  size_t _la = 0;

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(305);
    exp();
    setState(310);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == Sysy2022Parser::COMMA) {
      setState(306);
      match(Sysy2022Parser::COMMA);
      setState(307);
      exp();
      setState(312);
      _errHandler->sync(this);
      _la = _input->LA(1);
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

//----------------- MulexpContext ------------------------------------------------------------------

Sysy2022Parser::MulexpContext::MulexpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::UnaryexpContext* Sysy2022Parser::MulexpContext::unaryexp() {
  return getRuleContext<Sysy2022Parser::UnaryexpContext>(0);
}

Sysy2022Parser::MulexpContext* Sysy2022Parser::MulexpContext::mulexp() {
  return getRuleContext<Sysy2022Parser::MulexpContext>(0);
}

tree::TerminalNode* Sysy2022Parser::MulexpContext::MUL() {
  return getToken(Sysy2022Parser::MUL, 0);
}

tree::TerminalNode* Sysy2022Parser::MulexpContext::DIV() {
  return getToken(Sysy2022Parser::DIV, 0);
}

tree::TerminalNode* Sysy2022Parser::MulexpContext::MOD() {
  return getToken(Sysy2022Parser::MOD, 0);
}


size_t Sysy2022Parser::MulexpContext::getRuleIndex() const {
  return Sysy2022Parser::RuleMulexp;
}

antlrcpp::Any Sysy2022Parser::MulexpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitMulexp(this);
  else
    return visitor->visitChildren(this);
}


Sysy2022Parser::MulexpContext* Sysy2022Parser::mulexp() {
   return mulexp(0);
}

Sysy2022Parser::MulexpContext* Sysy2022Parser::mulexp(int precedence) {
  ParserRuleContext *parentContext = _ctx;
  size_t parentState = getState();
  Sysy2022Parser::MulexpContext *_localctx = _tracker.createInstance<MulexpContext>(_ctx, parentState);
  Sysy2022Parser::MulexpContext *previousContext = _localctx;
  (void)previousContext; // Silence compiler, in case the context is not used by generated code.
  size_t startState = 50;
  enterRecursionRule(_localctx, 50, Sysy2022Parser::RuleMulexp, precedence);

    size_t _la = 0;

  auto onExit = finally([=] {
    unrollRecursionContexts(parentContext);
  });
  try {
    size_t alt;
    enterOuterAlt(_localctx, 1);
    setState(314);
    unaryexp();
    _ctx->stop = _input->LT(-1);
    setState(321);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 33, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        if (!_parseListeners.empty())
          triggerExitRuleEvent();
        previousContext = _localctx;
        _localctx = _tracker.createInstance<MulexpContext>(parentContext, parentState);
        pushNewRecursionContext(_localctx, startState, RuleMulexp);
        setState(316);

        if (!(precpred(_ctx, 1))) throw FailedPredicateException(this, "precpred(_ctx, 1)");
        setState(317);
        _la = _input->LA(1);
        if (!((((_la & ~ 0x3fULL) == 0) &&
          ((1ULL << _la) & ((1ULL << Sysy2022Parser::MUL)
          | (1ULL << Sysy2022Parser::DIV)
          | (1ULL << Sysy2022Parser::MOD))) != 0))) {
        _errHandler->recoverInline(this);
        }
        else {
          _errHandler->reportMatch(this);
          consume();
        }
        setState(318);
        unaryexp(); 
      }
      setState(323);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 33, _ctx);
    }
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }
  return _localctx;
}

//----------------- AddexpContext ------------------------------------------------------------------

Sysy2022Parser::AddexpContext::AddexpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::MulexpContext* Sysy2022Parser::AddexpContext::mulexp() {
  return getRuleContext<Sysy2022Parser::MulexpContext>(0);
}

Sysy2022Parser::AddexpContext* Sysy2022Parser::AddexpContext::addexp() {
  return getRuleContext<Sysy2022Parser::AddexpContext>(0);
}

tree::TerminalNode* Sysy2022Parser::AddexpContext::ADD() {
  return getToken(Sysy2022Parser::ADD, 0);
}

tree::TerminalNode* Sysy2022Parser::AddexpContext::MINUS() {
  return getToken(Sysy2022Parser::MINUS, 0);
}


size_t Sysy2022Parser::AddexpContext::getRuleIndex() const {
  return Sysy2022Parser::RuleAddexp;
}

antlrcpp::Any Sysy2022Parser::AddexpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitAddexp(this);
  else
    return visitor->visitChildren(this);
}


Sysy2022Parser::AddexpContext* Sysy2022Parser::addexp() {
   return addexp(0);
}

Sysy2022Parser::AddexpContext* Sysy2022Parser::addexp(int precedence) {
  ParserRuleContext *parentContext = _ctx;
  size_t parentState = getState();
  Sysy2022Parser::AddexpContext *_localctx = _tracker.createInstance<AddexpContext>(_ctx, parentState);
  Sysy2022Parser::AddexpContext *previousContext = _localctx;
  (void)previousContext; // Silence compiler, in case the context is not used by generated code.
  size_t startState = 52;
  enterRecursionRule(_localctx, 52, Sysy2022Parser::RuleAddexp, precedence);

    size_t _la = 0;

  auto onExit = finally([=] {
    unrollRecursionContexts(parentContext);
  });
  try {
    size_t alt;
    enterOuterAlt(_localctx, 1);
    setState(325);
    mulexp(0);
    _ctx->stop = _input->LT(-1);
    setState(332);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 34, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        if (!_parseListeners.empty())
          triggerExitRuleEvent();
        previousContext = _localctx;
        _localctx = _tracker.createInstance<AddexpContext>(parentContext, parentState);
        pushNewRecursionContext(_localctx, startState, RuleAddexp);
        setState(327);

        if (!(precpred(_ctx, 1))) throw FailedPredicateException(this, "precpred(_ctx, 1)");
        setState(328);
        _la = _input->LA(1);
        if (!(_la == Sysy2022Parser::MINUS

        || _la == Sysy2022Parser::ADD)) {
        _errHandler->recoverInline(this);
        }
        else {
          _errHandler->reportMatch(this);
          consume();
        }
        setState(329);
        mulexp(0); 
      }
      setState(334);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 34, _ctx);
    }
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }
  return _localctx;
}

//----------------- RelexpContext ------------------------------------------------------------------

Sysy2022Parser::RelexpContext::RelexpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::AddexpContext* Sysy2022Parser::RelexpContext::addexp() {
  return getRuleContext<Sysy2022Parser::AddexpContext>(0);
}

Sysy2022Parser::RelexpContext* Sysy2022Parser::RelexpContext::relexp() {
  return getRuleContext<Sysy2022Parser::RelexpContext>(0);
}

tree::TerminalNode* Sysy2022Parser::RelexpContext::LT() {
  return getToken(Sysy2022Parser::LT, 0);
}

tree::TerminalNode* Sysy2022Parser::RelexpContext::GT() {
  return getToken(Sysy2022Parser::GT, 0);
}

tree::TerminalNode* Sysy2022Parser::RelexpContext::LE() {
  return getToken(Sysy2022Parser::LE, 0);
}

tree::TerminalNode* Sysy2022Parser::RelexpContext::GE() {
  return getToken(Sysy2022Parser::GE, 0);
}


size_t Sysy2022Parser::RelexpContext::getRuleIndex() const {
  return Sysy2022Parser::RuleRelexp;
}

antlrcpp::Any Sysy2022Parser::RelexpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitRelexp(this);
  else
    return visitor->visitChildren(this);
}


Sysy2022Parser::RelexpContext* Sysy2022Parser::relexp() {
   return relexp(0);
}

Sysy2022Parser::RelexpContext* Sysy2022Parser::relexp(int precedence) {
  ParserRuleContext *parentContext = _ctx;
  size_t parentState = getState();
  Sysy2022Parser::RelexpContext *_localctx = _tracker.createInstance<RelexpContext>(_ctx, parentState);
  Sysy2022Parser::RelexpContext *previousContext = _localctx;
  (void)previousContext; // Silence compiler, in case the context is not used by generated code.
  size_t startState = 54;
  enterRecursionRule(_localctx, 54, Sysy2022Parser::RuleRelexp, precedence);

    size_t _la = 0;

  auto onExit = finally([=] {
    unrollRecursionContexts(parentContext);
  });
  try {
    size_t alt;
    enterOuterAlt(_localctx, 1);
    setState(336);
    addexp(0);
    _ctx->stop = _input->LT(-1);
    setState(343);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 35, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        if (!_parseListeners.empty())
          triggerExitRuleEvent();
        previousContext = _localctx;
        _localctx = _tracker.createInstance<RelexpContext>(parentContext, parentState);
        pushNewRecursionContext(_localctx, startState, RuleRelexp);
        setState(338);

        if (!(precpred(_ctx, 1))) throw FailedPredicateException(this, "precpred(_ctx, 1)");
        setState(339);
        _la = _input->LA(1);
        if (!((((_la & ~ 0x3fULL) == 0) &&
          ((1ULL << _la) & ((1ULL << Sysy2022Parser::LT)
          | (1ULL << Sysy2022Parser::LE)
          | (1ULL << Sysy2022Parser::GT)
          | (1ULL << Sysy2022Parser::GE))) != 0))) {
        _errHandler->recoverInline(this);
        }
        else {
          _errHandler->reportMatch(this);
          consume();
        }
        setState(340);
        addexp(0); 
      }
      setState(345);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 35, _ctx);
    }
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }
  return _localctx;
}

//----------------- EqexpContext ------------------------------------------------------------------

Sysy2022Parser::EqexpContext::EqexpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::RelexpContext* Sysy2022Parser::EqexpContext::relexp() {
  return getRuleContext<Sysy2022Parser::RelexpContext>(0);
}

Sysy2022Parser::EqexpContext* Sysy2022Parser::EqexpContext::eqexp() {
  return getRuleContext<Sysy2022Parser::EqexpContext>(0);
}

tree::TerminalNode* Sysy2022Parser::EqexpContext::EQ() {
  return getToken(Sysy2022Parser::EQ, 0);
}

tree::TerminalNode* Sysy2022Parser::EqexpContext::NE() {
  return getToken(Sysy2022Parser::NE, 0);
}


size_t Sysy2022Parser::EqexpContext::getRuleIndex() const {
  return Sysy2022Parser::RuleEqexp;
}

antlrcpp::Any Sysy2022Parser::EqexpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitEqexp(this);
  else
    return visitor->visitChildren(this);
}


Sysy2022Parser::EqexpContext* Sysy2022Parser::eqexp() {
   return eqexp(0);
}

Sysy2022Parser::EqexpContext* Sysy2022Parser::eqexp(int precedence) {
  ParserRuleContext *parentContext = _ctx;
  size_t parentState = getState();
  Sysy2022Parser::EqexpContext *_localctx = _tracker.createInstance<EqexpContext>(_ctx, parentState);
  Sysy2022Parser::EqexpContext *previousContext = _localctx;
  (void)previousContext; // Silence compiler, in case the context is not used by generated code.
  size_t startState = 56;
  enterRecursionRule(_localctx, 56, Sysy2022Parser::RuleEqexp, precedence);

    size_t _la = 0;

  auto onExit = finally([=] {
    unrollRecursionContexts(parentContext);
  });
  try {
    size_t alt;
    enterOuterAlt(_localctx, 1);
    setState(347);
    relexp(0);
    _ctx->stop = _input->LT(-1);
    setState(354);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 36, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        if (!_parseListeners.empty())
          triggerExitRuleEvent();
        previousContext = _localctx;
        _localctx = _tracker.createInstance<EqexpContext>(parentContext, parentState);
        pushNewRecursionContext(_localctx, startState, RuleEqexp);
        setState(349);

        if (!(precpred(_ctx, 1))) throw FailedPredicateException(this, "precpred(_ctx, 1)");
        setState(350);
        _la = _input->LA(1);
        if (!(_la == Sysy2022Parser::EQ

        || _la == Sysy2022Parser::NE)) {
        _errHandler->recoverInline(this);
        }
        else {
          _errHandler->reportMatch(this);
          consume();
        }
        setState(351);
        relexp(0); 
      }
      setState(356);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 36, _ctx);
    }
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }
  return _localctx;
}

//----------------- LandexpContext ------------------------------------------------------------------

Sysy2022Parser::LandexpContext::LandexpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::EqexpContext* Sysy2022Parser::LandexpContext::eqexp() {
  return getRuleContext<Sysy2022Parser::EqexpContext>(0);
}

Sysy2022Parser::LandexpContext* Sysy2022Parser::LandexpContext::landexp() {
  return getRuleContext<Sysy2022Parser::LandexpContext>(0);
}

tree::TerminalNode* Sysy2022Parser::LandexpContext::AND() {
  return getToken(Sysy2022Parser::AND, 0);
}


size_t Sysy2022Parser::LandexpContext::getRuleIndex() const {
  return Sysy2022Parser::RuleLandexp;
}

antlrcpp::Any Sysy2022Parser::LandexpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitLandexp(this);
  else
    return visitor->visitChildren(this);
}


Sysy2022Parser::LandexpContext* Sysy2022Parser::landexp() {
   return landexp(0);
}

Sysy2022Parser::LandexpContext* Sysy2022Parser::landexp(int precedence) {
  ParserRuleContext *parentContext = _ctx;
  size_t parentState = getState();
  Sysy2022Parser::LandexpContext *_localctx = _tracker.createInstance<LandexpContext>(_ctx, parentState);
  Sysy2022Parser::LandexpContext *previousContext = _localctx;
  (void)previousContext; // Silence compiler, in case the context is not used by generated code.
  size_t startState = 58;
  enterRecursionRule(_localctx, 58, Sysy2022Parser::RuleLandexp, precedence);

    

  auto onExit = finally([=] {
    unrollRecursionContexts(parentContext);
  });
  try {
    size_t alt;
    enterOuterAlt(_localctx, 1);
    setState(358);
    eqexp(0);
    _ctx->stop = _input->LT(-1);
    setState(365);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 37, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        if (!_parseListeners.empty())
          triggerExitRuleEvent();
        previousContext = _localctx;
        _localctx = _tracker.createInstance<LandexpContext>(parentContext, parentState);
        pushNewRecursionContext(_localctx, startState, RuleLandexp);
        setState(360);

        if (!(precpred(_ctx, 1))) throw FailedPredicateException(this, "precpred(_ctx, 1)");
        setState(361);
        match(Sysy2022Parser::AND);
        setState(362);
        eqexp(0); 
      }
      setState(367);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 37, _ctx);
    }
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }
  return _localctx;
}

//----------------- LorexpContext ------------------------------------------------------------------

Sysy2022Parser::LorexpContext::LorexpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::LandexpContext* Sysy2022Parser::LorexpContext::landexp() {
  return getRuleContext<Sysy2022Parser::LandexpContext>(0);
}

Sysy2022Parser::LorexpContext* Sysy2022Parser::LorexpContext::lorexp() {
  return getRuleContext<Sysy2022Parser::LorexpContext>(0);
}

tree::TerminalNode* Sysy2022Parser::LorexpContext::OR() {
  return getToken(Sysy2022Parser::OR, 0);
}


size_t Sysy2022Parser::LorexpContext::getRuleIndex() const {
  return Sysy2022Parser::RuleLorexp;
}

antlrcpp::Any Sysy2022Parser::LorexpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitLorexp(this);
  else
    return visitor->visitChildren(this);
}


Sysy2022Parser::LorexpContext* Sysy2022Parser::lorexp() {
   return lorexp(0);
}

Sysy2022Parser::LorexpContext* Sysy2022Parser::lorexp(int precedence) {
  ParserRuleContext *parentContext = _ctx;
  size_t parentState = getState();
  Sysy2022Parser::LorexpContext *_localctx = _tracker.createInstance<LorexpContext>(_ctx, parentState);
  Sysy2022Parser::LorexpContext *previousContext = _localctx;
  (void)previousContext; // Silence compiler, in case the context is not used by generated code.
  size_t startState = 60;
  enterRecursionRule(_localctx, 60, Sysy2022Parser::RuleLorexp, precedence);

    

  auto onExit = finally([=] {
    unrollRecursionContexts(parentContext);
  });
  try {
    size_t alt;
    enterOuterAlt(_localctx, 1);
    setState(369);
    landexp(0);
    _ctx->stop = _input->LT(-1);
    setState(376);
    _errHandler->sync(this);
    alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 38, _ctx);
    while (alt != 2 && alt != atn::ATN::INVALID_ALT_NUMBER) {
      if (alt == 1) {
        if (!_parseListeners.empty())
          triggerExitRuleEvent();
        previousContext = _localctx;
        _localctx = _tracker.createInstance<LorexpContext>(parentContext, parentState);
        pushNewRecursionContext(_localctx, startState, RuleLorexp);
        setState(371);

        if (!(precpred(_ctx, 1))) throw FailedPredicateException(this, "precpred(_ctx, 1)");
        setState(372);
        match(Sysy2022Parser::OR);
        setState(373);
        landexp(0); 
      }
      setState(378);
      _errHandler->sync(this);
      alt = getInterpreter<atn::ParserATNSimulator>()->adaptivePredict(_input, 38, _ctx);
    }
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }
  return _localctx;
}

//----------------- ConstexpContext ------------------------------------------------------------------

Sysy2022Parser::ConstexpContext::ConstexpContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

Sysy2022Parser::AddexpContext* Sysy2022Parser::ConstexpContext::addexp() {
  return getRuleContext<Sysy2022Parser::AddexpContext>(0);
}


size_t Sysy2022Parser::ConstexpContext::getRuleIndex() const {
  return Sysy2022Parser::RuleConstexp;
}

antlrcpp::Any Sysy2022Parser::ConstexpContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<Sysy2022ParserVisitor*>(visitor))
    return parserVisitor->visitConstexp(this);
  else
    return visitor->visitChildren(this);
}

Sysy2022Parser::ConstexpContext* Sysy2022Parser::constexp() {
  ConstexpContext *_localctx = _tracker.createInstance<ConstexpContext>(_ctx, getState());
  enterRule(_localctx, 62, Sysy2022Parser::RuleConstexp);

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(379);
    addexp(0);
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

bool Sysy2022Parser::sempred(RuleContext *context, size_t ruleIndex, size_t predicateIndex) {
  switch (ruleIndex) {
    case 25: return mulexpSempred(dynamic_cast<MulexpContext *>(context), predicateIndex);
    case 26: return addexpSempred(dynamic_cast<AddexpContext *>(context), predicateIndex);
    case 27: return relexpSempred(dynamic_cast<RelexpContext *>(context), predicateIndex);
    case 28: return eqexpSempred(dynamic_cast<EqexpContext *>(context), predicateIndex);
    case 29: return landexpSempred(dynamic_cast<LandexpContext *>(context), predicateIndex);
    case 30: return lorexpSempred(dynamic_cast<LorexpContext *>(context), predicateIndex);

  default:
    break;
  }
  return true;
}

bool Sysy2022Parser::mulexpSempred(MulexpContext *_localctx, size_t predicateIndex) {
  switch (predicateIndex) {
    case 0: return precpred(_ctx, 1);

  default:
    break;
  }
  return true;
}

bool Sysy2022Parser::addexpSempred(AddexpContext *_localctx, size_t predicateIndex) {
  switch (predicateIndex) {
    case 1: return precpred(_ctx, 1);

  default:
    break;
  }
  return true;
}

bool Sysy2022Parser::relexpSempred(RelexpContext *_localctx, size_t predicateIndex) {
  switch (predicateIndex) {
    case 2: return precpred(_ctx, 1);

  default:
    break;
  }
  return true;
}

bool Sysy2022Parser::eqexpSempred(EqexpContext *_localctx, size_t predicateIndex) {
  switch (predicateIndex) {
    case 3: return precpred(_ctx, 1);

  default:
    break;
  }
  return true;
}

bool Sysy2022Parser::landexpSempred(LandexpContext *_localctx, size_t predicateIndex) {
  switch (predicateIndex) {
    case 4: return precpred(_ctx, 1);

  default:
    break;
  }
  return true;
}

bool Sysy2022Parser::lorexpSempred(LorexpContext *_localctx, size_t predicateIndex) {
  switch (predicateIndex) {
    case 5: return precpred(_ctx, 1);

  default:
    break;
  }
  return true;
}

// Static vars and initialization.
std::vector<dfa::DFA> Sysy2022Parser::_decisionToDFA;
atn::PredictionContextCache Sysy2022Parser::_sharedContextCache;

// We own the ATN which in turn owns the ATN states.
atn::ATN Sysy2022Parser::_atn;
std::vector<uint16_t> Sysy2022Parser::_serializedATN;

std::vector<std::string> Sysy2022Parser::_ruleNames = {
  "compunit", "compunitplus", "decl", "constdecl", "btype", "constdef", 
  "constinitval", "vardecl", "vardef", "initval", "funcdef", "functype", 
  "funcfparams", "funcfparam", "block", "blockitem", "stmt", "exp", "cond", 
  "lval", "primaryexp", "number", "unaryexp", "unaryop", "funcrparams", 
  "mulexp", "addexp", "relexp", "eqexp", "landexp", "lorexp", "constexp"
};

std::vector<std::string> Sysy2022Parser::_literalNames = {
  "", "'int'", "'float'", "'void'", "'const'", "'return'", "'if'", "'else'", 
  "'for'", "'while'", "'do'", "'break'", "'continue'", "'('", "')'", "'['", 
  "']'", "'{'", "'}'", "','", "';'", "'?'", "':'", "'-'", "'!'", "", "'='", 
  "'+'", "'*'", "'/'", "'%'", "'&&'", "'||'", "'=='", "'!='", "'<'", "'<='", 
  "'>'", "'>='", "", "", "", "", "", "", "", "", "", "' '"
};

std::vector<std::string> Sysy2022Parser::_symbolicNames = {
  "", "INT", "FLOAT", "VOID", "CONST", "RETURN", "IF", "ELSE", "FOR", "WHILE", 
  "DO", "BREAK", "CONTINUE", "LP", "RP", "LB", "RB", "LC", "RC", "COMMA", 
  "SEMICOLON", "QUESTION", "COLON", "MINUS", "NOT", "TILDE", "ASSIGN", "ADD", 
  "MUL", "DIV", "MOD", "AND", "OR", "EQ", "NE", "LT", "LE", "GT", "GE", 
  "ID", "INT_LIT", "FLOAT_LIT", "LEX_ERR", "NUMS", "ERROR", "Newline", "BlockComment", 
  "LineComment", "Voidplase"
};

dfa::Vocabulary Sysy2022Parser::_vocabulary(_literalNames, _symbolicNames);

std::vector<std::string> Sysy2022Parser::_tokenNames;

Sysy2022Parser::Initializer::Initializer() {
	for (size_t i = 0; i < _symbolicNames.size(); ++i) {
		std::string name = _vocabulary.getLiteralName(i);
		if (name.empty()) {
			name = _vocabulary.getSymbolicName(i);
		}

		if (name.empty()) {
			_tokenNames.push_back("<INVALID>");
		} else {
      _tokenNames.push_back(name);
    }
	}

  _serializedATN = {
    0x3, 0x608b, 0xa72a, 0x8133, 0xb9ed, 0x417c, 0x3be7, 0x7786, 0x5964, 
    0x3, 0x32, 0x180, 0x4, 0x2, 0x9, 0x2, 0x4, 0x3, 0x9, 0x3, 0x4, 0x4, 
    0x9, 0x4, 0x4, 0x5, 0x9, 0x5, 0x4, 0x6, 0x9, 0x6, 0x4, 0x7, 0x9, 0x7, 
    0x4, 0x8, 0x9, 0x8, 0x4, 0x9, 0x9, 0x9, 0x4, 0xa, 0x9, 0xa, 0x4, 0xb, 
    0x9, 0xb, 0x4, 0xc, 0x9, 0xc, 0x4, 0xd, 0x9, 0xd, 0x4, 0xe, 0x9, 0xe, 
    0x4, 0xf, 0x9, 0xf, 0x4, 0x10, 0x9, 0x10, 0x4, 0x11, 0x9, 0x11, 0x4, 
    0x12, 0x9, 0x12, 0x4, 0x13, 0x9, 0x13, 0x4, 0x14, 0x9, 0x14, 0x4, 0x15, 
    0x9, 0x15, 0x4, 0x16, 0x9, 0x16, 0x4, 0x17, 0x9, 0x17, 0x4, 0x18, 0x9, 
    0x18, 0x4, 0x19, 0x9, 0x19, 0x4, 0x1a, 0x9, 0x1a, 0x4, 0x1b, 0x9, 0x1b, 
    0x4, 0x1c, 0x9, 0x1c, 0x4, 0x1d, 0x9, 0x1d, 0x4, 0x1e, 0x9, 0x1e, 0x4, 
    0x1f, 0x9, 0x1f, 0x4, 0x20, 0x9, 0x20, 0x4, 0x21, 0x9, 0x21, 0x3, 0x2, 
    0x3, 0x2, 0x5, 0x2, 0x45, 0xa, 0x2, 0x3, 0x2, 0x3, 0x2, 0x3, 0x2, 0x3, 
    0x2, 0x3, 0x2, 0x5, 0x2, 0x4c, 0xa, 0x2, 0x3, 0x2, 0x3, 0x2, 0x5, 0x2, 
    0x50, 0xa, 0x2, 0x3, 0x3, 0x3, 0x3, 0x5, 0x3, 0x54, 0xa, 0x3, 0x3, 0x3, 
    0x3, 0x3, 0x3, 0x3, 0x5, 0x3, 0x59, 0xa, 0x3, 0x3, 0x4, 0x3, 0x4, 0x5, 
    0x4, 0x5d, 0xa, 0x4, 0x3, 0x5, 0x3, 0x5, 0x3, 0x5, 0x3, 0x5, 0x3, 0x5, 
    0x7, 0x5, 0x64, 0xa, 0x5, 0xc, 0x5, 0xe, 0x5, 0x67, 0xb, 0x5, 0x3, 0x5, 
    0x3, 0x5, 0x3, 0x6, 0x3, 0x6, 0x3, 0x7, 0x3, 0x7, 0x3, 0x7, 0x3, 0x7, 
    0x3, 0x7, 0x7, 0x7, 0x72, 0xa, 0x7, 0xc, 0x7, 0xe, 0x7, 0x75, 0xb, 0x7, 
    0x3, 0x7, 0x3, 0x7, 0x3, 0x7, 0x3, 0x8, 0x3, 0x8, 0x3, 0x8, 0x3, 0x8, 
    0x3, 0x8, 0x7, 0x8, 0x7f, 0xa, 0x8, 0xc, 0x8, 0xe, 0x8, 0x82, 0xb, 0x8, 
    0x5, 0x8, 0x84, 0xa, 0x8, 0x3, 0x8, 0x5, 0x8, 0x87, 0xa, 0x8, 0x3, 0x9, 
    0x3, 0x9, 0x3, 0x9, 0x3, 0x9, 0x7, 0x9, 0x8d, 0xa, 0x9, 0xc, 0x9, 0xe, 
    0x9, 0x90, 0xb, 0x9, 0x3, 0x9, 0x3, 0x9, 0x3, 0xa, 0x3, 0xa, 0x3, 0xa, 
    0x3, 0xa, 0x3, 0xa, 0x7, 0xa, 0x99, 0xa, 0xa, 0xc, 0xa, 0xe, 0xa, 0x9c, 
    0xb, 0xa, 0x3, 0xa, 0x3, 0xa, 0x3, 0xa, 0x3, 0xa, 0x3, 0xa, 0x7, 0xa, 
    0xa3, 0xa, 0xa, 0xc, 0xa, 0xe, 0xa, 0xa6, 0xb, 0xa, 0x3, 0xa, 0x3, 0xa, 
    0x5, 0xa, 0xaa, 0xa, 0xa, 0x3, 0xb, 0x3, 0xb, 0x3, 0xb, 0x3, 0xb, 0x3, 
    0xb, 0x7, 0xb, 0xb1, 0xa, 0xb, 0xc, 0xb, 0xe, 0xb, 0xb4, 0xb, 0xb, 0x5, 
    0xb, 0xb6, 0xa, 0xb, 0x3, 0xb, 0x5, 0xb, 0xb9, 0xa, 0xb, 0x3, 0xc, 0x3, 
    0xc, 0x3, 0xc, 0x3, 0xc, 0x5, 0xc, 0xbf, 0xa, 0xc, 0x3, 0xc, 0x3, 0xc, 
    0x3, 0xc, 0x3, 0xd, 0x3, 0xd, 0x3, 0xe, 0x3, 0xe, 0x3, 0xe, 0x7, 0xe, 
    0xc9, 0xa, 0xe, 0xc, 0xe, 0xe, 0xe, 0xcc, 0xb, 0xe, 0x3, 0xf, 0x3, 0xf, 
    0x3, 0xf, 0x3, 0xf, 0x3, 0xf, 0x3, 0xf, 0x3, 0xf, 0x3, 0xf, 0x7, 0xf, 
    0xd6, 0xa, 0xf, 0xc, 0xf, 0xe, 0xf, 0xd9, 0xb, 0xf, 0x5, 0xf, 0xdb, 
    0xa, 0xf, 0x3, 0x10, 0x3, 0x10, 0x7, 0x10, 0xdf, 0xa, 0x10, 0xc, 0x10, 
    0xe, 0x10, 0xe2, 0xb, 0x10, 0x3, 0x10, 0x3, 0x10, 0x3, 0x11, 0x3, 0x11, 
    0x5, 0x11, 0xe8, 0xa, 0x11, 0x3, 0x12, 0x3, 0x12, 0x3, 0x12, 0x3, 0x12, 
    0x3, 0x12, 0x3, 0x12, 0x5, 0x12, 0xf0, 0xa, 0x12, 0x3, 0x12, 0x3, 0x12, 
    0x3, 0x12, 0x3, 0x12, 0x3, 0x12, 0x3, 0x12, 0x3, 0x12, 0x3, 0x12, 0x3, 
    0x12, 0x5, 0x12, 0xfb, 0xa, 0x12, 0x3, 0x12, 0x3, 0x12, 0x3, 0x12, 0x3, 
    0x12, 0x3, 0x12, 0x3, 0x12, 0x3, 0x12, 0x3, 0x12, 0x3, 0x12, 0x3, 0x12, 
    0x3, 0x12, 0x3, 0x12, 0x5, 0x12, 0x109, 0xa, 0x12, 0x3, 0x12, 0x5, 0x12, 
    0x10c, 0xa, 0x12, 0x3, 0x13, 0x3, 0x13, 0x3, 0x14, 0x3, 0x14, 0x3, 0x15, 
    0x3, 0x15, 0x3, 0x15, 0x3, 0x15, 0x3, 0x15, 0x7, 0x15, 0x117, 0xa, 0x15, 
    0xc, 0x15, 0xe, 0x15, 0x11a, 0xb, 0x15, 0x3, 0x16, 0x3, 0x16, 0x3, 0x16, 
    0x3, 0x16, 0x3, 0x16, 0x3, 0x16, 0x5, 0x16, 0x122, 0xa, 0x16, 0x3, 0x17, 
    0x3, 0x17, 0x3, 0x18, 0x3, 0x18, 0x3, 0x18, 0x3, 0x18, 0x5, 0x18, 0x12a, 
    0xa, 0x18, 0x3, 0x18, 0x3, 0x18, 0x3, 0x18, 0x3, 0x18, 0x5, 0x18, 0x130, 
    0xa, 0x18, 0x3, 0x19, 0x3, 0x19, 0x3, 0x1a, 0x3, 0x1a, 0x3, 0x1a, 0x7, 
    0x1a, 0x137, 0xa, 0x1a, 0xc, 0x1a, 0xe, 0x1a, 0x13a, 0xb, 0x1a, 0x3, 
    0x1b, 0x3, 0x1b, 0x3, 0x1b, 0x3, 0x1b, 0x3, 0x1b, 0x3, 0x1b, 0x7, 0x1b, 
    0x142, 0xa, 0x1b, 0xc, 0x1b, 0xe, 0x1b, 0x145, 0xb, 0x1b, 0x3, 0x1c, 
    0x3, 0x1c, 0x3, 0x1c, 0x3, 0x1c, 0x3, 0x1c, 0x3, 0x1c, 0x7, 0x1c, 0x14d, 
    0xa, 0x1c, 0xc, 0x1c, 0xe, 0x1c, 0x150, 0xb, 0x1c, 0x3, 0x1d, 0x3, 0x1d, 
    0x3, 0x1d, 0x3, 0x1d, 0x3, 0x1d, 0x3, 0x1d, 0x7, 0x1d, 0x158, 0xa, 0x1d, 
    0xc, 0x1d, 0xe, 0x1d, 0x15b, 0xb, 0x1d, 0x3, 0x1e, 0x3, 0x1e, 0x3, 0x1e, 
    0x3, 0x1e, 0x3, 0x1e, 0x3, 0x1e, 0x7, 0x1e, 0x163, 0xa, 0x1e, 0xc, 0x1e, 
    0xe, 0x1e, 0x166, 0xb, 0x1e, 0x3, 0x1f, 0x3, 0x1f, 0x3, 0x1f, 0x3, 0x1f, 
    0x3, 0x1f, 0x3, 0x1f, 0x7, 0x1f, 0x16e, 0xa, 0x1f, 0xc, 0x1f, 0xe, 0x1f, 
    0x171, 0xb, 0x1f, 0x3, 0x20, 0x3, 0x20, 0x3, 0x20, 0x3, 0x20, 0x3, 0x20, 
    0x3, 0x20, 0x7, 0x20, 0x179, 0xa, 0x20, 0xc, 0x20, 0xe, 0x20, 0x17c, 
    0xb, 0x20, 0x3, 0x21, 0x3, 0x21, 0x3, 0x21, 0x2, 0x8, 0x34, 0x36, 0x38, 
    0x3a, 0x3c, 0x3e, 0x22, 0x2, 0x4, 0x6, 0x8, 0xa, 0xc, 0xe, 0x10, 0x12, 
    0x14, 0x16, 0x18, 0x1a, 0x1c, 0x1e, 0x20, 0x22, 0x24, 0x26, 0x28, 0x2a, 
    0x2c, 0x2e, 0x30, 0x32, 0x34, 0x36, 0x38, 0x3a, 0x3c, 0x3e, 0x40, 0x2, 
    0xa, 0x3, 0x2, 0x3, 0x4, 0x3, 0x2, 0x3, 0x5, 0x3, 0x2, 0x2a, 0x2b, 0x4, 
    0x2, 0x19, 0x1a, 0x1d, 0x1d, 0x3, 0x2, 0x1e, 0x20, 0x4, 0x2, 0x19, 0x19, 
    0x1d, 0x1d, 0x3, 0x2, 0x25, 0x28, 0x3, 0x2, 0x23, 0x24, 0x2, 0x18e, 
    0x2, 0x4f, 0x3, 0x2, 0x2, 0x2, 0x4, 0x58, 0x3, 0x2, 0x2, 0x2, 0x6, 0x5c, 
    0x3, 0x2, 0x2, 0x2, 0x8, 0x5e, 0x3, 0x2, 0x2, 0x2, 0xa, 0x6a, 0x3, 0x2, 
    0x2, 0x2, 0xc, 0x6c, 0x3, 0x2, 0x2, 0x2, 0xe, 0x86, 0x3, 0x2, 0x2, 0x2, 
    0x10, 0x88, 0x3, 0x2, 0x2, 0x2, 0x12, 0xa9, 0x3, 0x2, 0x2, 0x2, 0x14, 
    0xb8, 0x3, 0x2, 0x2, 0x2, 0x16, 0xba, 0x3, 0x2, 0x2, 0x2, 0x18, 0xc3, 
    0x3, 0x2, 0x2, 0x2, 0x1a, 0xc5, 0x3, 0x2, 0x2, 0x2, 0x1c, 0xcd, 0x3, 
    0x2, 0x2, 0x2, 0x1e, 0xdc, 0x3, 0x2, 0x2, 0x2, 0x20, 0xe7, 0x3, 0x2, 
    0x2, 0x2, 0x22, 0x10b, 0x3, 0x2, 0x2, 0x2, 0x24, 0x10d, 0x3, 0x2, 0x2, 
    0x2, 0x26, 0x10f, 0x3, 0x2, 0x2, 0x2, 0x28, 0x111, 0x3, 0x2, 0x2, 0x2, 
    0x2a, 0x121, 0x3, 0x2, 0x2, 0x2, 0x2c, 0x123, 0x3, 0x2, 0x2, 0x2, 0x2e, 
    0x12f, 0x3, 0x2, 0x2, 0x2, 0x30, 0x131, 0x3, 0x2, 0x2, 0x2, 0x32, 0x133, 
    0x3, 0x2, 0x2, 0x2, 0x34, 0x13b, 0x3, 0x2, 0x2, 0x2, 0x36, 0x146, 0x3, 
    0x2, 0x2, 0x2, 0x38, 0x151, 0x3, 0x2, 0x2, 0x2, 0x3a, 0x15c, 0x3, 0x2, 
    0x2, 0x2, 0x3c, 0x167, 0x3, 0x2, 0x2, 0x2, 0x3e, 0x172, 0x3, 0x2, 0x2, 
    0x2, 0x40, 0x17d, 0x3, 0x2, 0x2, 0x2, 0x42, 0x45, 0x5, 0x6, 0x4, 0x2, 
    0x43, 0x45, 0x5, 0x16, 0xc, 0x2, 0x44, 0x42, 0x3, 0x2, 0x2, 0x2, 0x44, 
    0x43, 0x3, 0x2, 0x2, 0x2, 0x45, 0x46, 0x3, 0x2, 0x2, 0x2, 0x46, 0x47, 
    0x5, 0x4, 0x3, 0x2, 0x47, 0x48, 0x7, 0x2, 0x2, 0x3, 0x48, 0x50, 0x3, 
    0x2, 0x2, 0x2, 0x49, 0x4c, 0x5, 0x6, 0x4, 0x2, 0x4a, 0x4c, 0x5, 0x16, 
    0xc, 0x2, 0x4b, 0x49, 0x3, 0x2, 0x2, 0x2, 0x4b, 0x4a, 0x3, 0x2, 0x2, 
    0x2, 0x4c, 0x4d, 0x3, 0x2, 0x2, 0x2, 0x4d, 0x4e, 0x7, 0x2, 0x2, 0x3, 
    0x4e, 0x50, 0x3, 0x2, 0x2, 0x2, 0x4f, 0x44, 0x3, 0x2, 0x2, 0x2, 0x4f, 
    0x4b, 0x3, 0x2, 0x2, 0x2, 0x50, 0x3, 0x3, 0x2, 0x2, 0x2, 0x51, 0x54, 
    0x5, 0x6, 0x4, 0x2, 0x52, 0x54, 0x5, 0x16, 0xc, 0x2, 0x53, 0x51, 0x3, 
    0x2, 0x2, 0x2, 0x53, 0x52, 0x3, 0x2, 0x2, 0x2, 0x54, 0x55, 0x3, 0x2, 
    0x2, 0x2, 0x55, 0x56, 0x5, 0x4, 0x3, 0x2, 0x56, 0x59, 0x3, 0x2, 0x2, 
    0x2, 0x57, 0x59, 0x3, 0x2, 0x2, 0x2, 0x58, 0x53, 0x3, 0x2, 0x2, 0x2, 
    0x58, 0x57, 0x3, 0x2, 0x2, 0x2, 0x59, 0x5, 0x3, 0x2, 0x2, 0x2, 0x5a, 
    0x5d, 0x5, 0x8, 0x5, 0x2, 0x5b, 0x5d, 0x5, 0x10, 0x9, 0x2, 0x5c, 0x5a, 
    0x3, 0x2, 0x2, 0x2, 0x5c, 0x5b, 0x3, 0x2, 0x2, 0x2, 0x5d, 0x7, 0x3, 
    0x2, 0x2, 0x2, 0x5e, 0x5f, 0x7, 0x6, 0x2, 0x2, 0x5f, 0x60, 0x5, 0xa, 
    0x6, 0x2, 0x60, 0x65, 0x5, 0xc, 0x7, 0x2, 0x61, 0x62, 0x7, 0x15, 0x2, 
    0x2, 0x62, 0x64, 0x5, 0xc, 0x7, 0x2, 0x63, 0x61, 0x3, 0x2, 0x2, 0x2, 
    0x64, 0x67, 0x3, 0x2, 0x2, 0x2, 0x65, 0x63, 0x3, 0x2, 0x2, 0x2, 0x65, 
    0x66, 0x3, 0x2, 0x2, 0x2, 0x66, 0x68, 0x3, 0x2, 0x2, 0x2, 0x67, 0x65, 
    0x3, 0x2, 0x2, 0x2, 0x68, 0x69, 0x7, 0x16, 0x2, 0x2, 0x69, 0x9, 0x3, 
    0x2, 0x2, 0x2, 0x6a, 0x6b, 0x9, 0x2, 0x2, 0x2, 0x6b, 0xb, 0x3, 0x2, 
    0x2, 0x2, 0x6c, 0x73, 0x7, 0x29, 0x2, 0x2, 0x6d, 0x6e, 0x7, 0x11, 0x2, 
    0x2, 0x6e, 0x6f, 0x5, 0x40, 0x21, 0x2, 0x6f, 0x70, 0x7, 0x12, 0x2, 0x2, 
    0x70, 0x72, 0x3, 0x2, 0x2, 0x2, 0x71, 0x6d, 0x3, 0x2, 0x2, 0x2, 0x72, 
    0x75, 0x3, 0x2, 0x2, 0x2, 0x73, 0x71, 0x3, 0x2, 0x2, 0x2, 0x73, 0x74, 
    0x3, 0x2, 0x2, 0x2, 0x74, 0x76, 0x3, 0x2, 0x2, 0x2, 0x75, 0x73, 0x3, 
    0x2, 0x2, 0x2, 0x76, 0x77, 0x7, 0x1c, 0x2, 0x2, 0x77, 0x78, 0x5, 0xe, 
    0x8, 0x2, 0x78, 0xd, 0x3, 0x2, 0x2, 0x2, 0x79, 0x87, 0x5, 0x40, 0x21, 
    0x2, 0x7a, 0x83, 0x7, 0x13, 0x2, 0x2, 0x7b, 0x80, 0x5, 0xe, 0x8, 0x2, 
    0x7c, 0x7d, 0x7, 0x15, 0x2, 0x2, 0x7d, 0x7f, 0x5, 0xe, 0x8, 0x2, 0x7e, 
    0x7c, 0x3, 0x2, 0x2, 0x2, 0x7f, 0x82, 0x3, 0x2, 0x2, 0x2, 0x80, 0x7e, 
    0x3, 0x2, 0x2, 0x2, 0x80, 0x81, 0x3, 0x2, 0x2, 0x2, 0x81, 0x84, 0x3, 
    0x2, 0x2, 0x2, 0x82, 0x80, 0x3, 0x2, 0x2, 0x2, 0x83, 0x7b, 0x3, 0x2, 
    0x2, 0x2, 0x83, 0x84, 0x3, 0x2, 0x2, 0x2, 0x84, 0x85, 0x3, 0x2, 0x2, 
    0x2, 0x85, 0x87, 0x7, 0x14, 0x2, 0x2, 0x86, 0x79, 0x3, 0x2, 0x2, 0x2, 
    0x86, 0x7a, 0x3, 0x2, 0x2, 0x2, 0x87, 0xf, 0x3, 0x2, 0x2, 0x2, 0x88, 
    0x89, 0x5, 0xa, 0x6, 0x2, 0x89, 0x8e, 0x5, 0x12, 0xa, 0x2, 0x8a, 0x8b, 
    0x7, 0x15, 0x2, 0x2, 0x8b, 0x8d, 0x5, 0x12, 0xa, 0x2, 0x8c, 0x8a, 0x3, 
    0x2, 0x2, 0x2, 0x8d, 0x90, 0x3, 0x2, 0x2, 0x2, 0x8e, 0x8c, 0x3, 0x2, 
    0x2, 0x2, 0x8e, 0x8f, 0x3, 0x2, 0x2, 0x2, 0x8f, 0x91, 0x3, 0x2, 0x2, 
    0x2, 0x90, 0x8e, 0x3, 0x2, 0x2, 0x2, 0x91, 0x92, 0x7, 0x16, 0x2, 0x2, 
    0x92, 0x11, 0x3, 0x2, 0x2, 0x2, 0x93, 0x9a, 0x7, 0x29, 0x2, 0x2, 0x94, 
    0x95, 0x7, 0x11, 0x2, 0x2, 0x95, 0x96, 0x5, 0x40, 0x21, 0x2, 0x96, 0x97, 
    0x7, 0x12, 0x2, 0x2, 0x97, 0x99, 0x3, 0x2, 0x2, 0x2, 0x98, 0x94, 0x3, 
    0x2, 0x2, 0x2, 0x99, 0x9c, 0x3, 0x2, 0x2, 0x2, 0x9a, 0x98, 0x3, 0x2, 
    0x2, 0x2, 0x9a, 0x9b, 0x3, 0x2, 0x2, 0x2, 0x9b, 0xaa, 0x3, 0x2, 0x2, 
    0x2, 0x9c, 0x9a, 0x3, 0x2, 0x2, 0x2, 0x9d, 0xa4, 0x7, 0x29, 0x2, 0x2, 
    0x9e, 0x9f, 0x7, 0x11, 0x2, 0x2, 0x9f, 0xa0, 0x5, 0x40, 0x21, 0x2, 0xa0, 
    0xa1, 0x7, 0x12, 0x2, 0x2, 0xa1, 0xa3, 0x3, 0x2, 0x2, 0x2, 0xa2, 0x9e, 
    0x3, 0x2, 0x2, 0x2, 0xa3, 0xa6, 0x3, 0x2, 0x2, 0x2, 0xa4, 0xa2, 0x3, 
    0x2, 0x2, 0x2, 0xa4, 0xa5, 0x3, 0x2, 0x2, 0x2, 0xa5, 0xa7, 0x3, 0x2, 
    0x2, 0x2, 0xa6, 0xa4, 0x3, 0x2, 0x2, 0x2, 0xa7, 0xa8, 0x7, 0x1c, 0x2, 
    0x2, 0xa8, 0xaa, 0x5, 0x14, 0xb, 0x2, 0xa9, 0x93, 0x3, 0x2, 0x2, 0x2, 
    0xa9, 0x9d, 0x3, 0x2, 0x2, 0x2, 0xaa, 0x13, 0x3, 0x2, 0x2, 0x2, 0xab, 
    0xb9, 0x5, 0x24, 0x13, 0x2, 0xac, 0xb5, 0x7, 0x13, 0x2, 0x2, 0xad, 0xb2, 
    0x5, 0x14, 0xb, 0x2, 0xae, 0xaf, 0x7, 0x15, 0x2, 0x2, 0xaf, 0xb1, 0x5, 
    0x14, 0xb, 0x2, 0xb0, 0xae, 0x3, 0x2, 0x2, 0x2, 0xb1, 0xb4, 0x3, 0x2, 
    0x2, 0x2, 0xb2, 0xb0, 0x3, 0x2, 0x2, 0x2, 0xb2, 0xb3, 0x3, 0x2, 0x2, 
    0x2, 0xb3, 0xb6, 0x3, 0x2, 0x2, 0x2, 0xb4, 0xb2, 0x3, 0x2, 0x2, 0x2, 
    0xb5, 0xad, 0x3, 0x2, 0x2, 0x2, 0xb5, 0xb6, 0x3, 0x2, 0x2, 0x2, 0xb6, 
    0xb7, 0x3, 0x2, 0x2, 0x2, 0xb7, 0xb9, 0x7, 0x14, 0x2, 0x2, 0xb8, 0xab, 
    0x3, 0x2, 0x2, 0x2, 0xb8, 0xac, 0x3, 0x2, 0x2, 0x2, 0xb9, 0x15, 0x3, 
    0x2, 0x2, 0x2, 0xba, 0xbb, 0x5, 0x18, 0xd, 0x2, 0xbb, 0xbc, 0x7, 0x29, 
    0x2, 0x2, 0xbc, 0xbe, 0x7, 0xf, 0x2, 0x2, 0xbd, 0xbf, 0x5, 0x1a, 0xe, 
    0x2, 0xbe, 0xbd, 0x3, 0x2, 0x2, 0x2, 0xbe, 0xbf, 0x3, 0x2, 0x2, 0x2, 
    0xbf, 0xc0, 0x3, 0x2, 0x2, 0x2, 0xc0, 0xc1, 0x7, 0x10, 0x2, 0x2, 0xc1, 
    0xc2, 0x5, 0x1e, 0x10, 0x2, 0xc2, 0x17, 0x3, 0x2, 0x2, 0x2, 0xc3, 0xc4, 
    0x9, 0x3, 0x2, 0x2, 0xc4, 0x19, 0x3, 0x2, 0x2, 0x2, 0xc5, 0xca, 0x5, 
    0x1c, 0xf, 0x2, 0xc6, 0xc7, 0x7, 0x15, 0x2, 0x2, 0xc7, 0xc9, 0x5, 0x1c, 
    0xf, 0x2, 0xc8, 0xc6, 0x3, 0x2, 0x2, 0x2, 0xc9, 0xcc, 0x3, 0x2, 0x2, 
    0x2, 0xca, 0xc8, 0x3, 0x2, 0x2, 0x2, 0xca, 0xcb, 0x3, 0x2, 0x2, 0x2, 
    0xcb, 0x1b, 0x3, 0x2, 0x2, 0x2, 0xcc, 0xca, 0x3, 0x2, 0x2, 0x2, 0xcd, 
    0xce, 0x5, 0xa, 0x6, 0x2, 0xce, 0xda, 0x7, 0x29, 0x2, 0x2, 0xcf, 0xd0, 
    0x7, 0x11, 0x2, 0x2, 0xd0, 0xd7, 0x7, 0x12, 0x2, 0x2, 0xd1, 0xd2, 0x7, 
    0x11, 0x2, 0x2, 0xd2, 0xd3, 0x5, 0x24, 0x13, 0x2, 0xd3, 0xd4, 0x7, 0x12, 
    0x2, 0x2, 0xd4, 0xd6, 0x3, 0x2, 0x2, 0x2, 0xd5, 0xd1, 0x3, 0x2, 0x2, 
    0x2, 0xd6, 0xd9, 0x3, 0x2, 0x2, 0x2, 0xd7, 0xd5, 0x3, 0x2, 0x2, 0x2, 
    0xd7, 0xd8, 0x3, 0x2, 0x2, 0x2, 0xd8, 0xdb, 0x3, 0x2, 0x2, 0x2, 0xd9, 
    0xd7, 0x3, 0x2, 0x2, 0x2, 0xda, 0xcf, 0x3, 0x2, 0x2, 0x2, 0xda, 0xdb, 
    0x3, 0x2, 0x2, 0x2, 0xdb, 0x1d, 0x3, 0x2, 0x2, 0x2, 0xdc, 0xe0, 0x7, 
    0x13, 0x2, 0x2, 0xdd, 0xdf, 0x5, 0x20, 0x11, 0x2, 0xde, 0xdd, 0x3, 0x2, 
    0x2, 0x2, 0xdf, 0xe2, 0x3, 0x2, 0x2, 0x2, 0xe0, 0xde, 0x3, 0x2, 0x2, 
    0x2, 0xe0, 0xe1, 0x3, 0x2, 0x2, 0x2, 0xe1, 0xe3, 0x3, 0x2, 0x2, 0x2, 
    0xe2, 0xe0, 0x3, 0x2, 0x2, 0x2, 0xe3, 0xe4, 0x7, 0x14, 0x2, 0x2, 0xe4, 
    0x1f, 0x3, 0x2, 0x2, 0x2, 0xe5, 0xe8, 0x5, 0x6, 0x4, 0x2, 0xe6, 0xe8, 
    0x5, 0x22, 0x12, 0x2, 0xe7, 0xe5, 0x3, 0x2, 0x2, 0x2, 0xe7, 0xe6, 0x3, 
    0x2, 0x2, 0x2, 0xe8, 0x21, 0x3, 0x2, 0x2, 0x2, 0xe9, 0xea, 0x5, 0x28, 
    0x15, 0x2, 0xea, 0xeb, 0x7, 0x1c, 0x2, 0x2, 0xeb, 0xec, 0x5, 0x24, 0x13, 
    0x2, 0xec, 0xed, 0x7, 0x16, 0x2, 0x2, 0xed, 0x10c, 0x3, 0x2, 0x2, 0x2, 
    0xee, 0xf0, 0x5, 0x24, 0x13, 0x2, 0xef, 0xee, 0x3, 0x2, 0x2, 0x2, 0xef, 
    0xf0, 0x3, 0x2, 0x2, 0x2, 0xf0, 0xf1, 0x3, 0x2, 0x2, 0x2, 0xf1, 0x10c, 
    0x7, 0x16, 0x2, 0x2, 0xf2, 0x10c, 0x5, 0x1e, 0x10, 0x2, 0xf3, 0xf4, 
    0x7, 0x8, 0x2, 0x2, 0xf4, 0xf5, 0x7, 0xf, 0x2, 0x2, 0xf5, 0xf6, 0x5, 
    0x26, 0x14, 0x2, 0xf6, 0xf7, 0x7, 0x10, 0x2, 0x2, 0xf7, 0xfa, 0x5, 0x22, 
    0x12, 0x2, 0xf8, 0xf9, 0x7, 0x9, 0x2, 0x2, 0xf9, 0xfb, 0x5, 0x22, 0x12, 
    0x2, 0xfa, 0xf8, 0x3, 0x2, 0x2, 0x2, 0xfa, 0xfb, 0x3, 0x2, 0x2, 0x2, 
    0xfb, 0x10c, 0x3, 0x2, 0x2, 0x2, 0xfc, 0xfd, 0x7, 0xb, 0x2, 0x2, 0xfd, 
    0xfe, 0x7, 0xf, 0x2, 0x2, 0xfe, 0xff, 0x5, 0x26, 0x14, 0x2, 0xff, 0x100, 
    0x7, 0x10, 0x2, 0x2, 0x100, 0x101, 0x5, 0x22, 0x12, 0x2, 0x101, 0x10c, 
    0x3, 0x2, 0x2, 0x2, 0x102, 0x103, 0x7, 0xd, 0x2, 0x2, 0x103, 0x10c, 
    0x7, 0x16, 0x2, 0x2, 0x104, 0x105, 0x7, 0xe, 0x2, 0x2, 0x105, 0x10c, 
    0x7, 0x16, 0x2, 0x2, 0x106, 0x108, 0x7, 0x7, 0x2, 0x2, 0x107, 0x109, 
    0x5, 0x24, 0x13, 0x2, 0x108, 0x107, 0x3, 0x2, 0x2, 0x2, 0x108, 0x109, 
    0x3, 0x2, 0x2, 0x2, 0x109, 0x10a, 0x3, 0x2, 0x2, 0x2, 0x10a, 0x10c, 
    0x7, 0x16, 0x2, 0x2, 0x10b, 0xe9, 0x3, 0x2, 0x2, 0x2, 0x10b, 0xef, 0x3, 
    0x2, 0x2, 0x2, 0x10b, 0xf2, 0x3, 0x2, 0x2, 0x2, 0x10b, 0xf3, 0x3, 0x2, 
    0x2, 0x2, 0x10b, 0xfc, 0x3, 0x2, 0x2, 0x2, 0x10b, 0x102, 0x3, 0x2, 0x2, 
    0x2, 0x10b, 0x104, 0x3, 0x2, 0x2, 0x2, 0x10b, 0x106, 0x3, 0x2, 0x2, 
    0x2, 0x10c, 0x23, 0x3, 0x2, 0x2, 0x2, 0x10d, 0x10e, 0x5, 0x36, 0x1c, 
    0x2, 0x10e, 0x25, 0x3, 0x2, 0x2, 0x2, 0x10f, 0x110, 0x5, 0x3e, 0x20, 
    0x2, 0x110, 0x27, 0x3, 0x2, 0x2, 0x2, 0x111, 0x118, 0x7, 0x29, 0x2, 
    0x2, 0x112, 0x113, 0x7, 0x11, 0x2, 0x2, 0x113, 0x114, 0x5, 0x24, 0x13, 
    0x2, 0x114, 0x115, 0x7, 0x12, 0x2, 0x2, 0x115, 0x117, 0x3, 0x2, 0x2, 
    0x2, 0x116, 0x112, 0x3, 0x2, 0x2, 0x2, 0x117, 0x11a, 0x3, 0x2, 0x2, 
    0x2, 0x118, 0x116, 0x3, 0x2, 0x2, 0x2, 0x118, 0x119, 0x3, 0x2, 0x2, 
    0x2, 0x119, 0x29, 0x3, 0x2, 0x2, 0x2, 0x11a, 0x118, 0x3, 0x2, 0x2, 0x2, 
    0x11b, 0x11c, 0x7, 0xf, 0x2, 0x2, 0x11c, 0x11d, 0x5, 0x24, 0x13, 0x2, 
    0x11d, 0x11e, 0x7, 0x10, 0x2, 0x2, 0x11e, 0x122, 0x3, 0x2, 0x2, 0x2, 
    0x11f, 0x122, 0x5, 0x28, 0x15, 0x2, 0x120, 0x122, 0x5, 0x2c, 0x17, 0x2, 
    0x121, 0x11b, 0x3, 0x2, 0x2, 0x2, 0x121, 0x11f, 0x3, 0x2, 0x2, 0x2, 
    0x121, 0x120, 0x3, 0x2, 0x2, 0x2, 0x122, 0x2b, 0x3, 0x2, 0x2, 0x2, 0x123, 
    0x124, 0x9, 0x4, 0x2, 0x2, 0x124, 0x2d, 0x3, 0x2, 0x2, 0x2, 0x125, 0x130, 
    0x5, 0x2a, 0x16, 0x2, 0x126, 0x127, 0x7, 0x29, 0x2, 0x2, 0x127, 0x129, 
    0x7, 0xf, 0x2, 0x2, 0x128, 0x12a, 0x5, 0x32, 0x1a, 0x2, 0x129, 0x128, 
    0x3, 0x2, 0x2, 0x2, 0x129, 0x12a, 0x3, 0x2, 0x2, 0x2, 0x12a, 0x12b, 
    0x3, 0x2, 0x2, 0x2, 0x12b, 0x130, 0x7, 0x10, 0x2, 0x2, 0x12c, 0x12d, 
    0x5, 0x30, 0x19, 0x2, 0x12d, 0x12e, 0x5, 0x2e, 0x18, 0x2, 0x12e, 0x130, 
    0x3, 0x2, 0x2, 0x2, 0x12f, 0x125, 0x3, 0x2, 0x2, 0x2, 0x12f, 0x126, 
    0x3, 0x2, 0x2, 0x2, 0x12f, 0x12c, 0x3, 0x2, 0x2, 0x2, 0x130, 0x2f, 0x3, 
    0x2, 0x2, 0x2, 0x131, 0x132, 0x9, 0x5, 0x2, 0x2, 0x132, 0x31, 0x3, 0x2, 
    0x2, 0x2, 0x133, 0x138, 0x5, 0x24, 0x13, 0x2, 0x134, 0x135, 0x7, 0x15, 
    0x2, 0x2, 0x135, 0x137, 0x5, 0x24, 0x13, 0x2, 0x136, 0x134, 0x3, 0x2, 
    0x2, 0x2, 0x137, 0x13a, 0x3, 0x2, 0x2, 0x2, 0x138, 0x136, 0x3, 0x2, 
    0x2, 0x2, 0x138, 0x139, 0x3, 0x2, 0x2, 0x2, 0x139, 0x33, 0x3, 0x2, 0x2, 
    0x2, 0x13a, 0x138, 0x3, 0x2, 0x2, 0x2, 0x13b, 0x13c, 0x8, 0x1b, 0x1, 
    0x2, 0x13c, 0x13d, 0x5, 0x2e, 0x18, 0x2, 0x13d, 0x143, 0x3, 0x2, 0x2, 
    0x2, 0x13e, 0x13f, 0xc, 0x3, 0x2, 0x2, 0x13f, 0x140, 0x9, 0x6, 0x2, 
    0x2, 0x140, 0x142, 0x5, 0x2e, 0x18, 0x2, 0x141, 0x13e, 0x3, 0x2, 0x2, 
    0x2, 0x142, 0x145, 0x3, 0x2, 0x2, 0x2, 0x143, 0x141, 0x3, 0x2, 0x2, 
    0x2, 0x143, 0x144, 0x3, 0x2, 0x2, 0x2, 0x144, 0x35, 0x3, 0x2, 0x2, 0x2, 
    0x145, 0x143, 0x3, 0x2, 0x2, 0x2, 0x146, 0x147, 0x8, 0x1c, 0x1, 0x2, 
    0x147, 0x148, 0x5, 0x34, 0x1b, 0x2, 0x148, 0x14e, 0x3, 0x2, 0x2, 0x2, 
    0x149, 0x14a, 0xc, 0x3, 0x2, 0x2, 0x14a, 0x14b, 0x9, 0x7, 0x2, 0x2, 
    0x14b, 0x14d, 0x5, 0x34, 0x1b, 0x2, 0x14c, 0x149, 0x3, 0x2, 0x2, 0x2, 
    0x14d, 0x150, 0x3, 0x2, 0x2, 0x2, 0x14e, 0x14c, 0x3, 0x2, 0x2, 0x2, 
    0x14e, 0x14f, 0x3, 0x2, 0x2, 0x2, 0x14f, 0x37, 0x3, 0x2, 0x2, 0x2, 0x150, 
    0x14e, 0x3, 0x2, 0x2, 0x2, 0x151, 0x152, 0x8, 0x1d, 0x1, 0x2, 0x152, 
    0x153, 0x5, 0x36, 0x1c, 0x2, 0x153, 0x159, 0x3, 0x2, 0x2, 0x2, 0x154, 
    0x155, 0xc, 0x3, 0x2, 0x2, 0x155, 0x156, 0x9, 0x8, 0x2, 0x2, 0x156, 
    0x158, 0x5, 0x36, 0x1c, 0x2, 0x157, 0x154, 0x3, 0x2, 0x2, 0x2, 0x158, 
    0x15b, 0x3, 0x2, 0x2, 0x2, 0x159, 0x157, 0x3, 0x2, 0x2, 0x2, 0x159, 
    0x15a, 0x3, 0x2, 0x2, 0x2, 0x15a, 0x39, 0x3, 0x2, 0x2, 0x2, 0x15b, 0x159, 
    0x3, 0x2, 0x2, 0x2, 0x15c, 0x15d, 0x8, 0x1e, 0x1, 0x2, 0x15d, 0x15e, 
    0x5, 0x38, 0x1d, 0x2, 0x15e, 0x164, 0x3, 0x2, 0x2, 0x2, 0x15f, 0x160, 
    0xc, 0x3, 0x2, 0x2, 0x160, 0x161, 0x9, 0x9, 0x2, 0x2, 0x161, 0x163, 
    0x5, 0x38, 0x1d, 0x2, 0x162, 0x15f, 0x3, 0x2, 0x2, 0x2, 0x163, 0x166, 
    0x3, 0x2, 0x2, 0x2, 0x164, 0x162, 0x3, 0x2, 0x2, 0x2, 0x164, 0x165, 
    0x3, 0x2, 0x2, 0x2, 0x165, 0x3b, 0x3, 0x2, 0x2, 0x2, 0x166, 0x164, 0x3, 
    0x2, 0x2, 0x2, 0x167, 0x168, 0x8, 0x1f, 0x1, 0x2, 0x168, 0x169, 0x5, 
    0x3a, 0x1e, 0x2, 0x169, 0x16f, 0x3, 0x2, 0x2, 0x2, 0x16a, 0x16b, 0xc, 
    0x3, 0x2, 0x2, 0x16b, 0x16c, 0x7, 0x21, 0x2, 0x2, 0x16c, 0x16e, 0x5, 
    0x3a, 0x1e, 0x2, 0x16d, 0x16a, 0x3, 0x2, 0x2, 0x2, 0x16e, 0x171, 0x3, 
    0x2, 0x2, 0x2, 0x16f, 0x16d, 0x3, 0x2, 0x2, 0x2, 0x16f, 0x170, 0x3, 
    0x2, 0x2, 0x2, 0x170, 0x3d, 0x3, 0x2, 0x2, 0x2, 0x171, 0x16f, 0x3, 0x2, 
    0x2, 0x2, 0x172, 0x173, 0x8, 0x20, 0x1, 0x2, 0x173, 0x174, 0x5, 0x3c, 
    0x1f, 0x2, 0x174, 0x17a, 0x3, 0x2, 0x2, 0x2, 0x175, 0x176, 0xc, 0x3, 
    0x2, 0x2, 0x176, 0x177, 0x7, 0x22, 0x2, 0x2, 0x177, 0x179, 0x5, 0x3c, 
    0x1f, 0x2, 0x178, 0x175, 0x3, 0x2, 0x2, 0x2, 0x179, 0x17c, 0x3, 0x2, 
    0x2, 0x2, 0x17a, 0x178, 0x3, 0x2, 0x2, 0x2, 0x17a, 0x17b, 0x3, 0x2, 
    0x2, 0x2, 0x17b, 0x3f, 0x3, 0x2, 0x2, 0x2, 0x17c, 0x17a, 0x3, 0x2, 0x2, 
    0x2, 0x17d, 0x17e, 0x5, 0x36, 0x1c, 0x2, 0x17e, 0x41, 0x3, 0x2, 0x2, 
    0x2, 0x29, 0x44, 0x4b, 0x4f, 0x53, 0x58, 0x5c, 0x65, 0x73, 0x80, 0x83, 
    0x86, 0x8e, 0x9a, 0xa4, 0xa9, 0xb2, 0xb5, 0xb8, 0xbe, 0xca, 0xd7, 0xda, 
    0xe0, 0xe7, 0xef, 0xfa, 0x108, 0x10b, 0x118, 0x121, 0x129, 0x12f, 0x138, 
    0x143, 0x14e, 0x159, 0x164, 0x16f, 0x17a, 
  };

  atn::ATNDeserializer deserializer;
  _atn = deserializer.deserialize(_serializedATN);

  size_t count = _atn.getNumberOfDecisions();
  _decisionToDFA.reserve(count);
  for (size_t i = 0; i < count; i++) { 
    _decisionToDFA.emplace_back(_atn.getDecisionState(i), i);
  }
}

Sysy2022Parser::Initializer Sysy2022Parser::_init;
