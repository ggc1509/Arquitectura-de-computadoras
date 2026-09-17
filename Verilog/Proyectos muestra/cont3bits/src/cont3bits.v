/*
    Contador binaro de 3 bits 
    Este proyecto consiste de un contador con  entrada de reloj CLK y reset RST y con una 
    salida de 3 bits.
           _______________
          |               |
   Clk--->|               |---> Bit0
          |               |---> Bit1
   Clr--->|               |---> Bit2
          |               |
          |_______________|     */

module cont3bits (
    input wire clk,             // Reloj
    input wire rst,             // Reset
    output reg [2:0] count      // Salida de 3 bits
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'b0000;   // Reiniciar el contador a 0
        end else begin
            count <= count + 1; // Incrementar el contador
        end
    end
endmodule