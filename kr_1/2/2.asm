; Треугольник задан уравнениями трех пересекающихся прямых:

; y = 6

; y = -x + 8

; y = 2(x-5)

; Ввести координаты точки (x, y) - db со знаком,  определить, находится ли она внутри треугольника. Если да, то выдать на печать YES и NO в противном случае. Если точка лежит на стороне треугольника, считаем, что она находится внутри.


 

; section .bss    

; x resb 1                                 

; y resb 1                                 

 

; Пример 1
  

; Пример 2

; ввод
  

; вывод
  

; ввод
  

; вывод

; 6

; 4
  

; YES
  

; 8

; 2
  

; NO
%include "st_io.inc"
global _start

section .bss
x resb 1
y resb 1

section .data
_start:
GETSIG eax
mov [x], al
GETSIG ebx
mov [y], bl
cmp bl, 6
jg N
neg al
add al,8
cmp bl,al
jl N
mov al, [x]
sub al,5
mov dl,2
imul dl
cmp bl,al
jl N
Y: PRINT "YES"
PUTCHAR 0xa
jmp f
N: PRINT "NO"
PUTCHAR 0xa
f: FINISH
