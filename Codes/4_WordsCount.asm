;program to count total words in input sentence

.model small
.data
ask db 'Enter the sring (0 to 9 words separated by space & empty string = 1 word):',10,13,'$'
wrd db 10,13,'Total words: '
f db ?,'$'         ;number of words

.code
main proc
    
    mov ax,@data
    mov ds,ax
    lea dx,ask     ;input message
    mov ah,09h
    int 21h
    
    mov ah,1       ;input operation
    mov bh,1       ;intializing count with 1
    
    read:
    int 21h
    cmp al,13      ;checking 'enter' key for newline
    je end_
    cmp al,32      ;checking ' ' for word count
    je cnt
    jmp read
    
    cnt:           ;word count increment
    inc bh
    jmp read
    
    end_:
    add bh,48      
    mov f,bh       ;word count printing
    lea dx,wrd    
    mov ah,09h
    int 21h
    mov ah,4ch     ;ending
    int 21h
    main endp
end main