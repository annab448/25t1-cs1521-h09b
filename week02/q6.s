	.text

main:
	li	$v0, 4		# printf("Enter a number: ");
	la	$a0, prompt
	syscall


	li	$v0, 5		# scanf("%d", &x);
	syscall
	move	$t0, $v0

	la	$t1, small_big_msg	# char *message = "small/big\n";


	ble	$t0, 100, print_message
	bge	$t0, 1000, print_message



medium:
	la	$t1, medium_msg

print_message:

	li	$v0, 4
	move	$a0, $t1
	syscall


	jr	$ra		# return


	.data
prompt:
	.asciiz "Enter a number: "

small_big_msg:
	.asciiz "small/big\n"

medium_msg:
	.asciiz "medium"
