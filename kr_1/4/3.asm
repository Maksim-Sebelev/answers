; Двумерный массив, состоящий из 4-х строк и 3-х столбцов, определен в секции .bss.

; Элементы массива – целые со знаком, размер db.

; section .bss

; a  resb 12

; Ввести элементы массива, поменять местами 2-ю 3-ю строки. Распечатать в виде матрицы,

; Массив вводить по одному элементу в строке, используя макросы.

; Пример 

; ввод
  

; вывод

; 1 -1 2 -2 3 -3 4 -4 5 -5 6 -6
  

; 1 -1 2

; 4 -4 5

; -2 3 -3

;  -5 6 -6
; #номер4 #кр1

%include "st_io.inc"
global _start
section .bss
a resb 12

section .text
_start:
mov ecx,4
in:
mov esi, ecx
mov ecx, 3
mov edi,0
in1:
GETSIG eax
mov [a + ebx + edi],al
inc edi
dec ecx
jcxz in2
jmp in1
in2:
mov ecx, esi
add ebx, 3*1
dec ecx
jcxz in3
jmp in
in3:
mov ebx, a + 1 * 3
mov esi, a + 1 * 6
mov ecx,3
l:
mov al, byte[ebx]
xchg al, byte[esi]
xchg al,byte[ebx]
inc ebx
inc esi
loop l
mov ecx,4
mov ebx, 0
prnt:
mov esi, ecx
mov ecx, 3
mov edi,0
l1:
mov al, [a + ebx + edi]
cbw
cwde
SIGNINT eax
PUTCHAR 0x20
inc edi
dec ecx
jcxz l2
jmp l1
l2:
mov ecx, esi
add ebx, 3*1
PUTCHAR 0xa
dec ecx
jcxz l3
jmp prnt
l3:
PUTCHAR 0xa
FINISH