; Matvey. ..., [20.05.2025 11:09]
; Дан массив из 10 элементов, размер 1 байт со знаком. Ввести элементы массива, используя функцию scanf, записать числа из массива в стек, найти первые два отрицательных и поменять их местами, не вынимая из стека.

; Переписать полученные данные в обратно в массив, в исходном порядке, распечатать значения полученного массива, используя функцию printf, в одной строке через пробел. Перевести строку.

; Если двух отрицательных элементов в массиве нет, вывести на печать, используя функцию printf, сообщение “NO”.  Перевести строку.

; Обратите внимание, что вынимать элементы из стека, можно только для печати. 

; Архитектура 64-х разрядная

; Пример:

; Ввод
  

; Вывод

; 4 5 2 -10 8 9 -3 7 -6 1
  

; 1 -6 7 -10 9 8 -3 2 5 4 #номер1

; Matvey. ..., [20.05.2025 11:09]

global main
    extern scanf
    extern printf
    extern exit

section .data
    f_in db "%d", 0
    f_out db "%d ", 0
    NO db "NO",0xa,0

section .bss
    a resb 10


section .text
    
main:

    sub rsp, 8
    mov rcx, 10
    mov rbx, 0
read_loop:
    lea rdi, [f_in]
    lea rsi, [a + rbx]
    push rcx
    push rbx
    xor rax,rax
    call scanf
    pop rbx
    pop rcx
    inc rbx
    loop read_loop
    mov rcx, 10
    mov rbx, 0
l:
  movsx ax,  [a + rbx]
  push ax
  inc rbx
loop l
    mov rbp, rsp
    mov rcx, 10
    mov rdi, -1
    mov rsi, -1
    xor rbx,rbx
    
l1:
  mov al, byte[rbp + rbx]
  cmp al,0
  jnl end
  cmp rsi, -1
  jne .rdi
  mov rsi, rbx
  jmp end
.rdi:
  cmp rdi, -1
  jne change
  mov rdi,rbx
  jmp end
change:
  mov rsi,rdi
  mov rdi, rbx
end:
  add rbx, 2
loop l1


check:  
  cmp rsi, -1
  je n
  cmp rdi,-1
  je n
  
  
  mov rcx, 10
    ;;;;;;;;;;;;;;
  mov ax, word[rbp + rsi]
  mov bx, word[rbp + rdi]
  mov word[rbp + rsi], bx
  mov word[rbp + rdi], ax
    ;;;;;;;;;;;;;
    mov rcx, 10
print_loop:
    lea rdi, [f_out]
    pop si
    movsx rsi,si
    push rcx
    xor rax,rax
    call printf
    pop rcx
    loop print_loop
  jmp fin
  n:
  mov rdi, NO
  xor rax,rax
  call printf 
  
fin:
   add rsp,8
    xor rax,rax
    call exit