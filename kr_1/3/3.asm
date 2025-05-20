; Дан одномерный массив из 10 элементов (в секции .data, вводить не нужно), размер dw без знака. Определить какие элементы являются третьей степенью каких чисел и записать эти числа в этот же массив. Если не являются, то на это место в массиве записать 0. Распечатать элементы полученного массива в одной строке через пробел.

; Известно, что в массиве нет элементов со значением равным 1.

; section .data

; a dw  8, 15, 216, 9, 59319, 125, 729, 140, 3, 1728

; Пример

; ввод
  

; вывод

 
  

; 2 0 6 0 39 5 9 0 0 12

 
%include "st_io.inc"
global _start
section .data
a dw 8, 15, 216, 9, 59319, 125, 729, 140, 3, 1728
section .text
_start:
mov ecx, 10
mov ebx, a
mov si,2
m:
met1:
mov ax,si
mul si
mul si
cmp ax, word[ebx]
je yes
ja no 
inc si
jmp met1 
yes: mov word[ebx], si
jmp l
no: mov word[ebx], 0
l:add ebx,2
mov si, 2
loop m
mov ecx, 10
mov ebx, a
prnt:
mov eax,0
mov ax, word[ebx]
UNSINT eax
PUTCHAR 0x20
add ebx,2
dec ecx
jcxz fin
jmp prnt
fin:
PUTCHAR 0xa
FINISH