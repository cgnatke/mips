#############################################
#  Program Name:          talkToMe.asm
#    Author:                Chris Natke
#    Due Date:              February 15, 2014
#  Course/Section:        CSC 211-001
#    Program Description:   
## talkToMe.asm - prompts the user and then strips the response of the \n ##                char while using the name in output
##
##         t0 - holds each byte from string in turn
##         t1 - contains newline char, then null char (00000000)
##         t2 - points to the string
##############################################

	.text
	.globl __start

__start:
	
	la $a0,intro        #  load address of prompt into a0
        li $v0,4            #  load instruction number to display a string into v0
        syscall             #  system call to print the prompt string

	# get input from user
	li $a1, 81          # set string length
        la $a0, str         # get address of string variable
        li $v0, 8           # service call number for reading string from keyboard
        syscall             # Read String
	
	#greeting
	la $a0, greeting
	li $v0, 4
	syscall
	
	#place user name address in t2
	la $t2, str	#t2 points to string	

	#place newline into t1
	la $t0, endl #address is in $t0... Do I have to do this?
	lb $t1, ($t0) #newline char is in t1 
	

#go through string and stop at newline char
NEXTC1:	lb $t0, ($t2)		#put char into t0
	beq $t1, $t0, YES  #compare char to t1 (newline)
	add $t2, 1		#move pointer to next byte
	j NEXTC1	#execute loop again

YES:	add $t2, 1 #get to the null char	
	lb $t1, ($t2) # load null byte into t1
	sub $t2, 1    #move back a byte
	sb $t1, ($t2) #store null char where newline was

	#print name of user without newline
	la $a0, str
	li $v0, 4
	syscall

	#print welcome message
	la $a0, welcome
	li $v0, 4
	syscall

	#print newline
	la $a0, endl
	li $v0, 4
	syscall	

	#exit	
	li,$v0,10
        syscall

######### data segment ############
	.data

str: .space 82 #directive to initialize number of characters in string

intro:	   .asciiz "Hi, my name is Hal, what is your name? "	
greeting:  .asciiz "It is nice to meet you "	
welcome:   .asciiz ", Welcome to CSC 211!"
endl:	   .asciiz "\n"

################### Sample Output #####################
# Hi, my name is Hal, what is your name? Fred Fergal #
# It is nice to meet you Fred Fergal, Welcome to CSC 211! #
#######################################################
