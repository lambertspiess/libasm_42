;	ft_strcpy expects a dest string address in %rdi and a source string address in %rsi
;	it returns the dest string address in %rax

section .text
	global	ft_strcpy

ft_strcpy:
	xor	rcx, rcx

ft_strcpy_loop:
	mov	dl, byte[rsi + rcx]
	mov	byte[rdi + rcx], dl	
	cmp	dl, 0
	je	strcpy_ret
	inc	rcx
	jmp	ft_strcpy_loop

strcpy_ret:
	mov	rax, rdi
	ret
