includelib legacy_stdio_definitions.lib
extrn printf:near
extrn scanf:near



;; Data segment
.data

	print_string BYTE "Please enter an integer: ", 0Ah, 00h
	print_result BYTE "The sum of proc. and user inputs (%lld , %lld , %lld , %lld) : %lld", 0Ah, 00h
	
	
	public inp_int
	inp_int QWORD 0

	type_input BYTE "%lld", 00h

;; Code segment
.code

public fibonacci_recursion

public fibonacci_recursion
fibonacci_recursion:

        push    rbp                 ; push frame pointer
        mov     rbp, rsp            

        mov     rax, rcx            ; rax = fin

        cmp     rax, 0              ; fin <= 0?
        jle     fibRet              ; yes, return fib

        cmp     rax, 1              ; fin = 1?
        je      fibRet              ; yes, return 1

		dec		rcx					; N - 1
		push	rcx					; push N-1
		call    fibonacci_recursion ; fibonacci_recursion(N-1)
		pop		rcx					; remove N-1 from stack

		push	rax					; save fibonacci_recursion(N-1)

		dec		rcx					; N-2
		push	rcx					; push N-2
		call    fibonacci_recursion ; fibonacci_recursion(N-2)
		pop		rcx					; remove N-2 from stack
		pop		rcx					; rcx = fibonacci(N-1)

		add		rax, rcx			; rax = fibonacci(N-2) + fibonacci(N-1)

fibRet:
        mov     rsp, rbp            ; restore rsp
        pop     rbp                 ; restore rbp
        ret                         ; return



public use_scanf
use_scanf:
        push    rbp					; push frame pointer
        mov     rbp, rsp		

		mov     [rbp+16],rcx		; a
        mov     [rbp+24],rdx		; b
        mov     [rbp+32],r8			; c

        mov     r9, rcx				; r9 = a, temporary store it for later

        add     rcx,rdx				; a + 0
        add     rcx,r8				; a + b
        mov     rbx, rcx            ; a + b + c

        lea     rcx, print_string	; print "Please enter an integer: "
        sub     rsp, 32			    ; allocate shadow space
        call    printf				; use C++ printf function

        lea     rcx, type_input
        lea     rdx, inp_int		; get input
        call    scanf				; use C++ scanf function

        add     rsp, 32				; de-allocate shadow space	
        mov     rax, inp_int
        add     rbx, rax            ; sum += inp_int
		
        mov     rax, r9             ; rax = a
        mov     r9, r8              ; r9 = c
        mov     r8, rdx             ; r8 = b
        mov     rdx, rax            ; rdx = a

		mov     r9, [rbp+32]        ; r9 = c
        mov     r8, [rbp+24]        ; r8 = b
        mov     rdx,[rbp+16]        ; rdx = a

        lea     rcx, print_result   ; print "The sum of proc. and user inputs (%lld , %lld , %lld , %lld) : %lld "
        mov     rax, inp_int		; rax = inp_int
        push    rbx                 ; push sum to stack
        push    rax                 ; push inp_int to stack
        sub     rsp, 32             ; allocate shadow space
        call    printf				; use C++ printf function

        add     rsp, 32			    ; deallocate shadow space



        mov     rax, rbx			; rax = sub

        mov     rsp, rbp            ; restore rsp
        pop     rbp                 ; restore rbp
        ret                         ; return sum



public max
max:
        push    rbp					; push frame pointer
        mov     rbp, rsp		
		mov		rax, rcx			; rax = a = v
		cmp		rdx, rax			; b > v ?
		jle		nextComp			; <=
		mov		rax, rdx			; v = b 
        
nextComp:
		cmp		r8, rax				; c > v ?
		jle		maxRet				; <= 
		mov		rax, r8				; v = c

maxRet:
        mov     rsp, rbp            ; restore rsp
        pop     rbp                 ; restore rbp
        ret                         ; return sum



public    max5						
max5:
        push    rbp					; push frame pointer
        mov     rbp, rsp			; update rbx
		sub		rsp, 32				; allocate shadow space
    
		mov		[rsp+56], r8		; temporary store k for later

		mov		r8, rdx				; r8  = j
		mov		rdx, rcx			; rdx = i
		mov		rcx, inp_int		; rcx = inp_int

		call	max					; max(inp_int, i, j)

		mov		rcx, rax			; rcx = max(inp_int, i, j
		mov		rdx, [rsp+56]		; r8 = k
		mov		r8, r9				; r9 = l

		call	max					; max(max(inp_int, i, j), k, l)

		add		rsp, 32				; deallocate shadow space
		mov     rsp, rbp            ; restore esp
        pop     rbp                 ; restore ebp
		ret 

end