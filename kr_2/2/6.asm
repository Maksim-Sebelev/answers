; Ввести число без знака, размером в слово, используя функцию scanf, поместить его в регистр ax, переписать в обратном порядке биты ah в al, используя команды сдвига. Регистр ah оставить без изменения. Вывести полученное число на печать, используя функцию printf в виде: ax = полученное значение, осуществить перевод строки. (Обратите внимание на пробелы при выводе).

; Биты нумеруются от 0 справа налево.

; Архитектура 64-х разрядная

section .data
    fmt_input db "%hu", 0 
    fmt_output db "ax = %hu", 10, 0 

section .bss
    input_val resw 1 

section .text
    global main
    extern scanf, printf, exit

main:
    sub rsp, 8
    lea rdi, [fmt_input]
    lea rsi, [input_val]
    call scanf
    add rsp, 8


    mov ax, [input_val] 


    mov bl, ah
    xor cl, cl 
    mov ch, 8 

reverse_loop:
    shr bl, 1 
    rcl cl, 1 
    dec ch
    jnz reverse_loop


    mov al, cl
    sub rsp, 8
    lea rdi, [fmt_output]
    movzx rsi, ax 
    xor rax, rax 
    call printf
    add rsp, 8


    xor rax, rax
    call exit
