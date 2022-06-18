
// Generated from Sysy2022Lexer.g4 by ANTLR 4.7.2

#pragma once


#include "antlr4-runtime.h"




class  Sysy2022Lexer : public antlr4::Lexer {
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

  Sysy2022Lexer(antlr4::CharStream *input);
  ~Sysy2022Lexer();

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

