	.data			#done by Naeem Shaikh
lower1:	.asciiz	"loop2"
upper1:	.space 10
lower2:	.asciiz "Elephant!"
upper2: .space 10

	.text
main:	la $a0, lower1	#loading address of loop2 into argument register
	la $a1, upper1
	jal toUpper	#main program calling the procedure first time
	la $a0, lower2	#loading address of Elephant! into argument register
	la $a1, upper2	# main program calling the procedure the second time
	li $t1, 97
	li $t3, 122
	jal  toUpper
	
	
toUpper:	
	lb $t2, ($a0)
	beq $t2, $zero, endToUpper 
	ble $t2 ,$t1 , store	# checking for a-z range and jumping to another subroutine if true
	bge $t2, $t3 , store
	subi $t2, $t2, 32	# conversion from lowercase to uppercase

	 
store:	addi $a0, $a0, 1
	sb $t2, ($a1)
	addi $a1, $a1, 1

	j toUpper
	

endToUpper:
	jr $ra

exit:	li $v0, 10
	syscall
	
	
	
