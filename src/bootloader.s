[org 0x7c00] ; Origin of the Bootloader
KERNEL equ 0x1000 ; Assigning the kernel location value to KERNEL

mov [BOOT_DRIVE], dl

; Moving the kernel to base register
mov bx, KERNEL
mov dh, 2

; Loading from drive
mov ah, 0x02
mov al, dh 
mov ch, 0x00
mov dh, 0x00
mov cl, 0x02
mov dl, [BOOT_DRIVE]
int 0x13

mov ah, 0x0
mov al, 0x3
int 0x10

; GDT Data for transitioning to 32-bit protected mode
CODE_SEG equ GDT_code - GDT_start
DATA_SEG equ GDT_data - GDT_start

cli
lgdt [GDT_descriptor]
mov eax, cr0
or eax, 1
mov cr0, eax
jmp CODE_SEG:start_protected_mode

jmp $

BOOT_DRIVE: db 0

GDT_start:
    GDT_null:
    dd 0x0
        dd 0x0

    GDT_code:
        dw 0xffff
        dw 0x0
        db 0x0
        db 0b10011010
        db 0b11001111
        db 0x0

    GDT_data:
        dw 0xffff
        dw 0x0
        db 0x0
        db 0b10010010
        db 0b11001111
        db 0x0

GDT_end:

GDT_descriptor:
    dw GDT_end - GDT_start - 1
    dd GDT_start


[bits 32]
start_protected_mode:
    mov ax, DATA_SEG
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	
	mov ebp, 0x90000
	mov esp, ebp

    jmp KERNEL

times 510-($-$$) db 0
dw 0xaa55