	.text

main:			# int main(void) {

	li	$v0, 4		# printf("Enter a number: ");
	la	$a0, prompt
	syscall
	
	li	$v0, 5		# scanf("%d", &x);
	syscall
	move	$t0, $v0	# $t0 = x

	# if (x <= SQUARE_MAX) goto square_x;
	ble	$t0, 46340, square_x

too_big:
	li	$v0, 4		# printf("square too big for 32 bits\n");
	la	$a0, too_big_msg
	syscall 

	b	end

square_x:
	mul	$t1, $t0, $t0	# y = x * x

	li	$v0, 1		# printf("%d\n", y);
	move	$a0, $t1
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall


end: 
	li	$v0, 0
	jr	$ra		# return 0;

	.data
prompt:
	.asciiz "Enter a number: "

too_big_msg:
	.asciiz "square too big for 32 bits\n"


