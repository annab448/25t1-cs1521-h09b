
main:

count_3_loop_init:
	li	$t0, 24		# int x = 24;
count_3_loop_cond:
	bge	$t0, 42, count_3_loop_end
count_3_loop_body:
	li	$v0, 1		# printf("%d\n", x);
	move	$a0, $t0
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall

count_3_loop_inc:
	add	$t0, $t0, 3	# x += 3
	b	count_3_loop_cond
count_3_loop_end:

	li	$v0, 0
	jr	$ra

	.data
