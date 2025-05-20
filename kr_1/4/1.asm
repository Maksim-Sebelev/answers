Двумерный массив, состоящий из 4-х строк и 3-х столбцов, определен в секции .bss.

Элементы массива – целые без знака, размер dw.

section .bss

a  resw 12

Ввести элементы массива, поменять местами 2-ю 3-ю строки. Распечатать в виде матрицы,

Массив вводить по одному элементу в строке, используя макросы.

Пример 

ввод

вывод

111 111 222 222 333 333 444 444 555 555 666 666

111 111 222

444 444 555

222 333 333

555 666 666

%include "st_io.inc"
global _start
section .data
section .bss
a resw 12

section .text
_start:
mov ecx,4
mov ebx,0
in:
mov esi, ecx
mov ecx, 3
mov edi,0
in1:
GETUN eax
mov [a + ebx + edi],ax
add edi,2
dec ecx
jcxz in2
jmp in1
in2:
mov ecx, esi
add ebx, 3*2
dec ecx
jcxz in3
jmp in
in3:
mov ebx, a + 2 * 3
mov esi, a + 2 * 6
mov ecx,3
l:
mov ax, word[ebx]
xchg ax, word[esi]
xchg ax,word[ebx]
add ebx,2
add esi,2
loop l
mov ecx,4
mov ebx, 0
prnt:
mov esi, ecx
mov ecx, 3
mov edi,0
l1:
mov eax,0
mov ax, [a + ebx + edi]
UNSINT eax
PUTCHAR 0x20
add edi,2
dec ecx
jcxz l2
jmp l1
l2:
mov ecx, esi
add ebx, 3*2
PUTCHAR 0xa
dec ecx
jcxz l3
jmp prnt
l3:
PUTCHAR 0xa
FINISH
