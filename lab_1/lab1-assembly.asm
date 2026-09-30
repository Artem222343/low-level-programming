%include "io64.inc"

section .bss
arr: resd 100

section .text
global main
main:
    GET_DEC 4, ebx
    mov rsi, 0
    .input_start:
        cmp esi, ebx
        jge .input_end
        GET_DEC 4, eax
        mov [arr + rsi*4], eax
        inc rsi
        jmp .input_start
    .input_end:
    
    mov rsi, 0
    mov rdi, 0
    mov ecx, ebx
    shr ecx, 1
    .ecx_start:
        cmp ecx, 0
        jle .ecx_end
        mov esi, ecx
        
        .rsi_start:
            cmp esi, ebx
            jge .rsi_end
            mov edx, [arr + rsi*4]
            mov rdi, rsi
            
            .rdi_start:
                cmp edi, ecx
                jl .rdi_end
                mov eax, edi
                sub eax, ecx
                cmp [arr + rax*4], edx
                jle .rdi_end
                mov r8d, [arr + rax*4]
                mov [arr + rdi*4], r8d
                sub edi, ecx
                jmp .rdi_start
            .rdi_end:
            
            mov [arr + rdi*4], edx
            inc rsi
            jmp .rsi_start
        .rsi_end:
        
        shr ecx, 1
        jmp .ecx_start
    .ecx_end:
    
    mov rsi, 0
    .output_start:
        cmp esi, ebx
        jge .output_end
        mov eax, [arr + rsi*4]
        PRINT_DEC 4, eax
        PRINT_CHAR " "
        inc rsi
        jmp .output_start
    .output_end:
                
    NEWLINE
    xor eax, eax
    ret