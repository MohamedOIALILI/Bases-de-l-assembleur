TITLE inverse d'une chaine

afficher macro chaine
    MOV DX,offset chaine
    MOV AH,09h
    INT 21h
ENDM

DATA SEGMENT
    chaine DB 100 dup("$")
    inv_chaine DB 100 dup("$")
    message DB 10,13,"Entrer une chaine :","$"
DATA ENDS

CODE Segment
    Main:
    ASSUME CS:CODE, DS:DATA
    
    MOV AX,DATA
    MOV DS,AX
    
    afficher message
    
    MOV CL,0
    
    INP:MOV AH,1
        INT 21H

        MOV [SI],AL

        INC SI
        INC CX

        CMP AL,0Dh
        JNZ INP
    
    MOV SI,0
    MOV DI,0
    ADD DI,CX
    DEC DI
    
    
    ici:MOV AL,chaine[SI]
        MOV inv_chaine[DI],AL
        INC SI
        DEC DI
        loop ici    
          
    afficher inv_chaine
        
    MOV AH,4Ch
    INT 21h
    
    CODE ENDS
END Main