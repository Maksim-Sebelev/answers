; Ввести число без знака, размером в слово, используя функцию scanf, поместить его в регистр ax, затем переписать в обратном порядке биты al в ah, используя команды сдвига. Регистр al оставить без изменения. Вывести полученное число на печать, используя функцию printf в виде: ax = полученное значение, осуществить перевод строки.  (Обратите внимание на пробелы при выводе).

; Биты нумеруются от 0 справа налево.

; Архитектура 64-х разрядная

; Пример:

; ввод
  

; вывод

; 43567
  

; ax = 62511

section .data
    input_format db "%hu", 0      
    output_format db "ax = %hu", 10, 0 
    
section .bss
    number resw 1               
    
section .text
    global main
    extern scanf, printf, exit

main:
    push rbp
    mov rbp, rsp
    
    sub rsp, 16
    
    lea rdi, [input_format]
    lea rsi, [number]
    xor eax, eax
    call scanf
    
    mov ax, [number]
    
    mov dl, al
    
    mov cl, 8            
    xor ah, ah
    
reverse_bits:
    shr al, 1 
    rcl ah, 1 
    dec cl
    jnz reverse_bits
    
    mov al, dl
    
    mov [number], ax
    
    lea rdi, [output_format]
    movzx rsi, word [number]
    xor eax, eax
    call printf
    
    xor rdi, rdi
    call exit
