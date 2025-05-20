; Дан двумерный массив, из элементов размером в слово со знаком, состоящий из n строк и m столбцов (n ≤ 10, m ≤ 10).
; Ввести, используя функцию scanf, сначала количество строк и столбцов, затем, элементы массива.
; Написать процедуру, в которой, используя цепочные команды, найти первые две строки, у которых 3, 4 и 5 элемент первой строки были бы равны 2, 3 и 4 элементу второй строки.  Поменять местами эти строки. Если таких строк нет, ничего не менять. Распечатать элементы, полученного массива в виде матрицы через пробел, используя функцию printf.
; Передать в процедуру массив – по адресу, количество элементов – по значению.  
; Обязательно использовать локальную переменную, сформировав стековый фрейм и ret с параметром.

; Архитектура 64-х разрядная


; Пример:
; Ввод
; Вывод
; 3
; 8
; 1 3 6 8 12 15 77 54
; 4 6 8 2 67 45 23 32
; 7 8 8 12 15 19 77 18
;  

; 7 8 8 12 15 19 77 18
; 4 6 8 2 67 45 23 32
; 1 3 6 8 12 15 77 54
; #номер3

global main
extern exit
extern scanf
extern printf

section .data
    f    db "%u", 0
    fvv  db "%d", 0
    fviv db "%d ", 0
    ent  db "%c", 0

section .bss
    n   resb 1
    m   resb 1
    a   resw 100
    rab resw 10

section .text
main:
    sub rsp, 8
    lea esi, [n]
    lea edi, [f]
    xor rax, rax
    call scanf
    
    lea esi, [m]
    lea edi, [f]
    xor rax, rax
    call scanf
    add rsp, 8
    
    movzx rcx, byte [n]
    xor ebx, ebx
l1:
    push rcx
    push rdx
    movzx rcx, byte [m]
    xor edx, edx
    sub rsp, 8
l2:
    push rcx
    push rdx
    lea esi, [a + ebx + edx*2]
    lea edi, [fvv]
    xor rax, rax
    call scanf
    pop rdx
    pop rcx
    inc edx
    loop l2
    add rsp, 8
    pop rdx
    pop rcx
    movzx eax, byte [m]
    mov esi, 2
    mul esi
    add ebx, eax
    loop l1
    
    push a
    movzx rax, byte [n]
    push rax
    movzx rax, byte [m]
    push rax
    call proc_eq_elem
    
    movzx rcx, byte [n]
    xor ebx, ebx
l3:
    push rcx
    movzx rcx, byte [m]
    xor edx, edx
    sub rsp, 8
l4:
    push rcx
    push rdx
    mov edi, fviv
    mov ax, word [a + ebx + edx*2]
    cwde
    mov esi, eax
    xor rax, rax
    call printf
    pop rdx
    pop rcx
    inc edx
    loop l4
    
    mov rdi, ent
    mov esi, 0xa
    xor rax, rax
    call printf
    add rsp, 8
    pop rcx
    movzx eax, byte [m]
    mov esi, 2
    mul esi
    add ebx, eax
    loop l3
    
    xor rdi, rdi
    call exit

proc_eq_elem:
    push rbp
    push rab
    mov rbp, rsp
    mov rcx, [rbp + 32]
    dec rcx
    xor ebx, ebx
r1:
    push rcx
    mov edx, ebx
    mov rax, [rbp + 24]
    add edx, eax
    add edx, eax
r2:
    push rcx
    mov ecx, 3
    mov rsi, [rbp + 40]
    add esi, ebx
    add esi, 6
    mov rdi, [rbp + 40]
    add edi, edx
    add edi, 4
    repe cmpsw
    jz fin
    
    mov rax, [rbp + 24]
    add edx, eax
    add edx, eax
    pop rcx
    loop r2
    
    pop rcx
    mov rax, [rbp + 24]
    add ebx, eax
    add ebx, eax
    loop r1
    jmp return

fin:
    pop rcx
    pop rcx
    mov rcx, [rbp + 24]
    mov rsi, [rbp + 40]
    add esi, ebx
    mov edi, [rbp]
    rep movsw
    
    mov rcx, [rbp + 24]
    mov rsi, [rbp + 40]
    add esi, edx
    mov rdi, [rbp + 40]
    add edi, ebx
    rep movsw
    
    mov rcx, [rbp + 24]
    mov rsi, [rbp]
    mov rdi, [rbp + 40]
    add edi, edx
    rep movsw

return:
    add rsp, 8
    pop rbp
    ret 24