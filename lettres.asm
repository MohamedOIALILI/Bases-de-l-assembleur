TITLE afficher les lettres

DATA SEGMENT
    lettre DB ?
DATA ENDS

CODE Segment
    Main:
    ASSUME CS:CODE, DS:DATA
    
    MOV AX,DATA
    MOV DS,AX
    
    MOV lettre, 'A' ; ou MOV CL, 65
    for : CMP lettre, 'Z' ; ou  for : CMP CL, 65+25
          JA endfor
          
          MOV DL, lettre
          MOV AH, 2
          INT 21h
          
          INC lettre
          
          MOV DL, ' '
          MOV AH, 2
          INT 21h
          
          JMP for
    endfor :
    
    MOV AH,4Ch
    INT 21h
    
    CODE ENDS
END Main