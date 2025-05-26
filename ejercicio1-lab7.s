.syntax unified
.cpu cortex-m4
.thumb

.global ejercicio1Lab7

ejercicio1Lab7:
	MOV R0, #10 	//Direccionamiento inmediato
	MOV R1, R0		//Direccionamiento de registro a registro
	ADD R3, R0, R1 	//Direccionamiento de registro a registro
loop:
	b loop

