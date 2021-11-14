org 0x7C00
bits 16

xor ax, ax
mov ds, ax

start:
	cli
	mov si, msg
	mov ah, 0x0E
.loop	lodsb
	or al, al
	jz halt
	int 0x10
	jmp .loop

halt:	hlt
msg:	db "Hello world!", 0 

times 510 - ($ - $$) db 0
dw 0xAA55