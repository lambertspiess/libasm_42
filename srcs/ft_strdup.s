; ft_strdup expects a string address in %rdi, and returns the string address of a malloc'd
; copy of that string
; size (in bytes) to malloc goes in %rdi, memory pointer returned in %rax

section .text
	extern	malloc
	extern	ft_strlen
	extern	ft_strcpy
	global	ft_strdup

ft_strdup:
	mov	r8, rdi		; save source string address before calling strlen
	call	ft_strlen	; %rax = strlen(%rdi)
	inc	rax		; +1 for '\0'
	mov	rdi, rax	; put size in %rdi for malloc
	call	malloc wrt ..plt
	cmp	rax, 0		; check errors
	je	strdup_return
	mov	rdi, rax	; mov destination ptr in %rsi for strcpy
	mov	rsi, r8		; mov source pointer in %rdi for strcpy
	call	ft_strcpy

strdup_return:
	ret
