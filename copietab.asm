Title copie un tableau

affiche_el macro
    MOV DL,[BX][SI]
    MOV AH,2
    INT 21h
    INC SI
    
    MOV DL,' '
    MOV AH,2
    INT 21h
ENDM

DATA SEGMENT
    tab DB 100 dup(?)
    tab_copie DB 100 dup(?)
    N DB ?
    msg_nb_cases DB 10,13,"Donner le nombre des elements du tableau (max=100): ","$"
    msg_saisie DB 10,13,"Donner une valeur :","$"
    msg_aff_tab DB 10,13,"Les elements du tableau source :","$"
    msg_aff_tab_copie DB 10,13,"Les elements du tableau destination :","$"
DATA ENDS
CODE SEGMENT
    Main:
    ASSUME DS:DATA,CS:CODE
    
    MOV AX,DATA
    MOV DS,AX
    
    MOV DX,offset msg_nb_cases
    MOV AH,9
    INT 21h
    
    MOV AH,1
    INT 21h
    MOV N,AL
    
    MOV CL,N
    SUB CL,30h
    
    MOV SI,offset tab
    MOV DI,offset tab_copie
    
    remp:
        MOV DX,offset msg_saisie
        MOV AH,09h
        INT 21h
        
        MOV AH,1
        INT 21h
        MOV [SI],AL
        MOV [DI],AL
        
        INC SI
        INC DI
    LOOP remp
    
    MOV DX,offset msg_aff_tab
    MOV AH,9
    INT 21h
    
    MOV BX,offset tab
    MOV SI,0
    
    MOV CL,N
    SUB CL,30h
    
    aff_tab:
        affiche_el
        LOOP aff_tab
    
    MOV DX,offset msg_aff_tab_copie
    MOV AH,9
    INT 21h
    
    MOV BX,offset tab_copie
    MOV SI,0
    
    MOV CL,N
    SUB CL,30h
    
    aff_tab_copie:
        affiche_el
        LOOP aff_tab_copie
    
    
    MOV AH,4Ch
    INT 21h
CODE ENDS
END Main