section .data
section .bss
section .text
global gets:
gets:
    push ebp
    push ebx
    push ecx
    push edx
    push edi
    mov ebp,esp
    mov esi,[ebp+8]
    mov eax,3
    mov ebx,0
    mov ecx,esi
    mov edx,12
    int 0x80
    mov esp,ebp
    pop edi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret

global atoi:
atoi:
    push ebp
    push ebx
    push ecx
    push edx
    push esi
    mov ebp,esp
    xor ebx,ebx
    mov esi,[ebp+8]
    call len
    .next:
        movzx eax,byte[esi]
        inc esi
        sub al,'0'
        imul ebx,10
        add ebx,eax
        loop .next
    mov eax,ebx
    mov esp,ebp
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret

len: 
    push esi
    xor ecx,ecx
    .check:
        cmp byte[esi],'*'
        jz .stlen
        inc ecx
        inc esi
        jmp .check
    .stlen:
        mov byte[esi],0
    pop esi
    ret


global printDec:
printDec:
    push ebp
    push eax
    push ebx
    push edx
    mov ebp,esp
    mov ebx,10
    xor edx,edx
    xor ecx,ecx
    mov eax,[ebp+8]
    .convert:
        div ebx
        add dx,'0'
        push dx
        inc ecx
        xor edx,edx
        cmp eax,0
        jne .convert
    .print:
        pop dx
        call print
        loop .print
    mov esp,ebp
    pop edx
    pop ebx
    pop eax
    pop ebp
    ret
print:
    push eax
    push ebx
    push ecx
    push edx
    mov eax,4
    mov ebx,1
    mov ecx,esp
    mov edx,1
    int 0x80
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

global printHex:
printHex:
    push ebp
    push eax
    push ebx
    push edx
    mov ebp,esp
    mov ebx,10h
    xor edx,edx
    xor ecx,ecx
    mov eax,[ebp+8]
    .convert:
        div ebx
        cmp dx,9
        jbe .menor
        add dx,7
    .menor:
        add dx,'0'
        push dx
        inc ecx
        xor edx,edx
        cmp eax,0
        jne .convert
    .print:
        pop dx
        call print
        loop .print
    mov esp,ebp
    pop edx
    pop ebx
    pop eax
    pop ebp
    ret