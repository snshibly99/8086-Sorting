.MODEL SMALL
.STACK 100H
.DATA
    ; DEFINE YOUR VARIABLES
    arr db 4,1,5,3,2,'$'
    bubble_before db 'Before bubble sort: $'
    bubble_after db 'After bubble sort: $' 
   
.CODE  
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        mov ah, 9
        lea dx, bubble_before
        int 21h
         
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
            
       
        mov ah, 2
        mov dl, 0dh
        int 21h
        mov dl, 0ah
        int 21h
        
        mov ah, 9
        lea dx, bubble_after
        int 21h
        
        
        ; YOUR CODE STARTS HERE
        mov cx, 5 ;cx holds the outer loop controller
        dec cx ;decrementing because of exclusive loop
        
        outer_loop:
        mov bx, cx
        mov si, 0 ;si holds the index of the array
        
        
        compare:
        mov al, arr[si] ;loading si index element in al
        mov dl, arr[si+1] ;loading si+1 index element in dl
        cmp al, dl ;comparing al and dl
        
        jc no_swap ;jumping to no_swap
        
        
        ;swapping the elements
        mov arr[si], dl
        mov arr[si+1], al
        
        
        no_swap:
        inc si
        dec bx
        jnz compare
        
        loop outer_loop
        
        ;initializing loop for print
        mov cx, 5
        mov bx, offset arr
        
        print:
        mov dl, [bx]
        mov ah, 2
        inc bx
        add dl, 30h
        int 21h
        mov ah, 2
        mov dl, 32
        int 21h
        loop print

        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H 
        
    MAIN ENDP
    END MAIN                   