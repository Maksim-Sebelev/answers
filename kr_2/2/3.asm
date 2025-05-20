; Заданы две даты в упакованном в виде.   t1 - D:5, M:4, Y:7 – дата в формате дд – мм -гг, и t2 -  M1:4, Y1:7 , D1:5  мм – гг - дд.

; Если эти даты равны, вывести на печать YES, и NO в противном случае.

; Для ввода и вывода использовать scanf и printf


; Архитектура 64-х разрядная

; Пример:

; Ввод

; вывод

; 62137

; 22334

; YES                                                                                                                                                     
                                                                                                                                                                  
                                                                                                                                                                  
extern printf
extern scanf
extern exit
section .data
    d db "%d", 0
    yes db "YES",0
    no db "NO",0
section .bss
    t1 resw 1
    t2 resw 1
section .text
    global main
main:
    sub rsp, 8
    mov rdi, d
    mov rsi, t1
    xor rax, rax
    call scanf
    mov rdi, d
    mov rsi, t2
    xor rax, rax
    call scanf
    mov ax, [t1]
    mov bx, [t2]
    shr ax, 11
    and bx, 0b11111
    cmp ax, bx
    jne NO
    mov ax, [t1]
    mov bx, [t2]
    shr ax, 7
    and ax, 0b1111
    shr bx, 12
    cmp ax, bx
    jne NO
    mov ax, [t1]
    mov bx, [t2]
    and ax, 0b1111111
    shr bx, 5
    and bx, 0b1111111
    cmp ax, bx
    jne NO
    mov rdi, yes
    xor rax, rax
    call printf
    jmp end
NO:
    mov rdi, no
    xor rax, rax
    call printf
    jmp end
end:
    add rsp, 8
    xor rdi,rdi
    call exit
