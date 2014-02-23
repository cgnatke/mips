#############################################
#  Program Name:          Lab05
#    Author:                Chris Natke
#    Due Date:              February 7, 2014
#  Course/Section:        CSC 211-001
#    Program Description:   Calculate sales tax
##############################################

        .text
        .globl __start
__start:
        #Print out prompt
        la $a0,prompt        # load beginning address of strint into $a0 register
        li $v0,4             # load call code to print a string into register $v0
        syscall              # system call to display prompt

        #Get the price from User
        li $v0,6             # load call code to read a float from keyboard
        syscall              # system call to read float and store in $f0

        #Initialize float value
        li.s $f6,1.08 #tax rate
       
        #Convert Fahrenheit to Celsius formula: C = 5/9 (F-32)

        mul.s $f2,$f0,$f6    # price * 1.08


        #Display output message
        la $a0, ans1         # load beginning address of display message into $a0 register
        li $v0,4             # load call code to print a string 
        syscall              # system call to display total cost
       
        #Display cost
        mov.s $f12,$f2       # move from f2 -> f12 for display
        li  $v0,2            # load call code to print a float    
        syscall              # system call to display cost

        #Move to next line       
        la $a0,endl          # display cr/lf
        li $v0,4             # load call code to print a string (new line is a string)
        syscall              # system call to move to next line

        li $v0,10            # load call code to End Program
        syscall              # system call to end program

        #Data Section
         .data
         prompt: .asciiz "What is the cost of the item: "       #Prompt for cost
         ans1:   .asciiz "The total cost of the item is: "   #Output message
         endl:   .asciiz "\n"                                  #New line character
 

 

