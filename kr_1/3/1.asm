; Дан одномерный массив из 10 элементов (в секции .data, вводить не нужно), размер db со знаком.

; section . data

; a db 34, 67, 28, -120, 6, 98,- 5, 88, 121, -65

; Найти минимальный элемент массива и заменить все элементы на остаток от их деления на минимальный элемент. Распечатать элементы полученного массива в одной строке через пробел в обратном порядке.

; Пример 

; ввод

; вывод

 

; -65 1 88 -5 98 6 0 28 67 34

%include "st_io.inc"
global _start
section .data
a db 34, 67, 28, -120, 6, 98, -5, 88, 121, -65

section .text
_start:
mov dl, 127
mov ecx, 10
mov ebx, a
met1:
cmp byte[ebx], dl
jge met2
mov dl, byte[ebx]
met2: 
inc ebx
loop met1
mov ecx, 10
mov ebx, a
met3:
mov al, byte[ebx]
cbw
idiv dl
mov byte[ebx], ah
inc ebx
loop met3
mov ecx, 10
mov ebx,a + 9
met4:
movsx eax, byte[ebx]
SIGNINT eax
PUTCHAR 0x20
dec ebx
dec ecx
jcxz met5
jmp met4
met5:
PUTCHAR 0xa
FINISH