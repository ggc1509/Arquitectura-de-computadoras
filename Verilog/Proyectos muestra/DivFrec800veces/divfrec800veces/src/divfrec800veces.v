/*
    Este programa puede dividir una frecuencia de
    entrada entre 800.
*/

module divfrec_conf (
    input wire clk,             // Reloj de entrada de 27 MHz
    input wire rst,             // Señal de reset
    output reg salida           // Salida de 1 ms (1 kHz)
);

    // Parámetros para el divisor
    localparam DIVISION = 800;    

    reg [9:0] contador;

    // Lógica del contador
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            contador <= 0;
            salida <= 0;
        end
        else begin
            if (contador == DIVISION - 1) begin
                contador <= 0;
                salida <= ~salida;                  // Invertir la salida
            end
            else begin
                contador <= contador + 1;
            end
        end
    end

endmodule