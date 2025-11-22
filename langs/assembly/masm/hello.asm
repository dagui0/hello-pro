.MODEL SMALL
.STACK 100h

.DATA
    message DB 'Hello, World!$'

.CODE
MAIN PROC
    ; Initialize Data Segment
    MOV AX, @DATA
    MOV DS, AX

    ; Print the string
    MOV AH, 09h    ; Function to display a string
    LEA DX, message ; Load effective address of the message
    INT 21h        ; Call MS-DOS interrupt

    ; Exit the program
    MOV AH, 4Ch    ; Function to terminate program
    INT 21h        ; Call MS-DOS interrupt
MAIN ENDP
END MAIN
