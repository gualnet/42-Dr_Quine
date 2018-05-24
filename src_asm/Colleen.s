section	.data
s db "section .data%c%c.s db %c%s%c||%csection	.text%cglobal start%cglobal _main%cextern _printf%cX%c useless%cstart:%ccall _main%cret%c_main:%cpush rbp%cmov rbp, rsp->A%cICI LA BOUCLE%clea rdi, \
[rel msg.s]%cmov rsi, 10%cmov rdx, 10%cmov rcx, 34%clea r8, [rel msg.s]%cmov r9, 34%ccall _printf%cadd rsp, 160 %c push *%cpop rbp%cret"
section	.text
global start
global _main
extern _printf
; useless
start:
call _main
ret
_main:
push rbp
mov rbp, rsp

push dword 10 ; 24 192
push dword 10
push dword 10 
push dword 64
push dword 10 ; 20 or 160
push dword 10
push dword 10
push dword 10
push dword 10
push dword 10
push dword 10
push dword 10
push dword 10
push dword 10 ; ->A
push dword 10 ; 10 or 80
push dword 10
push dword 10
push dword 10
push dword 59
push dword 10
push dword 10
push dword 10
push dword 10
push dword 10
_screen_it:
lea rdi, [rel s]
mov rsi, 10
mov rdx, 126
mov rcx, 34
lea r8, [rel s]
mov r9, 34
call _printf
_the_end:
add rsp, 192 ; push * 
pop rbp
ret