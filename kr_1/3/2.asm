
; find min : arr[i] -> arr[i]%min

%include "st_io.inc"

section .data
    a db 34, 67, 28, -120, 6, 98, -5, 88, 121, -65  
section .bss
    min resb 1
    temp resb 1

section .text
global _start

_start:
    mov esi, a
    mov al, [esi]
    mov [min], al
    mov ecx, 10
    dec ecx

find_min_loop:
    inc esi
    mov bl, [esi]
    cmp bl, [min]
    jge skip_update
    mov [min], bl
skip_update:
    loop find_min_loop

    mov esi, a
    mov ecx, 10
    mov bl, [min]
replace_loop:
    mov al, [esi]
    cbw
    idiv bl
    mov [esi], ah
    inc esi
    loop replace_loop

    mov esi, a
    add esi, 9
    mov ecx, 10

    print_loop:

    movsx edx, byte [esi]
    SIGNINT edx
    PUTCHAR ' '
    dec esi

    dec ecx
    cmp ecx, 0
    jne print_loop

    FINISH
