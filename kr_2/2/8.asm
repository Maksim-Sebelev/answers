; Matvey. ..., [20.05.2025 11:10]
; Задача 2 Ввести число без знака, размером в слово, используя функцию scanf, затем поменять местами 2,3 и 4 бит с 8, 9 и 10 битами и вывести полученное число на печать, используя функцию printf в виде: a = полученное значение, осуществить перевод строки.  (Обратите внимание на пробелы при выводе).

; Биты нумеруются от 0 справа налево.

; Архитектура 64-х разрядная

; Пример ;

; ввод
  

; вывод

; 43567
  

; a = 43819 #номер2

; Matvey. ..., [20.05.2025 11:10]
extern printf
extern exit
extern scanf
global main

section .data
f db "a = %u",0xa,0
f1 db "%u",0
a dw 1
section .text
main:
sub rsp,8
mov edi, f1
mov esi, a
xor rax,rax
call scanf
add rsp,8
mov ax, word[a]
;mov ax, 43567
;mov ax, 10893
;mov ax,55
;mov ax, 57392
;mov ax, 5
mov bx,ax
and bx, 0000011100011100b
shr bl,2
shl bh,2
xchg bl,bh
and ax, 1111100011100011b
or ax,bx
sub rsp,8
lea rdi,[f]
movzx esi, ax
xor rax,rax
call printf
xor rdi,rdi
add rsp,8
call exit