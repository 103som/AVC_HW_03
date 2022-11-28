	.file	"code.c"
	.text
	.globl	findPI
	.type	findPI, @function
findPI:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movsd	%xmm0, -40(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	.LC2(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L2
.L3:
	movsd	-24(%rbp), %xmm0
	addsd	-16(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-8(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	mulsd	%xmm0, %xmm1
	movsd	.LC1(%rip), %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-8(%rbp), %xmm1
	movsd	.LC1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
.L2:
	movsd	-8(%rbp), %xmm0
	movsd	.LC1(%rip), %xmm2
	movapd	%xmm0, %xmm1
	subsd	%xmm2, %xmm1
	movsd	.LC1(%rip), %xmm0
	divsd	%xmm1, %xmm0
	comisd	-40(%rbp), %xmm0
	ja	.L3
	movsd	-24(%rbp), %xmm1
	movsd	.LC3(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	call	sqrt@PLT
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	findPI, .-findPI
	.globl	randfrom
	.type	randfrom, @function
randfrom:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movsd	%xmm0, -24(%rbp)
	movsd	%xmm1, -32(%rbp)
	movsd	-32(%rbp), %xmm0
	subsd	-24(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	.LC4(%rip), %xmm0
	divsd	-16(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
	call	rand@PLT
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	divsd	-8(%rbp), %xmm0
	addsd	-24(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
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
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movl	%edi, -116(%rbp)
	movq	%rsi, -128(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$4, -116(%rbp)
	je	.L8
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L14
.L8:
	movsd	.LC6(%rip), %xmm0
	movsd	%xmm0, -96(%rbp)
	movsd	.LC7(%rip), %xmm0
	movsd	%xmm0, -88(%rbp)
	movq	-128(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	testl	%eax, %eax
	jne	.L10
	movq	-128(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	.LC8(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L11
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L14
.L11:
	movq	-128(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L12
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L14
.L12:
	leaq	-96(%rbp), %rdx
	movq	-48(%rbp), %rax
	leaq	.LC12(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -32(%rbp)
	call	clock@PLT
	movq	%rax, -24(%rbp)
	movsd	-96(%rbp), %xmm0
	movsd	.LC13(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, %xmm0
	call	findPI
	movq	%xmm0, %rax
	movq	%rax, -88(%rbp)
	call	clock@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	subq	-24(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC14(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	-32(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-88(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %xmm0
	leaq	.LC16(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L14
.L10:
	movq	-128(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	jne	.L13
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L14
.L13:
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -72(%rbp)
	call	clock@PLT
	movq	%rax, -64(%rbp)
	movq	-128(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -100(%rbp)
	movl	-100(%rbp), %eax
	movl	%eax, %edi
	call	srand@PLT
	movsd	.LC17(%rip), %xmm0
	movq	.LC18(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	randfrom
	movq	%xmm0, %rax
	movq	%rax, -96(%rbp)
	movsd	-96(%rbp), %xmm0
	movsd	.LC13(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, %xmm0
	call	findPI
	movq	%xmm0, %rax
	movq	%rax, -88(%rbp)
	call	clock@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	subq	-64(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC14(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	-72(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-96(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rdx, %xmm0
	leaq	.LC19(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rdx, %xmm0
	leaq	.LC19(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	movl	$0, %eax
.L14:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
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
