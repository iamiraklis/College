import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertNull;

import org.junit.Test;
import org.junit.Ignore;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

//-------------------------------------------------------------------------
/**
 * Test class for Doubly Linked List
 *
 * @author
 * @version 13/10/16 18:15
 */
@RunWith(JUnit4.class)
public class DoublyLinkedListTest {
	// ~ Constructor ........................................................
	@Test
	public void testConstructor() {
		new DoublyLinkedList<Integer>();
	}

	// ~ Public Methods ........................................................

	// ----------------------------------------------------------
	/**
	 * Check if the insertBefore works
	 */
	@Test
	public void testInsertBefore() {
		// test non-empty list
		DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
		testDLL.insertBefore(0, 1);
		testDLL.insertBefore(1, 2);
		testDLL.insertBefore(2, 3);
		testDLL.insertBefore(0, 4);
		assertEquals("Checking insertBefore to a list containing 3 elements at position 0", "4,1,2,3",
				testDLL.toString());
		testDLL.insertBefore(1, 5);
		assertEquals("Checking insertBefore to a list containing 4 elements at position 1", "4,5,1,2,3",
				testDLL.toString());
		testDLL.insertBefore(2, 6);
		assertEquals("Checking insertBefore to a list containing 5 elements at position 2", "4,5,6,1,2,3",
				testDLL.toString());
		testDLL.insertBefore(-1, 7);
		assertEquals(
				"Checking insertBefore to a list containing 6 elements at position -1 - expected the element at the head of the list",
				"7,4,5,6,1,2,3", testDLL.toString());
		testDLL.insertBefore(7, 8);
		assertEquals(
				"Checking insertBefore to a list containing 7 elemenets at position 8 - expected the element at the tail of the list",
				"7,4,5,6,1,2,3,8", testDLL.toString());
		testDLL.insertBefore(700, 9);
		assertEquals(
				"Checking insertBefore to a list containing 8 elements at position 700 - expected the element at the tail of the list",
				"7,4,5,6,1,2,3,8,9", testDLL.toString());

		// test empty list
		testDLL = new DoublyLinkedList<Integer>();
		testDLL.insertBefore(0, 1);
		assertEquals(
				"Checking insertBefore to an empty list at position 0 - expected the element at the head of the list",
				"1", testDLL.toString());
		testDLL = new DoublyLinkedList<Integer>();
		testDLL.insertBefore(10, 1);
		assertEquals(
				"Checking insertBefore to an empty list at position 10 - expected the element at the head of the list",
				"1", testDLL.toString());
		testDLL = new DoublyLinkedList<Integer>();
		testDLL.insertBefore(-10, 1);
		assertEquals(
				"Checking insertBefore to an empty list at position -10 - expected the element at the head of the list",
				"1", testDLL.toString());
	}

	// TODO: add more tests here. Each line of code in DoublyLinkedList.java should
	// be executed at least once from at least one test.
	@Test
	public void testGet() {
		DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
		assertNull("No element is taken", testDLL.get(0));
		testDLL.insertBefore(0, 1);
		testDLL.insertBefore(1, 2);
		testDLL.insertBefore(2, 3);
		assertEquals("Check to see data at position 0, with 3 elements", "1", testDLL.get(0).toString());
		assertEquals("Check to see data at position 1", "2", testDLL.get(1).toString());
		assertEquals("Check to see data at position 2", "3", testDLL.get(2).toString());
		testDLL.insertBefore(0, 5);
		testDLL.insertBefore(1, 6);
		testDLL.insertBefore(2, 9);
		assertNull("Check to see data at position that's larger than list size", testDLL.get(9));
		assertNull("Check to see data at position that's smaller than list size", testDLL.get(-1));
		assertEquals("Check to see data at position 2, with 6 elements", "9", testDLL.get(2).toString());
		assertEquals("Check to see data at position 0", "5", testDLL.get(0).toString());
		assertEquals("Check to see data at position 1", "6", testDLL.get(1).toString());
		assertEquals("Check to see data at position 2", "9", testDLL.get(2).toString());
	}

	@Test
	public void testDeleteAt() {
		DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
		testDLL.deleteAt(0);
		assertEquals("Check to see if element at position 0 is deleted", "", testDLL.toString());
		testDLL.deleteAt(-1);
		assertEquals("Check to see if element at position 0 is deleted", "", testDLL.toString());
		testDLL.deleteAt(100);
		assertEquals("Check to see if element at position 0 is deleted", "", testDLL.toString());
		testDLL.insertBefore(0, 1);
		testDLL.insertBefore(1, 2);
		testDLL.insertBefore(2, 3);
		testDLL.insertBefore(3, 4);
		testDLL.insertBefore(4, 5);
		testDLL.deleteAt(0);
		assertEquals("Check to see if element at position 0 is deleted", "2,3,4,5", testDLL.toString());
		testDLL.deleteAt(1);
		assertEquals("Check to see if element at position 1 is deleted", "2,4,5", testDLL.toString());
		testDLL.deleteAt(2);
		assertEquals("Check to see if element at position 2 is deleted", "2,4", testDLL.toString());
		testDLL.deleteAt(1);
		assertEquals("Check to see if element at position 0 is deleted", "2", testDLL.toString());
		testDLL.deleteAt(0);
		assertEquals("Check to see if element at position 0 is deleted", "", testDLL.toString());

	}

	@Test
	public void testReverse() {
		DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
		testDLL.reverse();
		assertEquals("Check if DLL is reversed", "", testDLL.toString());
		testDLL.insertBefore(0, 1);
		testDLL.reverse();
		assertEquals("Check if DLL is reversed", "1", testDLL.toString());
		testDLL.insertBefore(1, 2);
		testDLL.insertBefore(2, 3);
		testDLL.insertBefore(3, 4);
		testDLL.reverse();
		assertEquals("Check if DLL is reversed", "4,3,2,1", testDLL.toString());
		testDLL.reverse();
		assertEquals("Check if DLL is reversed", "1,2,3,4", testDLL.toString());
	}

	@Test
	public void testMakeUnique() {
		DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
		testDLL.makeUnique();
		assertEquals( "", testDLL.toString());
		testDLL.insertBefore(0, 1);
		testDLL.makeUnique();
		assertEquals("Check if 1 is deleted", "1", testDLL.toString());
		testDLL.insertBefore(1, 2);
		testDLL.insertBefore(2, 3);
		testDLL.insertBefore(3, 4);
		testDLL.makeUnique();
		assertEquals("Check if anything is deleted", "1,2,3,4", testDLL.toString());
		testDLL.insertBefore(4, 2);
		testDLL.makeUnique();
		assertEquals("Check if 2, which is duplicate, is deleted", "1,2,3,4", testDLL.toString());
		testDLL = new DoublyLinkedList<Integer>();
		testDLL.insertBefore(0, 2);
		testDLL.insertBefore(1, 1);
		testDLL.insertBefore(2, 1);
		testDLL.insertBefore(3, 1);
		testDLL.insertBefore(4, 2);
		testDLL.insertBefore(5, 1);
		testDLL.makeUnique();
		assertEquals("2,1", testDLL.toString());
		
	}

	@Test
	public void testPush() {
		DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
		testDLL.push(10);
		testDLL.push(20);
		assertEquals("20,10", testDLL.toString());
		testDLL.push(30);
		testDLL.push(40);
		testDLL.push(50);
		testDLL.push(60);
		testDLL.push(70);
		testDLL.push(80);
		assertEquals("80,70,60,50,40,30,20,10", testDLL.toString());
	}

	@Test
	public void testPop() {
		DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
		testDLL.pop();
		testDLL.pop();
		assertNull("If DLL is empty it should return null", testDLL.pop());
		assertEquals("", testDLL.toString());
		testDLL.push(10);
		testDLL.push(20);
		testDLL.push(30);
		testDLL.push(40);
		testDLL.pop();
		assertEquals("30,20,10", testDLL.toString());
		testDLL.pop();
		testDLL.pop();
		assertEquals("10", testDLL.toString());
		testDLL.pop();
		assertEquals("", testDLL.toString());
		assertNull("If DLL is empty it should return null", testDLL.pop());
	}

	@Test
	public void testEnqueue() {
		DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
		assertEquals("", testDLL.toString());
		testDLL.enqueue(10);
		testDLL.enqueue(20);
		assertEquals("10,20", testDLL.toString());
		testDLL.enqueue(30);
		testDLL.enqueue(40);
		assertEquals("10,20,30,40", testDLL.toString());
	}
	@Test
	public void testDequeue() {
		DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
		testDLL.dequeue();
		assertEquals("", testDLL.toString());
		testDLL.enqueue(10);
		testDLL.enqueue(20);
		testDLL.dequeue();
		assertEquals("20", testDLL.toString());
		testDLL.dequeue();testDLL.dequeue();
		assertEquals("", testDLL.toString());
		testDLL.dequeue();
		assertNull("If DLL is empty it should return null", testDLL.pop());
	}

}
