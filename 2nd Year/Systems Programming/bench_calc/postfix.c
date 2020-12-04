#include "postfix.h"
// evaluate expression stored as an array of string tokens
double evaluate_postfix_expression(char ** args, int nargs) {
  double value;
  double value1;
  double value2;
  struct double_stack * stack = double_stack_new(nargs);
  for (int i=0; i<nargs; i++){
    if (args[i][0]<='9' && args[i][0]>='0'){
      value = atof(args[i]);
      double_stack_push(stack, value);
    }else {
      if(strlen(args[i]) == 1)
      {
          value1 = double_stack_pop(stack);
          value2 = double_stack_pop(stack);
        switch(args[i][0]){
          case '+':
        		 double_stack_push(stack, value1 + value2);
         	 break;
          case '-':
 	 			 double_stack_push(stack, value2 - value1);
         	 break;
          case 'X':
 	 		 	double_stack_push(stack, value1 * value2);
         	break;
          case '/': 
 			  	double_stack_push(stack, value2 / value1);
          	break;
          case '^':
 	 			double_stack_push(stack, pow(value2, value1));
          	break;
          default:
          	break;
        }
      }
      else {
        double_stack_push(stack, atof(args[i]));
      }
    }
  }
  value = double_stack_pop(stack);
  return value;
}

