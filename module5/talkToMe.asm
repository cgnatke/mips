##
## length.asm - prints out the length of character string "str"
##
##         t0 - holds each byte from string in turn
##         t1 - contains count of characters
##         t2 - points to the string

################### text segment ###################

	.text
	.globl __start

__start:
	
	la $a0,intro        #  load address of prompt into a0
        li $v0,4            #  load instruction number to display a string into v0
        syscall             #  system call to print the prompt string

	# get input from user
	li $a1, 81          # set string length
        la $a0, string        # get address of string variable
        li $v0, 8           # service call number for reading string from keyboard
        syscall             # Read String
	
	#greeting
	la $a0, greeting
	li $v0, 4
	syscall
	

######### data segment ############
	.data

string: .space 82 #directive to initialize number of characters in string

intro:	   .asciiz "Hi, my name is Hal, what is your name? "	
greeting:  .asciiz "It is nice to meet you "	
welcome:   .asciiz ", Welcome to CSC 211!"
endl:	   .asciiz "\n"

################### Sample Output #####################
# Hi, my name is Hal, what is your name? Fred Fergal #
# It is nice to meet you Fred Fergal, Welcome to CSC 211! #
#######################################################
