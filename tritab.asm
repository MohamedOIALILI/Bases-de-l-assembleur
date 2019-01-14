TITLE tri tableau
DATA SEGMENT
    tab DB 10 dup(?)
    N DB ?
    msg_nb_cases DB 10,13,"Entrer la taille du tableau : ","$"
    msg_saisie DB 10,13,"Donner une valeur :","$"
    msg_tab_avant DB 10,13,"Tableau avant le tri : ","$"
    msg_tab_apres DB 10,13,"Tableau apres le tri : ","$"
DATA ENDS
Affiche_Ch macro chaine
    MOV DX,offset chaine
    MOV AH,09h
    INT 21h
ENDM
Charger macro tableau
    MOV BX,offset tableau
    MOV SI,0
    MOV CL,N
ENDM
Aff_Elem macro
    MOV DL,[BX][SI]
    MOV AH,2
    INT 21h
    INC SI
    MOV DL,' '
    MOV AH,2
    INT 21h    
ENDM
CODE SEGMENT
    Main:
    ASSUME CS:CODE,DS:DATA    
    MOV AX,DATA
    MOV DS,AX
    
    Affiche_Ch msg_nb_cases
    MOV AH,1
    INT 21h
    SUB AL,30h
    MOV N,AL
    
    MOV SI,offset tab
    MOV CL,N
    
    remp:
        Affiche_Ch msg_saisie
        MOV AH,1
        INT 21h
        MOV [SI],AL
        INC SI
    LOOP remp
    
    Affiche_Ch msg_tab_avant
    Charger tab
    
    Aff_avant:
    Aff_Elem
    LOOP aff_avant
    
    
    MOV CH,N
    SUB CH,1
    
    CMP N,1
    JE saut_tri
    
    Boucle1:
        MOV CL,N
        SUB CL,1
        MOV SI,offset tab
    
        Boucle2:
        MOV AL,[SI]
        MOV BL,[SI+1]
        cmp AL,BL
        JC Suiv ;JNC Suiv => descandant
        
        MOV DL,[SI+1]
        XCHG [SI],DL
        MOV [SI+1],DL
        
        Suiv:
        INC SI
        DEC CL
        JNZ Boucle2
        DEC CH
        JNZ Boucle1
    
    saut_tri:
    Affiche_Ch msg_tab_apres
    Charger tab
    
    Aff_apres:
    Aff_Elem
    LOOP aff_apres
    
    MOV AH,4Ch
    INT 21h
CODE ENDS
END Main