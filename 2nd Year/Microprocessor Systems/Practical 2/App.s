	
	AREA	ASM, CODE, READONLY
	IMPORT	main

; sample program makes the 4 LEDs P1.16, P1.17, P1.18, P1.19 go on and off in sequence
; (c) Mike Brady, 2011 -- 2019.

	EXPORT	start
start

IO1DIR	EQU	0xE0028018
IO1SET	EQU	0xE0028014
IO1CLR	EQU	0xE002801C
decimals EQU 0x40000000
		
USERINPUT  	EQU      -5309   ;user input

	
	LDR R1, =IO1DIR
	LDR R2, =0x000F0000
	STR R2, [R1]
	LDR R1, =IO1SET			;turns off LED
	STR R2, [R1]
	LDR R2, =IO1CLR			;turns on LED

	LDR R3, =USERINPUT      ;user input
	
	MOV R0, R3				;move user input to R0 in order to use it in subroutines
	
	
	BL GETNUM				;call subroutine which performs divide like process with multiples of 10 up to a billion
	LDR R6, =decimals		;start of address that contains the numbers from the subroutine
	MOV R7, #0				;index to loop through array
	
INFINITE_LOOP				;basically display LEDs all the time
	LDRB R3, [R6, R7]		;loop through the address, so that each number is displayed in a sequence of 4 bits
	
	
	CMP R3, #0				;compare current number to 0
	BNE NOZERO				;if input is 0, all LEDs turn on
	ORR R3, R3, #0xF		;
NOZERO	
	
	
	LDR R4, =0x80000		;address of P.19
	LDR R5, =0				;counter for loop
	
LOOP

	CMP R5, #3				;loop 4 times because we have 4 LEDs
	BGT ENDLOOP
	MOVS R3, R3, LSR#1		;move bit to right and set check LSB. if 0, current LED light is off. if 1, current LED light is ON
    BCC NOCARRY
	STR R4, [R2]			;turn LED on
	B DONE
NOCARRY
	
	
DONE
	MOV R4, R4, LSR#1		;move to next LED (P.19-P.16)
	ADD R5, R5, #1			;increment carry so we can stop when we've looped through all the LEDs
	
	B LOOP					;go to next LED
	
ENDLOOP
	BL DELAY				;go to DELAY subroutine
	LDR R4, =0x000F0000		;mask used in order to turn off all LEDs after displaying the whole number
	STR R4, [R1]			;turn LED OFF
	ADD R7, R7, #1			;increment index for next digit in memory address
	CMP R7, R11				;compares index with the total amount of digits that the user inputed. ex the number 8523 has 4 digits
	BEQ L5					;if index is less, then loop back to display next digit
	B	EXIT_LOOP
L5 	MOV R7, #0				;reset counter
	BL DELAY				;display blank
EXIT_LOOP
	B INFINITE_LOOP			;start all over again
stop	B	stop

GETNUM
	PUSH {R4-R10, LR}		;push registers used in subroutine to stack
	MOV R11, #0				;counter used for total number of userinput's digits
	LDR R6, =numbers		;load array of multiples of 10
	LDR r9, =decimals		;start of address that will later store the nmber of bits per digit in memory

	CMP R0, #0				;compare userinput to 0. if less than 0 means that it's negative. in that case, 1011 will be added in front of the number
	BGE NOT_NEGATIVE
	MOV R10, #11			;11 in binary is 1011
	STRB R10, [R9], #1		;store 1011(11) at the beginning of the address and post index to next memory address
	MVN R0, R0				;1's complement
	ADD R0, R0, #1			;2's complement
	ADD R11, R11, #1		;increment counter
NOT_NEGATIVE	
	LDR R10, =0				;boolean, when first digit of userinput is found is set to true. false for now
	
L3
	LDR R7, =0				;counter
	LDR R8, [R6], #4		;load a 10's multiple and post index to next memory address
	CMP R8, #0				;if number is equal to 0 means that we've reached the end of the array
	BEQ L4
L2
	CMP R0, R8				;compare user input to current element of the array
	BLT	L1					;if user input is less than the current element, 
	SUB R0, R0, R8			;subtract the current element from user input
	ADD R7, R7, #1			;increment counter of each digit
	LDR R10, =1				;boolean is set to true
	B	L2
L1	
	
	CMP R10, #0				;if boolean is false
	BNE OR_STATEMENT		;or
	CMP R7, #0				;if counter is 0
	BEQ IGNORE				;just ignore. so 0x00000704 only displays 7,0,4 disgarding the first 0s 
OR_STATEMENT
	STRB R7, [R9], #1		;store the counter in memory
	ADD R11, R11, #1		;increment counter
IGNORE
	B 	L3
L4	
		
	POP {R4-R10, PC}		;pop everything out
	
DELAY
	PUSH {R4, LR}			;push registers used in subroutine to stack
	LDR R4, =8000000		;****************
DELAY_LOOP					;****************
	SUBS R4, R4, #1			;delay code we learned in class
	BNE DELAY_LOOP			;****************
	POP{R4, PC}				;pop everything out
	
	
numbers		DCD 	1000000000, 100000000, 10000000, 1000000, 100000, 10000, 1000, 100, 10, 1, 0 ;array of all multiples of 10

	END