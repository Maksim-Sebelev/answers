; Двумерный массив, состоящий из 3-х строк и 4-х столбцов, определен в секции .bss.

; Элементы массива – целые без знака, размер dw.

; section .bss

; a  resw 12

; Ввести элементы массива, поменять местами 2-й 3-й столбцы. Распечатать в виде матрицы.

; Массив вводить по одному элементу в строке, используя макросы.

; Пример 

; ввод
  

; вывод

; 1234 1432 298 2345 377 883 3454 4432 5111 5333 6987 6789
  

; 1234 298 1432  2345

;  377 3454 883  4432

; 5111 6987 5333  6789
%include "st_io.inc"
global _start
section .data
section .bss
a resw 12

section .text
_start:
mov ecx,3
mov ebx,0
in:
mov esi, ecx
mov ecx, 4
mov edi,0
in1:
GETUN eax
mov [a + ebx + edi],ax
add edi, 2
dec ecx
jcxz in2
jmp in1
in2:
mov ecx, esi
add ebx, 4*2
dec ecx
jcxz in3
jmp in
in3:
mov edi, 2
mov esi,4
mov ecx,3
l:
mov ax, [a + edi]
xchg ax, [a + esi]
xchg ax, [a + edi]
add edi, 4*2
add esi, 4*2
loop l
mov ecx,3
mov ebx, 0
prnt:
mov esi, ecx
mov ecx, 4
mov edi,0
l1:
mov eax,0
mov ax, [a + ebx + edi]
UNSINT eax
PUTCHAR 0x20
add edi, 2
dec ecx
jcxz l2
jmp l1
l2:
mov ecx, esi
add ebx, 4*2
PUTCHAR 0xa
dec ecx
jcxz l3
jmp prnt
l3:
PUTCHAR 0xa
FINISH