	.data /* Variable definida en .data */
var: .word 36 // Inciso a
	
	.text
	.global main
main:
	ldr R0, =42 // Inciso b: R0 = 42
	ldr R1,=var // Inciso c: Carga la dirección de la variable var en R1
	str R0,[R1] 
	ldr R2, [R1] // Inciso d: Carga del valor de var en R2 (R2 = 42)
	
	BX LR // Fin del programa
	