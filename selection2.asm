.MODEL SMALL
.STACK 100H
.DATA
    ; DEFINE YOUR VARIABLES
    arr db 4, 1, 5, 3, 2, '$'
    selection_before db "Before selection sort: $"
    selection_after db "After selection sort: $"
     
   
.CODE  
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; printing before selection sort
        mov ah, 9
        lea dx, selection_before
        int 21h
        
        ; printing the elements initially
        mov cx, 5
        mov si, 0
        before_sort:
            mov ah, 2
            mov dl, arr[si]
            add dl, 30h
            int 21h
            mov dl, 32
            int 21h
            inc si
            loop before_sort
            
        ; new line
        mov ah, 2
        mov dl, 0dh
        int 21h
        mov dl, 0ah
        int 21h
        
        ; printing after selection sort
        mov ah, 9
        lea dx, selection_after
        int 21h
            
        
        
        
        ; YOUR CODE STARTS HERE
        mov cx, 5 ; cx holds loop controller
        mov si, 0 ; si holds index
        
        outer_loop:
            cmp si, cx
            jge before_print
            
            mov di, si
            
        inner_loop:
            cmp di, cx
            jge next
            
            mov al, arr[di]
            mov bl, arr[si]
            
            
            cmp al, bl
            
            jb update_min
            
            inc di
            jmp inner_loop
            
            
        update_min:
            mov arr[di], bl
            mov arr[si], al
            inc di
            jmp inner_loop
            
            
        next:
            inc si
            jmp outer_loop
            
            
        before_print:
            mov cx, 5
            mov si, 0
            jmp print
            
       
        print:
            cmp si, cx
            je exit
            mov dl, arr[si]
            add dl, 30h
            mov ah, 2
            int 21h
            mov dl, 32
            int 21h
            inc si
            jmp print

        
        ; YOUR CODE ENDS HERE
        exit:
        MOV AX, 4C00H
        INT 21H 
        
    MAIN ENDP
    END MAIN                   