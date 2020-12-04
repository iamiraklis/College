import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

//-------------------------------------------------------------------------
/**
 *  Test class for SortComparison.java
 *
 *  @author Iraklis Bogiatziou
 *  Discussed with Ethan Monkhouse
 *  @version HT 2020
 */

/*
 * Sorting algorithms and their running times
 *
 * ------------------------------------------------------------------------------------------------------
 * |                              |  Insert   |  Select  |  MergeRecursive | MergeIterative  |   Quick  |
 * |numbers10.txt                 |  0.008ms  |  0.009ms |     0.013ms     |     0.03ms      |  0.005ms |  
 * |numbers100.txt                |  0.094ms  |  0.115ms |     0.056ms     |     0.046ms     |  0.031ms |
 * |numbers1000.txt               |  2.771ms  |  3.253ms |     0.684ms     |     0.573ms     |  0.388ms |
 * |numbers1000Duplicates.txt     |  2.805ms  |  3.768ms |     0.549ms     |     0.507ms     |  1.151ms |
 * |numbersNearlyOrdered1000.txt  |  1.038ms  |  2.4ms   |     0.302m      |     0.573ms     |  0.547ms |
 * |numbersReverse1000.txt        |  3.21ms   |  2.965ms |     0.505ms     |     0.469ms     |  3.316ms |
 * |numbersSorted1000.txt         |  0.083ms  |  3.292ms |     0.653ms     |     0.628ms     |  3.568ms |
 * ------------------------------------------------------------------------------------------------------
 *
 * Questions:
 * a) Q: Which of the sorting algorithms does the order of input have an impact on? Why?
 *	  A: Insertion sort and QuickSort have the largest impact because they are the most most volatile
 *		 
 *
 * b) Q: Which algorithm has the biggest difference between the best and worst performance, based
 *       on the type of input, for the input of size 1000? Why?
 *    A: QuickSort has the biggest difference in performance times. The order of values made a big differene in the running time
 *    
 * c) Q: Which algorithm has the best/worst scalability, i.e., the difference in performance time
 *       based on the input size? Please consider only input files with random order for this answer.   
 *    A: Best: QuickSort, Worst: SelectionSort
 *    
 * d) Q: Did you observe any difference between iterative and recursive implementations of merge
 *       sort?
 *    A: Mergesort Iterative was consistently faster in all inputs
 *    
 * e) Q: Which algorithm is the fastest for each of the 7 input files?
 *    A: numbers10.txt: QuickSort
 *    	 numbers100.txt: QuickSort
 *       numbers1000.txt: QuickSort
 *       numbers1000Duplicates.txt: MergeSort Iterative 
 *       numbersNearlyOrdered1000.txt: MergeSort Recursive
 *       numbersReverse1000.txt: MergeSort Iterative
 *       numbersSorted1000.txt: Insertion Sort
 *    
 */

@RunWith(JUnit4.class)
public class SortComparisonTest
{
    //~ Constructor ........................................................
    @Test
    public void testConstructor()
    {
        new SortComparison();
    }

    //~ Public Methods ........................................................

    // ----------------------------------------------------------
    /**
     * Check that the methods work for empty arrays
     */
    @Test
    public void testEmpty()
    {
    }

    @Test
    public void testInsertionSort() {
    	double a[] = {3.14, 6.31, 8, 1.2, 5.0};
    	assertEquals("[1.2, 3.14, 5.0, 6.31, 8.0]", Arrays.toString(SortComparison.insertionSort(a)));
    }
    
    @Test
    public void testSelectionSort() {
    	double a[] = {3.14, 6.31, 8, 1.2, 5.0};
    	assertEquals("[1.2, 3.14, 5.0, 6.31, 8.0]", Arrays.toString(SortComparison.selectionSort(a)));
    	
    }
    
    @Test
    public void testQuickSort() {
    	double a[] = {3.14, 6.31, 8, 1.2, 5.0};
    	double b[] = null;
    	double c[] = {2.3};
    	double d[] = {2.3, 4.1};
    	double e[] = {};
    	assertEquals("[1.2, 3.14, 5.0, 6.31, 8.0]", Arrays.toString(SortComparison.quickSort(a)));
    	assertNull(SortComparison.quickSort(b));
    	assertEquals("[2.3]", Arrays.toString(SortComparison.quickSort(c)));
    	assertEquals("[2.3, 4.1]", Arrays.toString(SortComparison.quickSort(d)));
    	assertEquals("[]", Arrays.toString(SortComparison.quickSort(e)));
    }
    
    @Test
    public void testMergeSortIterative() {
    	double a[] = {3.14, 6.31, 8, 1.2, 5.0};
    	double b[] = null;
    	double c[] = {2.3};
    	double d[] = {2.3, 4.1};
    	double e[] = {};
    	assertEquals("[1.2, 3.14, 5.0, 6.31, 8.0]", Arrays.toString(SortComparison.mergeSortIterative(a)));
    	assertNull(SortComparison.mergeSortIterative(b));
    	assertEquals("[2.3]", Arrays.toString(SortComparison.mergeSortIterative(c)));
    	assertEquals("[2.3, 4.1]", Arrays.toString(SortComparison.mergeSortIterative(d)));
    	assertEquals("[]", Arrays.toString(SortComparison.mergeSortIterative(e)));
    }
  
    @Test
    public void testMergeSortRecursive() {
    	double a[] = {3.14, 6.31, 8, 1.2, 5.0};
    	double b[] = null;
    	double c[] = {2.3};
    	double d[] = {2.3, 4.1};
    	double e[] = {};
    	assertEquals("[1.2, 3.14, 5.0, 6.31, 8.0]", Arrays.toString(SortComparison.mergeSortRecursive(a)));
    	assertNull(SortComparison.mergeSortRecursive(b));
    	assertEquals("[2.3]", Arrays.toString(SortComparison.mergeSortRecursive(c)));
    	assertEquals("[2.3, 4.1]", Arrays.toString(SortComparison.mergeSortRecursive(d)));
    	assertEquals("[]", Arrays.toString(SortComparison.mergeSortRecursive(e)));
    }
    
    
    
    /**
     *  Main Method.
     *  Use this main method to create the experiments needed to answer the experimental performance questions of this assignment.
     *
     */
    @Test
    public void testMain() throws IOException {
//        System.out.println("main");
//        String[] args = null;
//        final InputStream original = System.in;
//        final FileInputStream fips = new FileInputStream(new File("D:\\\\eclipse-workspace\\\\CSU22010_SortComparison\\\\src\\\\numbers10.txt"));
//        System.setIn(fips);
//        SortComparison.main(args);
//        System.setIn(original);
    }

}
