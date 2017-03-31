	.data
lower:	.asciiz	"hola"
upper:	.asciiz "xxxx"
	.align 4

	.text
main:	la $t1, lower	#loading address of hola
	la $t4, upper	#loading address of xxxx
	j  loop
	
	
loop:	lb $t2, ($t1)	# loading the byte associated with the 'h' in a temporary register
	beq $t2, $zero , exit	
	subi $t2, $t2, 32	#conversion from lowercase to uppercase; 32 as the decimal number
	addi $t1, $t1, 1	
	sb $t2, ($t4)
	addi $t4, $t4, 1
	j loop

exit:	li $v0, 10
	syscall
	
	
	
	