.syntax unified
.cpu cortex-m4
.thumb

.global ejercicio5Lab7

.section .data
    array:  .word 5, 10, 5, 20     // Arreglo con los valores: 5, 10, 5, 20
    result: .space 16               // Espacio para el arreglo de resultados (4 elementos, 4 bytes cada uno)

.section .text
ejercicio5Lab7:
    // Cargar la dirección de inicio del arreglo y el primer valor
    LDR R0, =array                 // R0 = Dirección de 'array'
    LDR R1, [R0]                   // R1 = Primer valor de 'array' (5)

    // Inicializar el índice i = 0
    MOV R2, #0                     // R2 = Índice i = 0
    LDR R3, =result                // R3 = Dirección de 'result'

loop:
    // Cargar el valor array[i] en R4
    LDR R4, [R0, R2, LSL #2]       // Cargar array[i] en R4 (usamos LSL para multiplicar i por 4)

    // Comparar array[i] con el primer valor (5)
    CMP R4, R1                     // Comparar array[i] con 5 (guardado en R1)
    BEQ equal                      // Si son iguales, saltar a la etiqueta 'equal'

    // Si no son iguales (BEQ no saltó)
    MOV R5, #0                     // Cargar 0 en R5 (resultado)
    STR R5, [R3, R2, LSL #2]       // Almacenar 0 en result[i]
    B next                         // Saltar a la siguiente iteración

equal:
    // Si los valores son iguales (BEQ saltó aquí)
    MOV R5, #1                     // Cargar 1 en R5 (resultado)
    STR R5, [R3, R2, LSL #2]       // Almacenar 1 en result[i]

next:
    // Incrementar el índice i
    ADD R2, R2, #1                 // i = i + 1

    // Comprobar si hemos terminado (i < 4)
    CMP R2, #4                     // Comparar i con 4 (tamaño del arreglo)
    BLT loop                       // Si i < 4, repetir el ciclo

    // Terminar el programa
    MOV R7, #1                     // Código de salida (1)
    SVC #0                         // Llamada al sistema para salir
