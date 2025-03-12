FLAG_ROWS=6
FLAG_COLS=12

main:


	li	$t0, 0	# row = 0
main__row_cond:
	bge	$t0, FLAG_ROWS, main__row_end


	li	$t1, 0		# col = 0
main__col_cond:
	bge	$t1, FLAG_COLS, main__col_end

	# &flag[row][col]	
	mul	$t2, $t0, FLAG_COLS	# row * N_COLS
	add	$t2, $t2, $t1		#	+ col

	lb	$a0, flag($t2)		# $t3 = flag[row][col]
	li	$v0, 11
	syscall

	add	$t1, $t1, 1	# col++
	b	main__col_cond
main__col_end:
	
	li	$v0, 11		# printf("\n");
	li	$a0, '\n'
	syscall

	add	$t0, $t0, 1	# row++
	b	main__row_cond
main__row_end:

	jr	$ra
	.data
flag:
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
