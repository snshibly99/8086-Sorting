.MODEL SMALL
.STACK 100H
.DATA
array db 4, 1, 5, 3, 2, '$'  
array_len equ $ - array        

.CODE  
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        mov cx,0              ; counter
         
    loop_o:
        mov si,cx             ; putting i 
        mov bx,si             ; loading i
        mov al,[array + bx]   

    loop_i:
        cmp si,0              
        jle end_loop_i         ; when si<=0,loop ends
        mov bx,si               ; loading j
        dec bx                ; decrementign j and compare with j-1
        mov dl,[array+bx]   ; loading a[j - 1] into dl
        cmp dl,al             
        jle end_loop_i     ; for a[j - 1] <= a[i], loop ends
        mov [array + bx],al  ; putting a[i] into a[j]
        mov [array + si],dl    ; putting a[j - 1] into a[j]
        dec si                 
        jmp loop_i         ; repeatation

    end_loop_i:
        inc cx            ;i incrementatiion
        cmp cx,array_len     
        jl loop_o          

           
           
        mov cx, 0     ; counter back to 0

    print_loop:
        mov si,cx      ; counter is in si
        mov dl,[array+si] ; loading byte from array 
        cmp dl,'$'  ; null terminator check
        je end_print_loop   
        add dl,30h  ; ASCII value convertion
        mov ah, 2    ; display character
        int 21h                
        mov dl, ' '     ; spacing
        int 21h                
        inc cx        ; next elem
        jmp print_loop   ; repeatation
        
    end_print_loop:
        mov ax, 4C00H         
        int 21H               

    MAIN ENDP
END MAIN
