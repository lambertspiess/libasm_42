;	ft_strcmp expects two string addresses in %rdi and %rsi, and return in %rax

section .text
	global	ft_strcmp

ft_strcmp:
	xor	rcx, rcx		; iterator = 0

strcmp_loop:
	cmp	byte [rdi + rcx], 0
	je	end_of_string
	cmp	byte [rsi + rcx], 0
	je	return_pos
	mov	rdx, [rsi + rcx]
	cmp	[rdi + rcx], rdx
	jl	return_neg
	jg	return_pos
	inc	rcx
	jmp	strcmp_loop

end_of_string:
	cmp	byte [rsi + rcx], 0
	je	return_zero
	jmp	return_neg
	
return_zero:
	xor	rax,rax
	ret

return_neg:
	xor	rax,rax
	dec	rax
	ret

return_pos:
	xor	rax,rax
	inc	rax
	ret
