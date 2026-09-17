/*
    Este programa puede generar una señal de 

*/


module divfrec_conf (
    input wire clk,             // Reloj de entrada de 27 MHz
    input wire rst,             // Señal de reset
    output reg salida           // Salida de 1 ms (1 kHz)
);

    // Parámetros para el divisor
    localparam CICLOS_27MHZ = 27_000_000;           // Frecuencia del cristal
    localparam FRECUENCIA_SALIDA = 1_600;           // Frecuencia deseada (1 kHz)
    localparam CONTADOR_MAX = (CICLOS_27MHZ / FRECUENCIA_SALIDA);
    
    /* Registro del contador (15 bits para contar hasta 27000, la cuenta 
       máxima es de 32768)
       En caso de requerir una división mayor, es necesario cambiar el
       ancho del registro contador.
    */

    reg [15:0] contador;

    // Lógica del contador
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            contador <= 0;
            salida <= 0;
        end
        else begin
            if (contador == CONTADOR_MAX - 1) begin
                contador <= 0;
                salida <= ~salida;                  // Invertir la salida
            end
            else begin
                contador <= contador + 1;
            end
        end
    end

endmodule