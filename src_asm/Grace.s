section .data
string:
.to_write db "section .data%cstring:%c.to_write db %c%s%c, 0%c.path db %c./Grace_kid.s%c, 0%csection	.text%cglobal start%cglobal _main%cextern _dprintf%c%c useless%c%%macro my_one 0%cmov rax, 0x2000005%clea rdi, [rel string.path]%cmov rsi, 0x0002 + 0x0200%cmov rdx, 0644o%csyscall%ccmp rax, 0%cjl _end%cmy_three%c%%endmacro%c%%macro my_two 0%c%c%c_main:%cpush rbp%cmov rbp, rsp%cmov rcx, 60%c_lp:%cpush 10%cdec rcx%ccmp rcx, 0%cjg _lp%cmy_one%c_end:%cadd rsp, 480%cpop rbp%cret%c%%endmacro%c%%macro my_three 0%cmov dword [rsp + 0], 34%cmov dword [rsp + 2 * 8], 34%cmov dword [rsp + 3 * 8], 34%cmov dword [rsp + 9 * 8], 59%cmov rdi, rax%clea rsi, [rel string.to_write]%cmov rdx, 10%cmov rcx, 10%cmov r8, 34%clea r9, [rel string.to_write]%ccall _dprintf%c%%endmacro%cstart:%cmy_two", 0
.path db "./Grace_kid.s", 0
section	.text
global start
global _main
extern _dprintf
; useless
%macro my_one 0
mov rax, 0x2000005
lea rdi, [rel string.path]
mov rsi, 0x0002 + 0x0200
mov rdx, 0644o
syscall
cmp rax, 0
jl _end
my_three
%endmacro
%macro my_two 0


_main:
push rbp
mov rbp, rsp
mov rcx, 60
_lp:
push 10
dec rcx
cmp rcx, 0
jg _lp
my_one
_end:
add rsp, 480
pop rbp
ret
%endmacro
%macro my_three 0
mov dword [rsp + 0], 34
mov dword [rsp + 2 * 8], 34
mov dword [rsp + 3 * 8], 34
mov dword [rsp + 9 * 8], 59
mov rdi, rax
lea rsi, [rel string.to_write]
mov rdx, 10
mov rcx, 10
mov r8, 34
lea r9, [rel string.to_write]
call _dprintf
%endmacro
start:
my_two