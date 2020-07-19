;	ft_strcmp expects two string addresses in %rdi and %rsi, and return in %rax

section .text
	global	ft_strcmp

ft_strcmp:
	xor	rcx, rcx		; iterator = 0

strcmp_loop:
	xor	rax, rax
	mov	r8b, byte[rdi + rcx]
	mov	r9b, byte[rsi + rcx]
	mov	al, r8b
	sub	rax, r9
	cmp	r8b, 0
	je	strcmp_return
	cmp	r9b, 0
	je	strcmp_return
	inc	rcx
	cmp	r8b, r9b
	je	strcmp_loop

strcmp_return:
	ret
