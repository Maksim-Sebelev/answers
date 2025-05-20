; Треугольник задан уравнениями трех пересекающихся прямых:

; y = -2(4-x)

; y = -2(x + 20) / 7

; y = (-6x + 8) / 5

; Ввести координаты точки (x, y), размер – db со знаком, определить, находится ли она внутри треугольника. Если да, то выдать на печать YES и NO в противном случае. Если точка лежит на стороне треугольника, считаем, что она находится внутри.



; section .bss    

; x resb 1                                 

; y resb 1                                 

 

; Пример 1

; Пример 2

; ввод

; вывод

; ввод

; Вывод

; 4

; -6

; YES

; 2

; -7

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
mov al,4
sub al, byte[x]
mov dl, -2
imul dl
cmp bl,al 
jg N
mov al,[x]
add al,20
imul dl
cbw
mov dl,7
idiv dl
cmp bl,al
jl N
mov dl,-6
mov al,[x]
imul dl
add al,8
mov dl,5
cbw
idiv dl
cmp bl,al
jg N
Y: PRINT "YES"
PUTCHAR 0xa
jmp f
N: PRINT "NO"
PUTCHAR 0xa
f: FINISH
