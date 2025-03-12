max:
    # Frame:    [$ra, $s0] # anything pushed onto stack	  
    # Uses:     [$a0, $a1, $s0, $v0]	# every register 
    # Clobbers: [$a0, $a1, $v0]				# USES - FRAME
    #
    # Locals:         
    #   - $t0 array (from $a0)
	#   - $a1 length
	#   - $s0 first_element
	#   - $v0 max_so_far
    #
    # Structure:     
    #   max
    #   -> [prologue]
    #       -> body
	#		-> base_case
	#		-> recursive_case
    #   -> [epilogue]
max__prologue:
	begin
	push	$ra
	push	$s0

max__body:

	lw	$s0, ($a0)	# int first_element = array[0];

	bne	$a1, 1, max__recursive case
max__base_case:

	move	$v0, $s0
	b	max__epilogue

max__recursive_case:

	add	$a0, $a0, 4
	sub	$a1, $a1, 1
	jal	max	# max(&array[1], length - 1);

	# $v0 = max_so_far

	bgt	$v0, $s0, max__epilogue # if (max_so_far > first_element) return max_so_far;

	move	$v0, $s0		# return first_element

max__epilogue:
	pop	$s0
	pop	$ra
	end

main:
main__prologue:
	push	$ra

main__body:
	la	$a0, array
	li	$a1, 10
	jal	max			# result = max(array, 10)

	move	$a0, $v0
	li	$v0, 1			# syscall 1: print_int
	syscall				# printf("%d", result)

	li	$a0, '\n'
	li	$v0, 11			# syscall 11: print_char
	syscall				# printf("%c", '\n');

	li	$v0, 0

main__epilogue:
	pop	$ra
	jr	$ra			# return 0;


.data
array:
	.word 1, 2, 3, 4, 5, 6, 4, 3, 2, 1
