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

global main
    extern scanf
    extern printf
    extern exit

section .data
    f_in db "%u", 0
    f_out db "%u", 10, 0
    
section .bss
    n resb 1
    a resb 20
    count resb 1

section .text
    
main:

    sub rsp, 8
    lea rdi, [f_in]
    lea rsi, [n]
    call scanf
   
    movzx rcx, byte [n] 
  xor rbx, rbx
read_loop:
    lea rdi, [f_in]
    lea rsi, [a + rbx]
    push rcx
    push rbx
    call scanf
    pop rbx
    pop rcx
    inc rbx
    loop read_loop

  mov byte[count], 1
  movzx ax, byte[a]
  push ax
  movzx rcx, byte[n]
  dec rcx
  mov rbx,1
  xor si,si

l:  
  movzx ax, byte[a + rbx]
  cmp ax, word[rsp]
  jbe end
  push ax
  inc byte[count]
end:
  inc rbx
loop l

    lea rdi, [f_out]
    movzx rsi, byte [count]
    xor rax, rax
    call printf
    add rsp, 8

    xor rax, rax
    call exit
