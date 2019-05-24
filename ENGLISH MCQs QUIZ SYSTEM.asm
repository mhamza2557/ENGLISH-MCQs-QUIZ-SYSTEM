.MODEL SMALL
.STACK 100H
.DATA
WELCOME DB ' ',0AH,0DH
        DB ' ',0AH,0DH
        DB ' ',0AH,0DH
        DB '                ****************************************************',0AH,0DH
        DB '               ||                                                 ||',0AH,0DH
        DB '               ||                  WELCOME                        ||',0AH,0DH
        DB '               ||                    TO                           ||',0AH,0DH
        DB '               ||                QUIZ SYSTEM                      ||',0AH,0DH
        DB '               ||_________________________________________________||',0AH,0DH
        DB '               ||                                                 ||',0AH,0DH
        DB '               ||                 1. START                        ||',0AH,0DH
        DB '               ||                 2. EXIT                         ||',0AH,0DH
        DB '               ||                                                 ||',0AH,0DH
        DB '                ****************************************************$',0AH,0DH
        
QUIZ_START DB '                                 START QUIZ$'
Q1 DB '          Q.1 Who is the first person to reach Mount Everest?',0AH,0DH 
   DB '          (1) Sherpa Tensing, Edmund Hillary',0AH,0DH 
   DB '          (2) Rajesh Sharma',0AH,0DH 
   DB '          (3) Charles Hillary',0AH,0DH 
   DB '          (4) Johan don $',0AH,0DH
      
Q2 DB '          Which is the religion of the world?',0AH,0DH 
   DB '          (1) Hinduism',0AH,0DH 
   DB '          (2) Muslim',0AH,0DH 
   DB '          (3) Sikh',0AH,0DH 
   DB '          (4) Christian $',0AH,0DH              
   
Q3 DB '          Who is the first President of the U.S.A.?',0AH,0DH 
   DB '          (1) George Washington',0AH,0DH 
   DB '          (2) Robert Walpole',0AH,0DH 
   DB '          (3) Henry Waterloo',0AH,0DH 
   DB '          (4) George Bush $',0AH,0DH


Q4 DB '          Who was the first Governor General of Pakistan?',0AH,0DH 
   DB '          (1) Mohd. Ali Jinnah',0AH,0DH 
   DB '          (2) Robert Walpole',0AH,0DH 
   DB '          (3) Henry Waterloo',0AH,0DH 
   DB '          (4) George Bush  $',0AH,0DH

Q5 DB '          Who was the first person to fly aero plane?',0AH,0DH 
   DB '          (1) Wright Brothers',0AH,0DH 
   DB '          (2) Robert Walpole',0AH,0DH 
   DB '          (3) Henry Waterloo',0AH,0DH 
   DB '          (4) George Bush $',0AH,0DH
   
Q6 DB '          Which was the first country to send man to the moon?',0AH,0DH 
   DB '          (1) USA',0AH,0DH 
   DB '          (2) India',0AH,0DH 
   DB '          (3) China',0AH,0DH
   DB '          (4) UK $',0AH,0DH
   
Q7 DB '          Which was the first country to launch Artificial satellite in the space?',0AH,0DH 
   DB '          (1) Russia',0AH,0DH 
   DB '          (2) India',0AH,0DH 
   DB '          (3) USA',0AH,0DH 
   DB '          (4) UK  $',0AH,0DH

Q8 DB '          Who was the first batsman to score three test century in three successive tests on debut?',0AH,0DH 
   DB '          (1) Mohd. Azharuddin',0AH,0DH 
   DB '          (2) Sacchin Tendulkar',0AH,0DH 
   DB '          (3) Gail',0AH,0DH 
   DB '          (4) Virat Kohali  $',0AH,0DH

Q9 DB '          Turkey connects the two continents',0AH,0DH
   DB '          (1) Asia and Africa',0AH,0DH
   DB '          (2) Asia and Europe',0AH,0DH
   DB '          (3) Asia and Australia',0AH,0DH
   DB '          (4) South America and North America $',0AH,0DH

Q10 DB '          Which country awards the Nobel Prize?',0AH,0DH  
    DB '          (1) Ireland',0AH,0DH
    DB '          (2) Sweden',0AH,0DH
    DB '          (3) England',0AH,0DH
    DB '          (4) America $',0AH,0DH
    
CORRECT_ANSWERS DB '                  CORRECT ANSWERS',0AH,0DH
                DB '          (1) Sherpa Tensing, Edmund Hillary',0AH,0DH
                DB '          (2) Hinduism',0AH,0DH
                DB '          (3) George Washington',0AH,0DH
                DB '          (4) Mohd. Ali Jinnah',0AH,0DH
                DB '          (5) Wright Brothers',0AH,0DH
                DB '          (6) USA',0AH,0DH
                DB '          (7) Russia',0AH,0DH
                DB '          (8) Mohd. Azharuddin',0AH,0DH
                DB '          (9) Asia and Europe',0AH,0DH
                DB '          (10) Sweden $',0AH,0DH



;MAX_NUMBER DB 10H
OBTAINED_NUMBER DB 0H

EXIT_PROGRAM_ DB '                                  QUIZ EXIT$'
WIN  DB '                                  YOU WIN$'
LOSS DB '                                  YOU LOSS$'
.CODE
INPUT_SPACE PROC
     MOV DX,0AH
    MOV AH,02H
    INT 21H
    
    MOV DX,0DH
    MOV AH,02H
    INT 21H
    
    MOV AH,1H
    INT 21H
    SUB AL,30H
    RET
INPUT_SPACE ENDP

SPACE PROC
     MOV DX,0AH
    MOV AH,02H
    INT 21H
    
    MOV DX,0DH
    MOV AH,02H
    INT 21H
    RET
SPACE ENDP

TIMER_2S PROC
    MOV CX,30 ;1E
    MOV AH,86H
    INT 15H
    RET
TIMER_2S ENDP

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,WELCOME
    MOV AH,9H
    INT 21H
    
    MOV DX,0AH
    MOV AH,02H
    INT 21H
    
    MOV DX,0DH
    MOV AH,02H
    INT 21H
    
    MOV AH,1H
    INT 21H
    SUB AL,30H
    
    CMP AL,1H
    JE QUIZ_SYSTEM
    
    CMP AL,2H
    JE EXIT_PROGRAM
    
    QUIZ_SYSTEM:
    LEA DX,QUIZ_START
    MOV AH,9H
    INT 21H
    
    MOV DX,0AH
    MOV AH,02H
    INT 21H
    
    MOV DX,0DH
    MOV AH,02H
    INT 21H
    
    MOV DX,0AH
    MOV AH,02H
    INT 21H
    
    MOV DX,0DH
    MOV AH,02H
    INT 21H
    ;--------------------------------
    LEA DX,Q1
    MOV AH,09H
    INT 21H
    
    CALL INPUT_SPACE
    
    CMP AL,1H
    JE CORRECT_ANSWER_1
    
    JMP NOT_CORRECT_1
    
    CORRECT_ANSWER_1:
    INC OBTAINED_NUMBER
    ;--------------------------------
    NOT_CORRECT_1:
    CALL TIMER_2S
    
    CALL SPACE
    LEA DX,Q2
    MOV AH,09H
    INT 21H
    
    CALL INPUT_SPACE
    
    CMP AL,1H
    JE CORRECT_ANSWER_2
    
    JMP NOT_CORRECT_2
    
    CORRECT_ANSWER_2:
    INC OBTAINED_NUMBER
    ;--------------------------------
    NOT_CORRECT_2:
    CALL TIMER_2S
    
    CALL SPACE
    LEA DX,Q3
    MOV AH,09H
    INT 21H
    
    CALL INPUT_SPACE
    
    CMP AL,1H
    JE CORRECT_ANSWER_3
    
    JMP NOT_CORRECT_3
    
    CORRECT_ANSWER_3:
    INC OBTAINED_NUMBER
    ;--------------------------------
    NOT_CORRECT_3:
    CALL TIMER_2S
    
    CALL SPACE
    LEA DX,Q4
    MOV AH,09H
    INT 21H
    
    CALL INPUT_SPACE
    
    CMP AL,1H
    JE CORRECT_ANSWER_4
    
    JMP NOT_CORRECT_4
    
    CORRECT_ANSWER_4:
    INC OBTAINED_NUMBER
    ;--------------------------------
    NOT_CORRECT_4:
    CALL TIMER_2S
    
    CALL SPACE
    LEA DX,Q5
    MOV AH,09H
    INT 21H
    
    CALL INPUT_SPACE
    
    CMP AL,1H
    JE CORRECT_ANSWER_5
    
    CORRECT_ANSWER_5:
    INC OBTAINED_NUMBER
    ;--------------------------------
    NOT_CORRECT_5:
    CALL TIMER_2S
    
    CALL SPACE
    LEA DX,Q6
    MOV AH,09H
    INT 21H
    
    CALL INPUT_SPACE
    
    CMP AL,1H
    JE CORRECT_ANSWER_6
    
    JMP NOT_CORRECT_6
    
    CORRECT_ANSWER_6:
    INC OBTAINED_NUMBER
    ;--------------------------------
    NOT_CORRECT_6:
    CALL TIMER_2S
    
    CALL SPACE
    LEA DX,Q7
    MOV AH,09H
    INT 21H
    
    CALL INPUT_SPACE
    
    CMP AL,1H
    JE CORRECT_ANSWER_7
    
    JMP NOT_CORRECT_7
    
    CORRECT_ANSWER_7:
    INC OBTAINED_NUMBER
    ;--------------------------------
    NOT_CORRECT_7:
    CALL TIMER_2S
    
    CALL SPACE
    LEA DX,Q8
    MOV AH,09H
    INT 21H
    
    CALL INPUT_SPACE
    
    CMP AL,1H
    JE CORRECT_ANSWER_8
    
    JMP NOT_CORRECT_8
    
    CORRECT_ANSWER_8:
    INC OBTAINED_NUMBER
    ;--------------------------------
    NOT_CORRECT_8:
    CALL TIMER_2S
    
    CALL SPACE
    LEA DX,Q9
    MOV AH,09H
    INT 21H
    
    CALL INPUT_SPACE
    
    CMP AL,2H
    JE CORRECT_ANSWER_9
    
    JMP NOT_CORRECT_9
    
    CORRECT_ANSWER_9:
    INC OBTAINED_NUMBER
    ;--------------------------------
    NOT_CORRECT_9:
    CALL TIMER_2S
    
    CALL SPACE
    LEA DX,Q10
    MOV AH,09H
    INT 21H
    
    CALL INPUT_SPACE
    
    CMP AL,2H
    JE CORRECT_ANSWER_10
    
    JMP QUIZ_COMPLETED
    
    CORRECT_ANSWER_10:
    INC OBTAINED_NUMBER
    ;--------------------------------    
    CALL TIMER_2S
    CALL SPACE
    
    QUIZ_COMPLETED:
    
    MOV BL,OBTAINED_NUMBER
    CMP BL,5
    JGE WIN_

    CALL SPACE
    LEA DX,LOSS
    MOV AH,09H
    INT 21H
    
    CALL SPACE
    CALL SPACE
    LEA DX,CORRECT_ANSWERS
    MOV AH,09H
    INT 21H
    
    JMP EXIT_PROGRAM
    
    WIN_:
    LEA DX,WIN
    MOV AH,09H
    INT 21H
    
    CALL SPACE
    CALL SPACE
    LEA DX,CORRECT_ANSWERS
    MOV AH,09H
    INT 21H
                  

    EXIT_PROGRAM:
    CALL SPACE
    CALL SPACE
    
    LEA DX,EXIT_PROGRAM_
    MOV AH,9H
    INT 21H    
    
ENDP
END MAIN