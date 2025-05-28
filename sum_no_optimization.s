.file	"main.c"
    .text

    # Function: _addNumbers
    .globl	_addNumbers
    .def	_addNumbers;	.scl	2;	.type	32;	.endef
_addNumbers:
    # Function prologue
LFB10:
    .cfi_startproc
    pushl	%ebp                     # Save the base pointer
    movl	%esp, %ebp               # Set the new base pointer

    # Load parameters and add them
    movl	8(%ebp), %edx            # Load the first parameter into %edx
    movl	12(%ebp), %eax           # Load the second parameter into %eax
    addl	%edx, %eax               # Add the two parameters

    # Function epilogue
    popl	%ebp                     # Restore the base pointer
    ret                            # Return the result in %eax
    .cfi_endproc
LFE10:

    # Data section for printf format string
    .section .rdata,"dr"
LC0:
    .ascii "The sum of %d and %d is %d\12\0"  # Format string for printf

    # Main function
    .text
    .globl	_main
    .def	_main;	.scl	2;	.type	32;	.endef
_main:
    # Function prologue
LFB11:
    .cfi_startproc
    pushl	%ebp                     # Save the base pointer
    movl	%esp, %ebp               # Set the new base pointer
    andl	$-16, %esp               # Align the stack
    subl	$32, %esp                # Allocate space on the stack

    # Prepare parameters for _addNumbers
    movl	$5, 28(%esp)            # First parameter (5)
    movl	$10, 24(%esp)           # Second parameter (10)

    # Call _addNumbers
    movl	24(%esp), %eax           # Load second parameter into %eax
    movl	%eax, 4(%esp)            # Push second parameter onto the stack
    movl	28(%esp), %eax           # Load first parameter into %eax
    movl	%eax, (%esp)             # Push first parameter onto the stack
    call	_addNumbers              # Call the _addNumbers function

    # Store the result
    movl	%eax, 20(%esp)           # Store the result in memory

    # Prepare parameters for printf
    movl	20(%esp), %eax           # Load the result into %eax
    movl	%eax, 12(%esp)           # Push the result onto the stack
    movl	24(%esp), %eax           # Load the second parameter into %eax
    movl	%eax, 8(%esp)            # Push the second parameter onto the stack
    movl	28(%esp), %eax           # Load the first parameter into %eax
    movl	%eax, 4(%esp)            # Push the first parameter onto the stack
    movl	$LC0, (%esp)             # Push the format string onto the stack
    call	_printf                  # Call printf to print the result

    # Exit the program
    movl	$0, %eax                 # Set return value to 0
    leave                          # Restore the stack and base pointer
    ret                            # Return from main
    .cfi_endproc
LFE11:

    .ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
    .def	_printf;	.scl	2;	.type	32;	.endef
