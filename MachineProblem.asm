org 100h

.data
    mainMenu db 0Dh, 0Ah, 0Dh, 0Ah, "= Quiz Game =", 0Dh, 0Ah, 0Dh, 0Ah, "Choose a level:", 0Dh, 0Ah, "1. Level 1", 0Dh, 0Ah, "2. Level 2", 0Dh, 0Ah, "3. Level 3", 0Dh, 0Ah, "4. Exit", 0Dh, 0Ah, "$"
    levelPrompt db 0Dh, 0Ah, "Enter your choice: $"
    
    ;level 1
    
    levelOnePrompt db 0Dh, 0Ah, 0Dh, 0Ah, "= Level One =", 0Dh, 0Ah, "$"     
    aL1Question db 0Dh, 0Ah, "What is the decimal value of 001?", 0Dh, 0Ah, "A: 1", 0Dh, 0Ah, "B: 2", 0Dh, 0Ah, "C: 3", 0Dh, 0Ah, "$"            
    bL1Question db 0Dh, 0Ah, 0Dh, 0Ah, "What is the decimal value of 101?", 0Dh, 0Ah, "A: 5", 0Dh, 0Ah, "B: 2", 0Dh, 0Ah, "C: 6", 0Dh, 0Ah, "$"    
    cL1Question db 0Dh, 0Ah, 0Dh, 0Ah, "What is the decimal value of 111?", 0Dh, 0Ah, "A: 8", 0Dh, 0Ah, "B: 3", 0Dh, 0Ah, "C: 7", 0Dh, 0Ah, "$"
    
    ;level 2           
    
    levelTwoPrompt db 0Dh, 0Ah, 0Dh, 0Ah, "= Level Two =", 0Dh, 0Ah, "$"               
    aL2Question db 0Dh, 0Ah, "What is the decimal value of 1001?", 0Dh, 0Ah, "A: 13", 0Dh, 0Ah, "B: 10", 0Dh, 0Ah, "C: 9", 0Dh, 0Ah, "D: 15", 0Dh, 0Ah, "$" 
    bL2Question db 0Dh, 0Ah, 0Dh, 0Ah, "What is the decimal value of 1010?", 0Dh, 0Ah, "A: 12", 0Dh, 0Ah, "B: 11", 0Dh, 0Ah, "C: 13", 0Dh, 0Ah, "D: 10", 0Dh, 0Ah,"$"    
    cL2Question db 0Dh, 0Ah, 0Dh, 0Ah, "What is the decimal value of 1101?", 0Dh, 0Ah, "A: 14", 0Dh, 0Ah, "B: 12", 0Dh, 0Ah, "C: 13", 0Dh, 0Ah, "D: 15", 0Dh, 0Ah, "$"
    
    ;level 3
    
    levelThreePrompt db 0Dh, 0Ah, 0Dh, 0Ah, "= Level Three =", 0Dh, 0Ah, "$"    
    aL3Question db 0Dh, 0Ah, "What is the decimal value of 10000?", 0Dh, 0Ah, "A: 14", 0Dh, 0Ah, "B: 15", 0Dh, 0Ah, "C: 16", 0Dh, 0Ah, "D: 20", 0Dh, 0Ah, "E: 17", 0Dh, 0Ah, "$"  
    bL3Question db 0Dh, 0Ah, 0Dh, 0Ah, "What is the decimal value of 10111?", 0Dh, 0Ah, "A: 21", 0Dh, 0Ah, "B: 24", 0Dh, 0Ah, "C: 19", 0Dh, 0Ah, "D: 20", 0Dh, 0Ah, "E: 18", 0Dh, 0Ah, "$"                       
    cL3Question db 0Dh, 0Ah, 0Dh, 0Ah, "What is the decimal value of 11011?", 0Dh, 0Ah, "A: 30", 0Dh, 0Ah, "B: 31", 0Dh, 0Ah, "C: 29", 0Dh, 0Ah, "D: 27", 0Dh, 0Ah, "E: 22", 0Dh, 0Ah, "$"
    
    ;choices
    
    aAnswer db 'A'
    bAnswer db 'B'
    cAnswer db 'C'
    dAnswer db 'D'
    eAnswer db 'E'   
    
    ;msg prompts
    
    inputPrompt db 0Dh, 0Ah, "Enter your answer: $"
    correctMSG db 0Dh, 0Ah, "Correct!", 0Dh, 0Ah, "$"
    incorrectMSG db 0Dh, 0Ah, "Incorrect.", 0Dh, 0Ah, "$"
    
    ;empty inputs
    
    userAnswer db ?
    levelChoice db ?

.stack 100h

.code
main:
    mov ah, 09h
    lea dx, mainMenu
    int 21h

    mov ah, 09h
    lea dx, levelPrompt
    int 21h

    mov ah, 01h
    int 21h
    mov levelChoice, al

    cmp levelChoice, '1'
    je aLevelOne
    cmp levelChoice, '2'
    je aLevelTwo
    cmp levelChoice, '3'
    je aLevelThree     
    cmp levelChoice, '4'
    je endProgram

    jmp main

;Level One

aLevelOne:  
    mov ah, 09h
    lea dx, levelOnePrompt
    int 21h
       
    mov ah, 09h
    lea dx, aL1Question
    int 21h

    call getAnswer
    cmp al, aAnswer  
   
    je bLevelOne     
    jmp incorrect 

bLevelOne:     
    mov ah, 09h
    lea dx, bL1Question
    int 21h

    call getAnswer
    cmp al, aAnswer   
       
    je cLevelOne    
    jmp incorrect 
    
cLevelOne:    
    mov ah, 09h
    lea dx, cL1Question
    int 21h

    call getAnswer
    cmp al, cAnswer  
         
    je aLevelTwo    
    jmp incorrect    

;Level Two

aLevelTwo:  
    mov ah, 09h
    lea dx, levelTwoPrompt
    int 21h
      
    mov ah, 09h
    lea dx, aL2Question
    int 21h

    call getAnswer
    cmp al, cAnswer  
           
    je blevelTwo    
    jmp incorrect
    
bLevelTwo:    
    mov ah, 09h
    lea dx, bL2Question
    int 21h

    call getAnswer
    cmp al, dAnswer  
            
    je clevelTwo
    jmp incorrect 

cLevelTwo:    
    mov ah, 09h
    lea dx, cL2Question
    int 21h

    call getAnswer
    cmp al, cAnswer  
     
    je aLevelThree
    jmp incorrect  

;Level Three  

aLevelThree:   
    mov ah, 09h
    lea dx, levelThreePrompt
    int 21h
    
    mov ah, 09h
    lea dx, aL3Question
    int 21h            

    call getAnswer
    cmp al, cAnswer
     
    je bLevelThree 
    jmp incorrect

bLevelThree:
    mov ah, 09h
    lea dx, bL3Question
    int 21h            

    call getAnswer
    cmp al, bAnswer
     
    je cLevelThree 
    jmp incorrect

cLevelThree:
    mov ah, 09h
    lea dx, cL3Question
    int 21h            

    call getAnswer
    cmp al, dAnswer
     
    je main
    jmp incorrect

;get input

getAnswer:
    mov ah, 09h
    lea dx, inputPrompt
    int 21h

    mov ah, 01h
    int 21h
    mov userAnswer, al 
    mov al, userAnswer
    ret

;msg prompts    

incorrect:
    mov ah, 09h
    lea dx, incorrectMSG
    int 21h 
    jmp main

;end program

endProgram:
    mov ah, 4Ch
    int 21h

