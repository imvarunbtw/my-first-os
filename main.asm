section .text
    global _start

_start:
    ; 1. Setup the memory segment pointers for the hardware
    mov ax, 0x07C0
    mov ds, ax

    ; 2. Change Screen Background to Blue & Text to White
    mov ah, 0x06        ; BIOS command: Scroll window / Clear screen
    mov al, 0           ; Clear entire screen
    mov bh, 0x1F        ; Color Code: 1 = Blue Background, F = White Text
    mov ch, 0           ; Top row (0)
    mov cl, 0           ; Left column (0)
    mov dh, 24          ; Bottom row (24)
    mov dl, 79          ; Right column (79)
    int 0x10            ; Hardware graphic card interrupt

    ; 3. Reset cursor back to the top left corner (0,0)
    mov ah, 0x02        ; BIOS command: Set cursor position
    mov bh, 0           ; Video page 0
    mov dh, 0           ; Row 0
    mov dl, 0           ; Column 0
    int 0x10            ; Hardware graphic card interrupt

    ; 4. Point to your custom message and print it
    mov si, msg         
    mov ah, 0x0E        ; BIOS command: Print character

print_loop:
    lodsb               ; Grab the next letter from memory
    cmp al, 0           ; Is text finished?
    je halt_system      ; If yes, stop printing
    int 0x10            ; Draw character on the screen
    jmp print_loop      ; Repeat for next letter

halt_system:
    hlt                 ; Put virtual CPU to sleep
    jmp halt_system     ; Safety lock loop

section .data
    msg db "Welcome to My Custom Blue-Screen OS!", 13, 10, 0
