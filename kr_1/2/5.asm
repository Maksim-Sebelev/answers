y = -2
y = x
x = 1

%include "st_io.inc"

section .bss                            
x resb 1                                 
y resb 1  

section .text
global _start

_start:
    GETSIG eax
    GETSIG ebx

    cmp eax, 1
    jg fail1
    cmp ebx, -2
    jl fail2
    cmp ebx, eax
    jg fail3
    PRINT "YES"
    jmp SKIP

fail1:
fail2:
fail3:
    PRINT "NO"
SKIP:
    FINISH
