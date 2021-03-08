# **PDIH**
## *Seminario 1*

___

*He modificado el código de "Hola" para que me muestre 7 veces la palabra "Adios".\
El codigo sería:* 

``` as
pila segment stack 'stack'
	dw 100h dup (?)
pila ends
datos segment 'data'
	msg db 'Adios  $'
datos ends
codigo segment 'code'
	assume cs:codigo, ds:datos, ss:pila
	main PROC
		mov ax,datos
		mov ds,ax

		;imprimir N veces una cadena
		mov cx,0
		bucle:
 			mov dx,OFFSET msg
 			mov ah,9
 			int 21h
			;actualizar contador y comprobar condición
			inc cx
			cmp cx,7
			jne bucle

		mov ax,4C00h
		int 21h
	main ENDP
codigo ends

END main
```

