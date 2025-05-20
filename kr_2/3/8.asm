; Дан массив, состоящий из n (n <10) строк одинаковой длины l (l <15).

; Ввод осуществить, используя функцию scanf. Сначала ввести количество строк (n), количество символов в строках (l), затем сами строки.

; Написать процедуру, в которой, используя цепочные команды, найти две первые одинаковые строки и заменить в них 3, 4 и 5 символы на символы ‘&’. Если таких строк нет, то ничего не менять.

; Передать в процедуру массив – по адресу, количество строк (n) и количество символов в строках (l) – по значению. Распечатать полученный массив, используя функцию printf, в виде матрицы. Передачу параметров осуществить через стек. Обязательно использовать ret с параметром.

; Архитектура 64-х разрядная

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
movzx rax,byte[n]
push rax
movzx rax,byte[l]
push rax
call proc_change
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
proc_change:
push rbp
mov rbp,rsp
mov rcx,[rbp + 24]
dec rcx                ; n-1
xor ebx,ebx            ;line
mov rax,[rbp + 16]
r1:
push rcx
mov edx,ebx
add edx,eax     ; next line 
r2:
push rcx
mov rcx,rax
mov rsi,[rbp + 32]
add esi,ebx
mov rdi,[rbp + 32]
add edi,edx
repe cmpsb
jz star
add edx,eax
pop rcx
loop r2
pop rcx
add ebx,eax
loop r1
jmp fin

star:
pop rcx
pop rcx
add ebx,3
add edx,3
mov al,'&'
mov ecx,3
mov rdi,[rbp + 32]
add edi,ebx
rep stosb
mov rdi,[rbp + 32]
add edi, edx
mov ecx,3
rep stosb
fin:
pop rbp
ret 24
