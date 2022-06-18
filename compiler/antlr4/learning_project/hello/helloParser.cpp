
// Generated from hello.g4 by ANTLR 4.9.3


#include "helloVisitor.h"

#include "helloParser.h"


using namespace antlrcpp;
using namespace antlr4;

helloParser::helloParser(TokenStream *input) : Parser(input) {
  _interpreter = new atn::ParserATNSimulator(this, _atn, _decisionToDFA, _sharedContextCache);
}

helloParser::~helloParser() {
  delete _interpreter;
}

std::string helloParser::getGrammarFileName() const {
  return "hello.g4";
}

const std::vector<std::string>& helloParser::getRuleNames() const {
  return _ruleNames;
}

dfa::Vocabulary& helloParser::getVocabulary() const {
  return _vocabulary;
}


//----------------- RContext ------------------------------------------------------------------

helloParser::RContext::RContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

std::vector<tree::TerminalNode *> helloParser::RContext::ID() {
  return getTokens(helloParser::ID);
}

tree::TerminalNode* helloParser::RContext::ID(size_t i) {
  return getToken(helloParser::ID, i);
}


size_t helloParser::RContext::getRuleIndex() const {
  return helloParser::RuleR;
}


antlrcpp::Any helloParser::RContext::accept(tree::ParseTreeVisitor *visitor) {
  if (auto parserVisitor = dynamic_cast<helloVisitor*>(visitor))
    return parserVisitor->visitR(this);
  else
    return visitor->visitChildren(this);
}

helloParser::RContext* helloParser::r() {
  RContext *_localctx = _tracker.createInstance<RContext>(_ctx, getState());
  enterRule(_localctx, 0, helloParser::RuleR);
  size_t _la = 0;

#if __cplusplus > 201703L
  auto onExit = finally([=, this] {
#else
  auto onExit = finally([=] {
#endif
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(2);
    match(helloParser::T__0);
    setState(6);
    _errHandler->sync(this);
    _la = _input->LA(1);
    while (_la == helloParser::ID) {
      setState(3);
      match(helloParser::ID);
      setState(8);
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

// Static vars and initialization.
std::vector<dfa::DFA> helloParser::_decisionToDFA;
atn::PredictionContextCache helloParser::_sharedContextCache;

// We own the ATN which in turn owns the ATN states.
atn::ATN helloParser::_atn;
std::vector<uint16_t> helloParser::_serializedATN;

std::vector<std::string> helloParser::_ruleNames = {
  "r"
};

std::vector<std::string> helloParser::_literalNames = {
  "", "'hello'"
};

std::vector<std::string> helloParser::_symbolicNames = {
  "", "", "ID", "WS"
};

dfa::Vocabulary helloParser::_vocabulary(_literalNames, _symbolicNames);

std::vector<std::string> helloParser::_tokenNames;

helloParser::Initializer::Initializer() {
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

  static const uint16_t serializedATNSegment0[] = {
    0x3, 0x608b, 0xa72a, 0x8133, 0xb9ed, 0x417c, 0x3be7, 0x7786, 0x5964, 
       0x3, 0x5, 0xc, 0x4, 0x2, 0x9, 0x2, 0x3, 0x2, 0x3, 0x2, 0x7, 0x2, 
       0x7, 0xa, 0x2, 0xc, 0x2, 0xe, 0x2, 0xa, 0xb, 0x2, 0x3, 0x2, 0x2, 
       0x2, 0x3, 0x2, 0x2, 0x2, 0x2, 0xb, 0x2, 0x4, 0x3, 0x2, 0x2, 0x2, 
       0x4, 0x8, 0x7, 0x3, 0x2, 0x2, 0x5, 0x7, 0x7, 0x4, 0x2, 0x2, 0x6, 
       0x5, 0x3, 0x2, 0x2, 0x2, 0x7, 0xa, 0x3, 0x2, 0x2, 0x2, 0x8, 0x6, 
       0x3, 0x2, 0x2, 0x2, 0x8, 0x9, 0x3, 0x2, 0x2, 0x2, 0x9, 0x3, 0x3, 
       0x2, 0x2, 0x2, 0xa, 0x8, 0x3, 0x2, 0x2, 0x2, 0x3, 0x8, 
  };

  _serializedATN.insert(_serializedATN.end(), serializedATNSegment0,
    serializedATNSegment0 + sizeof(serializedATNSegment0) / sizeof(serializedATNSegment0[0]));


  atn::ATNDeserializer deserializer;
  _atn = deserializer.deserialize(_serializedATN);

  size_t count = _atn.getNumberOfDecisions();
  _decisionToDFA.reserve(count);
  for (size_t i = 0; i < count; i++) { 
    _decisionToDFA.emplace_back(_atn.getDecisionState(i), i);
  }
}

helloParser::Initializer helloParser::_init;
