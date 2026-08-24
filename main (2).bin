section .data
    msg db "Success! My OS is working!", 10
    len equ $ - msg

section .text
    global _start

_start:
    ; 1. Command the system to print text (sys_write)
    mov eax, 4          ; System call number 4 is write in 32-bit
    mov ebx, 1          ; File descriptor 1 is stdout (screen)
    mov ecx, msg        ; Point to our text message buffer
    mov edx, len        ; Tell it the exact length of the message
    int 0x80            ; Trigger the 32-bit operating system kernel

    ; 2. Safely exit the program (sys_exit)
    mov eax, 1          ; System call number 1 is exit in 32-bit
    mov ebx, 0          ; Exit status code 0 means zero errors
    int 0x80            ; Exit cleanly
