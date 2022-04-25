;program to check type of a character

.model small
.data
ask db 'Entered Character, $'
num db ' is a number.$'
upr db ' is an uppercase charcter.$'
lwr db ' is a lowercase character.$'
sgn db ' is a special character.$'

.code
main proc
    
    mov ax,@data
    mov ds,ax
    lea dx,ask     ;input message
    mov ah,09h
    int 21h
    
    mov ah,1       ;taking input
    int 21h
    
    cmp al,48      ;checking ASCII
    jl s           
    cmp al,58      
    jl n           
    cmp al,65      
    jl s           
    cmp al,91
    jl u
    cmp al,97
    jl s
    cmp al,123
    jl l
    
    s:             ;special
    lea dx,sgn
    mov ah,09h
    int 21h
    jmp end_ 
    
    n:             ;number
    lea dx,num
    mov ah,09h
    int 21h
    jmp end_
    
    l:             ;lowercase
    lea dx,lwr
    mov ah,09h
    int 21h
    jmp end_   
    
    u:             ;uppercase
    lea dx,upr
    mov ah,09h
    int 21h
    jmp end_
    
    end_:
    mov ah,4ch     ;ending program
    int 21h
    main endp
end main