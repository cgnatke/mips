#############################################
#  Program Name:          threeBlindInts
#    Author:                Chris Natke
#    Due Date:              February 15, 2014
#  Course/Section:        CSC 211-001
#    Program Description:   print largest of three ints
##############################################

.text
.globl __start

__start:

la $a0,prompt1           # load address of prompt into a0
li $v0,4                 # load call code number to display a string into v0
syscall                  # system call to print the prompt for 1st integer

li $v0,5                 # load call code number to read first integer -> v0
syscall                  # system call to read first integer and store in v0

move $t0,$v0             # move integer from v0 -> t0 for safe keeping
                         # t0 holds first integer

la $a0,prompt2           # load address of prompt into a0
li $v0,4                 # load call code number to display a string into v0
syscall                  # system call to print the prompt for 2nd integer

li $v0,5                 # load call code number to read an integer -> v0
syscall                  # system call to read second integer and store in v0

move $t1,$v0             # move integer from v0 -> t1 for safe keeping
                         # t1 holds second integer

la $a0,prompt3           # load address of prompt into a0
li $v0,4                 # load call code number to display a string into v0
syscall                  # system call to print the prompt for 2nd integer

li $v0,5                 # load call code number to read an integer -> v0
syscall                  # system call to read second integer and store in v0

move $t2,$v0             # move integer from v0 -> t2 for safe keeping
                         # t2 holds third integer

la $a0, output           # load address of output message into a0
li $v0,4                 # load call code number to display a string into v0
syscall                  # system call to print output string

blt $t0, $t1, ELSE       # IF t0 < t1 then Branch to ELSE
move $a0,$t0             # IF t0 > t1 move t0 -> a0 for display as largest   
j ENDIF                  # done with IF so jump over ELSE code to ENDIF label
 
ELSE:  move $a0,$t1      # ELSE t1 is largest so move t1 -> a0 for display


ENDIF:


blt $t2, $a0, FINAL       # IF t0 < t2 then Branch to ELSE
move $a0,$t2            #move t2 -> a0 for display as largest   

FINAL:
#print here 
li $v0,1                 # load call code number to display integer into v0
syscall                  # system call to print t1 as largest

la $a0,endl              # load the new line character into a0
li $v0,4                 # load the call code number to display the string into v0
syscall                  # system call to print the new line character

li $v0,10                # Exit
syscall

#####data section######

.data

prompt1: .asciiz "Enter first Integer: "  #prompt for the 1st integer
prompt2: .asciiz "Enter second Integer: " #prompt for the 2nd integer
prompt3: .asciiz "Enter last Integer: " #prompt for the last integer

output: .asciiz "The largest integer is " #output message
endl: .asciiz "\n"    #new line

 
