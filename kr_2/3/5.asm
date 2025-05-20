; Дан массив, состоящий из n (n <10) строк одинаковой длины l (l  <  15).

; Ввод осуществить, используя функцию scanf.  Сначала ввести количество строк, количество символов в строке, затем, сами строки.

; Написать процедуру, в которой, используя цепочные команды, сравнить попарно строки и найти две первые строки, в которых совпадают первые символы (сравнивать до первого не совпадающего символа).  Напечатать количество совпадающих символов в одной строке, номера строк, в которых они были найдены, в следующей строке, используя функцию printf/. Если ни в одной паре строк, совпадающих символов нет, то напечатать 0.  

;  Передать в процедуру массив – по адресу, количество строк – по значению. Передачу параметров и возврат полученных значений осуществить через стек. Для возвращаемых значений, предусмотреть место при формировании стекового фрейма. Обязательно использовать ret с параметром.

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
nstr_1 db 0
nstr_2 db 0 
amount db 0
f db "%u",0
ft db "%s",0
fv db "%u ",0
fviv db "%u",0xa,0
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
sub rsp,24        
push s
movzx rax, byte[n]
push rax
movzx rax, byte[l]    
push rax
call proc_amount
pop rax
mov byte[nstr_2],al
pop rax
mov byte[nstr_1],al
pop rax
mov byte[amount], al
sub rsp,8
movzx esi,byte[amount]
mov edi,fviv
xor rax,rax
call printf
cmp byte[amount],0
je mend
movzx esi, byte[nstr_1]
mov edi,fv
xor rax,rax
call printf
movzx esi,byte[nstr_2]
mov edi,fviv
xor rax,rax
call printf
mend:
add rsp,8
xor rdi,rdi
call exit
;;;;;
proc_amount:
push rbp
mov rbp,rsp
mov rcx, [rbp + 24]    
dec rcx                
xor ebx,ebx            
mov rax, [rbp + 16]     
r1:
push rcx
mov edx,ebx
add edx,eax     
r2:
push rcx
mov rcx,rax
mov rsi,[rbp + 32]
add esi,ebx           
mov rdi,[rbp + 32]
add edi, edx          
repe cmpsb
jz star
dec eax
cmp ecx, eax
jne star      ;;;;;;;;;
inc eax
add edx,eax
pop rcx
loop r2
pop rcx
add ebx,eax
loop r1
jmp zero

star:
pop rdi
pop rdi
push rdx
movzx esi, byte[l]
dec esi
sub esi,ecx
movzx rsi,si
mov [rbp + 56], rsi     
movzx esi, byte[l]
dec esi
mov eax,ebx 
xor edx,edx
div esi
movzx rax,ax
mov [rbp + 48], rax    
pop rax
movzx esi,byte[l]
xor edx,edx
div esi
mov [rbp + 40], rax    
jmp fin
zero:
mov dword[rbp + 40],0
mov dword[rbp + 48],0
mov dword[rbp + 56],0
;;;;
fin:
pop rbp
ret 24