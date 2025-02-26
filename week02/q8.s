	.text

main:

	li	$t0, 1		# i = 1
line_loop_cond:
	bgt	$t0, 10, line_loop_end

line_loop_body:

	li	$t1, 0		# j = 0

star_loop_cond:
	bge	$t1, $t0, star_loop_end

	li	$v0, 11
	li	$a0, '*'
	syscall

	add	$t1, $t1, 1	# j++
	b	star_loop_cond

star_loop_end:

	li	$v0, 11		# printf("\n");
	li	$a0, '\n'
	syscall

	add	$t0, $t0, 1	# i++;
	b	line_loop_cond

line_loop_end:

	li	$v0, 0		# return 0;
	jr	$ra


	.data