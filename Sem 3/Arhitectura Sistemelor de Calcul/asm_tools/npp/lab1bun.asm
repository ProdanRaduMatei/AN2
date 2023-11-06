bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    a dw 2
    b db 1
    c dw 3
    d db 4

; our code starts here
segment code use32 class=code
    start:
        ; ...
        mov ax, [a]
        add ax, 2
        mov bl, [b]
        mov bh, 0
        sub ax, bx
        mov bl, [d]
        mov bh, 0
        add ax, bx
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
