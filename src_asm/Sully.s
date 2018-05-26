section .data
fmt db "section .data%cfmt db %c%s%c, 0%cpath db %c./Sully_%d.s%c, 0%cexec_inst db %cld -macosx_version_min 10.8 -lSystem ./Sully_%d.o -o Sully_%d && ./Sully_%d%c, 0%ccomp_inst db %c/usr/local/bin/nasm -f macho64 ./Sully_%d.s -o Sully_%d.o%c, 0%csection .text%cglobal _start%cglobal _main%cextern _system%cextern _dprintf%c_start:%ccall _main%cret%c_main:%cpush rbp%cmov rbp, rsp%cmov r15, %d%cdec r15%ccmp r15d, -1%cjl _v_end%cmov rcx, 80%c_lp_stk:%cpush 10%cdec rcx%ccmp rcx, 0%cjg _lp_stk%cmov dword [rsp + 8 * 1], 34%cmov [rsp + 8 * 2], r15%cmov dword [rsp + 8 * 3], 34%cmov dword [rsp + 8 * 5], 34%cmov [rsp + 8 * 6], r15%cmov [rsp + 8 * 7], r15%cmov [rsp + 8 * 8], r15%cmov dword [rsp + 8 * 9], 34%cmov dword [rsp + 8 * 11], 34%cmov [rsp + 8 * 12], r15%cmov [rsp + 8 * 13], r15%cmov dword [rsp + 8 * 14], 34%cmov [rsp + 8 * 27], r15%c_op_file:%cmov rax, 0x2000005%clea rdi, [rel path]%cmov rsi, 0x0002 + 0x0200%cmov rdx, 0644o%csyscall%ccmp rax, 0%cjl _v_end%cmov r15, rax%c_print_it:%cmov rdi, r15%clea rsi, [rel fmt]%cmov rdx, 10%cmov rcx, 34%clea r8, [rel fmt]%cmov r9, 34%ccall _dprintf%c_close:%cmov rax, 0x2000006%cmov rdi, r15%csyscall%c_comp_exec:%clea rdi, [rel comp_inst]%ccall _system%clea rdi, [rel exec_inst]%ccall _system%cadd rsp, 640%c_v_end:%cpop rbp%cret", 0
path db "./Sully_5.s", 0
exec_inst db "ld -macosx_version_min 10.8 -lSystem ./Sully_5.o -o Sully_5  && ./Sully_5", 0
comp_inst db "/usr/local/bin/nasm -f macho64 ./Sully_5.s -o Sully_5.o", 0
section .text
global _start
global _main
extern _system
extern _dprintf
_start:
call _main
ret
_main:
push rbp
mov rbp, rsp
mov r15, 5
dec r15
cmp r15d, -1
jl _v_end
mov rcx, 80
_lp_stk:
push 10
dec rcx
cmp rcx, 0
jg _lp_stk
mov dword [rsp + 8 * 1], 34
mov [rsp + 8 * 2], r15
mov dword [rsp + 8 * 3], 34
mov dword [rsp + 8 * 5], 34
mov [rsp + 8 * 6], r15
mov [rsp + 8 * 7], r15
mov [rsp + 8 * 8], r15
mov dword [rsp + 8 * 9], 34
mov dword [rsp + 8 * 11], 34
mov [rsp + 8 * 12], r15
mov [rsp + 8 * 13], r15
mov dword [rsp + 8 * 14], 34
mov [rsp + 8 * 27], r15
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
mov rdi, r15
lea rsi, [rel fmt]
mov rdx, 10
mov rcx, 34
lea r8, [rel fmt]
mov r9, 34
call _dprintf
_close:
mov rax, 0x2000006
mov rdi, r15
syscall
_comp_exec:
lea rdi, [rel comp_inst]
call _system
lea rdi, [rel exec_inst]
call _system
add rsp, 640
_v_end:
pop rbp
ret