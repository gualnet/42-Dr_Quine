section .data
fmt db "section .data%cfmt db %c%s%c, 0%ci equ %d%cfmtName db %cSully_%%d.s%c, 0%cfmtCmd db %cnasm -f macho64 ./Sully_%%d.s -o Sully_%%d.o && ld -macosx_version_min 10.8 -lSystem Sully_%%d.o -o ./Sully_%%d && rm Sully_*.o && ./Sully_%%d%c, 0%cfileName times 16 db 0%cexecCmd times 160 db 0%csection .text%cglobal _start%cglobal _main%cextern _system%cextern _dprintf%cextern _printf%cextern _sprintf%c_start:%ccall _main%cret%c_main:%cpush rbp%cmov rbp, rsp%cmov r15, i%ccmp r15d, -1%cjle _v_end%cmov rcx, 90 %c 90 cycles de push%cmov r11, r15%cdec r11%cjmp _lp_stk%c_createName:%clea rdi, [rel fileName]%clea rsi, [rel fmtName]%cmov rdx, r15%ccall _sprintf%ccmp eax, -1%cje _v_end%c_open_file:%cmov rax, 0x2000005%clea rdi, [rel fileName]%cmov rsi, 0x0002 + 0x0200%cmov rdx, 0644o%csyscall%ccmp rax, 0%cjl _v_end%cmov r14, rax%c_print_it:%cmov rdi, r14%clea rsi, [rel fmt]%cmov rdx, 10%cmov rcx, 34%clea r8, [rel fmt]%cmov r9, 34%ccall _dprintf%c_close:%cmov rax, 0x2000006%cmov rdi, r14%csyscall%c_createExec:%clea rdi, [rel execCmd]%clea rsi, [rel fmtCmd]%cmov rdx, r15%cmov rcx, r15%cmov r8, r15%cmov r9, r15%cmov dword [rsp], r15d%ccall _sprintf%ccmp eax, -1%cje _v_end%c_exec:%clea rdi, [rel execCmd]%ccall _system%cadd rsp, 720%c_v_end:%cpop rbp%cret%c_lp_stk:%cpush 10%cdec rcx%ccmp rcx, 0%cjg _lp_stk%cmov dword [rsp + 8 * 1], r11d%cmov dword [rsp + 8 * 3], 34%cmov dword [rsp + 8 * 4], 34%cmov dword [rsp + 8 * 6], 34%cmov dword [rsp + 8 * 7], 34%cmov dword [rsp + 8 * 27], 59%cjmp _createName", 0
i equ 5
fmtName db "Sully_%d.s", 0
fmtCmd db "nasm -f macho64 ./Sully_%d.s -o Sully_%d.o && ld -macosx_version_min 10.8 -lSystem Sully_%d.o -o ./Sully_%d && rm Sully_*.o && ./Sully_%d", 0
fileName times 16 db 0
execCmd times 160 db 0
section .text
global _start
global _main
extern _system
extern _dprintf
extern _printf
extern _sprintf
_start:
call _main
ret
_main:
push rbp
mov rbp, rsp
mov r15, i
cmp r15d, -1
jle _v_end
mov rcx, 90 ; 90 cycles de push
mov r11, r15
dec r11
jmp _lp_stk
_createName:
lea rdi, [rel fileName]
lea rsi, [rel fmtName]
mov rdx, r15
call _sprintf
cmp eax, -1
je _v_end
_open_file:
mov rax, 0x2000005
lea rdi, [rel fileName]
mov rsi, 0x0002 + 0x0200
mov rdx, 0644o
syscall
cmp rax, 0
jl _v_end
mov r14, rax
_print_it:
mov rdi, r14
lea rsi, [rel fmt]
mov rdx, 10
mov rcx, 34
lea r8, [rel fmt]
mov r9, 34
call _dprintf
_close:
mov rax, 0x2000006
mov rdi, r14
syscall
_createExec:
lea rdi, [rel execCmd]
lea rsi, [rel fmtCmd]
mov rdx, r15
mov rcx, r15
mov r8, r15
mov r9, r15
mov dword [rsp], r15d
call _sprintf
cmp eax, -1
je _v_end
_exec:
lea rdi, [rel execCmd]
call _system
add rsp, 720
_v_end:
pop rbp
ret
_lp_stk:
push 10
dec rcx
cmp rcx, 0
jg _lp_stk
mov dword [rsp + 8 * 1], r11d
mov dword [rsp + 8 * 3], 34
mov dword [rsp + 8 * 4], 34
mov dword [rsp + 8 * 6], 34
mov dword [rsp + 8 * 7], 34
mov dword [rsp + 8 * 27], 59
jmp _createName