#include "AstBuilder.h"
namespace antlrcpp
{

	 antlrcpp::Any AstBuilder::visitCompUnit(Sysy2022Parser::CompUnitContext *ctx) 
	{
		auto result = new comp_root;
        	auto compile_units = ctx->children;

        	result->line = ctx->getStart()->getLine();
        	result->pos = ctx->getStart()->getCharPositionInLine();
        
       	 for (auto i = 0; i < compile_units.size(); i++)
       	 {
      		      if (auto decl = dynamic_cast<Sysy2022Parser::DeclContext *>(compile_units[i]))
	            {
	                // global define
	                auto comp_units = (visit(decl).as<block_node *>())->body;
	                for(auto j = 0; j < comp_units.size(); j++)
	                {
                    
	                }
	            }
	            else if (auto func_def = dynamic_cast<Sysy2022Parser::FuncDefContext 	*>(compile_units[i]))
	            {
 	               // function define
	                auto comp_unit = visit(func_def).as<func_def_node *>();
	                result->comp_units.push_back(ptr<compunit_node>(comp_unit));
	            }
	        }
	        return result;
	};
	 antlrcpp::Any AstBuilder::AstBuilder::visitcompunitplus(Sysy2022Parser::compunitplusContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::AstBuilder::visitDecl(Sysy2022Parser::DeclContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitConstDecl(Sysy2022Parser::ConstDeclContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitBType(Sysy2022Parser::BTypeContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitConstDef(Sysy2022Parser::ConstDefContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitConstInitVal(Sysy2022Parser::ConstInitValContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitVarDecl(Sysy2022Parser::VarDeclContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitVarDef(Sysy2022Parser::VarDefContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitInitVal(Sysy2022Parser::InitValContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitFuncDef(Sysy2022Parser::FuncDefContext *ctx) 
	{
		auto result = new func_def_node;

        	result->line = ctx->getStart()->getLine();
        	result->pos = ctx->getStart()->getCharPositionInLine();
        	result->name = ctx->Identifier()->getSymbol()->getText();
        	result->body.reset(visit(ctx->block()).as<block_node *>());

        	return result;
	};
	 antlrcpp::Any AstBuilder::visitFuncType(Sysy2022Parser::FuncTypeContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitFuncFParams(Sysy2022Parser::FuncFParamsContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitFuncFParam(Sysy2022Parser::FuncFParamContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitBlock(Sysy2022Parser::BlockContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitBlockItem(Sysy2022Parser::BlockItemContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitStmt(Sysy2022Parser::StmtContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitExp(Sysy2022Parser::ExpContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitCond(Sysy2022Parser::CondContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitLVal(Sysy2022Parser::LValContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitPrimaryExp(Sysy2022Parser::PrimaryExpContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitNumber(Sysy2022Parser::NumberContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitUnaryExp(Sysy2022Parser::UnaryExpContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitUnaryOp(Sysy2022Parser::UnaryOpContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitFuncRParams(Sysy2022Parser::FuncRParamsContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitMulExp(Sysy2022Parser::MulExpContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitAddExp(Sysy2022Parser::AddExpContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitRelExp(Sysy2022Parser::RelExpContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitEqExp(Sysy2022Parser::EqExpContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitLAndExp(Sysy2022Parser::LAndExpContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitLOrExp(Sysy2022Parser::LOrExpContext *ctx) 
	{

	};
	 antlrcpp::Any AstBuilder::visitConstExp(Sysy2022Parser::ConstExpContext *ctx) 
	{

	};
    }

    ptr<ast_node> AstBuilder::operator()(antlr4::tree::ParseTree *ctx)
    {
        auto result = visit(ctx);

        if (result.is<ast_node *>())
            return ptr<ast_node>(result.as<ast_node *>());
        if (result.is<comp_root *>())
            return ptr<ast_node>(result.as<comp_root *>());
        if (result.is<compunit_node *>())
            return ptr<ast_node>(result.as<compunit_node *>());
        if (result.is<func_def_node *>())
            return ptr<ast_node>(result.as<func_def_node *>());
        if (result.is<expr_node *>())
            return ptr<ast_node>(result.as<expr_node *>());
        if (result.is<cond_node *>())
            return ptr<ast_node>(result.as<cond_node *>());
        if (result.is<binop_expr_node *>())
            return ptr<ast_node>(result.as<binop_expr_node *>());
        if (result.is<unaryop_expr_node *>())
            return ptr<ast_node>(result.as<unaryop_expr_node *>());
        if (result.is<lval_node *>())
            return ptr<ast_node>(result.as<lval_node *>());
        if (result.is<number_node *>())
            return ptr<ast_node>(result.as<number_node *>());
        if (result.is<stmt_node *>())
            return ptr<ast_node>(result.as<stmt_node *>());
        if (result.is<var_def_stmt_node *>())
            return ptr<ast_node>(result.as<var_def_stmt_node *>());
        if (result.is<assign_stmt_node *>())
            return ptr<ast_node>(result.as<assign_stmt_node *>());
        if (result.is<func_call_stmt_node *>())
            return ptr<ast_node>(result.as<func_call_stmt_node *>());
        if (result.is<block_node *>())
            return ptr<ast_node>(result.as<block_node *>());
        if (result.is<if_stmt_node *>())
            return ptr<ast_node>(result.as<if_stmt_node *>());
        if (result.is<while_stmt_node *>())
            return ptr<ast_node>(result.as<while_stmt_node *>());
        if (result.is<empty_stmt_node *>())
            return ptr<ast_node>(result.as<empty_stmt_node *>());

        return ptr<ast_node>(result.as<ast_node*>());
    }
}
