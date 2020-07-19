;	ft_strcpy expects a dest string address in %rdi and a source string address in %rsi
;	it returns the dest string address in %rax

section .text
	global	ft_strcpy

ft_strcpy:
	xor	rcx, rcx

ft_strcpy_loop:
	mov	rdx, [rsi + rcx]
	cmp	rdx, 0
	je	strcpy_ret
	mov	[rdi + rcx], rdx	
	inc	rcx
	jmp	ft_strcpy_loop

strcpy_ret:
	mov	rax, rdi
	ret
