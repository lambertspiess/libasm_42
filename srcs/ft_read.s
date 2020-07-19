;	read syscall expects an unsigned int fd in %rdi, a char *buf address in %rsi.
;	and a size_t bytes count in %rdx

section .text
	extern	__errno_location
	global	ft_read

ft_read:
	mov	rax, rdi
	syscall
	cmp	rax, 0
	je	read_error_handler
	ret

read_error_handler:
	neg	rax
	mov	rdi, rax
	call	__errno_location wrt ..plt
	xor	rax, rax
	dec	rax
	ret
