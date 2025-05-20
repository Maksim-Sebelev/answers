; Ввести число без знака, размером в слово, используя функцию scanf, затем поменять местами 3 правых бита с 3 левыми битами и вывести полученное число на печать, используя функцию printf в виде: a = и полученное значение, осуществить перевод строки.  (Обратите внимание на пробелы при выводе)

; Архитектура 64-х разрядная

section .data
input_format db "%d", 0 
output_format db "a = %d", 10, 0 

section .bss
number resw 1 

section .text
global main
extern scanf, printf

main:
push rbp
mov rbp, rsp

mov rdi, input_format
mov rsi, number
xor eax, eax
call scanf

mov ax, [number]

mov bx, ax 
shr bx, 13 ;сдвинули на 13 бит направо получаем 3 левых справа 0000000000000b1b2b3

mov cx, ax
and cx, 0x0007 ; 0000 0000 0000 0111 получаем три правых бита 
shl cx, 13 ;сдвиагем на лево на 13 получаем b14b15b1600000000000000

and ax, 0x1FF8 ;0001 1111 1111 1000 получаем все без трех левых и трех правых

or ax, cx 
or ax, bx 

mov [number], ax

mov rdi, output_format
mov rsi, [number]
xor eax, eax
call printf

mov rsp, rbp
pop rbp
ret