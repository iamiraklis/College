#include "infix.h"

_Bool  is_empty(struct double_stack * this)
  {
    if(this->top == 0)
    {
      return 1;
    }
    return 0;
  }
  _Bool is_operator_of_higher_precedence(char  c, struct double_stack * stack)
  {
 	 char op = stack->items[stack->top-1];
    if (op == '^' && c != '^') return 1;
    else if((op == 'X' || op == '/') && (c == '+' || c == '-')) return 1;
    else if((op == '+' || op == '-') && ((c == 'X' || c == '/'))) return 0;
    
    else return 0;
  }
double evaluate_infix_expression(char ** args, int nargs) {

 struct double_stack * stack = double_stack_new(nargs);
  char ** postfix = malloc(sizeof(char*) * nargs);
  int length=0;
  
  for (int i = 0; i <nargs; i++)
  {

    if (*args[i] == '(')
    {

      double_stack_push(stack, *args[i]);
    }
   
    else if ((strlen(args[i])== 1)&&(*args[i] == '+' || *args[i] == '-' || *args[i] == 'X' || *args[i] == '/' || *args[i] == '^'))
    {
      while (!is_empty(stack) &&  (is_operator_of_higher_precedence((*args[i]), stack)))
      {
        
        		
        		char operator= (char)double_stack_pop(stack);
      
         	postfix[length] = malloc(sizeof(operator));
         	*postfix[length] = operator;
            length++;
            
        
      }
      double_stack_push(stack, *args[i]);
    }
    else if (*args[i] == ')')
    {
      while ( (stack->items[stack->top-1] != '(') && !is_empty(stack))
      {
      		
           	char operator= (char)double_stack_pop(stack);
          
         	postfix[length] = malloc(sizeof(operator));
         	*postfix[length] = operator;
            length++;
   
      }
      double_stack_pop(stack);

    }
    else {
		   postfix[length] = args[i];
		   length++;
		   }
    
  }
  
  while (!is_empty(stack))
  {
 				char operator= (char)double_stack_pop(stack);
 				printf("%d pop operator \n", operator);
         	postfix[length] = malloc(sizeof(operator));
         	*postfix[length] = operator;
            length++;
  }

  return evaluate_postfix_expression(postfix, length);
}
