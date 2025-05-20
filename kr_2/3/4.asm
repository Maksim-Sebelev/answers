; Дан одномерный массив, состоящих из элементов размером в двойное слово без знака, состоящий из n элементов (n < 20) .

; Ввести, используя функцию scanf, сначала количество элементов, затем, элементы массива.

; Написать процедуру, в которой, используя цепочные команды найти первый и последний элемент равный 700 и заменить их на 899. Передать в процедуру массив – по адресу, количество элементов – по значению. Распечатать индексы, найденных элементов и полученный массив, используя функцию scanf. На первой строке напечатать индексы, на следующей строке – элементы полученного массива через пробел.

; Если таких элементов не найдено, или найден только один, напечатать NO.

; Передачу параметров и возврат полученных значений осуществить через стек. Для возвращаемых значений, предусмотреть место при формировании стекового фрейма. Обязательно использовать локальные переменные и ret с параметром.

; Архитектура 64-х разрядная

; Пример: 

; Ввод

; Вывод

; 10

; 89 700 743 32 43 276 700 500 700 800

; 1 8

; 89 899 743 32 43 276 700 500 899 800                                                                                  
global main
extern exit
extern scanf
extern printf
section .data
f db "%u",0
fvv db "%d",0
fviv db "%d ",0

fn db "%s",0xa,0
sn db "NO",0
ent db "%c",0
section .bss
n resb 1
a resd 100
ind_1 resb 1
ind_2 resb 1
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
lea  esi, [a+ebx*4]
mov edi, fvv
xor rax,rax
call scanf
add rsp,8
pop rcx
inc ebx
loop l1
sub rsp,8    
push a
movzx rax,byte[n]
push rax
call proc_700

pop rax
mov [ind_1],al
pop rax
mov [ind_2],al
cmp byte[ind_1],-1
je nn
;print
sub rsp,8
movzx esi,byte[ind_1]
mov edi,fviv
xor rax,rax
call printf
movzx esi,byte[ind_2]
mov edi,fviv
xor rax,rax
call printf
mov esi,0xa
mov edi,ent
xor rax,rax
call printf
add rsp,8
movzx rcx,byte[n]
mov ebx,0
l2:
push rcx
sub rsp,8
mov edi, fviv
mov eax, dword[a + ebx*4]
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
jmp finish
nn:
sub rsp,8
mov edi,fn
mov esi,sn
xor rax,rax
call printf
add rsp,8
finish:
xor rdi,rdi
call exit

;;;;;
proc_700:
push rbp
mov rbp,rsp
sub rsp,16       
mov eax, 700
mov rcx,[rbp + 16]     
mov rdi,[rbp + 24]      
rasch:
repne scasd
jnz no
mov eax,edi
sub eax,4
sub rax,[rbp + 24]     
xor edx,edx
mov esi,4
div esi
mov [rbp - 8],rax    
mov rbx,[rbp + 16]      
dec ebx
mov rdi,[rbp + 24]    
mov esi,4       
mov eax,ebx     
mul esi               
add edi,eax           
mov eax,700
std
repne scasd
jnz no
add edi,4
sub edi,a
mov eax,edi
xor edx,edx
mov esi,4
div esi
mov [rbp - 16],rax     
;chabge
mov rax, [rbp - 8]         
mov edi,a                 
mov esi,4
mul esi
add edi,eax             
mov eax,899
stosd
mov rax,[rbp - 16]             
mov edi,a                       
mov esi,4
mul esi
add edi,eax
mov eax,899
stosd
mov rax,[rbp - 16] 
mov [rbp + 40],rax    
mov rax,[rbp - 8]
mov [rbp + 32],rax     
jmp end
no:
mov dword[rbp + 32],-1
mov dword[rbp + 40],-1
end:
cld
mov rsp,rbp
pop rbp
ret 16