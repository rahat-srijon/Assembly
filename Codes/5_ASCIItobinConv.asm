;program to find binary of a ASCII value

.model small
.data
ask db 'Enter ASCII character: $'
bin db 10,13,'Binary: $'

.code
main proc
    
    mov ax,@data
    mov ds,ax
    lea dx,ask     ;input message
    mov ah,09h
    int 21h
    
    mov ah,1       ;input operation
    int 21h        
    mov bh,al
    
    lea dx,bin     ;output message
    mov ah,09h
    int 21h
    
    mov cl,0       ;bit count
    mov ah,2       ;output operation
    
    do:
    shl bh,1       ;shifting left by 1 bit (multiplying with 2)
    mov bl,bh      ;temporary store
    mov bh,0       ;assign 0
    adc bh,48      ;add with the carry flag for digit
    mov dl,bh      ;printing bit
    int 21h
    mov bh,bl      ;restoring value
    inc cl
    cmp cl,8       ;base case 8 bit count check as ASCII is input 
    je end_
    jmp do
    
    end_:
    mov ah,4ch     ;ending
    int 21h
    main endp
end main                    
