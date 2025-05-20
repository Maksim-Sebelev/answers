; Используя команды работы со стеком в массиве, состоящем из 10 положительных чисел, размером в слово, для каждого элемента массива найти ближайший меньший слева и записать их на соответствующие места в результирующий массив. Если таких элементов нет, записать -1.

; Вывести элементы результирующего массив в одной строке через запятую и пробел

; Для ввода и вывода использовать функции scanf и printf.

; Архитектура 64-х разрядная

section .data
input_format db "%d", 0
output_format db "%d", 0
separator db ", ", 0
newline db 10, 0
a times 10 dd 0 ;исходный массив 
r times 10 dd -1 ;итоговый массив 

section .text
global main
extern scanf, printf 

main:
push rbp
mov rbp, rsp
sub rsp, 32 

; Ввод массива
mov rbx, a 
mov r12, 0 

input_loop:
cmp r12, 10
jge exit1

lea rdi, [input_format]
mov rsi, rbx
xor eax, eax
call scanf

add rbx, 4 
inc r12
jmp input_loop

exit1:
;поиск меньшего 
mov r12, 0 
xor r13, r13 

process_loop:
cmp r12, 10
jge exit2

mov eax, [a + r12*4]

stack_loop:
test r13, r13 
jz stack_empty

mov r14, [rsp + r13*8 - 8] ;индекс из вершины стека
mov edx, [a + r14*4] ;элемент по этому индексу

cmp edx, eax
jl found_smaller 

dec r13
jmp stack_loop

stack_empty:
mov dword [r + r12*4], -1
jmp push_to_stack

found_smaller:
mov [r + r12*4], edx

push_to_stack:
mov [rsp + r13*8], r12
inc r13

inc r12
jmp process_loop

exit2:
mov r12, 0
mov r15, r 

output_loop:
cmp r12, 10
jge exit3

mov edi, output_format
mov esi, [r15]
xor eax, eax
call printf

cmp r12, 9
je no_separator

lea rdi, [separator]
xor eax, eax
call printf

no_separator:
add r15, 4
inc r12
jmp output_loop

exit3:
lea rdi, [newline]
xor eax, eax
call printf

mov rsp, rbp
pop rbp
xor eax, eax
ret
