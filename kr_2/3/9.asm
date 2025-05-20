; Matvey. ..., [20.05.2025 11:11]
; Задача 3 Дан массив, состоящий из n (n <10) строк одинаковой длины l (l < 15).

; Ввод осуществить, используя функцию scanf.  Сначала ввести количество строк, количество символов в строке, затем сами строки.

; Написать процедуру, в которой, используя цепочные команды, найти в каждой строке все вхождения символа ‘*’ и   заменить их на номер столбца, в котором этот символ был найден.  Если ‘*’ в строке нет, то ничего не менять.

;  Передать в процедуру массив – по адресу, количество строк и количество символов в строках– по значению. Распечатать полученный массив, используя функцию printf, в виде матрицы. Передачу параметров осуществить через стек. Обязательно использовать ret с параметром.

; Архитектура 64-х разрядная

; Пример 1:

; Ввод
  

; Вывод

; 4

; 6

; wer*y*

; **yu*p

; 123456

; 78*956
  

 

 

; wer3y5

; 01yu1p

; 123456

; 782956 #номер3

; Matvey. ..., [20.05.2025 11:11]
extern scanf
extern printf
extern exit
global main
section .bss
n resb 1
l resb 1
s resb 165
section .data 
f db "%u",0
ft db "%s",0
ft1 db "%s",0xa,0
section .text
main:
sub rsp,8
mov edi, f
mov esi, n
xor rax,rax
call scanf
mov edi, f
mov esi,l
xor rax,rax
call scanf
add rsp,8
inc byte[l]
movzx  ecx, byte[n]
mov ebx,0
movzx edx, byte[l]
m:
push rcx
push rdx
sub rsp,8
lea edi, [ft]
lea esi, [s + ebx]
xor rax,rax
call scanf
add rsp, 8
pop rdx
pop rcx
add ebx,edx
loop m
push s
movzx rax, byte[n]
push rax
movzx rax,byte[l]
push rax
call proc_star
movzx ecx, byte[n]
movzx edx, byte[l]  
mov ebx,0
m2:
push rcx
push rdx
sub rsp,8
lea edi,[ft1]
lea esi, [s + ebx]
xor rax,rax
call printf
add rsp,8
pop rdx
pop rcx
add ebx, edx
loop m2
;;;;
xor rdi,rdi
call exit
 

;;;;;
proc_star:
push rbp
mov rbp,rsp
mov rcx,[rbp + 24]      
mov esi,0
mov rdx,[rbp + 16]     
mov al,'*'
rch:
push rcx
mov rcx, [rbp + 16]    
dec  ecx
mov rdi,[rbp + 32]
add edi,esi         
lstart:
repne scasb
je next
cmp ecx,0
je lend
next:
mov ebx,edi
dec edi
sub rbx, [rbp + 32]    
sub ebx,esi
dec bl
add bl,48
mov byte[edi],bl
inc edi
jmp lstart
lend:

pop rcx
add esi, edx
loop rch
;;;;;;;;;;
mov rsp,rbp
pop rbp
ret 24