section .data
fmt db "ma string", 0
path db "./Sully_5.s", 0
i db 5
section .text
global _start
global _main
extern _print
_start:
call _main
ret
_main:
push rbp
mov rbp, rsp
mov r15, i
cmp r15, 0
je _v_end

mov rcx, 60
_lp_stk:
push 10
dec rcx
cmp rcx, 0
jg _lp_stk

_op_file:
mov rax, 0x2000005
lea rdi, [rel path]
mov rsi, 0x0002 + 0x0200
mov rdx, 0644o
syscall
cmp rax, 0
jl _v_end
mov r15, rax

_print_it:

_close:
mov rax, 0x2000006
mov rdi, r15
syscall

add rsp, 480
_v_end:
pop rbp
ret