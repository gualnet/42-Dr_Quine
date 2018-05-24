section .data
	s db "section .data%c%cs db %c%s%c%csection	.text%cglobal start%cglobal _main%cextern _printf%c%c useless%cstart:%ccall _main%cret%c_main:%cpush rbp%cmov rbp, rsp%cmov rcx, 34%c_lp:%cpush dword 10%ccmp rcx, 0%cdec rcx%cjg _lp%cmov dword [rsp + 8 * 30], 59%cmov dword [rsp + 8 * 5], 59%c_screen_it:%clea rdi, [rel s]%cmov rsi, 10%cmov rdx, 9%cmov rcx, 34%clea r8, [rel s]%cmov r9, 34%ccall _printf%c_the_end:%cadd rsp, 272 %c push *%cpop rbp%cret%c"
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
mov rcx, 34
_lp:
push dword 10
cmp rcx, 0
dec rcx
jg _lp
mov dword [rsp + 8 * 30], 59
mov dword [rsp + 8 * 5], 59
_screen_it:
lea rdi, [rel s]
mov rsi, 10
mov rdx, 9
mov rcx, 34
lea r8, [rel s]
mov r9, 34
call _printf
_the_end:
add rsp, 272 ; push *
pop rbp
ret
