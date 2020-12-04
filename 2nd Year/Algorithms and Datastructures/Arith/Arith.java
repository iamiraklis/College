import java.util.*;
import java.util.NoSuchElementException;

// -------------------------------------------------------------------------
/**
 *  Utility class containing validation/evaluation/conversion operations
 *  for prefix and postfix arithmetic expressions.
 *
 *  @author  Iraklis Bogiatziou
 *  @version 1/12/15 13:03:48s
 */

public class Arith {
	
	

  //~ Validation methods ..........................................................


  /**
   * Validation method for prefix notation.
   *
   * @param prefixLiterals : an array containing the string literals hopefully in prefix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return true if the parameter is indeed in prefix notation, and false otherwise.
   **/
	public static boolean validatePrefixOrder(String prefixLiterals[]) {
		int counter = 1;
		boolean flag = false;
		for (int i = 0; i < prefixLiterals.length; i++) {
			if (prefixLiterals[i] == "+" || prefixLiterals[i] == "-" || prefixLiterals[i] == "*"
					|| prefixLiterals[i] == "/") {
				counter++;
			} else
				counter--;
			//check if the counter at the end of the sequence is 0 and it never became negative nor zero during scanning by excluding final scanning
			if (!(prefixLiterals[i] == prefixLiterals[prefixLiterals.length-1]) && counter <= 0) {
				flag = true;
			}
		}
		if (flag) {
			return false;
		}
		return true;
	}


  /**
   * Validation method for postfix notation.
   *
   * @param postfixLiterals : an array containing the string literals hopefully in postfix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return true if the parameter is indeed in postfix notation, and false otherwise.
   **/
  public static boolean validatePostfixOrder(String postfixLiterals[])
  {
	 
	  int counter = 1;
		boolean flag = false;
		 for (int i = postfixLiterals.length-1; i>=0; i--) {
			if (postfixLiterals[i] == "+" || postfixLiterals[i] == "-" || postfixLiterals[i] == "*"
					|| postfixLiterals[i] == "/") {
				counter++;
			} else
				counter--;
			//check if the counter at the end of the sequence is 0 and it never became negative nor zero during scanning by excluding final scanning
			if (!(postfixLiterals[i] == postfixLiterals[0]) && counter <= 0) {
				flag = true;
			}
		}
		if (flag) {
			return false;
		}
		return true;
    //TODO
  }


  //~ Evaluation  methods ..........................................................


  /**
   * Evaluation method for prefix notation.
   *
   * @param prefixLiterals : an array containing the string literals in prefix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return the integer result of evaluating the expression
   **/
  public static int evaluatePrefixOrder(String prefixLiterals[])
  {
	  Stack<Integer> stack = new Stack<Integer>();


	    for (int i = prefixLiterals.length-1; i>=0; i--) {
	    	try {
	    		stack.push(Integer.valueOf(prefixLiterals[i]));
	        } catch (NumberFormatException  e) {
	            Integer value1 = stack.pop();
	            Integer value2 = stack.pop();

	            switch (prefixLiterals[i]) {
	                case "+":
	                	stack.push(value1 + value2);
	                    break;
	                case "-":
	                	stack.push(value1 - value2);
	                    break;
	                case "*":
	                	stack.push(value1 * value2);
	                    break;
	                case "/":
	                	stack.push(value1 / value2);
	                    break;
	            }
	        }
	    }

	    return stack.pop();
  }


  /**
   * Evaluation method for postfix notation.
   *
   * @param postfixLiterals : an array containing the string literals in postfix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return the integer result of evaluating the expression
   **/
  public static int evaluatePostfixOrder(String postfixLiterals[])
  {
	  Stack<Integer> stack = new Stack<Integer>();


	    for (int i = 0; i < postfixLiterals.length; i++) {
	    	try {
	    		stack.push(Integer.valueOf(postfixLiterals[i]));
	        } catch (NumberFormatException  e) {
	            Integer value1 = stack.pop();
	            Integer value2 = stack.pop();

	            switch (postfixLiterals[i]) {
	                case "+":
	                	stack.push(value2 + value1);
	                    break;
	                case "-":
	                	stack.push(value2 - value1);
	                    break;
	                case "*":
	                	stack.push(value2 * value1);
	                    break;
	                case "/":
	                	stack.push(value2 / value1);
	                    break;
	            }
	        }
	    }

	    return stack.pop();
  }


  //~ Conversion  methods ..........................................................


  /**
   * Converts prefix to postfix.
   *
   * @param prefixLiterals : an array containing the string literals in prefix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return the expression in postfix order.
   **/
  public static String[] convertPrefixToPostfix(String prefixLiterals[])
  {
	  Stack<String> stack = new Stack<String>();

		for (int i = prefixLiterals.length-1; i >=0; i--) {

			if (prefixLiterals[i] == "+" || prefixLiterals[i] == "-" || prefixLiterals[i] == "*"
					|| prefixLiterals[i] == "/") {
				String value1 = stack.pop();
				String value2 = stack.pop();
				String temp = value1 + value2 + prefixLiterals[i];
				stack.push(temp);
			} else {
				stack.push(prefixLiterals[i] + "");
			}
		}
		String[] conv = stack.pop().split("");
		return conv;
  }


  /**
   * Converts postfix to prefix.
   *
   * @param prefixLiterals : an array containing the string literals in postfix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return the expression in prefix order.
   **/
	public static String[] convertPostfixToPrefix(String postfixLiterals[]) {
		Stack<String> stack = new Stack<String>();

		for (int i = 0; i < postfixLiterals.length; i++) {

			if (postfixLiterals[i] == "+" || postfixLiterals[i] == "-" || postfixLiterals[i] == "*"
					|| postfixLiterals[i] == "/") {
				String value1 = stack.pop();
				String value2 = stack.pop();
				String temp = postfixLiterals[i] + value2 + value1;
				stack.push(temp);
			} else {
				stack.push(postfixLiterals[i] + "");
			}
		}
		String[] conv = stack.pop().split("");
		return conv;
	}

  /**
   * Converts prefix to infix.
   *
   * @param infixLiterals : an array containing the string literals in prefix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return the expression in infix order.
   **/
	public static String[] convertPrefixToInfix(String prefixLiterals[]) {
		Stack<String> stack = new Stack<String>();
		for (int i = prefixLiterals.length - 1; i >= 0; i--)
			if (prefixLiterals[i] == "+" || prefixLiterals[i] == "-" || prefixLiterals[i] == "*"
					|| prefixLiterals[i] == "/") {
				String value1 = stack.pop();
				String value2 = stack.pop();
				stack.push("( " + value1 + prefixLiterals[i] + value2 + " )");

			} else {
				stack.push(prefixLiterals[i]);
			}
		String[] conv = stack.pop().split(" ");
		return conv;

	}
  

  /**
   * Converts postfix to infix.
   *
   * @param infixLiterals : an array containing the string literals in postfix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return the expression in infix order.
   **/
	public static String[] convertPostfixToInfix(String postfixLiterals[]) {
		Stack<String> stack = new Stack<String>();
		for (int i = 0; i < postfixLiterals.length; i++) {
			if (postfixLiterals[i] == "+" || postfixLiterals[i] == "-" || postfixLiterals[i] == "*"
					|| postfixLiterals[i] == "/") {
				String value1 = stack.pop();
				String value2 = stack.pop();
				stack.push("( " + value2 + postfixLiterals[i] + value1 + " )");

			} else {
				stack.push(postfixLiterals[i]);
			}

		}
		String[] conv = stack.pop().split(" ");
		return conv;
	}
  }