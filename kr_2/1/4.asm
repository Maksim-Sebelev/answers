; В строке расположена последовательность символов, являющихся буквами английского алфавита (используются только три гласные – a, o, u). Записать в новой строке символы исходной строки, чередуя по очереди согласные и гласные буквы. Оставшиеся буквы дописать в конец строки. Для решения использовать два стека.

; Результирующая строка должна начинаться с последней согласной буквы исходной строки, если в строке присутствует хотя бы одна такая буква, и содержать чередующиеся согласные и гласные буквы, начиная с конца исходной строки.

; Если согласных букв в строке нет, то просто переписать строку в обратном порядке.

; Длина строки не превышает 30 символов.

; Используя системные прерывания ввести исходную строку, завершив ввод пробелом. Результирующую строку, также вывести с помощью прерывания.

; Архитектура 32-х разрядная

; Пример:

; Ввод
  

; Вывод

; assuddtttto
  

; totutatddss
global _start
section .data
section .bss
s resb 35
res resb 36
stgl resd 1
stsogl resd 1

section .text
_start:
mov ebp,esp
mov eax,3
mov ebx,0
lea  ecx,[s]
mov edx,30
int 0x80
mov esp,ebp
mov edi,esp
mov [stgl], esp
sub esp,66
mov esi,esp
mov[stsogl],esp
mov ebx, 0
l1:
mov al,byte[s + ebx]
cmp al, ' '
je stop
inc ebx
cmp al, 'a'
je glasn
cmp al, 'o'
je glasn
cmp al, 'u'
je glasn
sogl:
mov esp,esi
movzx ax,al
push ax
mov esi,esp
jmp l1
glasn:
mov esp,edi
movzx ax,al
push ax
mov edi,esp
jmp l1
stop:
mov ebx,0
l2:
mov esp,esi
cmp esp,[stsogl]
je last
pop ax
mov esi,esp
mov [res + ebx],al
inc ebx
mov esp,edi
cmp esp,[stgl]
je last
pop ax
mov edi,esp
mov byte[res + ebx], al
inc ebx
jmp l2

last:
mov esp,esi
mov ebp,[stsogl]
mov eax,esi
cmp esi,[stsogl]
jne tail
mov esp,edi
mov ebp,[stgl]
mov eax, edi
cmp edi,[stgl]
jne tail
jmp print
tail:
mov esp,eax
cycl:
pop ax
mov [res + ebx],al
inc ebx
cmp ebp,esp
je print
jmp cycl
mov ebx,0
print:
mov byte [res + ebx],0xa
inc ebx
mov byte [res + ebx],0
mov esi, ebx
mov eax,4
mov ebx,1
mov ecx,res
mov edx, esi
int 0x80
mov eax,1
mov ebx,0
int 0x80