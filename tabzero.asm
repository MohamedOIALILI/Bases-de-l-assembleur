TITLE tableau non zero

DATA SEGMENT
    tab DB 1,2,0,4,6,5,1,9,8,0
    N DW 10
DATA ENDS

CODE Segment
    Main:
    ASSUME DS:DATA, CS:CODE
    
    MOV AX,DATA
    MOV DS,AX
    
    MOV CX, N
    MOV BX, offset tab
    MOV SI, 0
    
    Boucle:
    MOV DL, [BX][SI]
    CMP DL, 0
    JE null
    ADD DL, 48
    MOV AH, 02h
    INT 21h
    null:
    INC SI
    LOOP Boucle
          
    MOV AH,4Ch
    INT 21h
    
    CODE ENDS
END Main