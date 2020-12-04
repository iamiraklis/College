import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Arrays;

// -------------------------------------------------------------------------

/**
 * This class contains static methods that implementing sorting of an array of
 * numbers using different sort algorithms.
 *
 * @author Iraklis Bogiatziou
 * @version HT 2020
 */

class SortComparison {

	/**
	 * Sorts an array of doubles using InsertionSort. This method is static, thus it
	 * can be called as SortComparison.sort(a)
	 * 
	 * @param a: An unsorted array of doubles.
	 * @return array sorted in ascending order.
	 *
	 */
	static double[] insertionSort(double a[]) {
		int n = a.length;
		for (int i = 1; i < n; ++i) {
			double key = a[i];
			int j = i - 1;
			while (j >= 0 && a[j] > key) {
				a[j + 1] = a[j];
				j = j - 1;
			}
			a[j + 1] = key;
		}
		return a;
	}// end insertionsort

	/**
	 * Sorts an array of doubles using Selection Sort. This method is static, thus
	 * it can be called as SortComparison.sort(a)
	 * 
	 * @param a: An unsorted array of doubles.
	 * @return array sorted in ascending order
	 *
	 */
	static double[] selectionSort(double a[]) {
		int n = a.length;

		// One by one move boundary of unsorted subarray
		for (int i = 0; i < n - 1; i++) {
			// Find the minimum element in unsorted array
			int min_idx = i;
			for (int j = i + 1; j < n; j++)
				if (a[j] < a[min_idx])
					min_idx = j;

			// Swap the found minimum element with the first
			// element
			double temp = a[min_idx];
			a[min_idx] = a[i];
			a[i] = temp;
		}
		return a;

	}// end selectionsort

	/**
	 * Sorts an array of doubles using Quick Sort. This method is static, thus it
	 * can be called as SortComparison.sort(a)
	 * 
	 * @param a: An unsorted array of doubles.
	 * @return array sorted in ascending order
	 *
	 */
	static double[] quickSort(double a[]) {
		if (a == null || a.length < 2) // check for invalid/already sorted arrays
			return a;
		quickSortRecursive(a, 0, a.length - 1);
		return a;
	}// end quicksort

	private static void quickSortRecursive(double a[], int start, int finish) {
		int pivot = partition(a, start, finish);
		if (start < pivot - 1)
			quickSortRecursive(a, start, pivot - 1);
		if (finish > pivot + 1)
			quickSortRecursive(a, pivot + 1, finish);
	}

	private static int partition(double a[], int low, int high) {
		double pivot = a[high];
		int i = (low - 1); // index of smaller element
		for (int j = low; j < high; j++) {
			// If current element is smaller than the pivot
			if (a[j] < pivot) {
				i++;

				// swap arr[i] and arr[j]
				double temp = a[i];
				a[i] = a[j];
				a[j] = temp;
			}
		}

		// swap arr[i+1] and arr[high] (or pivot)
		double temp = a[i + 1];
		a[i + 1] = a[high];
		a[high] = temp;

		return i + 1;
	}

	/**
	 * Sorts an array of doubles using Merge Sort. This method is static, thus it
	 * can be called as SortComparison.sort(a)
	 * 
	 * @param a: An unsorted array of doubles.
	 * @return array sorted in ascending order
	 *
	 */
	/**
	 * Sorts an array of doubles using iterative implementation of Merge Sort. This
	 * method is static, thus it can be called as SortComparison.sort(a)
	 *
	 * @param a: An unsorted array of doubles.
	 * @return after the method returns, the array must be in ascending sorted
	 *         order.
	 */
	static double[] mergeSortIterative(double a[]) {
		if (a == null || a.length < 2)
			return a;
		return mSortI(a);
	}

	private static double[] mSortI(double a[]) {
		int arrLen = a.length;
		double[] aux = new double[arrLen];
		for (int i = 1; i < arrLen; i += i) {
			for (int j = 0; j < arrLen - i; j += i + i) {
				mergeR(a, aux, j, j + i - 1, Math.min(j + i + i - 1, arrLen - 1));
			}
		}
		return a;
	}// end mergesortIterative

	/**
	 * Sorts an array of doubles using recursive implementation of Merge Sort. This
	 * method is static, thus it can be called as SortComparison.sort(a)
	 *
	 * @param a: An unsorted array of doubles.
	 * @return after the method returns, the array must be in ascending sorted
	 *         order.
	 */
	static double[] mergeSortRecursive(double[] a) {
		if (a == null || a.length < 2)
			return a;
		double[] aux = new double[a.length];
		mSortR(a, aux, 0, a.length - 1);
		return a;
	}

	private static void mSortR(double[] a, double[] aux, int lo, int hi) {
		if (lo >= hi)
			return;
		int mid = lo + (hi - lo) / 2;
		mSortR(a, aux, lo, mid);
		mSortR(a, aux, mid + 1, hi);
		mergeR(a, aux, lo, mid, hi);
	}

	private static void mergeR(double[] a, double[] aux, int lo, int mid, int hi) {
		System.arraycopy(a, lo, aux, lo, (hi - lo) + 1);

		int i = lo, j = mid + 1;
		for (int k = lo; k <= hi; k++) {
			if (i > mid)
				a[k] = aux[j++];
			else if (j > hi)
				a[k] = aux[i++];
			else if (aux[i] > aux[j])
				a[k] = aux[j++];
			else
				a[k] = aux[i++];
		}
	}
}// end mergeSortRecursive

	
	
//	public static void main(String[] args) {
//		int runs = 3;
//		double average = 0;
//		double startT;
//		double finishT;
//		double[] a = new double[1000];
//		DecimalFormat df = new DecimalFormat();
//		df.setMaximumFractionDigits(3);
//		
//		for (int i = 0; i < runs; i++) {
//			try {
//				File f = new File("D:\\eclipse-workspace\\CSU22010_SortComparison\\src\\numbers1000.txt");
//				FileReader input = new FileReader(f);
//				BufferedReader in = new BufferedReader(input);
//
//				String s = in.readLine();
//				int j = 0;
//				while (s != null) {
//					a[j] = Double.parseDouble(s);
//					s = in.readLine();
//					j++;
//				}
//				
//
//				in.close();
//			} catch (FileNotFoundException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//
//			startT = System.nanoTime();
//
//			SortComparison.mergeSortRecursive(a);
//			finishT = System.nanoTime();
//			average += ((finishT - startT) / 1000000);
//		}
//		System.out.println("Average sorting time: " + df.format(average / runs) + "ms");
//	}
//
//}// end class
