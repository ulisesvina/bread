org 0x7C00
bits 16

xor ax, ax
mov ds, ax

start:
	cli
	mov ah, 0x0e
	mov al, 64
	jmp loop
loop:
	inc al
	cmp al, 'Z'+1
	je exit
	int 0x10
	jmp loop
exit:
	jmp $

times 510 - ($ - $$) db 0
dw 0xAA55