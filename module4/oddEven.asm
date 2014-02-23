#############################################
#  Program Name:          oddEven.asm
#    Author:                Chris Natke
#    Due Date:              February 15, 2014
#  Course/Section:        CSC 211-001
#    Program Description:   print largest of three ints
##############################################

.text
.globl __start

__start:

la $a0,prompt           # load address of prompt into a0
li $v0,4                 # load call code number to display a string into v0
syscall                  # system call to print the prompt for integer

li $v0,5                 # load call code number to read int -> v0
syscall                  # system call to read first integer and store in v0

move $t0,$v0             # move integer from v0 -> t0 for safe keeping
                         # t0 holds ints


div $t1, $t0, 2               #divide int by 2 
mfhi $t1                  #put lower (remainder) reg into t0

#print int
move $a0, $t0		#move to print
li $v0,1                 # load call code number to display integer into v0
syscall                  # system call to print t1 as largest

beq $t1, 0, ELSE       # if they are equal... assumes 0 or 1 remainder
# num is odd
la $a0, odd           
li $v0,4                 
syscall               
j ENDIF                  # done with IF so jump over ELSE code to ENDIF label

ELSE:
#num is even
la $a0, even           
li $v0,4                 
syscall 

ENDIF:

#diagnostic code
#move $a0, $t0
#li $v0,1                 # load call code number to display integer into v0
#syscall                  # system call to print t1 as largest

la $a0,endl              # load the new line character into a0
li $v0,4                 # load the call code number to display the string into v0
syscall                  # system call to print the new line character

li $v0,10                # Exit
syscall

#####data section######

.data

prompt: .asciiz "Enter an Integer: "  #prompt for int

odd: .asciiz " is odd " #output message
even: .asciiz " is even " #output message
endl: .asciiz "\n"    #new line


