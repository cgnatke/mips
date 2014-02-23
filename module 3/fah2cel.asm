#############################################
#  Program Name:          Lab03
#    Author:                Chris Natke
#    Due Date:              February 7, 2014
#  Course/Section:        CSC 211-001
#    Program Description:   Convert F to C
##############################################

        .text
        .globl __start
__start:
        #Print out prompt
        la $a0,prompt        # load beginning address of strint into $a0 register
        li $v0,4             # load call code to print a string into register $v0
        syscall              # system call to display "Enter temperature (F):"

        #Get the temperature from User
        li $v0,6             # load call code to read a float from keyboard
        syscall              # system call to read float and store in $f0

        #Initialize float values for conversion
        li.s $f6, 9.0
        li.s $f8 5.0
        li.s $f10, 32.0
       
        #Convert Fahrenheit to Celsius formula: C = 5/9 (F-32)

	sub.s $f2,$f0,$f10    # F - 32
        mul.s $f2,$f2,$f8    # 5*(F-32)
        div.s $f2,$f2,$f6   # (5*(F-32))/9 and store -> f2

	#old code for reference
        #mul.s $f2,$f0,$f6    # 9*temperature
        #div.s $f2,$f2,$f8    # 9*temperature/5
        #add.s $f2,$f2,$f10   # 9*temperature/5 + 32 and store -> f2

        #Display output message
        la $a0, ans1         # load beginning address of display message into $a0 register
        li $v0,4             # load call code to print a string 
        syscall              # system call to display "The Temperature in Fahrenheit is "
       
        #Display temperature
        mov.s $f12,$f2       # move Fahrenheit temperature from f2 -> f12 for display
        li  $v0,2            # load call code to print a float    
        syscall              # system call to display temperature

        #Move to next line       
        la $a0,endl          # display cr/lf
        li $v0,4             # load call code to print a string (new line is a string)
        syscall              # system call to move to next line

        li $v0,10            # load call code to End Program
        syscall              # system call to end program

        #Data Section
         .data
         prompt: .asciiz "Enter temperature (Fahrenheit): "       #Prompt for Fahrenheit temperature
         ans1:   .asciiz "The Temperature in Celcius is "   #Output message
         endl:   .asciiz "\n"                                  #New line character
 

 

