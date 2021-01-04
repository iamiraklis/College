.686                                ; create 32 bit code
.model flat, C                      ; 32 bit memory model
option casemap:none                ; case sensitive


.data


.code

;
; t1.asm
;

;
; example mixing C/C++ and IA32 assembly language
;
; use stack for local variables
;
; simple mechanical code generation which doesn't make good use of the registers

public      poly                    ; make sure function name is exported
poly:
            push  ebp               ; push frame pointer
            mov   ebp, esp          ; update ebp

            push  2                 ; push 2
            push  [ebp+8]           ; push arg
            mov   eax, 0            ; instruction requires more bytes
            xor   eax, eax          ; quickest way to clear a register
            call  pow               ; call pow(arg, 2)
            add   eax, [ebp+8]      ; eax = x^2 (from subroutine)+ x
            add   eax, 1            ; eax = x^2 + x + 1

            mov   esp, ebp          ; restore esp
            pop   ebp               ; restore ebp
            ret                     ; return

pow:
            push  ebp               ; push frame pointer
            mov   ebp, esp          ; update ebp

            mov	  eax, [ebp+8]      ; eax = args0
            mov   ecx, [ebp+12]     ; ecx = args1
            sub   ecx, 1            ; N = 2 - 1 So it only loops twice and not 3 times

l1:         imul  eax, [ebp+8]      ; eax = eax * args0
            loop  l1                ; i <= args1

            mov   esp, ebp          ; restore esp
            pop	  ebp               ; restore ebp
            ret                     ; return



public      factorial               ; make sure function name is exported
factorial:
            push  ebp               ; push frame pointer
            mov   ebp, esp          ; update ebp

            mov   eax, [ebp+8]      ; eax = N
            cmp   eax, 1            ; N == 1?
            je    factRet           ; if N == 0 return 1

            dec   eax               ; eax = N - 1
            push  eax               ; push N-1 into stack
            call  factorial         ; call factorial(N-1)
            mov   ebx, [ebp+8]      ; ebx = N

            imul  eax, ebx          ; eax  = N * factorial(N-1)

factRet:    mov   esp, ebp          ; restore esp
            pop	  ebp               ; restore ebp
            ret                     ; return



public       multiple_k_asm         ; make sure function name is exported
multiple_k_asm:
            push  ebp               ; push frame pointer
            mov   ebp, esp          ; update ebp

            mov	  ecx, [ebp+8]      ; ecx = N
            mov   edi, [ebp+12]     ; ebx = K
            mov   esi, [ebp+16]     ; esi = array

            mov   ebx, 0            ; eax = i = 0

mulLoop:
            inc   ebx               ; i + 1
            mov   eax, ebx
            cdq                     ; sign-extend EAX into EDX
            idiv  edi               ; (i + 1) % K
            dec   ebx               ; bring i + 1 back to i

            cmp   edx, 0            ; (i + 1) % K == 0)?
            jne   elseNot           ; if not, go to else
            mov   ax, 1             ; store 1 in register
            mov   [esi], ax         ; array[i] = 1
            add   esi, 2            ; increment array
            jmp   loopBack

elseNot:    mov   ax, 0             ; store 0 in register
            mov   [esi], ax         ; array[i] = 0
            add   esi, 2            ; increment array

loopBack:   inc   ebx               ; i ++
            loop  mulLoop

            mov   eax, esi

            mov   esp, ebp          ; restore esp
            pop	  ebp               ; restore ebp
            ret                     ; return

end
