

main:
	
	# count += 1
	lw	$t0, count	# $t0 = count
	add	$t0, $t0, 1
	sw	$t0, count

	lw	$s0, x		# x = 99 = $s0

	jal another_func()	# no x = 0


	# NEED TO LOAD x again
	# printf("%d", x)



	.data
# GLOBAL VARIABLES
count:
	.word 10

x:
	.word 99
