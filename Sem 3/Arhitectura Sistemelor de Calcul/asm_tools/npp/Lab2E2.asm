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
    ; E = 1 / a + 200 * b - c / (d + 1) + e; a,b-word; c,d-byte; e-doubleword;
    ; E = 1 / 1 + 200 * 1 - 2 / (1 + 1) + 1 = 201
    a dw 1
    b dw 1
    c db 2
    d db 1
    e dd 1

; our code starts here
segment code use32 class=code
    start:
        ; ...
        ; 1 / a, words
        mov ax, [a]
        mov bx, 1
        div bx ; ax = ax / bx
        mov [a], ax
        ; 200 * b, words
        mov ax, [b]
        mov bx, 200
        mul bx ; ax = ax * bx
        mov [b], ax
        ; c / (d + 1), bytes
        mov al, [c]
        mov bl, [d]
        inc bl ; bl = bl + 1
        div bl ; al = al / bl
        mov [c], al
        ; 1 + 200 * 1 - 2 / (1 + 1) + 1, words
        mov ax, [a]
        movzx eax, ax
        mov bx, [b]
        movzx ebx, bx
        add eax, ebx ; eax = eax + ebx
        mov al, [c]
        movzx ebx, al
        

        sub ax, bx ; ax = ax - bx
        mov bx, [e]
        add ax, bx ; ax = ax + bx

    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
