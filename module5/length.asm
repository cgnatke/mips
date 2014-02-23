

##
## length.asm - prints out the length of character string "str"
##
##         t0 - holds each byte from string in turn
##         t1 - contains count of characters
##         t2 - points to the string
##

################### text segment ###################

        .text
        .globl __start

__start:                      # execution starts here

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
str:    .asciiz "hello world"
ans:    .asciiz "length is "
endl:   .asciiz "\n"

######### End Of Program length.asm ##########

#### Output #####
#               #
# length is 11  #
#               #
#################

 

