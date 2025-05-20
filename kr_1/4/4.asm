; 4 строки 3 столбца 
; a resw 12
; change 2 и 3 строки
; распечатать

%include "st_io.inc"

section .bss
    a resw 12 

section .text
global _start

_start:

    mov esi, a
    mov ecx, 12
input_loop:
    GETSIG eax 
    mov [esi], ax 
    add esi, 2 
    dec ecx
    cmp ecx, 0
    jne input_loop



mov ecx, 3 
mov esi, a + 6 
mov edi, a + 12 
swap_loop:
    mov ax, [esi] 
    mov bx, [edi] 
    mov [esi], bx 
    mov [edi], ax
    add esi, 2 
    add edi, 2
    dec ecx
    cmp ecx, 0
    jne swap_loop


    mov esi, a 
    mov ecx, 12 
    mov ebx, 0 
print_loop:
    movsx eax, word [esi] 
    SIGNINT eax 
    PUTCHAR ' ' 
    add esi, 2 
    inc ebx 
    cmp ebx, 3 
    jne no_newline
    PUTCHAR 10 
    mov ebx, 0 
    no_newline:
    dec ecx
    cmp ecx, 0
    jne print_loop

FINISH
