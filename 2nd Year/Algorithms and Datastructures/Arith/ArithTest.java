import static org.junit.Assert.*;

import java.util.*;

import org.junit.Test;

public class ArithTest {
	
	@Test
    public void testConstructor()
    {
      new Arith();
    }

	@Test
	public void validatePrefixOrderTest() {
		String[] firstTest = {"*", "-", "1", "2", "3"};
		String[] secondTest = {"+", "2", "3", "-", "4"};
		String[] thirdTest = {"/", "2", "3"};
		assertEquals(true, Arith.validatePrefixOrder(firstTest));
		assertEquals(true, Arith.validatePrefixOrder(thirdTest));
		assertEquals(false, Arith.validatePrefixOrder(secondTest));
		}
	
	@Test
	public void validatePostfixOrderTest() {
		String[] firstTest = {"3", "1", "2", "-", "*"};
		String[] secondTest = {"7", "-8", "3", "*", "28", "+", "+"};
		String[] thirdTest = {"6", "2", "/"};
		String[] fourthTest = {"6", "/", "2"};
		assertEquals(true, Arith.validatePostfixOrder(firstTest));
		assertEquals(true, Arith.validatePostfixOrder(secondTest));
		assertEquals(false, Arith.validatePostfixOrder(fourthTest));
	}
	
	@Test
	public void evaluatePostfixOrderTest() {
		String[] firstTest = {"3", "1", "2", "-", "*"};
		String[] secondTest = {"7", "-8", "3", "*", "28", "+", "+"};
		String[] thirdTest = {"6", "2", "/"};
		assertEquals(-3, Arith.evaluatePostfixOrder(firstTest));
		assertEquals(11, Arith.evaluatePostfixOrder(secondTest));
		assertEquals(3, Arith.evaluatePostfixOrder(thirdTest));
	}
	
	@Test
	public void evaluatePrefixOrderTest() {
		String[] firstTest = {"*", "-", "1", "2", "3"};
		String[] secondTest = {"-", "+", "2", "3", "4"};
		String[] thirdTest = {"/", "9", "3"};
		assertEquals(-3, Arith.evaluatePrefixOrder(firstTest));
		assertEquals(3, Arith.evaluatePrefixOrder(thirdTest));
		assertEquals(1, Arith.evaluatePrefixOrder(secondTest));
	}
	
	@Test
	public void convertPrefixToPostfixTest() {
		String[] firstTest = {"*", "3", "-", "1", "2"};
		assertEquals("[3, 1, 2, -, *]", Arrays.deepToString(Arith.convertPrefixToPostfix(firstTest)));
		String[] secondTest = {"+", "1", "/", "4", "2"};
		assertEquals("[1, 4, 2, /, +]", Arrays.deepToString(Arith.convertPrefixToPostfix(secondTest)));
	}
	
	@Test
	public void convertPostfixToPrefixTest() {
		String[] firstTest = {"3", "1", "2", "-", "*"};
		assertEquals("[*, 3, -, 1, 2]", Arrays.deepToString(Arith.convertPostfixToPrefix(firstTest)));
		String[] secondTest = {"1", "4", "2", "/", "+"};
		assertEquals("[+, 1, /, 4, 2]", Arrays.deepToString(Arith.convertPostfixToPrefix(secondTest)));
	}
	
	@Test
	public void convertPrefixToInfixTest() {
		String[] firstTest = {"*", "3", "-", "1", "2"};
		String[] secondTest = {"+", "10", "/", "1", "5"};
		assertEquals("[(, 3*(, 1-2, ), )]", Arrays.deepToString(Arith.convertPrefixToInfix(firstTest)));
		assertEquals("[(, 10+(, 1/5, ), )]", Arrays.deepToString(Arith.convertPrefixToInfix(secondTest)));
	}
	
	@Test
	public void convertPostfixToInfixTest() {
		String[] firstTest = {"3", "1", "2", "-", "*"};
		String[] secondTest = {"1", "10", "5", "/", "+"};
		assertEquals("[(, 3*(, 1-2, ), )]", Arrays.deepToString(Arith.convertPostfixToInfix(firstTest)));
		assertEquals("[(, 1+(, 10/5, ), )]", Arrays.deepToString(Arith.convertPostfixToInfix(secondTest)));
	}
	}
