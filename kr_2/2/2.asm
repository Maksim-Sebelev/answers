; Ввести число без знака, размером в слово, используя функцию scanf, поместить его в регистр ax, переписать в обратном порядке биты ah в al, используя команды сдвига. Регистр ah оставить без изменения. Вывести полученное число на печать, используя функцию printf в виде: ax = полученное значение, осуществить перевод строки.  (Обратите внимание на пробелы при выводе).

; Биты нумеруются от 0 справа налево.

; Архитектура 64-х разрядная

; Пример :

; ввод

; вывод

; 43567

; ax = 43605

section .data
    scan_format db "%d", 0
    printf_format db "ax = %d", 10, 0

section .bss
    n resw 1

section .text
    global main

extern scanf, printf, exit

main:
    sub rsp, 8
    mov rdi, scan_format
    mov rsi, n
    xor rax, rax
    call scanf
    add rsp, 8

    mov ax, word [n]
    and ax, 0b1111111100000000
    mov bx, ax
    shr bx, 8

    mov ecx, 8
go:
    mov dl, 0
    shr bx, 1
    adc dl, 0
    push rcx
    dec ecx
    shl dl, cl
    or al, dl
    pop rcx
    loop go

    sub rsp, 8
    lea rdi, [printf_format]
    mov rsi, rax
    xor rax, rax
    call printf
    add rsp, 8

    xor rdi, rdi
    call exit