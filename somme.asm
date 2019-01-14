TITLE somme sur 1 digit

PILE SEGMENT STACK
    DW 5 dup(?)
PILE ENDS

affiche macro chaine
    MOV DX,offset chaine
    MOV AH,09h
    INT 21h
ENDM

DATA SEGMENT
    saisie_val1 DB 10,13,"Donner le premier nombre :","$"
    saisie_val2 DB 10,13,"Donner le deuxieme nombre :","$"
    msg_resultat DB 10,13,"La somme est :",32,"$"
    val1 DB ?
    val2 DB ?
DATA ENDS

CODE Segment
    Main:
    ASSUME CS:CODE, DS:DATA, SS:PILE
    
    MOV AX,DATA
    MOV DS,AX
    
    affiche saisie_val1
    MOV AH,1
    INT 21h
    MOV val1, AL
    
    affiche saisie_val2
    MOV AH,1
    INT 21h
    ADD AL, val1
    MOV val2, AL
    
    affiche msg_resultat
    SUB val2, 30h
    
    MOV AH,2
    MOV DL,val2
    INT 21h
    
    MOV AH,4Ch
    INT 21h
    
    CODE ENDS
END Main