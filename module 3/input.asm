#############################################
#  Program Name:          Lab04
#    Author:                Chris Natke
#    Due Date:              February 7, 2014
#  Course/Section:        CSC 211-001
#    Program Description:   Convert F to C
##############################################


.text
.globl __start

__start:

la $a0,prompt                                             # load address of prompt into a0
li $v0,4                                                        # load call code number to display a string into v0
syscall                                                          # system call to print the prompt string

li $v0,5                                                        # load call code number to read an integer -> v0
syscall                                                          # system call to read the integer and store in v0

move $t0,$v0                                              # move integer from v0 -> t0 for safe keeping

#2nd prompt
la $a0,prompt2                                             # load address of prompt into a1
li $v0,4                                                        # load call code number to display a string into v1
syscall                                                          # system call to print the prompt string

li $v0,5                                                        # load call code number to read an integer -> v0
syscall                                                          # system call to read the integer and store in v0

move $t2,$v0                                              # move integer from v0 -> t2 for safe keeping

#print 1st int
move $a0,$t0                                              # move integer from t0 -> a0 for display
li $v0,1                                                         # load call code number to display the integer into v0
syscall                                                          # system call to print the integer

#print plus sign
#la $a0,plus                                                    # load the new line character into a0

#li $v0,4                                                         # load the call code number to display the string into v0
#syscall 

#print second int
move $a0,$t2                                              # move integer from t0 -> a0 for display
li $v1,1                                                         # load call code number to display the integer into v1
syscall                                                          # system call to print the integer

#print second half of equation
la $a0,equals                                                    # load the new line character into a0
li $v0,4                                                         # load the call code number to display the string into v0
syscall                                                           # system call to print the new line character
 
#newline
la $a0,endl                                                    # load the new line character into a0
li $v0,4                                                         # load the call code number to display the string into v0
syscall                                                           # system call to print the new line character


li $v0,10                                                       # Exit
syscall




#####data section######

.data

prompt: .asciiz "Enter an Integer: "               #prompt for the integer
prompt2: .asciiz "Enter another Integer: "         #promt for second integer
plus: .asciiz " + " #plus sign
equals: .asciiz " = ?"	#second half of equation
endl: .asciiz "\n"                                             #new line
