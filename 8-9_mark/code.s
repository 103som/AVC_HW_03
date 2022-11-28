	.file	"code.c"
	.intel_syntax noprefix
	.text
	.globl	findPI
	.type	findPI, @function
findPI:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	movsd	QWORD PTR -40[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC1[rip]
	movsd	QWORD PTR -16[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC2[rip]
	movsd	QWORD PTR -24[rbp], xmm0
	jmp	.L2
.L3:
	movsd	xmm0, QWORD PTR -8[rbp]
	addsd	xmm0, QWORD PTR -16[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	movapd	xmm1, xmm0
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	movsd	xmm1, QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR .LC1[rip]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
.L2:
	movsd	xmm0, QWORD PTR -24[rbp]
	movsd	xmm2, QWORD PTR .LC1[rip]
	movapd	xmm1, xmm0
	subsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	comisd	xmm0, QWORD PTR -40[rbp]
	ja	.L3
	movsd	xmm1, QWORD PTR -8[rbp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm1, xmm0
	movq	rax, xmm1
	movq	xmm0, rax
	call	sqrt@PLT
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax
	movsd	xmm0, QWORD PTR -8[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	leave
	ret
	.size	findPI, .-findPI
	.globl	randfrom
	.type	randfrom, @function
randfrom:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	QWORD PTR -32[rbp], xmm1
	movsd	xmm0, QWORD PTR -32[rbp]
	subsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC4[rip]
	divsd	xmm0, QWORD PTR -8[rbp]
	movsd	QWORD PTR -16[rbp], xmm0
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	divsd	xmm0, QWORD PTR -16[rbp]
	addsd	xmm0, QWORD PTR -24[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	leave
	ret
	.size	randfrom, .-randfrom
	.section	.rodata
	.align 8
.LC5:
	.string	"\320\237\320\265\321\200\320\265\320\264\320\260\320\275\320\276 \320\275\320\265\320\262\320\265\321\200\320\275\320\276\320\265 \321\207\320\270\321\201\320\273\320\276 \320\260\321\200\320\263\321\203\320\274\320\265\320\275\321\202\320\276\320\262 \320\272\320\276\320\274\320\260\320\275\320\264\320\275\320\276\320\271 \321\201\321\202\321\200\320\276\320\272\320\270."
.LC8:
	.string	"r"
	.align 8
.LC9:
	.string	"\320\235\320\265\320\277\321\200\320\260\320\262\320\270\320\273\321\214\320\275\320\276 \320\262\320\262\320\265\320\264\320\265\320\275\320\276 \320\270\320\274\321\217 \320\262\321\205\320\276\320\264\320\275\320\276\320\263\320\276 \321\204\320\260\320\271\320\273\320\260."
.LC10:
	.string	"w"
	.align 8
.LC11:
	.string	"\320\235\320\265\320\277\321\200\320\260\320\262\320\270\320\273\321\214\320\275\320\276 \320\262\320\262\320\265\320\264\320\265\320\275\320\276 \320\270\320\274\321\217 \320\262\321\213\321\205\320\276\320\264\320\275\320\276\320\263\320\276 \321\204\320\260\320\271\320\273\320\260."
.LC12:
	.string	"%lf"
.LC15:
	.string	"Time %f \n"
.LC16:
	.string	"%f"
.LC19:
	.string	" %f "
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 112
	mov	DWORD PTR -100[rbp], edi
	mov	QWORD PTR -112[rbp], rsi
	cmp	DWORD PTR -100[rbp], 4
	je	.L8
	lea	rax, .LC5[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L14
.L8:
	movsd	xmm0, QWORD PTR .LC6[rip]
	movsd	QWORD PTR -96[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC7[rip]
	movsd	QWORD PTR -8[rbp], xmm0
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	test	eax, eax
	jne	.L10
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC8[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -56[rbp], rax
	cmp	QWORD PTR -56[rbp], 0
	jne	.L11
	lea	rax, .LC9[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L14
.L11:
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -64[rbp], rax
	cmp	QWORD PTR -64[rbp], 0
	jne	.L12
	lea	rax, .LC11[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L14
.L12:
	lea	rdx, -96[rbp]
	mov	rax, QWORD PTR -56[rbp]
	lea	rcx, .LC12[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	pxor	xmm0, xmm0
	movsd	QWORD PTR -72[rbp], xmm0
	call	clock@PLT
	mov	QWORD PTR -80[rbp], rax
	movsd	xmm0, QWORD PTR -96[rbp]
	movsd	xmm1, QWORD PTR .LC13[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -96[rbp], xmm0
	mov	rax, QWORD PTR -96[rbp]
	movq	xmm0, rax
	call	findPI
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax
	call	clock@PLT
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR -88[rbp]
	sub	rax, QWORD PTR -80[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC14[rip]
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -72[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -72[rbp], xmm0
	mov	rax, QWORD PTR -72[rbp]
	movq	xmm0, rax
	lea	rax, .LC15[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -64[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC16[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	eax, 0
	jmp	.L14
.L10:
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	cmp	QWORD PTR -16[rbp], 0
	jne	.L13
	lea	rax, .LC11[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L14
.L13:
	pxor	xmm0, xmm0
	movsd	QWORD PTR -24[rbp], xmm0
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -112[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -36[rbp], eax
	mov	eax, DWORD PTR -36[rbp]
	mov	edi, eax
	call	srand@PLT
	movsd	xmm0, QWORD PTR .LC17[rip]
	mov	rax, QWORD PTR .LC18[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	randfrom
	movq	rax, xmm0
	mov	QWORD PTR -96[rbp], rax
	movsd	xmm0, QWORD PTR -96[rbp]
	movsd	xmm1, QWORD PTR .LC13[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -96[rbp], xmm0
	mov	rax, QWORD PTR -96[rbp]
	movq	xmm0, rax
	call	findPI
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax
	call	clock@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	sub	rax, QWORD PTR -32[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC14[rip]
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -24[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
	mov	rax, QWORD PTR -24[rbp]
	movq	xmm0, rax
	lea	rax, .LC15[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	rdx, QWORD PTR -96[rbp]
	mov	rax, QWORD PTR -16[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC19[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -16[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC19[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	eax, 0
.L14:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1073741824
	.align 8
.LC3:
	.long	0
	.long	1075314688
	.align 8
.LC4:
	.long	-4194304
	.long	1105199103
	.align 8
.LC6:
	.long	-350469331
	.long	1058682594
	.align 8
.LC7:
	.long	1374389535
	.long	1074339512
	.align 8
.LC13:
	.long	0
	.long	1079574528
	.align 8
.LC14:
	.long	0
	.long	1093567616
	.align 8
.LC17:
	.long	858993459
	.long	1071854387
	.align 8
.LC18:
	.long	-1717986918
	.long	1069128089
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
