; Zevs Grom, [20.05.2025 11:08]
; 1
; Дан массив чисел без знака, размером в 1 байт, состоящий из n элементов.

; Это - высоты некоторых сооружений. Необходимо определить сколько таких сооружений, можно увидеть из начальной точки 0. Все остальные точки (от 1 до n) – это элементы массива.
; Сначала вводим n (n  <=  20), затем n элементов массива.

; Для ввода и вывода использовать функции scanf и printf.

; Задачу решить с использованием стека.

; Архитектура 64-х разрядная

; Пример:

; Ввод

; Вывод

; 7

; 13 12 15 11 9 12 16

; 3
; #номер1

; Zevs Grom, [20.05.2025 11:09]

section .data
    fmt_input db "%hhu", 0
    fmt_output db "%d", 10, 0
    n db 0
    a times 20 db 0

section .bss
    max_height resb 1
    count resb 1

section .text
    global main
    extern scanf, printf, exit

main:

    sub rsp, 8
    lea rdi, [fmt_input]
    lea rsi, [n]
    call scanf
    add rsp, 8


    xor r12, r12 
    movzx rbx, byte [n] 

.read_loop:
    cmp r12, rbx
    jge .end_read

    sub rsp, 8
    lea rdi, [fmt_input]
    lea rsi, [a + r12]
    call scanf
    add rsp, 8

    inc r12
    jmp .read_loop

.end_read:

    xor r12, r12
    mov byte [count], 1
    mov dl, [a]
    push rdx

.check_loop:
    cmp r12, rbx
    jge .end_check

    mov al, [a + r12]
    pop rdx
    cmp al, dl
    jna .skip

    inc byte [count]
    mov dl, al

.skip:
    push rdx
    inc r12
    jmp .check_loop

.end_check:

    sub rsp, 8
    lea rdi, [fmt_output]
    movzx rsi, byte [count]
    xor rax, rax
    call printf
    add rsp, 8

    xor rax, rax
    call exit