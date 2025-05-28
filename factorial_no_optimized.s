.file	"factorial.c"
	.text
	.globl	_factorial
_factorial:
	# Function prologue
	pushl	%ebp                     # Save the base pointer
	movl	%esp, %ebp               # Set the new base pointer

	# Load input into %edx
	movl	8(%ebp), %edx            # Load the input parameter (n) into %edx

	# Initialize result to 1 in %eax
	movl	$1, %eax                 # Set result = 1

	# Check if input is 0
	testl	%edx, %edx               # Check if n == 0
	je	.done                     # If n == 0, jump to .done

.loop:
	# Multiply result by input
	imull	%edx, %eax               # result *= n

	# Decrement input
	subl	$1, %edx                 # n--

	# Continue loop if input is not 0
	testl	%edx, %edx               # Check if n == 0
	jne	.loop                     # If n != 0, repeat the loop

.done:
	# Function epilogue
	popl	%ebp                     # Restore the base pointer
	ret                            # Return the result

	.section .rdata,"dr"
LC0:
	.ascii "Factorial of %d is %d\12\0"

	.text
	.globl	_main
_main:
	# Function prologue
	pushl	%ebp                     # Save the base pointer
	movl	%esp, %ebp               # Set the new base pointer

	# Prepare for factorial calculation
	movl	$5, %eax                 # Set num = 5
	pushl	%eax                     # Push num onto the stack
	call	_factorial               # Call the factorial function
	addl	$4, %esp                 # Clean up the stack

	# Prepare for printf
	movl	%eax, 8(%esp)            # Move result to the stack for printf
	movl	$5, 4(%esp)              # Move num to the stack for printf
	movl	$LC0, (%esp)             # Move format string to the stack for printf
	call	_printf                  # Call printf

	# Exit program
	movl	$0, %eax                 # Set return value to 0
	leave                          # Restore the stack
	ret                            # Return from main
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
