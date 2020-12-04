	AREA	app, CODE, READWRITE
	IMPORT main

; sample program makes the 4 LEDs P1.16, P1.17, P1.18, P1.19 go on and off in sequence
; (c) Mike Brady, 2011 -- 2019.

	EXPORT	start
start

IO1DIR   EQU 0xE0028018
IO1SET	 EQU 0xE0028014
IO1CLR	 EQU 0xE002801C
decimals EQU 0x40000000
IO1PIN   EQU 0xE0028010
P120	 EQU 0x00E00000
P121	 EQU 0x00D00000
P122	 EQU 0x00B00000	
P123	 EQU 0x00700000


	LDR R1, =IO1DIR
	LDR R2, =0x000F0000		;mask in order to use P1.16-P1.20
	STR R2, [R1]
	LDR R1, =IO1SET			;turns off LED
	STR R2, [R1]
	LDR R2, =IO1CLR			;turns on LED
	
startover	
	mov r3, #0				;number will be stored here
nextPress1
	mov r6, #0				;boolean for add
	mov r7, #0				;boolean for sub	
	
nextPress
	BL readPress
	mov r4, r0     			;get the return value from subroutine
	cmp r4, #20				;if p1.20, subtract numbers
	beq subnum
	cmp r4, #21				;if p1.21, add numbers
	beq	addnum
	cmp r4, #22				;if p1.22, decrease number
	beq	decnum
	cmp r4, #23				;if p1.23, increase number
	beq incnum
	cmp r4, #-20			;if p1.20, longpress, clear calc
	beq clearcalc
	cmp r4, #-21			;;if p1.20, longpress, clear current
	beq clearcurr

incnum
	add r3, r3, #1
	mov r0, r3				;move number to r0 to display in subroutine
	bl display
	bl nextPress			;wait for next button press
	
decnum
	sub r3, r3, #1
	mov r0, r3				;move number to r0 to display in subroutine
	bl display
	bl nextPress			;wait for next button press

addnum
	cmp r6, #0				;if first time
	bne	notfirsttime
	mov r5, #0
	mov r6, #1	
	mov r0, #0
	bl display
	b noadd
notfirsttime
	add r3, r3, r5
	mov r0, r3
	bl display
noadd
	mov r5, r3				;move number to temp register
	mov r3, #0				;restart register
	b	nextPress         
	
subnum
	cmp r7, #0				;if first time
	bne	notfirsttime1
	mov r5, #0
	mov r7, #1
	mov r0, #0
	bl display
	b nosub
notfirsttime1
	sub r3, r5, r3
	mov r0, r3
	bl display	
nosub
	mov r5, r3				;move number to temp register
	mov r3, #0				;restart register
	b	nextPress  
	
clearcalc
	b startover
clearcurr
	mov r3, r5
	mov r5, #0
	b nextPress1
stop	B	stop


; Subroutine: display press of button
; parameters: number that will be displayed
; return: none

display
	stmfd sp!,{r3-r6,lr}
	ldr r6, =0x80000
	str r6, [r1]
	ldr r6, =0x40000
	str r6, [r1]
	ldr r6, =0x20000
	str r6, [r1]
	ldr r6, =0x10000
	str r6, [r1]
	and r3, r0, #1			;p1.19
	mov r3, r3, lsl#19		;shift 19 times in order to get #0x80000
	and r4, r0, #2			;p1.18
	mov r4, r4, lsl#17		;shift 19 times in order to get #0x40000
	and r5, r0, #4			;p1.19
	mov r5, r5, lsl#15		;shift 15 times in order to get #0x20000
	and r6, r0, #8			;p1.19
	mov r6, r6, lsl#13		;shift 15 times in order to get #0x10000
	orr r3, r4, r3			;Or-ring everything together
	orr r3, r5, r3
	orr r3, r6, r3
	str r3, [r2]			;display in LED
	ldmfd sp!, {r3-r6,pc}

; Subroutine: reading press of button
; parameters: none
; return: index of buttons in R0
readPress
	PUSH {R3-R10, LR}
	LDR R4,  =P120 			 ;P1.20
	LDR R5,  =P121  		 ;P1.21
	LDR R6,  =P122   		 ;P1.22
	LDR R7,  =P123    		 ;P1.23
	LDR R8,  =0x10000  		 ;P1.16
	ldr r10,  =0x00F00000 	 ; mask
	
Loop
	LDR R3, =IO1PIN			;read/write
	LDR R9, [R3]			;get user input
	AND R9, R10, R9
	CMP R9, R4				;check button press, P1.20
	BNE light17
	;check for delay
	bl  delay				;subroutine to check for long press
	LDR R3, =IO1PIN
	LDR R9, [R3]			;get user input
	ldr r10,  =0x00F00000   ; mask
	AND R9, R10, R9
	CMP R9, R4
	BEQ longp16
	mov r0, #20
	b	nolong16
longp16
	mov r0, #-20			;turn off led p1.16
nolong16
	b	finish
	
light17	
	CMP R9, R5				;check button press, P1.21
	BNE light18
	;check for delay
	bl  delay				;subroutine to check for long press
	LDR R3, =IO1PIN
	LDR R9, [R3]			;get user input
	ldr r10,  =0x00F00000   ; mask
	AND R9, R10, R9
	cmp r9, r5
	BEQ longp17
	mov r0, #21
	b	nolong17
longp17
	mov r0, #-21
nolong17

	b finish
	
light18	
	CMP R9, R6				;check button press, P1.22
	BNE light19
	;check for delay
	bl  delay				;subroutine to check for long press
	LDR R3, =IO1PIN
	LDR R9, [R3]			;get user input
	ldr r10,  =0x00F00000   ; mask
	AND R9, R10, R9
	cmp r9, r6
	BEQ longp18
	mov r0, #22
	b	nolong18
longp18
	mov r0, #-22
nolong18
	b finish
	
light19	
	CMP R9, R7				;check button press, P1.23
	BNE nolight
	;check for delay
	bl  delay				;subroutine to check for long press
	LDR R3, =IO1PIN
	LDR R9, [R3]			;get user input
	ldr r10,  =0x00F00000   ; mask
	AND R9, R10, R9
	cmp r9, r7
	BEQ longp19
	mov r0, #23
	b	nolong19
longp19
	mov r0, #-23
nolong19
	b finish
	
nolight
	B Loop
	
finish
	POP {R3-R10, PC}


; Subroutine: delay
; parameters: none
; return: none
delay
	stmfd sp!,{r4,lr}
	ldr r4, =4000000 
delay1 
    subs r4, r4, #1 
	bne delay1 
	ldmfd sp!, {r4,pc}

	END