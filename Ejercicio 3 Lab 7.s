	.data
array: .byte 1, 2, 3, 4 // Inciso a: definición del arreglo

.text
.global main
main:
	ldr R1, =array // Inciso b: Cargar de la dirección del arreglo en R1
	ldrb R0, [R1] // Inciso b: Cargar del primer byte en R0
	add R0, R0, #1 // Inciso c: Modificación del valor (R0 + 1)
	strb R0, [R1, #3] //Carga del nuevo valor en la última posición del arreglo
	
	bx lr //fin del programa