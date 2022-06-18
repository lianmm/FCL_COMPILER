 #include "def.h"
struct node * mknode(int kind,struct node *first,struct node *second, struct node *third,int pos ) {
  struct node *T=(struct node *)malloc(sizeof(struct node));
  T->kind=kind;
  T->ptr[0]=first;
  T->ptr[1]=second;
  T->ptr[2]=third;
  T->pos=pos;
  return T;
}

void display(struct node *T,int indent)  {//对抽象语法树的先根遍历
  int i=1;
  struct node *T0;
  if (T)
	{
        
	switch (T->kind) {
	case EXT_DEF_LIST:  display(T->ptr[0],indent);    //显示该外部定义列表中的第一个
                        display(T->ptr[1],indent);    //显示该外部定义列表中的其它外部定义
                        break;
	case EXT_VAR_DEF:   printf("%*c外部变量定义：\n",indent,' ');
                        display(T->ptr[0],indent+3);        //显示外部变量类型
                        printf("%*c变量名：\n",indent+3,' ');
                        display(T->ptr[1],indent+6);        //显示变量列表
                        break;     
	case TYPE:          printf(" %s",T->type_id);
                        break;
    case EXT_DEC_LIST:  display(T->ptr[0],indent);     //依次显示外部变量名，
                        display(T->ptr[1],indent);     //后续还有相同的，仅显示语法树此处理代码可以和类似代码合并
                        break;
	case FUNC_DEF:      printf("%*cFuncDef",indent);
                        display(T->ptr[0],indent+3);      //显示函数返回类型
                        display(T->ptr[1],indent+3);      //显示函数名和参数
                        display(T->ptr[2],indent+3);      //显示函数体
                        break;
	case FUNC_DEC:      printf(" %s(",T->type_id);
                        if (T->ptr[0]) {
                                printf("%*c函数形参：\n",indent,' ');
                                display(T->ptr[0],indent+3);  //显示函数参数列表
                                }
                        else printf(")\n");
                        break;
	case PARAM_LIST:    display(T->ptr[0],indent);     //依次显示全部参数类型和名称，
                        display(T->ptr[1],indent);
                        break;
	case PARAM_DEC:     printf("%*c类型：%s, 参数名：%s\n", indent,' ',  \
                               T->ptr[0]->type==INT?"int": "float",T->ptr[1]->type_id);
                        break;
	case EXP_STMT:      //printf("%*c",indent，' ');
                        display(T->ptr[0],indent); 
                        break;
	case RETURN:        printf("%*c`--return\n",indent,' ');
                        display(T->ptr[0],indent+3);
                        break;
	case COMP_STM:      printf("%*c`--block：\n",indent,' ');
                        printf("%*c|--Decl：\n",indent+3,' ');
                        display(T->ptr[0],indent+6);      //显示定义部分
                        //printf("%*c复合语句的语句部分：\n",indent+3,' ');
                        display(T->ptr[1],indent+3);      //显示语句部分
                        break;
	case STM_LIST:      

				display(T->ptr[0],indent);      //显示第一条语句
                        display(T->ptr[1],indent);        //显示剩下语句
                        break;
	case WHILE:         printf("%*c循环语句：\n",indent,' ');
                        printf("%*c循环条件：\n",indent+3,' ');
                        display(T->ptr[0],indent+6);      //显示循环条件
                        printf("%*c循环体：\n",indent+3,' ');
                        display(T->ptr[1],indent+6);      //显示循环体
                        break;
	case IF_THEN:       printf("%*c条件语句(IF_THEN)：\n",indent,' ');
                        printf("%*c条件：\n",indent+3,' ');
                        display(T->ptr[0],indent+6);      //显示条件
                        printf("%*cIF子句：\n",indent+3,' ');
                        display(T->ptr[1],indent+6);      //显示if子句
                        break;
	case IF_THEN_ELSE:  printf("%*c条件语句(IF_THEN_ELSE)：\n",indent,' ');
                        printf("%*c条件：\n",indent+3,' ');
                        display(T->ptr[0],indent+6);      //显示条件
                        printf("%*cIF子句：\n",indent+3,' ');
                        display(T->ptr[1],indent+6);      //显示if子句
                        printf("%*cELSE子句：\n",indent+3,' ');
                        display(T->ptr[2],indent+6);      //显示else子句
                        break;
    case DEF_LIST:      display(T->ptr[0],indent);    //显示该局部变量定义列表中的第一个
                        display(T->ptr[1],indent);    //显示其它局部变量定义
                        break;
    case VAR_DEF:       printf("%*c|--VarDecl",indent,' ');
                        display(T->ptr[0],indent+3);   //显示变量类型
                        display(T->ptr[1],indent+3);   //显示该定义的全部变量名
                        break;
    case DEC_LIST:      printf(" ");
                        T0=T;int i=0;
                        while (T0) {
                            if (T0->ptr[0]->kind==ID&&0)
                                printf("%s\n",T0->ptr[0]->type_id);
                            else if (T0->ptr[0]->kind==ID)
                                {printf("\n%*c|-- %s",indent,' ',T0->ptr[0]->type_id);if(T0->ptr[1]==0){printf("\n");}}
                            else if (T0->ptr[0]->kind==ASSIGNOP)
                                {  if(i==0){printf("\n");}
                               // printf("%*c|-- %s\n",indent,' ',T0->ptr[0]->ptr[0]->type_id);
							//显示初始化表达式
				
                               //display(T0->ptr[0]->ptr[1],indent+3);   
                               printf("%*c|--%s的初始化式：\n",indent,' ',T0->ptr[0]->ptr[0]->type_id);
                               
                    		display(T->ptr[0],indent+3);
                    		//display(T->ptr[1]->ptr[1],indent+3);
                    		     

                                }
                            T0=T0->ptr[1];
                            i++;
                            }
                        break;
        case BREAK:
        		printf("%*c|--break语句\n",indent,' ');
        		break;
        case CONTINUE:
        		printf("%*c|--continue语句\n",indent,' ');
        		break;
	case ID:
			for(int iid=0;iid<indent;iid++){printf(" ");}	        
			printf("|--%s\n",T->type_id);
                        break;
	case INT:	        printf("%*c|--%d IntLiteral\n",indent,' ',T->type_int);
                        break;
	case FLOAT:	        printf("%*c|--%f FloatLiteral\n",indent,' ',T->type_float);
                        break;

	case ASSIGNOP: 
			     
	case AND:
			
	case OR:
			
	case RELOP:
			
	case MINUS:
			
	case STAR:
	
	case MOD:
			
	case DIV:
                    
	case PLUS:	
                    printf("%*c|--%s\n",indent,' ',T->type_id);
                    display(T->ptr[0],indent+3);
                    display(T->ptr[1],indent+3);
                    break;    
	case NOT:
	case UMINUS:    printf("%*c%s\n",indent,' ',T->type_id);
                    display(T->ptr[0],indent+3);
                    break;
    case FUNC_CALL: printf("%*c|--UnaryExp",indent,' ');
                    printf(" %s ()\n",T->type_id);
                    //printf("%d\n",T->ptr[0]->type);
                    display(T->ptr[0],indent+3);
                    break;
	case ARGS:      i=1;
                    while (T) {  //ARGS表示实际参数表达式序列结点，其第一棵子树为其一个实际参数表达式，第二棵子树为剩下的。
                        struct node *T0=T->ptr[0];
                        //printf("%*c第%d个实际参数表达式：\n",indent,' ',i++);
 //                      for(int j=0;j<indent+1;j++)                        printf("|%*c",i,' ');
                        display(T0,indent);
                        T=T->ptr[1];
                        }
  //                  printf("%*c第%d个实际参数表达式：\n",indent,' ',i);
  //                  display(T,indent+3);

                    break;
         }
      }
}

//void display(struct node *T,int indent){}

