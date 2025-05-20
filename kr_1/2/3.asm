Кирилл, [20.05.2025 11:15]
Треугольник задан уравнениями трех пересекающихся прямых:

y = 4

y = -2(x + 1)

y = 2(3x – 1)

Ввести координаты точки (x, y), определить, находится ли она внутри треугольника. Если да, то выдать на печать YES и NO в противном случае. Если точка лежит на стороне треугольника, считаем, что она находится внутри.


section .bss    

x resb 1                                 

y resb 1                                 

 

Пример 1
  

Пример 2

ввод
  

вывод
  

ввод
  

вывод

-1

2
  

YES
  

-1

-1
  

NO
#номер2 #кр1

Кирилл, [20.05.2025 11:15]
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

inc al
mov dl, -2
imul dl
cmp bl,al 
jl N

mov al,[x]
mov dl,3
imul dl
dec al
mov dl, 2
imul dl
cmp bl,al 
jl N
cmp bl,4
jg N

Y: PRINT "YES"
PUTCHAR 0xa
jmp f
N: PRINT "NO"
PUTCHAR 0xa
f: FINISH