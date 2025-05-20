; Дан двумерный массив, из элементов размером в слово со знаком, состоящий из n строк и m столбцов (n ≤ 10, m ≤ 10).

; Ввести, используя функцию scanf, сначала количество строк и столбцов, затем, элементы массива.

; Написать процедуру, в которой, используя цепочные команды, найти первую строку, в которой есть элемент со значением -100, и заменить все элементы в столбце, в котором находится этот элемент на -200.

; Если такого элемента нет, ничего не менять.

; Распечатать элементы, полученного массива в виде матрицы через пробел, используя функцию printf.

; Передать в процедуру массив – по адресу, количество строк и столбцов – по значению.

; Обязательно использовать ret с параметром.

; Архитектура 64-х разрядная


; Пример:

; Ввод

; Вывод

; 3

; 4

; 23     56    32  18

; 500  -100  8  99

; 67      82  754  22

 



; 23    -200    32  18

; 500  -200  8  99

; 67     -200  754  22

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
m resb 1
a resw 100
section .text
main:
sub rsp,8
lea esi,[n]
lea edi,[f]
xor rax,rax
call scanf
lea esi,[m]
lea edi,[f]
xor rax,rax
call scanf
add rsp,8
movzx rcx,byte[n]
xor ebx,ebx
l1:
push rcx
push rdx
movzx rcx, byte[m]
xor edx,edx
sub rsp,8
l2:
push rcx
push rdx
lea  esi, [a + ebx + edx*2]   
lea edi, [fvv]
xor rax,rax
call scanf
pop rdx
pop rcx
inc edx
loop l2
add rsp,8    
pop rdx
pop rcx
movzx eax,byte[m]
mov esi,2
mul esi
add ebx,eax
loop l1 
push a
movzx rax, byte[n]
push rax
movzx rax,byte[m]
push rax
call proc_100
movzx rcx,byte[n]
xor ebx,ebx
l3:
push rcx
movzx rcx,byte[m]
xor edx,edx
sub rsp,8     
l4:
push rcx
push rdx
mov edi, fviv
mov ax, word[a + ebx + edx*2]
cwde
mov esi,eax
xor rax,rax
call printf
pop rdx
pop rcx
inc edx
loop l4
mov rdi, ent
mov esi,0xa
xor rax, rax
call printf
add rsp,8
pop rcx
movzx eax,byte[m]
mov esi,2
mul esi
add ebx,eax
loop l3
xor rdi,rdi
call exit
proc_100:
push rbp
mov rbp,rsp
mov rcx,[rbp + 24]
xor ebx,ebx
mov rdx,[rbp + 16]
mov ax,-100
r1:
push rcx   
mov rcx,[rbp + 16]
mov edi,a
add edi,ebx
repne scasw
jz fin
pop rcx
add ebx,edx
add ebx,edx
loop r1
jmp return
fin:
pop rcx
sub edi,2
sub edi,a
mov eax,edi
mov esi,edx      
add esi,esi      
xor edx,edx      
div esi         
                 
mov rcx,[rbp + 24]     
xor ebx,ebx
mov rax,[rbp + 16]     
add eax,eax
place:
mov rdi, [rbp + 32]
add edi,ebx
add edi,edx      
mov word[edi],-200
add ebx,eax
loop place
return:
pop rbp
ret 24