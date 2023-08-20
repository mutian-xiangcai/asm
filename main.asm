.8086

data segment byte public
    nm db "hello world",'$'
data ends

stack segment para stack
    dw 256 dup(?)
stack ends

main segment
    assume ds:data,cs:main,ss:stack
start:
    mov ax,data
    mov ds,ax
    mov ax,stack
    mov ss,ax
    mov ax,offset nm
    push ax
    call tk
    mov ah,4ch
    int 21h
main ends

main segment
    tk proc near
        push bp
        mov bp,sp
        mov dx,[bp+4]
        mov ah,9
        int 21h
        pop bp
        ret 2
    tk endp
main ends

end start