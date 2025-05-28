.file	"factorial.c"
	.text
	.p2align 4,,15
	.globl	_factorial
	.def	_factorial;	.scl	2;	.type	32;	.endef
_factorial:
    # Function prologue
    pushl	%ebp
    movl	%esp, %ebp

    # Load input into %edx
    movl	8(%ebp), %edx

    # Initialize result to 1 in %eax
    movl	$1, %eax

    # Check if input is 0
    testl	%edx, %edx
    je	.done

.loop:
    # Multiply result by input
    imull	%edx, %eax

    # Decrement input
    subl	$1, %edx

    # Continue loop if input is not 0
    testl	%edx, %edx
    jne	.loop

.done:
    # Function epilogue
    popl	%ebp
    ret
	.cfi_endproc
LFE12:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Factorial of %d is %d\12\0"
	.section	.text.startup,"x"
	.p2align 4,,15
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	call	___main
	movl	$120, 8(%esp)
	movl	$5, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	xorl	%eax, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
