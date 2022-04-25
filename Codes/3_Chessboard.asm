;program that will print a 8x8 chessboard pattern

.model small
.code

main proc
                       
    mov ch,0       ;for rows    
    mov cl,0       ;for columns    
    mov bh,219     ;intializing with white block   
    mov ah,2       ;output operation 
    
    pattern:
    cmp ch,8       ;base case for all rows
    je end_
    
    cmp bh,219     ;changing block color
    je black
    cmp bh,32
    je white
    white:         ;black to white
    mov bh,219
    jmp continue
    black:         ;white to black
    mov bh,32
    jmp continue
    
    continue:
    mov dl,bh      ;printing blocks
    int 21h      
    int 21h
    cmp cl,7       ;block count check in case of neline
    je nextline
    inc cl         ;incrementing block count per line
    jmp pattern
        
    nextline:
    inc ch         ;incrementing line count
    mov cl,0    
    mov dl,186     ;printing border
    int 21h
    mov dl,0ah     ;newline
    int 21h
    mov dl,0dh     ;beginning of the line
    int 21h
    cmp bh,219     ;changing block color
    je b
    cmp bh,32
    je w           
    w:             ;black to white
    mov bh,219
    jmp pattern
    b:             ;white to black
    mov bh,32
    jmp pattern   
        
    end_:
    mov cl,0
    abr:           ;bottom border
    cmp cl,16
    je end__
    mov dl,205      
    int 21h
    inc cl
    jmp abr
    
    end__:    
    mov dl,188     ;corner  
    int 21h
    mov ah,4ch     ;ending
    int 21h
        
    main endp
end main
    