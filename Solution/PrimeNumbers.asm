; Assemble with: nasm -f win32 PrimeNumbers.asm -o PrimeNumbers.obj
; Link with: golink /entry:start PrimeNumbers.obj user32.dll kernel32.dll
; PrimeNumbers.asm

global start

extern GetStdHandle
extern WriteConsoleA
extern ExitProcess
extern HeapAlloc
extern HeapFree
extern Sleep

section .data
    title_str       db 'Prime Numbers in Assembly (Sieve of Eratosthenes)', 0
    message_str     db 'Prime Numbers: ', 0 
    newline_str     db 0xA, 0xD

section .text
start:
    mov     ecx, 99999

    mov     edx, ecx
    shr     edx, 1          
    inc     edx              
    ; We used the HEAP for simplicity
    push    edx
    call    HeapAlloc
    add     esp, 4
    mov     dword [esi], ecx 
    mov     esi, eax        

    ; Initializing the sieve array
    mov     eax, esi
    add     eax, 4
    xor     ecx, ecx
    primeloop_init:
        mov     [eax], cl
        inc     ecx
        add     eax, 1
        cmp     ecx, dword [esi]
        jl      primeloop_init

    ; Use the Sieve of Eratosthenes to mark non-prime numbers
    mov     eax, 2           ; We decided to start from 2 as it is the first prime number
    sieve_loop:
        mov     edx, eax
        imul    edx, edx       
        cmp     edx, dword [esi] ; Comparing  with the limit
        jae     end_sieve

        mov     ecx, eax
        sieve_multiples:
            add     ecx, eax
            mov     byte [esi + ecx], 1 
            cmp     ecx, dword [esi]
            jl      sieve_multiples


        find_next_unmarked:
            inc     eax
            cmp     eax, dword [esi]
            jl      sieve_loop

    end_sieve:

    mov     eax, 2          
    sieve_to_message:
        cmp     eax, dword [esi] 
        jae     display_message

        
        cmp     byte [esi + eax], 0 
        je      not_prime_sieve_to_message

        push    eax
        lea     ecx, [message_str] 
        call    itoa
        mov     ebx, message_str + 15

      
        mov     byte [ebx], ' '
        inc     ebx

        push    eax
        lea     edx, [newline_str]  
        push    edx
        push    2              
        push    message_str    
        push    -11              
        call    GetStdHandle
        push    eax
        call    WriteConsoleA
        add     esp, 24

        not_prime_sieve_to_message:
        inc     eax
        jmp     sieve_to_message

    display_message:
    push    5000               
    call    Sleep
    add     esp, 4

    mov     eax, esi
    push    eax
    call    HeapFree
    add     esp, 8

    push    0                   
    call    ExitProcess


itoa:
    mov     ebx, 10         
    xor     edi, edi        
    mov     eax, [esp + 4]   ; Coping the number to eax
convert_digit:
    xor     edx, edx         ; Clearing  any previous remainder
    div     ebx              ; Dividing the number by 10, result in eax, remainder in edx
    add     dl, '0'          
    dec     edi             
    mov     [edi], dl       
    test    eax, eax        
    jnz     convert_digit   
    ret
