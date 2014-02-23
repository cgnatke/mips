########### readStrings.asm Module 2- lab 1 #############

# Chris Natke                                 #

###############################################


.text
.globl __start

__start:

	la $a0,prompt          #  load address of prompt into a0
        li $v0,4                     #  load instruction number to display a string into v0
        syscall                      #  system call to print the prompt string
	
	li $a1, 81               # set string length
        la $a0, string        # get address of string variable
        li $v0, 8                 # service call number for reading string from keyboard
        syscall                   # Read String

	la $a0, hello          # load address of string into a0
        li $v0, 4                   # load instruction number to display a string into v0
        syscall 	

	la $a0, string          # load address of string into a0
        li $v0, 4                   # load instruction number to display a string into v0
        syscall                     # system call to print the string

	la $a0, welcome          # load address of string into a0
        li $v0, 4                   # load instruction number to display a string into v0
        syscall  	

	la $a0, endl          # load address of string into a0
        li $v0, 4                   # load instruction number to display a string into v0
        syscall

	li $v0,10                                                       # Exit
	syscall

#####data section######
.data
prompt: .asciiz "What is your name? "           #prompt for input
string: .space 82 #directive to initialize number of characters in string

hello: .asciiz "Hello "  #output message
welcome: .asciiz "Welcome to CSC 211!" #output message 2nd line
endl: .asciiz "\n"        #new line
