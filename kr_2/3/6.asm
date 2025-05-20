; Дан массив, состоящий из n (n <10) строк одинаковой длины l (l < 15).

; Ввод осуществить, используя функцию scanf.  Сначала ввести количество строк, количество символов в строке, затем, сами строки.

; Написать процедуру, в которой, используя цепочные команды, сравнить попарно строки и найти количество первых совпадающих символов (сравнивать до первого не совпадающего символа). Количество символов записать в двумерный массив и распечатать. Если совпадающих символов нет, то записать 0.  При сравнении строки с самой собой, значение совпадающих символов будет равно количеству символов в строке (т.е. на главной диагонали в результирующем массиве будут стоять значения, равные количеству символов в строках).

; Передать в процедуру массивы – по адресу, количество строк и количество символов в строке – по значению. Распечатать полученный массив, используя функцию printf, в виде матрицы. Передачу параметров осуществить через стек. Обязательно использовать ret с параметром.

; Архитектура 64-х разрядная

; Пример:

; Ввод
  

; Вывод

; 5

; 6

; asd568

; as6744

; sa3456

; zxcvbn

; zxcvbn
  

 

; 6 2 0 0 0

; 2 6 0 0 0

; 0 0 6 0 0

; 0 0 0 6 6

; 0 0 0 6 6
extern scanf
extern printf
extern exit
global main
section .bss
n resb 1
l resb 1
s resb 165
a times 100 resb 1
section .data 
f db "%u",0
ft db "%s",0
fv db "%u ",0
fent db "%c",0
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
push a
movzx rax, byte[n]
push rax
movzx rax,byte[l]
push rax
call quantity_eq
movzx rcx, byte[n]
movzx eax,byte[n]
xor ebx,ebx
pr1:
push rcx
push rax
xor edx,edx
movzx ecx, byte[n]
pr2:
push rcx
push rdx
sub rsp,8
xor rax,rax
movzx esi, byte[a + ebx + edx]
mov edi, fv
call printf
add rsp,8
pop rdx
pop rcx
inc edx
loop pr2
sub rsp,8
mov edi,fent
mov esi, 0xa
xor rax,rax
call printf
add rsp,8
pop rax
pop rcx
add ebx,eax
loop pr1
xor rdi,rdi
call exit
 
quantity_eq:
push rbp
mov rbp, rsp
;;;;;
mov rcx,[rbp + 24]      
xor ebx,ebx            
mov rax,[rbp + 16]     
r1:
push rcx
mov edx,ebx
mov edx,ebx
r2:
push rcx
push rax
push rbx
push rdx
mov ecx,eax        
mov rsi,[rbp + 40]   
add esi,ebx          
mov rdi, [rbp + 40]   
add edi,edx           
repe cmpsb
sub eax,ecx
dec eax
cmp eax,0
je no_eq
push rax
;;;;;;;;;;;;
mov ecx,edx      
;  ebx
mov eax,ebx
xor edx,edx
mov rsi, [rbp + 16]    
div esi
mov ebx,eax    
;  edx
mov eax,ecx     
xor edx,edx
div esi
mov edx, eax    
;;;;;;;;;;;; 
push rax
push rcx
push rbx
push rdx
mov rcx,[rbp + 24]   
mov eax,ebx          
mul ecx             
mov esi, eax         
pop rdx
add esi,edx          
mov eax,edx          
mul ecx             
mov edi,eax          
pop rbx
add edi,ebx         
pop rcx
pop rax
push  rcx
pop rcx
pop rax
add  rsi, [rbp + 32]      
mov byte[rsi], al        
add rdi, [rbp + 32]      
mov byte[rdi], al        
no_eq:
pop rdx
pop rbx
pop rax
pop rcx
add edx,eax
loop r2
pop rcx
add ebx,eax
loop r1
mov rsp, rbp
pop rbp
ret 32
