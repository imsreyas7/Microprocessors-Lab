
;Program for subtracting 2, 8 bit numbers

assume cs:code,ds:data
data segment 
	opr1 db 88h
        opr2 db 11h
        result db 00H
	carry db 00H
data ends
code segment
        org 0100h
start:  mov ax,data
        mov ds,ax

        mov ah,opr1
        mov bh,opr2
	mov ch,00h
	sub ah,bh
	jnc here
        neg ah
	inc ch
here:  mov result,ah
	mov carry,ch
        mov ah,4ch
        int 21h
	code ends
end start
