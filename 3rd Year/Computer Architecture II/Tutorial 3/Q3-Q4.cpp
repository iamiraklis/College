#include "pch.h"
#include <iostream>
#include <conio.h>			
#include <time.h> 		

int windowDepth;
int procedureCalls;
int numberWindows;
int usedWindows;
int maxRegisterWindowDepth;
int underflows;
int overflows;

void setVariables(int registerWindows) {
	numberWindows = registerWindows;

	windowDepth = 0;
	procedureCalls = 0;
	usedWindows = 2;
	maxRegisterWindowDepth = 0;
	underflows = 0;
	overflows = 0;
}

int compute_pascal(int row, int position) {

	windowDepth++;

	if (numberWindows == usedWindows)
	{
		overflows++;
	}
	else  usedWindows++;

	if (windowDepth > maxRegisterWindowDepth)
	{
		maxRegisterWindowDepth = windowDepth;
	}

	if (position == 1)
	{
		procedureCalls = 1;
	}
	else if (position == row)
	{
		procedureCalls = 1;
	}
	else
	{
		procedureCalls = compute_pascal(row - 1, position) + compute_pascal(row - 1, position - 1);
	}

	if (usedWindows == 2)
	{
		underflows++;
	}
	else usedWindows--;

	windowDepth--;

	return procedureCalls;
}

int main()
{
	int callsResult;
	clock_t begin;
	clock_t end;
	double time_elapsed;

	begin = clock();
	setVariables(6);
	callsResult = compute_pascal(30, 20);
	printf("Number of windows = %d,\nProcedure calls = %d,\nMaximum register window depth = %d,\nOverflows = %d,\nUnderflows = %d,\nUsed windows = %d,\n", numberWindows, callsResult, maxRegisterWindowDepth, overflows, underflows, usedWindows);
	end = clock();
	time_elapsed = (double)(end - begin);
	printf("Time passed: %g \n\n", (time_elapsed) / CLOCKS_PER_SEC);

	printf("**************************\n\n");

	begin = clock();
	setVariables(8);
	callsResult = compute_pascal(30, 20);
	printf("Number of windows = %d,\nProcedure calls = %d,\nMaximum register window depth = %d,\nOverflows = %d,\nUnderflows = %d,\nUsed windows = %d,\n", numberWindows, callsResult, maxRegisterWindowDepth, overflows, underflows, usedWindows);
	end = clock();
	time_elapsed = (double)(end - begin);
	printf("Time passed: %g \n\n", (time_elapsed) / CLOCKS_PER_SEC);

	printf("**************************\n\n");

	begin = clock();
	setVariables(16);
	callsResult = compute_pascal(30, 20);
	printf("Number of windows = %d,\nProcedure calls = %d,\nMaximum register window depth = %d,\nOverflows = %d,\nUnderflows = %d,\nUsed windows = %d,\n", numberWindows, callsResult, maxRegisterWindowDepth, overflows, underflows, usedWindows);
	end = clock();
	time_elapsed = (double)(end - begin);
	printf("Time passed: %g \n\n", (time_elapsed) / CLOCKS_PER_SEC);

	return 0;
}

/*
Q4
To measure the time elapsed, I used the clock_t function of time.h which takes the current CPU time.
Then, I subtracted the start CPU time from the end CPU time giving me the total CPU time it took
to compute pascal. This is a quite accurate measurement as it very CPU dependant. However the
CLOCKS_PER_SEC macro which converts to real time, only does so to a few decimal places. Other CPUs
would produce different results.
The program was ran on a Macbook Air 2020 (using Windows) i5 1030NG7 CPU at 1.1Ghz (Max 3.5Ghz).

*/