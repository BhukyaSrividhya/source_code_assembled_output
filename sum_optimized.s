.file	"main.c"
	.text
	.p2align 4,,15

	# Function: _addNumbers
	.globl	_addNumbers
	.def	_addNumbers;	.scl	2;	.type	32;	.endef
_addNumbers:
	# Function prologue
LFB12:
	.cfi_startproc
	movl	8(%esp), %eax          # Load the first parameter into %eax
	addl	4(%esp), %eax          # Add the second parameter to %eax
	ret                         # Return the result in %eax
	.cfi_endproc
LFE12:

	# Data section for printf format string
	.section .rdata,"dr"
LC0:
	.ascii "The sum of %d and %d is %d\12\0"  # Format string for printf

	# Main function
	.section	.text.startup,"x"
	.p2align 4,,15
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	# Function prologue
LFB13:
	.cfi_startproc
	pushl	%ebp                     # Save the base pointer
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp               # Set the new base pointer
	.cfi_def_cfa_register 5
	andl	$-16, %esp               # Align the stack
	subl	$16, %esp                # Allocate space on the stack

	# Call the _addNumbers function
	movl	$15, 12(%esp)           # Push the first parameter (15) onto the stack
	movl	$10, 8(%esp)            # Push the second parameter (10) onto the stack
	movl	$5, 4(%esp)             # Push an unused value (5) onto the stack
	movl	$LC0, (%esp)            # Push the format string onto the stack
	call	_printf                  # Call printf to print the result

	# Exit the program
	xorl	%eax, %eax               # Set return value to 0
	leave                          # Restore the stack and base pointer
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret                            # Return from main
	.cfi_endproc
LFE13:

	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
