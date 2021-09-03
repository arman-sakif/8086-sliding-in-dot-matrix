;assignment 7
DSEG    SEGMENT 'DATA'

    z1  DB  01h
    z2  DB  03h,07h,0Fh
    Z3  DB  1Fh,3Fh,7Fh
    z4  DB  41h
    z5  DB  61h,71h,79h
    z6  DB  7Dh,7Fh
    
    a1  DB  01h,03h,07h,0Fh
    a2  DB  1Fh,3Fh,7Fh
    ;a3=a1
    ;a4=a2
    a5  DB  01h
    a6  DB  09h
    
    ;f1=a1
    f2  DB  08h
    f3  DB  18h,38h,78h
    f4  DB  48h,48h,4Fh
    f5  DB  49h,49h,79h
    
    c1  DB  01h
    c2  DB  03h,07h,0Fh
    c3  DB  1Fh,3Fh,7Fh
    c4  DB  41h
    
    r1  DB  01h,03h,07h,0Fh
    r2  DB  08h
    r3  DB  01h,03h,07h,0Fh
    r4  DB  1Fh,3Fh,7Fh  
    
    COUNT DB 125     
    
	

DSEG    ENDS

SSEG    SEGMENT STACK   'STACK'
SSEG    ENDS

CSEG    SEGMENT 'CODE'



START   PROC    FAR

; Store return address to OS:
    PUSH    DS
    MOV     AX, 0
    PUSH    AX

; set segment registers:
	MOV     AX, DSEG
    MOV     DS, AX
    MOV     ES, AX
    	
    
;-----------------PRINTING SECTION---------------------;
MOV DX,2070H
MOV AL,08H
OUT DX,AL ; R2
;segment-z1
    MOV DX,2003h
    MOV SI, 0
    MOV CX, 4   ;z1 running 5 times
    
    @z1:
    MOV AL,z1[SI]
	OUT DX,AL
	;INC SI     ;here no inc needed
	DEC DX

	LOOP @z1	
	
	MOV DX,2030H
	MOV AL,01H
	OUT DX,AL
       
;segment-z2
    MOV DX,2000h
    MOV SI, 0
    MOV CX, 3   
    
    @z2:
    MOV AL,z2[SI]
	OUT DX,AL
	INC SI     
	;DEC DX     ;same column

	LOOP @z2
	
	MOV DX,2030H
	MOV AL,21H
	OUT DX,AL
        

;segment-z3
    MOV DX,2000h
    MOV SI, 0
    MOV CX, 3   
    
    @z3:
    MOV AL,z3[SI]
	OUT DX,AL
	INC SI     
	;DEC DX     ;same column

	LOOP @z3	
	
	MOV DX,2030H
	MOV AL,31H
	OUT DX,AL
    
;segment-z4
    MOV DX,2001h
    MOV SI, 0
    MOV CX, 3   
    
    @z4:
    MOV AL,z4[SI]
	OUT DX,AL
	;INC SI     ;same val     
	INC DX

	LOOP @z4
	
	MOV DX,2030H
	MOV AL,39H
	OUT DX,AL


;segment-z5
    MOV DX,2003h
    MOV SI, 0
    MOV CX, 3   
    
    @z5:
    MOV AL,z5[SI]
	OUT DX,AL
	INC SI       
	;INC DX    

	LOOP @z5
	
	MOV DX,2030H
	MOV AL,3DH
	OUT DX,AL


;segment-z6
    MOV DX,2003h
    MOV SI, 0
    MOV CX, 2   
    
    @z6:
    MOV AL,z6[SI]
	OUT DX,AL
	INC SI       
	;INC DX    

	LOOP @z6
	
	MOV DX,2030H
	MOV AL,3FH
	OUT DX,AL
;--------------------------------------------------------------------------;
	
;NO NEED TO LIGHT R2 AGAIN
;segment-a1
    MOV DX,2005h
    MOV SI, 0
    MOV CX, 4   ;z1 running 5 times
    
    @a1:
    MOV AL,a1[SI]
	OUT DX,AL
	INC SI     ;here no inc needed
	;DEC DX

	LOOP @a1
	MOV DX,2031H
	MOV AL,20H
	OUT DX,AL   

;segment-a2
    MOV DX,2005h
    MOV SI, 0
    MOV CX, 3   ;z1 running 5 times
    
    @a2:
    MOV AL,a2[SI]
	OUT DX,AL
	INC SI     ;here no inc needed
	;DEC DX

	LOOP @a2
	MOV DX,2031H
	MOV AL,30H
	OUT DX,AL
        
;segment-a3
    MOV DX,2008h
    MOV SI, 0
    MOV CX, 4   ;z1 running 5 times
    
    @a3:
    MOV AL,a1[SI]   ;a1,a3 is exact same won't use another array
	OUT DX,AL
	INC SI     ;here no inc needed
	;DEC DX

	LOOP @a3
	MOV DX,2031H
	MOV AL,32H
	OUT DX,AL
    

;segment-a4
    MOV DX,2008h
    MOV SI, 0
    MOV CX, 3   ;z1 running 5 times
    
    @a4:
    MOV AL,a2[SI]   ;a2,a4 is exact same won't use another array
	OUT DX,AL
	INC SI     ;here no inc needed
	;DEC DX

	LOOP @a4
	MOV DX,2031H
	MOV AL,36H
	OUT DX,AL


;segment-a5
    MOV DX,2006h
    MOV SI, 0
    MOV CX, 2   
    
    @a5:
    MOV AL,a5[SI]
	OUT DX,AL
	;INC SI       
	INC DX    

	LOOP @a5
	MOV DX,2031H
	MOV AL,37H
	OUT DX,AL


;segment-a6
    MOV DX,2006h
    MOV SI, 0
    MOV CX, 2   
    
    @a6:
    MOV AL,a6[SI]
	OUT DX,AL
	;INC SI       
	INC DX    

	LOOP @a6
	MOV DX,2031H
	MOV AL,77H
	OUT DX,AL
;-------------------------------------------------------------------------------;

MOV DX,2070H
MOV AL,02H
OUT DX,AL ; YELLOW
;segment-f1
    MOV DX,200Ah
    MOV SI, 0
    MOV CX, 4   ;z1 running 5 times
    
    @f1:
    MOV AL,a1[SI]
	OUT DX,AL
	INC SI     ;here no inc needed
	;DEC DX

	LOOP @f1
	MOV DX,2032H
	MOV AL,20H
	OUT DX,AL   

;segment-f2
    MOV DX,200Bh
    MOV SI, 0
    MOV CX, 3   ;z1 running 5 times
    
    @f2:
    MOV AL,f2[SI]   ;a2,a4 is exact same won't use another array
	OUT DX,AL
	;INC SI     ;here no inc needed
	INC DX

	LOOP @f2
	MOV DX,2032H
	MOV AL,60H
	OUT DX,AL
        
;segment-F3
    MOV DX,200Dh
    MOV SI, 0
    MOV CX, 3   
    
    @f3:
    MOV AL,f3[SI]   
	OUT DX,AL
	INC SI     

	LOOP @f3
	MOV DX,2032H
	MOV AL,64H
	OUT DX,AL
    

;segment-F4
    MOV DX,200Ch
    MOV SI, 0
    MOV CX, 3
    
    @f4:
    MOV AL,f4[SI]   
	OUT DX,AL
	INC SI     
	DEC DX

	LOOP @f4
	MOV DX,2032H
	MOV AL,6CH
	OUT DX,AL
        

;segment-f5 
    MOV DX,200Bh
    MOV SI, 0
    MOV CX, 3
    
    @f5:
    MOV AL,f5[SI]   
	OUT DX,AL
	INC SI     
	INC DX

	LOOP @f5
	MOV DX,2032H
	MOV AL,6DH
	OUT DX,AL
;----------------------------------------------------------------------------;
MOV DX,2070H
MOV AL,04H
OUT DX,AL ; GREEN
;segment-c1
    MOV DX,2012h
    MOV SI, 0
    MOV CX, 4   
    
    @c1:
    MOV AL,c1[SI]
	OUT DX,AL
	DEC DX

	LOOP @c1
	MOV DX,2033H
	MOV AL,01H
	OUT DX,AL
;segment-c2
    MOV DX,200Fh
    MOV SI, 0
    MOV CX, 3
    
    @c2:
    MOV AL,c2[SI]
	OUT DX,AL
	INC SI

	LOOP @c2
	MOV DX,2033H
	MOV AL,21H
	OUT DX,AL
;segment-c2
    MOV DX,200Fh
    MOV SI, 0
    MOV CX, 3
    
    @c3:
    MOV AL,c3[SI]
	OUT DX,AL
	INC SI

	LOOP @c3
	MOV DX,2033H
	MOV AL,31H
	OUT DX,AL
;segment-c4
    MOV DX,2010h
    MOV SI, 0
    MOV CX, 3   
    
    @c4:
    MOV AL,c4[SI]
	OUT DX,AL
	INC DX

	LOOP @c4
	MOV DX,2033H
	MOV AL,39H
	OUT DX,AL
;----------------------------------------------------------------------------;
MOV DX,2070H
MOV AL,08H
OUT DX,AL ; RED2
;segment-r1
    MOV DX,2014h
    MOV SI, 0
    MOV CX, 4   
    
    @r1:
    MOV AL,r1[SI]
	OUT DX,AL
	INC SI

	LOOP @r1
	MOV DX,2034H
	MOV AL,20H
	OUT DX,AL
;segment-r2
    MOV DX,2015h
    MOV SI, 0
    MOV CX, 3   
    
    @r2:
    MOV AL,r2[SI]
	OUT DX,AL
	INC DX

	LOOP @r2
	MOV DX,2034H
	MOV AL,60H
	OUT DX,AL
;segment-r3
    MOV DX,2017h
    MOV SI, 0
    MOV CX, 4   
    
    @r3:
    MOV AL,r3[SI]
	OUT DX,AL
	INC SI

	LOOP @r3
	MOV DX,2034H
	MOV AL,62H
	OUT DX,AL
;segment-r4
    MOV DX,2017h
    MOV SI, 0
    MOV CX, 3   
    
    @r4:
    MOV AL,r4[SI]
	OUT DX,AL
	INC SI

	LOOP @r4
	MOV DX,2034H
	MOV AL,66H
	OUT DX,AL
;--------------------------printing done--------------------------;

;--------------------------rotate--------------------------;

@ROTATE:

MOV DX, 2018H
IN AL,DX

MOV BL,AL;TEMPORARY STORE

MOV CX,24
    @RT:
     DEC DX     ;2017
     IN AL,DX
     INC DX     ;2018
     OUT DX,AL
     
     DEC DX     ;2017
     
     LOOP @RT

MOV DX, 2000H
MOV AL,BL
OUT DX,AL

DEC COUNT
CMP COUNT,0
JNE @ROTATE

    


; return to operating system:
    RET
START   ENDP
END START



CSEG    ENDS 

        
;------------------------------------
;delay code if I want to use later

    ;MOV BX, 01h ;just delay
	;L1:
	;dec bx
	;cmp bx, 0
	;JNE L1;  
;------------------------------------