; Nombre: Brayan Lopez Mercado
; Matricula: 1280838
; Fecha: 16/Nov/2023
; Materia: Organizacion y Arquitectura De Computadoras
; Practica 12
.model tiny
locals
.data
    PA dw 0040h
    PB dw 0041h
    PC dw 0042h
    RCtr dw 0043h
    PTOs_all_out db 80h
.code
   org 100h
    
Main proc
    start:mov sp,0fffh
    mov dx,RCtr
    mov al,PTOs_all_Out
    call outportC
    mov dx,PC
    mov al,07fh
    call printBin8
    call newLine
    mov cl,7
    ;call setBitPort
    ;call clearBitPort
    call notBitPort
    call newLine
    jmp start
    ret
    endp
    
outportC proc
out dx,al
ret
endp

; Parte 2 (Sin Puertos)   
setBit proc
push ax
push cx
ror ax,cl
or ax,1h
rol ax,cl
call printBin
call newLine
pop cx
pop ax
ret
endp

clearBit proc
push ax
push cx
ror ax,cl
and ax,0FFFEh
rol ax,cl
call printBin
call newLine
pop cx
pop ax
ret
endp

notBit proc
push ax
push cx
ror ax,cl
xor ax,1h
rol ax,cl
call printBin
call newLine
pop cx
pop ax
ret
endp

; Parte 3 (Con Puertos) 
setBitPort proc
push ax
push cx
push dx
ror al,cl
or al,1h
rol al,cl
call outportC
call printBin8
call newLine
pop dx
pop cx
pop ax
ret
endp

clearBitPort proc
push ax
push cx
push dx
ror al,cl
and al,0FEh
rol al,cl
call outportC
call printBin8
call newLine
pop dx
pop cx
pop ax
ret
endp

notBitPort proc
push ax
push cx
push dx
ror al,cl
xor al,1h
rol al,cl
call outportC
call printBin8
call newLine
pop dx
pop cx
pop ax
ret
endp

; Subrutinas Auxiliares 
printBin proc
push ax
push dx
push cx
push bx
mov bx,ax
mov cx,16
.convert:
    xor al,al
    shl bx,1
    adc al,'0'
    call putchar
    loop .convert
pop bx
pop cx
pop dx
pop ax
ret
endp

printBin8 proc
push ax
push dx
push cx
mov ah,al
mov cx,8
.convert2:
    xor al,al
    shl ah,1
    adc al,'0'
    call putchar
    loop .convert2
pop cx
pop dx
pop ax
ret
endp
    
newLine proc
 push ax
 mov al,10
 call putchar
 mov al,13
 call putchar
 pop ax
 ret
endp

putchar proc
 push ax
 push dx
 mov dl,al
 mov ah,2
 int 21h
 pop dx
 pop ax
 ret
 endp
 
end Main