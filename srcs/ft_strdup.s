; ft_strdup expects a string address in %rdi, and returns the string address of a malloc'd
; copy of that string

section .text
	extern	malloc
	extern	ft_strlen
	extern	ft_strcpy
	global	ft_strdup

ft_strdup:
;	call	ft_strlen	; %rax = strlen(%rdi)
;	inc	rax		; +1 for '\0'
;	mov	r8, rdi		; copy dst pointer in %r8
;	mov	rdi, rax	; put size in rdi for malloc
;	call	malloc wrt ..plt
;	cmp	rax, 0
;	je	strdup_return
;	mov	rsi, rax
;	mov	rdi, r8
;	call	ft_strcpy
;
;strdup_return:
;	ret
	ret;
