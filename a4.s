.global _start

@ Define constants for grade thresholds
.equ A_THRESHOLD, 90
.equ B_THRESHOLD, 75
.equ C_THRESHOLD, 50

@ Input: percentage grade in R0
@ Output: letter grade message printed to terminal 

_start:
    @ Prompt the user for input
    LDR R1, =prompt
    MOV R7, #4
    SWI 0
    
    @ Read the input value
    MOV R7, #3
    LDR R1, =input_buffer
    MOV R2, #4
    SWI 0
    
    @ Convert input to integer
    LDR R5, =input_buffer
    LDR R0, [R5]
    
    LDR R6, =A_THRESHOLD
    LDR R7, =B_THRESHOLD
    LDR R8, =C_THRESHOLD
    
    @ Compare with A_THRESHOLD
    CMP R0, #A_THRESHOLD
    BGE grade_A

    @ Compare with B_THRESHOLD
    CMP R0, #B_THRESHOLD
    BLT grade_B
    BGE grade_C

    @ Compare with C_THRESHOLD
    CMP R0, #C_THRESHOLD
    BLT grade_C
    B grade_F

grade_A:
    @ Print "Congratulations! You got an A."
    @ Call a print function
    B done

grade_B:
    @ Print "Good job! You got a B."
    @ Call a print function
    B done

grade_C:
    @ Print "Not bad, you got a C."
    @ Call a print function
    B done

grade_F:
    @ Print "Sorry, you got an F."
    @ Call a print function
    B done

done:
    @ Exit the program
    MOV R7, #1
    MOV R0, #0
    SWI 0

    @ Data section
    .data
prompt:
    .asciz "Enter your percentage grade: "
input_buffer:
    .space 4