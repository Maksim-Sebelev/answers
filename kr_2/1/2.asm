; На вход подается строка, которая представляет собой арифметическое выражение, состоящее из одноразрядных десятичных чисел и арифметических операций “+’,’-‘,’x’,’/’,  представленных в виде обратной польской записи.  Ввести ОПН как строку, используя прерывание, завершив ввод пробелом. Максимальная длина вводимой строки - 50 символов.

; Используя команды работы со стеком, посчитать значение этого выражения. Вывести полученное значение, используя макросы.

; Архитектура 32-х разрядная с использованием макросов

; Пример 

; Ввод

; Вывод
;  15
; 12+4×3+                                                                                                                                                

%include "st_io.inc"
global _start

section .bss
opn resb 50  

section .text
_start:
mov eax,3
mov ebx,0
mov ecx, opn
mov edx, 49
int 0x80

;mov eax,4
;mov ebx,2
;mov ecx, opn
;mov edx, 10
;int 0x80

mov edi, opn
l1:
mov al, byte[edi]

cmp al, ' '
je fin
cmp al, '+'
je plus
cmp al, '-'
je mines
cmp al, 'x'
je multipl
cmp al, '/'
je division

jmp NO 
plus:
pop eax
pop ebx
add eax,ebx
push eax
jmp end_loop
mines:
pop ebx
pop eax
sub eax,ebx
push eax
jmp end_loop
multipl:
pop eax
pop ebx
imul ebx
push eax
jmp end_loop
division:
pop ebx
pop eax
mov edx,eax
shr edx,16     ; сдвиг старшего слова ax в dx
idiv bx
movsx eax,ax
push eax
jmp end_loop

NO:

sub al, '0'
movzx eax, al
push eax
end_loop:
inc edi
jmp l1
fin:
pop eax
SIGNINT eax
PUTCHAR 0xa
mov eax,1
mov ebx,0
int 0x80
