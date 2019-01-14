Title somme sur 2 digits
DATA SEGMENT
    msg_a DB 10,13,"Donner le premier nombre : ","$"
    msg_b DB 10,13,"Donner le deuxieme nombre : ","$"
    msg_somme DB 10,13,"Somme est : ","$"
    a DB ?
    b DB ?
    c DB ?
DATA ENDS
Message macro chaine
    MOV DX,offset chaine
    MOV AH,09h
    INT 21h
ENDM
CODE SEGMENT
    Main:
    ASSUME DS:DATA,CS:CODE
    MOV AX,DATA
    MOV DS,AX
    
    Message msg_a
    MOV AH,01h
    INT 21h
    SUB AL,30h
    MOV a,AL
    
    Message msg_b
    MOV AH,01h
    INT 21h
    SUB AL,30h
    MOV b,AL
    
    ADD AL,a
    
    MOV c,AL
    MOV AH,0
    AAA
    
    ADD AH,30h
    ADD AL,30h
    
    MOV BX,AX
    
    Message msg_somme
    
    MOV AH,2
    MOV DL,BH
    INT 21h
    
    MOV AH,2
    MOV DL,BL
    INT 21h
    
    MOV AH,4Ch
    INT 21h
CODE ENDS
END Main