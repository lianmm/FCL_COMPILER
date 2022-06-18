
// Generated from SysYLexer.g4 by ANTLR 4.9.3

#pragma once


#include "antlr4-runtime.h"


namespace antlrcpptest {


class  SysYLexer : public antlr4::Lexer {
public:
  enum {
    Int = 1, Void = 2, Const = 3, Return = 4, If = 5, Else = 6, For = 7, 
    While = 8, Do = 9, Break = 10, Continue = 11, Lparen = 12, Rparen = 13, 
    Lbrkt = 14, Rbrkt = 15, Lbrace = 16, Rbrace = 17, Comma = 18, Semicolon = 19, 
    Question = 20, Colon = 21, Minus = 22, Exclamation = 23, Tilde = 24, 
    Addition = 25, Multiplication = 26, Division = 27, Modulo = 28, LAND = 29, 
    LOR = 30, EQ = 31, NEQ = 32, LT = 33, LE = 34, GT = 35, GE = 36, IntLiteral = 37, 
    Identifier = 38, STRING = 39, WS = 40, LINE_COMMENT = 41, COMMENT = 42
  };

  explicit SysYLexer(antlr4::CharStream *input);
  ~SysYLexer();

  virtual std::string getGrammarFileName() const override;
  virtual const std::vector<std::string>& getRuleNames() const override;

  virtual const std::vector<std::string>& getChannelNames() const override;
  virtual const std::vector<std::string>& getModeNames() const override;
  virtual const std::vector<std::string>& getTokenNames() const override; // deprecated, use vocabulary instead
  virtual antlr4::dfa::Vocabulary& getVocabulary() const override;

  virtual const std::vector<uint16_t> getSerializedATN() const override;
  virtual const antlr4::atn::ATN& getATN() const override;

private:
  static std::vector<antlr4::dfa::DFA> _decisionToDFA;
  static antlr4::atn::PredictionContextCache _sharedContextCache;
  static std::vector<std::string> _ruleNames;
  static std::vector<std::string> _tokenNames;
  static std::vector<std::string> _channelNames;
  static std::vector<std::string> _modeNames;

  static std::vector<std::string> _literalNames;
  static std::vector<std::string> _symbolicNames;
  static antlr4::dfa::Vocabulary _vocabulary;
  static antlr4::atn::ATN _atn;
  static std::vector<uint16_t> _serializedATN;


  // Individual action functions triggered by action() above.

  // Individual semantic predicate functions triggered by sempred() above.

  struct Initializer {
    Initializer();
  };
  static Initializer _init;
};

}  // namespace antlrcpptest
