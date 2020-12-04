import java.util.Iterator;
import java.util.ListIterator;
import java.util.NoSuchElementException;

import javax.xml.crypto.Data;

// -------------------------------------------------------------------------
/**
 *  This class contains the methods of Doubly Linked List.
 *
 *  @author  
 *  @version 09/10/18 11:13:22
 */

/**
 * Class DoublyLinkedList: implements a *generic* Doubly Linked List.
 * 
 * @param <T> This is a type parameter. T is used as a class name in the
 *            definition of this class.
 *
 *            When creating a new DoublyLinkedList, T should be instantiated
 *            with an actual class name that extends the class Comparable. Such
 *            classes include String and Integer.
 *
 *            For example to create a new DoublyLinkedList class containing
 *            String data: DoublyLinkedList<String> myStringList = new
 *            DoublyLinkedList<String>();
 *
 *            The class offers a toString() method which returns a
 *            comma-separated sting of all elements in the data structure.
 * 
 *            This is a bare minimum class you would need to completely
 *            implement. You can add additional methods to support your code.
 *            Each method will need to be tested by your jUnit tests -- for
 *            simplicity in jUnit testing introduce only public methods.
 */
class DoublyLinkedList<T extends Comparable<T>> {

	/**
	 * private class DLLNode: implements a *generic* Doubly Linked List node.
	 */
	private class DLLNode {
		public final T data; // this field should never be updated. It gets its
								// value once from the constructor DLLNode.
		public DLLNode next;
		public DLLNode prev;

		/**
		 * Constructor
		 * 
		 * @param theData  : data of type T, to be stored in the node
		 * @param prevNode : the previous Node in the Doubly Linked List
		 * @param nextNode : the next Node in the Doubly Linked List
		 * @return DLLNode
		 */
		public DLLNode(T theData, DLLNode prevNode, DLLNode nextNode) {
			data = theData;
			prev = prevNode;
			next = nextNode;
		}
	}

	// Fields head and tail point to the first and last nodes of the list.
	private DLLNode head, tail;
	public int currentSize = 0;

	/**
	 * Constructor of an empty DLL
	 * 
	 * @return DoublyLinkedList
	 */
	public DoublyLinkedList() {
		head = null;
		tail = null;
	}

	/**
	 * Tests if the doubly linked list is empty
	 * 
	 * @return true if list is empty, and false otherwise
	 *
	 *         Worst-case asymptotic running time cost: theta(1)
	 *
	 *         Justification: the if statement is executed once, therefore the worst case running time is theta(1).
	 */
	public boolean isEmpty() {
		if (head == null) {
			return true;
		}
		return false;
	}

	/**
	 * Inserts an element in the doubly linked list
	 * 
	 * @param pos  : The integer location at which the new data should be inserted
	 *             in the list. We assume that the first position in the list is 0
	 *             (zero). If pos is less than 0 then add to the head of the list.
	 *             If pos is greater or equal to the size of the list then add the
	 *             element at the end of the list.
	 * @param data : The new data of class T that needs to be added to the list
	 * @return none
	 *
	 *         Worst-case asymptotic running time cost: theta(N)
	 *
	 *         Justification: the for-loop is going through the whole list once, therefore the worst case running time is theta(n).
	 */
	public void insertBefore(int pos, T data) {
		DLLNode newNode = new DLLNode(data, null, null);
		DLLNode currentNode = head;
		if (isEmpty()) {
			head = newNode;
			tail = head;
			currentSize++;
		} else if (pos < 0) {
			currentNode = head;
			currentNode.prev = newNode;
			newNode.next = currentNode;
			newNode.prev = null;
			head = newNode;
			currentSize++;
		} else if (pos >= currentSize) {
			currentNode = tail;
			currentNode.next = newNode;
			newNode.next = null;
			newNode.prev = currentNode;
			tail = newNode;
			currentSize++;
		} else {
			for (int i = 0; i < pos; i++) {
				currentNode = currentNode.next;
			}
			newNode.prev = currentNode.prev;
			if (currentNode.prev != null) {
				currentNode.prev.next = newNode;
			} else {
				head = newNode;
			}
			newNode.next = currentNode;
			currentNode.prev = newNode;
			currentSize++;
		}
	}

	/**
	 * Returns the data stored at a particular position
	 * 
	 * @param pos : the position
	 * @return the data at pos, if pos is within the bounds of the list, and null
	 *         otherwise.
	 *
	 *         Worst-case asymptotic running time cost: theta(N)
	 *
	 *         Justification: the for-loop is going through the whole list once, therefore the worst case running time is theta(n).
	 *
	 */
	public T get(int pos) {
		DLLNode currentNode = head;
		if (isEmpty()) {
			return null;
		}
		if (pos >= 0 && pos < currentSize) {
			for (int i = 0; i < pos; i++) {
				currentNode = currentNode.next;
			}
			return currentNode.data;

		}
		return null;

	}

	/**
	 * Deletes the element of the list at position pos. First element in the list
	 * has position 0. If pos points outside the elements of the list then no
	 * modification happens to the list.
	 * 
	 * @param pos : the position to delete in the list.
	 * @return true : on successful deletion, false : list has not been modified.
	 *
	 *         Worst-case asymptotic running time cost: theta(N)
	 *
	 *         Justification: the for-loop is going through the whole list once, therefore the worst case running time is theta(n).
	 */
	public boolean deleteAt(int pos) {
		DLLNode currentNode = head;
		if (get(pos) != null) {
			for (int i = 0; i < pos; i++) {
				currentNode = currentNode.next;
			}
			if (currentNode == head) {
				if (currentNode == tail) {
					head = tail = null;
				} else {
					currentNode.next.prev = null;
					head = head.next;
					currentNode.prev = null;
				}
			} else if (currentNode == tail) {
				currentNode.prev.next = null;
				tail = tail.prev;
				currentNode.next = null;

			} else {
				currentNode.prev.next = currentNode.next;
				currentNode.next.prev = currentNode.prev;
				currentNode.prev = currentNode.next = null;
			}

			currentSize--;
			return true;
		}
		return false;
	}
	

	/**
	 * Reverses the list. If the list contains "A", "B", "C", "D" before the method
	 * is called Then it should contain "D", "C", "B", "A" after it returns.
	 *
	 * Worst-case asymptotic running time cost: theta(N)
	 *
	 * Justification: the for-loop is going through the whole list once, therefore the worst case running time is theta(n).
	 */
	public void reverse() {
		if (currentSize <= 1) {
			return;
		}
		DLLNode temp = null;
		DLLNode currentNode = head;
		while (currentNode != null) {
			temp = currentNode.prev;
			currentNode.prev = currentNode.next;
			currentNode.next = temp;
			currentNode = currentNode.prev;
		}
		head = temp.prev;

	}

	/**
	 * Removes all duplicate elements from the list. The method should remove the
	 * _least_number_ of elements to make all elements uniqueue. If the list
	 * contains "A", "B", "C", "B", "D", "A" before the method is called Then it
	 * should contain "A", "B", "C", "D" after it returns. The relative order of
	 * elements in the resulting list should be the same as the starting list.
	 *
	 * Worst-case asymptotic running time cost: theta(n^2)
	 *
	 * Justification: there exist two nested for-loops that go through each element of the list once, therefore the worst case running time is theta(n^2).
	 */
	public void makeUnique() {
		DLLNode currentNode = head;
		DLLNode indexNode = head;
		DLLNode temp1;
		DLLNode temp2;
			for (int i = 0; currentNode != null;  i++) {
				for (int j = 0; indexNode != null; j++) {
					if (currentNode.data == indexNode.data && i != j) {
						temp1 = indexNode.prev;
						temp2 = indexNode.next;
						if (temp2 != null) {
						temp2.prev = temp1;							
						} else {
							tail = temp1;
						}
						currentSize--;
					if(temp1 != null) {
							temp1.next = temp2; 
						}
					}
					indexNode = indexNode.next;
				}
				indexNode = head;
				currentNode = currentNode.next;
			}
	}
	

	/*----------------------- STACK API 
	 * If only the push and pop methods are called the data structure should behave like a stack.
	 */

	/**
	 * This method adds an element to the data structure. How exactly this will be
	 * represented in the Doubly Linked List is up to the programmer.
	 * 
	 * @param item : the item to push on the stack
	 *
	 *             Worst-case asymptotic running time cost: theta(1)
	 *
	 *             Justification: the function is only executed once so the worst case running time is theta(1)
	 */
	public void push(T item) {
		DLLNode newNode = new DLLNode(item, null, null);
		newNode.next = head;
		newNode.prev = null;
		head = newNode;
		currentSize++;
	}

	/**
	 * This method returns and removes the element that was most recently added by
	 * the push method.
	 * 
	 * @return the last item inserted with a push; or null when the list is empty.
	 *
	 *         Worst-case asymptotic running time cost: theta(1)
	 *
	 *         Justification: the function is only executed once so the worst case running time is theta(1)
	 */
	public T pop() {
		DLLNode temp = null;
		if (head != null) {
			temp = head;
			head = head.next;
			currentSize--;
			return temp.data;

		}
		return null;
	}

	/*----------------------- QUEUE API
	 * If only the enqueue and dequeue methods are called the data structure should behave like a FIFO queue.
	 */

	/**
	 * This method adds an element to the data structure. How exactly this will be
	 * represented in the Doubly Linked List is up to the programmer.
	 * 
	 * @param item : the item to be enqueued to the stack
	 *
	 *             Worst-case asymptotic running time cost: theta(1)
	 *
	 *             Justification: the function is only executed once so the worst case running time is theta(1)
	 */
	public void enqueue(T item) {
		DLLNode newNode = new DLLNode(item, null, null);
		if (isEmpty()) {
			head = tail = newNode;
			return;
		}
		tail.next = newNode;
		tail = newNode;
		currentSize++;

	}

	/**
	 * This method returns and removes the element that was least recently added by
	 * the enqueue method.
	 * 
	 * @return the earliest item inserted with an equeue; or null when the list is
	 *         empty.
	 *
	 *         Worst-case asymptotic running time cost: theta(1)
	 *
	 *         Justification: the function is only executed once so the worst case running time is theta(1)
	 */
	public T dequeue() {
		DLLNode temp = null;
		if (head != null) {
			temp = head;
			head = head.next;
			currentSize--;
			return temp.data;

		}
		return null;
	}

	/**
	 * @return a string with the elements of the list as a comma-separated list,
	 *         from beginning to end
	 *
	 *         Worst-case asymptotic running time cost: Theta(n)
	 *
	 *         Justification: We know from the Java documentation that
	 *         StringBuilder's append() method runs in Theta(1) asymptotic time. We
	 *         assume all other method calls here (e.g., the iterator methods above,
	 *         and the toString method) will execute in Theta(1) time. Thus, every
	 *         one iteration of the for-loop will have cost Theta(1). Suppose the
	 *         doubly-linked list has 'n' elements. The for-loop will always iterate
	 *         over all n elements of the list, and therefore the total cost of this
	 *         method will be n*Theta(1) = Theta(n).
	 */
	public String toString() {
		StringBuilder s = new StringBuilder();
		boolean isFirst = true;

		// iterate over the list, starting from the head
		for (DLLNode iter = head; iter != null; iter = iter.next) {
			if (!isFirst) {
				s.append(",");
			} else {
				isFirst = false;
			}
			s.append(iter.data.toString());
		}

		return s.toString();
	}

}
