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
        mov ax, 1 ; ax = 1
        idiv word [a] ; ax = ax / a
        mov bx, ax ; bx = ax
        ; 200 * b, words
        mov ax, [b] ; ax = b
        mov dx, 200 ; dx = 200
        mul dx ; dx:ax = ax * dx
        ; make dx:ax in eax
        push dx ; push dx onto the stack
        push ax ; push ax onto the stack
        pop eax ; pop ax off the stack
        ; c / (d + 1), bytes
        mov al, [c] ; al = c
        mov bl, [d] ; bl = d
        inc bl ; bl = bl + 1
        div bl ; al = al / bl
        ; move al in ebx
        movzx ebx, al ; ebx = al
        ; move ax in ecx
        movzx ecx, ax ; ecx = ax
        ; ebx + eax - ecx + e, doublewords
        mov edx, [e] ; edx = e
        add ebx, eax ; ebx = ebx + eax
        sub ebx, ecx ; ebx = ebx - ecx
        add ebx, edx ; ebx = ebx + edx
        ; ebx is the result


    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
