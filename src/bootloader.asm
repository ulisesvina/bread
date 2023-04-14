[bits 16]
[org 0x7c00]
KERNEL equ 0x1000

start:
    pusha
    mov ah, 0
    mov al, 3
    int 0x10
    popa
    mov si, msg
    mov ah, 0x0e
.loop:
    lodsb
    or al, al
    jz start_boot
    int 0x10
    jmp .loop
msg: db "Booting to Bread...", 0
start_boot:
    mov [BOOT], dl
    mov bx, KERNEL
    mov dh, 2

    mov ah, 0x02
    mov al, dh
    mov ch, 0
    mov dh, 0
    mov cl, 2
    mov dl, [BOOT]
    int 0x13

    mov ah, 0
    mov al, 3
    int 0x10

    CODE_SEG equ GDT_code - GDT_start
    DATA_SEG equ GDT_data - GDT_start

    cli
    lgdt [gdt]
    mov eax, cr0
    or eax, 1
    mov cr0, eax
    jmp CODE_SEG:protected_mode

    jmp $
BOOT: db 0
GDT_start: dd 0
GDT_null: dd 0
GDT_code:
    dw 0xffff
    dw 0
    db 0
    db 0x9a
    db 0xcf
    db 0x0
GDT_data:
    dw 0xffff
    dw 0
    db 0
    db 0x92
    db 0xcf
    db 0x0
GDT_end:

IRQ1_handler:
    pusha
    xor ah, ah
    in al, 0x60
    mov byte [key_pressed], al
    mov al, 0x20
    out 0x20, al
    popa
    iretd

gdt:
    dw GDT_end - GDT_start - 1
    dd GDT_start

[bits 32]
protected_mode:
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000
    mov esp, ebp

    xor ax, ax
    mov es, ax

    mov al, 0x11
    out 0x20, al
    out 0xa0, al

    mov al, 0x20
    out 0x21, al
    mov al, 0x28
    out 0xa1, al

    mov al, 4
    out 0x21, al
    mov al, 2
    out 0xa1, al

    mov al, 1
    out 0x21, al
    out 0xa1, al

    mov al, 0xff
    out 0x21, al
    mov al, 0xff
    out 0xa1, al

    lidt [idt_ptr]

    in al, 0x21
    and al, 0xfd
    out 0x21, al

    sti

    jmp KERNEL    

IDT_start:
    dw IRQ1_handler_end - IRQ1_handler - 1
    dw IRQ1_handler
    db 0x8e
    db CODE_SEG
IRQ1_handler_end:
idt_ptr:
    dw IDT_end - IDT_start - 1
    dd IDT_start
    
key_pressed: db -1

times 510-($-$$) db 0
dw 0xaa55

IDT_end: