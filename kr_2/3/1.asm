; demagogen, [20.05.2025 12:21]
; Дан одномерный массив, из элементовразмером в слово со знаком, состоящий из n элементов (n ≤ 20).

; Ввести, используя функцию scanf, сначала количество элементов,затем, элементы массива.
; Написать процедуру, в которой,
; используя цепочные команды найти минимальный элемент массива и заменить его на700.  Передать в процедуру массив – по
; адресу, количество элементов – по значению. Распечатать значение минимальногоэлемента и полученный массив, используя функцию printf. На первой строке напечатать
; значение минимального элемента, на следующей строке – элементы полученногомассива через пробел.
; Передачу параметров
; и возврат полученного значения осуществить через стек. Для возвращаемогозначения, предусмотреть место при формировании стекового фрейма. Обязательно использовать
; ret с параметром.
; Архитектура 64-х разрядная
; Пример:

 
    
; Ввод
   
    
; Вывод

    
 
  
;   10

;   4 5 2 10 1 9 3 7 6 15

     
;   1

;   4 5 2 10
;   700 9 3 7 6 15

; #номер3

; Любимый афанасик, [20.05.2025 12:21]
; Кто-то в лмс просто скинет ссылк у

; demagogen, [20.05.2025 12:21]
global main
extern exit
extern scanf
extern printf
section .data
f db "%u",0
fvv db "%d",0
fviv db "%d ",0
ent db "%c",0
section .bss
n resb 1
a resw 100
min resw 1
section .text
main:
sub rsp,8
lea esi,[n]
lea edi,[f]
xor rax,rax
call scanf
add rsp,8

sub rsp,8
movzx rcx,byte[n]
xor ebx,ebx
l1:
push rcx
sub rsp,8
lea  esi, [a+ebx*2]
mov edi, fvv
xor rax,rax
call scanf
add rsp,8
pop rcx
inc ebx
loop l1
sub rsp,8    ; for min
push a
movzx rax,byte[n]
push rax
call proc_min
;;;;;;
pop rax
sub rsp,8
mov edi,fvv
movsx esi,ax
xor rax,rax
call printf
mov edi,ent
mov esi,0xa
xor rax,rax
call printf
add rsp,8

movzx rcx,byte[n]
mov ebx,0
l2:
push rcx
sub rsp,8
mov edi, fviv
mov ax, word[a + ebx*2]
cwde
mov esi,eax
xor rax,rax
call printf
add rsp,8
pop rcx
inc ebx
loop l2
mov rdi, ent
mov esi,0xa
xor rax, rax
call printf
xor rdi,rdi
call exit

;;;;;

proc_min:
push rbp
mov rbp,rsp
mov ax, 32767
mov rcx, [rbp + 16]    ; n in rcx
xor ebx,ebx
mov rdi,[rbp + 24]     ; a in rdi
rasch:
scasw
jle fin
mov ebx,edi
sub ebx,2
mov esi,ebx
lodsw
fin:
loop rasch
;;;;
mov word[ebx],700
movsx rax,ax
mov [rbp + 32],rax
pop rbp
ret 16