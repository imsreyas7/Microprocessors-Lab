; Program to find the largest number in the list

assume cs:code, ds:data

data segment
		array	db	43h, 1Ch, 03h, 0Ah, 05h, 22h, 47h, 6Dh, 18h, 24h
		len		db 09h	; Total numbers present
		org		0010h	
		largest	db	?	; Variable to store the largest number
data ends

code segment
		org 0100h		; Setting an offset value
start:
		mov ax, data		; copy the base address of Data segment to AX
		mov ds, ax		; copy the address in AX to DS

		mov si, offset array	; Pointer to parse
		mov cl, len		; length of the array (count)

		mov bx, 0000h		; index of largest element

looper:
		mov al, [si]		; Move the starting element of SI register to AL
		cmp al, [bx]		; Compare value in AL to the elemnt present in the address stored in BX
		jc here			; Jump on carry to label 'here'
		mov bx, si		; Copy the address of the element to BX
here:
		inc si			; Move to the next element
		dec cl			; Decrement the count (number of elements to be checked)
		jnz looper		; If not zero, jump to the label 'looper'

		mov al , [bx]		; Move the value present in the address stored in BL to AL
		mov largest, al		; Move the value in AL (largest element) to variable largest
		mov ah, 4Ch		; DOS interrupt for termination
		int 21h			;Interrupt the process with return code and exit

code ends
end start