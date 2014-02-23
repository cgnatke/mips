
#############################################
#  Program Name:          countInput.asm
#    Author:                Chris Natke
#    Due Date:              February 21, 2014
#  Course/Section:        CSC 211-001
#    Program Description:   
## talkToMe.asm - prompt user for word then counts the number of chars
## in the string
##         t0 - holds each byte from string
##         t1 - contains count
##         t2 - points to the string (address)
##############################################

        .text
        .globl __start

__start:                      # execution starts here

	la $a0,prompt        #  load address of prompt into a0
        li $v0,4            #  load instruction number to display a string into v0
        syscall             #  system call to print the prompt string

	# get input from user
	li $a1, 81          # set string length
        la $a0, str         # get address of string variable
        li $v0, 8           # service call number for reading string from keyboard
        syscall             # Read String

          la $t2,str          # t2 points to the string
          li $t1,0            # t1 holds the count
       
WHILE:    lb $t0,($t2)        # get a byte from the string
          beqz $t0,ENDWHILE   # zero means end of string
          add $t1,$t1,1       # increment count
          add $t2,1           # move pointer one character
          j WHILE             # go around the loop again

ENDWHILE: la $a0,ans          # display "length is "
          li $v0,4
          syscall
 
          move $a0,$t1        # display the length
          li $v0,1
          syscall

          la $a0,endl      # display new line
          li $v0,4
          syscall

          li,$v0,10
          syscall

######### data segment ############

        .data
str: .space 82 #directive to initialize number of characters in string

prompt: .asciiz "Enter a string: "
ans:    .asciiz "length is "
endl:   .asciiz "\n"

######### End Of Program length.asm ##########

#### Output ###########
# Enter a String: bob #
# length is 4         #
#                     #
#######################

 

