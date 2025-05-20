;  Даны поля A:3, B:2, C:3 и три переменные размером в один байт.  Используя scanf ввести значения переменных a1, a2, a3. Запаковать их в один байт и вывести на печать, используя функцию printf, перевести строку.

; Архитектура 64-х разрядная

; Пример:

; Ввод
  

; вывод

; 5  2  4
  

; 180

section .data
    in_format  db "%hhu", 0
    out_format db "%d", 10, 0

section .bss
    a1 resb 1
    a2 resb 1
    a3 resb 1

section .text

global main
extern scanf, printf, exit

main:
    sub rsp, 8

    lea rdi, [in_format]
    lea rsi, [a1]
    call scanf


    lea rdi, [in_format]
    lea rsi, [a2]
    call scanf

    lea rdi, [in_format]
    lea rsi, [a3]
    call scanf


    movzx eax, byte [a1]
    and eax, 0b00000111

    movzx ebx, byte [a2]
    and ebx, 0b00000011
    shl ebx, 3
    or eax, ebx

    movzx ecx, byte [a3]
    and ecx, 0b00000111
    shl ecx, 5
    or eax, ecx

    lea rdi, [out_format]
    mov esi, eax
    xor rax, rax
    call printf

end:
    xor rax, rax
    call exit