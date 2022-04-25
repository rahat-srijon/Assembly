;Program to print 2 charcaters in order of their ASCII value


.model small
.data
ask db 'Enter 2 Characters: $'
ord db 10,13,'Ordered: '
v1 db ?
v2 db ?,'$' 

.code
main proc
    
    mov ax,@data
    mov ds,ax
    lea dx,ask     ;input message
    mov ah,09h
    int 21h
    
    mov ah,1       ;taking inputs
    int 21h
    mov v1,al
    int 21h
    mov v2,al
    
    cmp al,v1      ;checking order
    jge end_
    mov bl,v1      ;swapping
    mov v2,bl
    mov v1,al    
    
    end_:
    lea dx,ord     ;final output
    mov ah,09h
    int 21h
    mov ah,4ch     ;ending program
    int 21h
    main endp
end main