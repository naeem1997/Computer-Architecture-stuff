#done by Naeem Shaikh
#Homework 3; Professor Mazidi
		.data
space:	.asciiz "\n"	#to print new line
height:	.float	0.0
weight:	.float 	0.0
const703:	.float	703
prompt_height:	.asciiz	 "Please enter your height in inches:"
prompt_weight:	.asciiz	"Now enter your weight in pounds (round to a whole number):"
echo_bmi:	.asciiz "Your bmi is: "
bmi:	.float	0.0
under:	.float 18.5
normal:	.float 25
over:	.float	30
string1:	.asciiz	"This is considered underweight"
string2:	.asciiz	"This is a normal weight"
string3:	.asciiz	"This is considered overweight."
string4:	.asciiz	"This is considered obese."

	.text
lwc1	$f2, height	#load word  (height) into first coprocessor 
lwc1	$f3, weight	#load weight into $f3
lwc1	$f5, const703	#load 703 into the $f5 register

la	$a0, prompt_height	#prompts user to enter height onto command using syscall
li	$v0, 4
syscall
li	$v0, 6
syscall
mov.s	$f4, $f0	#$f4 has height

la	$a0, prompt_weight	#prompts user to enter weight using syscall
li	$v0, 4
syscall
li	$v0, 6
syscall			#$f0 has weight

mul.s	$f0, $f0, $f5	# weight*703=weight
mul.s	$f4, $f4, $f4	#height*height=height
div.s	$f0, $f0, $f4	# $f0=bmi; bmi=weight/height



l.s	$f12, under	#under weight loaded in $f9
l.s	$f10, over	#over weight loaded in $f10
l.s	$f14, normal	#normal weight loaded in $f11

la $a0, echo_bmi	
li $v0, 4
syscall

mov.s $f12, $f0
li $v0, 2
syscall

la $a0, space
li $v0, 4
syscall


c.lt.s	$f0, $f12	#if bmi<18.5, print underweight
bc1t	print1
c.lt.s	$f0, $f14	#if bmi<25, print normal weight
bc1t	print2
c.lt.s	$f0, $f10	#if bmi<30, print overweight
bc1t	print3
c.lt.s	$f10, $f0	#if 30<bmi, print obese
bc1t	print4




print1:
	la $a0, string1		#underweight message
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall

print2:
	la $a0, string2		#normal weight message
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall

print3:				#over weight message
	la $a0, string3
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall

print4:				#obese message
	la $a0, string4
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall










