TITLE min et max

affiche_ch macro chaine
    MOV DX,offset chaine
    MOV AH,09h
    INT 21h
ENDM

affiche_c macro caractere
    MOV DL,caractere
    MOV AH,2
    INT 21h
ENDM

position macro t
    MOV CL,N
    SUB CL,48
    MOV BX,offset t
    MOV SI,0
ENDM

DATA SEGMENT
    tab DB 20 dup(?)
    chaine DB "Donner la valeur de N :","$"
    msg_val DB 10,13,"Donner une valeur :","$"
    msg_elements DB 10,13,"Les elements du tableau :","$"
    msg_max DB 10,13,"Le maximum :","$"
    msg_min DB 10,13,"Le minimum :","$"
    N DB ?
    Max DB ?
    Min DB ?
DATA ENDS

CODE Segment
    Main:
    ASSUME CS:CODE, DS:DATA
    
    MOV AX,DATA
    MOV DS,AX
    
    affiche_ch chaine
    
    MOV AH,1
    INT 21h
    MOV N,AL
    
    MOV CL,N
    SUB CL,48
    MOV SI,offset tab
    
    Boucle: 
    MOV DX,offset msg_val
    MOV AH,09h
    INT 21h
    
    MOV AH,1
    INT 21h
    MOV [SI],AL
    INC SI
    LOOP Boucle
    
    position tab
    
    MOV DL,10
    MOV AH,2
    INT 21h
    affiche_ch msg_elements
    Afficher:
    MOV DL,[BX][SI]
    MOV AH,2
    INT 21h
    INC SI
    LOOP Afficher
    
    MOV SI,offset tab
    
    MOV DL,[SI]
    MOV Min,DL
    MOV Max,DL
    
    position tab
    
    Max_Min:
    MOV DL,[BX][SI]
    CMP DL,Max
    JG est_grand
    
    CMP DL,Min
    JL est_petit
    
    JMP suiv
    
    est_grand:
    MOV Max,DL
    JMP suiv
    
    est_petit: 
    MOV Min,DL
    
    suiv:
    INC SI 
    LOOP Max_Min
    
    affiche_ch msg_max
    affiche_c Max
    
    affiche_ch msg_min
    affiche_c Min
    
    MOV AH,4Ch
    INT 21h
    
    CODE ENDS
END Main