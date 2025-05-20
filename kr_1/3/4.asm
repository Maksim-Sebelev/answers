; В секции .bss определен одномерный массив из 10 элементов размер – слово. Ввести элементы массива dw со знаком. Найдите первый под-массив (подряд идущие элементы) с нулевой суммой. Выдать его элементы на печать в одной строке через пробел. Если такого под-массива нет, выдать сообщение NO.

; section .bss

; a resw 10

; Пример 1

; ввод
  

; вывод

; 24  87 -25 70 -45 -11  98 121 7 118
  

; -25 70 -45

;  Пример 2

; ввод
  

; вывод

; 24  87 -25 75 -45 -11 98 121 7 118
  

; NO
; #номер3 #кр1

%include "st_io.inc"
global _start
section .bss
a resw 10

section .text
_start:
;
mov ecx,10
mov ebx,a
vv:
GETSIG eax
mov [ebx], ax
add ebx,2
dec ecx
jcxz ev
jmp vv
ev:
;
mov ecx, 10
mov ebx,a
met1:
mov esi, ecx
mov edi,ebx
add edi,2
mov ax, [ebx]
met2:
add ax,  word[edi]
cmp ax,0
je prnt
add edi,2
loop met2
mov ecx,esi
add ebx,2
loop met1
PRINT "NO"
jmp fin
prnt:
movsx eax,word[ebx] 
SIGNINT eax
PUTCHAR 0x20
add ebx,2
cmp ebx,edi
jg fin
jmp prnt
fin:
PUTCHAR 0xa
FINISH